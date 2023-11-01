@extends('admin::layout')

@component('admin::components.page.header')
    @slot('title', trans('invoice::invoice.invoice.index'))

    <li class="active">{{ trans('invoice::invoice.invoice.index') }}</li>
@endcomponent

@section('content')
    <div class="box box-primary" id="create-invoice">
        <create-form :gateways="{{ $gateways }}" :shippingmethods="{{ $shippingMethod }}" inline-template>
            <div class="box-body index-create-invoice">
                <form @submit.prevent="createInvoice" autocomplete="off">
                    <div class="row">
                        <div class="col-md-6">

                            @include('invoice::admin.form.cart.index')
                            @include('invoice::admin.form.cart.cart_items')

                        </div>

                        <div class="col-md-6" :style="[cartIsNotEmpty ? { 'opacity': 0.4, 'pointer-events': 'none' } : '']">

                            @include('invoice::admin.form.input.invoice')
                            @include('invoice::admin.form.input.name')
                            @include('invoice::admin.form.input.number')
                            @include('invoice::admin.form.input.address')
                            @include('invoice::admin.form.input.courier')
                            @include('invoice::admin.form.input.city')
                            @include('invoice::admin.form.input.order_note')
                            @include('invoice::admin.form.payment_methods')
                            @include('invoice::admin.form.delivery_area')

                            <div class="invoice-summary-total">
                                @include('invoice::admin.form.payment.subtotal')
                                @include('invoice::admin.form.payment.delivery')
                                @include('invoice::admin.form.payment.discount')
                                @include('invoice::admin.form.payment.advance')
                                @include('invoice::admin.form.payment.due')
                                @include('invoice::admin.form.payment.total')
                            </div>
                        </div>
                    </div>

                    <div class="invoice-summary-bottom">
                        <button type="submit" class="btn btn-primary btn-place-order"
                            :class="{ 'btn-loading': btnLoading }" :disabled="cartIsNotEmpty">
                            {{ trans('invoice::invoice.invoice.index') }}
                        </button>
                    </div>
                </form>
            </div>
        </create-form>
    </div>

    <script src="https://unpkg.com/vue@2.5.13/dist/vue.min.js"></script>

    <script>
        class Errors {
            //need to store the error 
            constructor() {
                this.errors = {};
            }
            // will get and return the error here
            get(field) {

                if (this.errors[field]) {

                    return this.errors[field][0];
                }
            }
            has(field) {
                if (this.errors[field]) {
                    return true;
                }
            }
            record(errors) {
                this.errors = errors;
            }
        }
        Vue.component('createForm', {
            props: ['gateways', 'shippingmethods', 'options'],
            data() {
                return {
                    btnLoading: false,
                    laodingCart: false,
                    selectedKey: [],
                    productPrice: 0,
                    productList: {},
                    errors: new Errors(),
                    form: {
                        selected_products: [],
                        shipping_method: 0,
                        shipping_cost: 0,
                        discount: 0,
                        advance: 0,
                        total: 0,
                        due: 0,
                        sub_total: 0,
                    },
                }
            },
            computed: {
                hasNoPaymentMethod() {
                    return Object.keys(this.gateways).length === 0;
                },
                hasNoShippingMethods() {
                    return Object.keys(this.shippingmethods).length === 0;
                },
                cartIsNotEmpty() {
                    return Object.keys(this.productList).length === 0;
                },
                totalAmount() {
                    const productPrice = parseInt(this.productPrice);
                    const deliveryCharge = parseInt(this.form.shipping_cost) || 0;
                    const discount = parseInt(this.form.discount) || 0;
                    const advance = parseInt(this.form.advance) || 0;

                    const mergeProductDelivery = this.sum([productPrice, deliveryCharge]);
                    const mergeDiscountAdvance = this.sum([discount, advance]);

                    this.form.due = (mergeProductDelivery - mergeDiscountAdvance);

                    this.form.sub_total = parseInt(productPrice);
                    this.form.total = parseInt(mergeProductDelivery - discount);

                    return `BDT ${(mergeProductDelivery - discount)}.00`;
                }
            },
            methods: {
                sum(array) {
                    var total = 0;
                    array.forEach(function(element) {
                        total += element;
                    })
                    return total;
                },
                createInvoice(form) {
                    this.btnLoading = true;
                    $.ajax({
                        method: 'POST',
                        url: route('admin.invoice.create'),
                        data: this.form,
                    }).then((response) => {
                        if (response.redirect) {
                            window.location.href = response.redirect;
                        }
                    }).catch((xhr) => {
                        if (xhr.status === 422) {
                            this.errors.record(xhr.responseJSON.errors);
                        }
                        this.btnLoading = false;
                    });

                },
                optionValues(option) {
                    let values = [];

                    for (let value of option.values) {
                        values.push(value.label);
                    }
                    return values.join(', ');
                },
                updateQuantity(product, qty) {

                    if (qty < 1) return;
                    if (isNaN(qty)) qty = 1;

                    let currentAmount = parseInt(product.price.inCurrentCurrency.amount);
                    currentAmount = currentAmount * qty;

                    product.quantity = parseInt(qty);
                    this.updatePrice(product, currentAmount);
                },
                updatePrice(product, currentAmount) {
                    product.price.amount = currentAmount;
                    this.updateSubTotal();
                },
                updateSubTotal() {
                    let productList = this.productList;
                    var newAmount = 0;
                    productList.forEach((item, index) => {
                        newAmount += parseInt(item.price.amount);
                    });

                    this.productPrice = newAmount;
                    this.getShippingMethods();
                },
                getShippingMethods() {
                    if (this.form.shipping_method == false) return;
                    const method = this.shippingmethods;
                    const selectedMethod = this.form.shipping_method;
                    const newAmount = parseInt(method[selectedMethod].cost.amount);
                },
                updateDeliveryCharge(amount) {
                    this.form.shipping_cost = parseInt(amount);
                },
                onChangeProducts() {
                    let that = this;
                    document.addEventListener("DOMContentLoaded", function() {
                        document.querySelector('.selectize-input > input').addEventListener('blur', () => {

                            const dataSelectable = document.querySelectorAll(
                                '.select-products select option');

                            console.log(dataSelectable);

                            that.selectedKey = [];
                            that.laodingCart = true;

                            if (dataSelectable.length === 0) {
                                that.selectedKey = [];
                                that.laodingCart = 0;
                                that.productList = [];
                                return;
                            };

                            dataSelectable.forEach((item, index, dataSelectable) => {

                                that.selectedKey.push(parseInt(item.value));

                                if (Object.is(dataSelectable.length - 1, index)) {
                                    that.getSelectedProducts();
                                }

                            });
                        });
                    });
                },
                getSelectedProducts() {
                    const selectedProducts = this.selectedKey;

                    $.ajax({
                        method: 'POST',
                        url: route('admin.invoice.products'),
                        data: {
                            productsID: selectedProducts
                        },
                    }).then((response) => {
                        this.productList = response;
                        this.form.selected_products = response;
                        this.updateSubTotal();
                        this.laodingCart = false;
                    }).catch((xhr) => {
                        console.log(xhr.responseJSON.errors);
                    });

                }
            },
            mounted() {
                this.onChangeProducts();
            }
        });

        new Vue({
            el: "#create-invoice",
        });
    </script>
    <style>
        .error-message {
            line-height: 20px;
            display: block;
            margin: 4px 0 -5px;
            color: #e23e1d;
        }

        .error-input {
            border-color: red;
        }

        .index-create-invoice {
            width: 100%;
            margin-right: auto;
            text-align: left;
        }

        .select-products .form-group>label {
            width: 100%;
        }

        .select-products .form-group>[class*="col-md-9"] {
            width: 100%;
            padding: 0;
        }

        .invoic-cart-table .table-text {
            margin-top: 20px;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .invoic-cart-table .product-options label {
            font-weight: 500;
        }

        .invoic-cart-table .form-group .row {
            display: flex;
            justify-content: flex-start;
            align-content: center;
        }

        .invoic-cart-table .form-group .row .option-values {
            padding-left: 15px;
        }

        .invoic-cart-table .number-picker {
            display: inline-block;
            position: relative;
            width: 57px;
        }

        .invoic-cart-table .number-picker input {
            border: none;
        }

        .invoic-cart-table .list-varitant label {
            width: 90px;
            font-weight: 500;
        }

        .invoic-cart-table .product-price {
            font-weight: 500;
        }

        .invoic-cart-table .content {
            min-height: inherit !important;
        }

        .shipping-methods,
        .payment-method {
            padding-left: 15px;
            padding-top: 10px;
        }

        .shipping-methods .title,
        .payment-method .title {
            margin-bottom: 10px;
            font-weight: 500;
        }

        .shipping-methods .form-group,
        .payment-method .form-group {
            margin-left: 20px;
        }

        .shipping-methods .form-group label,
        .payment-method .form-group label {
            font-weight: 100;
        }

        .shipping-methods .form-group .price-amount {
            padding-left: 15px;
        }

        #create-invoice .invoice-summary-total {
            margin-top: 25px;
            padding-top: 25px;
            border-top: 1px solid #ebebeb;
        }

        #create-invoice .invoice-summary-total label {
            font-weight: 500;
        }

        #create-invoice .invoice-summary-bottom {
            text-align: right;
            margin-top: 10px;
        }

        #create-invoice .item-list {
            border-bottom: 1px solid #dddd;
            margin-bottom: 30px;
        }

        #create-invoice .item-list .d-flex {
            display: inline-flex;
        }

        #create-invoice .item-list .base-image img {
            width: 100px;
            height: 100px;
            margin-right: 11px;
            border-radius: 5px;
        }

        #create-invoice .item-list .details .title {
            font-weight: 500;
        }

        .loading {
            position: relative;
        }

        .loading:before {
            position: absolute;
            content: "";
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            background: hsla(0, 0%, 100%, .7);
            border-radius: 2px;
            z-index: 2;
        }

        .loading:after {
            position: absolute;
            content: "";
            left: 50%;
            top: 50%;
            height: 30px;
            width: 30px;
            border-radius: 50%;
            border: 3px solid #2a3447;
            border-top-color: transparent !important;
            z-index: 3;
            -webkit-animation: loader-spin .8s linear infinite;
            animation: loader-spin .8s linear infinite;
        }

        @-webkit-keyframes loader-spin {
            0% {
                -webkit-transform: translate(-50%, -50%) rotate(0deg);
                transform: translate(-50%, -50%) rotate(0deg);
            }

            to {
                -webkit-transform: translate(-50%, -50%) rotate(1turn);
                transform: translate(-50%, -50%) rotate(1turn);
            }
        }

        @keyframes loader-spin {
            0% {
                -webkit-transform: translate(-50%, -50%) rotate(0deg);
                transform: translate(-50%, -50%) rotate(0deg);
            }

            to {
                -webkit-transform: translate(-50%, -50%) rotate(1turn);
                transform: translate(-50%, -50%) rotate(1turn);
            }
        }
    </style>
@endsection
