/** Custom Product Landing Page */ 
import store from "../../store";
import Errors from "../../Errors";
import CartHelpersMixin from "../../mixins/CartHelpersMixin";
import ProductHelpersMixin from "../../mixins/ProductHelpersMixin";
 
export default {

	mixins: [CartHelpersMixin, ProductHelpersMixin],

	props: [ 
		"gateways",  
        "product",
	],

	data() {
		return {  
			form:{ }, 
            cartItemForm: {
                product_id: this.product.id,
                qty: 1,
                options: {},
            },
            shippingMethodName: null,
			placingOrder: false,
			errors: new Errors(),  
			authorizeNetToken: null,
		};
	},   

	computed: {
		cartIsNotEmpty() {
            return ! store.cartIsEmpty();
        },
    },
    
    
    created() {
        this.$nextTick(() => {
            if (store.state.cart.shippingMethodName) {
                this.changeShippingMethod(store.state.cart.shippingMethodName);
            } else {
                this.updateShippingMethod(this.firstShippingMethod);
            } 
        });
    },

	methods: {
		     
        optionValues(option) {
            let values = [];

            for (let value of option.values) {
                values.push(value.label);
            }

            return values.join(', ');
		},
		
		updateOption() { 
            this.$nextTick(() => {
                $.ajax({
                    method: 'POST',
                    url: route('products.option.update', { id: this.product.id }),
                    data: { options: this.cartItemForm.options },
                }).then((items) => {
                    this.cartItemForm = items;
                }).catch((xhr) => {
                    this.$notify(xhr.responseJSON.message);
                });
            });
		}, 
		 
        updateQuantity(cartItem, qty) {
            if (qty < 1 || this.exceedsMaxStock(cartItem, qty)) {
                return;
            }

            if (isNaN(qty)) {
                qty = 1;
            }

            this.loadingOrderSummary = true;

            cartItem.qty = qty;

            $.ajax({
                method: 'PUT',
                url: route('cart.items.update', { cartItemId: cartItem.id }),
                data: { qty: qty || 1 },
            }).then((cart) => {
                store.updateCart(cart);
            }).catch((xhr) => {
                this.$notify(xhr.responseJSON.message);
            }).always(() => {
                this.loadingOrderSummary = false;
            });
        },

        exceedsMaxStock(cartItem, qty) {
            return cartItem.product.manage_stock && cartItem.product.qty < qty;
        },

        remove(cartItem) {
            this.loadingOrderSummary = true;

            store.removeCartItem(cartItem);

            if (store.cartIsEmpty()) {
                this.crossSellProducts = [];
            }

            $.ajax({
                method: 'DELETE',
                url: route('cart.items.destroy', { cartItemId: cartItem.id }),
            }).then((cart) => {
                store.updateCart(cart);
            }).catch((xhr) => {
                this.$notify(xhr.responseJSON.message);
            }).always(() => {
                this.loadingOrderSummary = false;
            });
        },
        
		updateCart() { 

			const cartId = store.getCartFirstId();
			const quantity = store.getCartFirstQuantity();
   
            this.$nextTick(() => {
                $.ajax({
                    method: 'PUT',
                    url: route('cart.option.update', { id: this.product.id }),
					data: { 
						cartId: cartId,
						productId: this.product.id,
						qty: quantity,
						options: this.cartItemForm.options
					},
				}).then((cart) => {
					store.updateCart(cart);
                }).catch((xhr) => {
                    this.$notify(xhr.responseJSON.message);
                });
            });
		}, 
		  
        updateSelectTypeOptionValue(optionId, e) {
            this.$set(this.cartItemForm.options, optionId, $(e.target).val());

            this.errors.clear(`options.${optionId}`);
        },

        updateCheckboxTypeOptionValue(optionId, e) {
            let values = $(e.target)
                .parents('.variant-check')
                .find('input[type="checkbox"]:checked')
                .map((_, el) => {
                    return el.value;
                });

            this.$set(this.cartItemForm.options, optionId, values.get());
        },

        customRadioTypeOptionValueIsActive(optionId, valueId) {
            if (!this.cartItemForm.options.hasOwnProperty(optionId)) {
                return false;
            }

            return this.cartItemForm.options[optionId] === valueId;
        },

        syncCustomRadioTypeOptionValue(optionId, valueId) {
            if (this.customRadioTypeOptionValueIsActive(optionId, valueId)) {
                this.$delete(this.cartItemForm.options, optionId);
            } else {
                this.$set(this.cartItemForm.options, optionId, valueId);

                this.errors.clear(`options.${optionId}`);
            }

            this.updateCart();
        },

        customCheckboxTypeOptionValueIsActive(optionId, valueId) {
            if (!this.cartItemForm.options.hasOwnProperty(optionId)) {
                this.$set(this.cartItemForm.options, optionId, []);

                return false;
            }

            return this.cartItemForm.options[optionId].includes(valueId);
        },

        syncCustomCheckboxTypeOptionValue(optionId, valueId) {
            if (this.customCheckboxTypeOptionValueIsActive(optionId, valueId)) {
                this.cartItemForm.options[optionId].splice(
                    this.cartItemForm.options[optionId].indexOf(valueId),
                    1
                );
            } else {
                this.cartItemForm.options[optionId].push(valueId);

                this.errors.clear(`options.${optionId}`);
            }

            this.updateCart();
        },

        changeShippingMethod(shippingMethodName) {
            this.shippingMethodName = shippingMethodName;
        },
   
		placeOrder() {

            this.placingOrder = true; 

            const form = new FormData(this.$refs.form);
            const formData = {};
            form.forEach((value, key) => {
                formData[key] = value;
            });
  
			$.ajax({
				method: "POST",
				url: route("checkout.fromLandingPage"),
				data: { ...formData },
			})
				.then((response) => {
					if (response.redirectUrl) {
						window.location.href = response.redirectUrl;
					 } else {
						this.confirmOrder(
							response.orderId,
							formData.payment_method
						);
					}
				})
				.catch((xhr) => {
					if (xhr.status === 422) {
						this.errors.record(xhr.responseJSON.errors);
					}

					this.$notify(xhr.responseJSON.message);

					this.placingOrder = false;
				});
		},

		confirmOrder(orderId, paymentMethod, params = {}) {
			$.ajax({
				method: "GET",
				url: route("checkout.complete.store", {
					orderId,
					paymentMethod,
					...params,
				}),
			})
				.then(() => {
					window.location.href = route("checkout.complete.show", { paymentMethod: paymentMethod });
				})
				.catch((xhr) => {
					this.placingOrder = false;
					this.loadingOrderSummary = false;

					this.deleteOrder(orderId);
					this.$notify(xhr.responseJSON.message);
				});
		},

		deleteOrder(orderId) {
			if (!orderId) {
				return;
			}

			$.ajax({
				method: "GET",
				url: route("checkout.payment_canceled.store", { orderId }),
			}).then((xhr) => {
				this.$notify(xhr.message);
			});
		},
  
	},
};
