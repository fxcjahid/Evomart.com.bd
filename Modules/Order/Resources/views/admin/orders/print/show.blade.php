<!DOCTYPE html>
<html lang="{{ locale() }}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{{ trans('order::print.invoice') }} #{{ $order->id }}</title>

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">
    <link href="{{ v(Module::asset('order:admin/css/print.css')) }}" rel="stylesheet">
</head>

<body class="{{ is_rtl() ? 'rtl' : 'ltr' }}">
    <!--[if lt IE 8]>
<p>You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a>
    to improve your experience.</p>
<![endif]-->

    <div class="container">
        <div class="invoice-wrapper clearfix">
            <div class="row">
                <div class="invoice-header clearfix">
                    <div class="col-md-3">

                        <span class="title">{{ trans('order::print.invoice') }}</span>

                        <div class="invoice-info clearfix">
                            <div class="invoice-id">
                                <label for="invoice-id">{{ trans('order::print.invoice_id') }}:</label>
                                <span>#{{ $order->id }}</span>
                            </div>

                            <div class="invoice-date">
                                <label for="invoice-date">{{ trans('order::print.date') }}:</label>
                                <span>{{ $order->created_at->format('d-m-Y') }}</span>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-9 clearfix">
                        <div class="invoice-header-right pull-right">
                            <div class="store-name">
                                @if (is_null($logo))
                                    <h1>{{ setting('store_name') . '.com' }}</h1>
                                @else
                                    <img class="invoice-logo" src="{{ $logo }}" alt="logo">
                                @endif

                                @if (setting('store_tagline'))
                                    <p>{{ setting('store_tagline') }}</p>
                                @endif

                                @if (setting('storefront_address'))
                                    <p>{{ setting('storefront_address') }}</p>
                                @endif

                                @if (setting('store_phone') && !setting('store_phone_hide'))
                                    <p>{{ setting('store_phone') }}</p>
                                @endif

                                @if (setting('store_email') && !setting('store_email_hide'))
                                    <p>{{ setting('store_email') }}</p>
                                @endif

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="invoice-body clearfix">
                <div class="invoice-details-wrapper">
                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <div class="invoice-details">
                                <h5>{{ trans('order::print.order_details') }}</h5>

                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>

                                            <tr>
                                                <td>{{ trans('order::print.name') }}:</td>
                                                <td>{{ $order->CustomerFullName }}</td>
                                            </tr>

                                            <tr>
                                                <td>{{ trans('order::print.address') }}:</td>
                                                <td>{{ $order->billing_address_1 }}</td>
                                            </tr>

                                            @if ($order->customer_email)
                                                <tr>
                                                    <td>{{ trans('order::print.email') }}:</td>
                                                    <td>{{ $order->customer_email }}</td>
                                                </tr>
                                            @endif

                                            @if ($order->customer_phone)
                                                <tr>
                                                    <td>{{ trans('order::print.phone') }}:</td>
                                                    <td>{{ $order->customer_phone }}</td>
                                                </tr>
                                            @endif


                                            @if ($order->shipping_method)
                                                <tr>
                                                    <td>{{ trans('order::print.shipping_method') }}:</td>
                                                    <td>{{ $order->shipping_method }}</td>
                                                </tr>
                                            @endif

                                            <tr>
                                                <td>{{ trans('order::print.payment_method') }}:</td>
                                                <td>{{ $order->payment_method }}
                                                    @if ($order->payment_method === 'Bank Transfer')
                                                        <br />
                                                        {{ setting('bank_transfer_instructions') }}
                                                    @endif
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <div class="invoice-address">
                                @if ($order->same_address)
                                    <h5>{{ trans('order::print.delivery_address') }}</h5>
                                @else
                                    <h5>{{ trans('order::print.shipping_address') }}</h5>
                                @endif

                                <span>{{ $order->shipping_full_name }}</span>
                                <span>{{ $order->shipping_address_1 }}</span>
                                <span>{{ $order->shipping_address_2 }}</span>
                                <span>
                                    {{ $order->shipping_city }}
                                    {{ $order->shipping_state }}
                                    {{ $order->shipping_zip }}
                                </span>
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-6">
                            @if (!$order->same_address)
                                <div class="invoice-address">
                                    <h5>{{ trans('order::print.billing_address') }}</h5>

                                    <span>{{ $order->billing_full_name }}</span>
                                    <span>{{ $order->billing_address_1 }}</span>
                                    <span>{{ $order->billing_address_2 }}</span>
                                    <span>
                                        {{ $order->billing_city }}
                                        {{ $order->billing_state }}
                                        {{ $order->billing_zip }}
                                    </span>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="cart-list">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>{{ trans('order::print.product') }}</th>
                                        <th>{{ trans('order::print.quantity') }}</th>
                                        <th>{{ trans('order::print.unit_price') }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($order->products as $product)
                                        <tr>
                                            <td>
                                                <span>{{ $product->name }}</span>

                                                @if ($product->hasAnyOption())
                                                    <div class="option">
                                                        @foreach ($product->options as $option)
                                                            <span>
                                                                {{ $option->name }}:

                                                                <span>
                                                                    @if ($option->option->isFieldType())
                                                                        {{ $option->value }}
                                                                    @else
                                                                        {{ $option->values->implode('label', ', ') }}
                                                                    @endif
                                                                </span>
                                                            </span>
                                                        @endforeach
                                                    </div>
                                                @endif
                                            </td>


                                            <td>
                                                <label class="visible-xs">{{ trans('order::print.quantity') }}:</label>
                                                <span>{{ $product->qty }}</span>
                                            </td>

                                            <td>
                                                <label
                                                    class="visible-xs">{{ trans('order::print.unit_price') }}:</label>
                                                <span>{{ $product->unit_price->amount() }}</span>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="editable pull-left">
                        <div contenteditable="true">
                            Apply terms & condition *
                        </div>
                    </div>

                    <div class="total pull-right">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td>{{ trans('order::print.product_price') }}</td>
                                    <td>
                                        {{ $order->sub_total->amount() }}
                                    </td>
                                </tr>

                                @if ($order->hasShippingMethod())
                                    <tr>
                                        <td>{{ trans('order::print.delivery_charge') }}</td>
                                        <td>{{ $order->shipping_cost->amount() }}
                                        </td>
                                    </tr>
                                @endif

                                @if ($order->hasDiscount())
                                    <tr>
                                        <td>{{ trans('order::print.discount') }}</td>
                                        <td>
                                            {{ $order->discount->amount() }}
                                        </td>
                                    </tr>
                                @endif

                                @if ($order->hasAdvancePayment())
                                    <tr>
                                        <td>{{ trans('order::print.advance_payment') }}</td>
                                        <td>
                                            {{ $order->advance_pay->amount() }}
                                        </td>
                                    </tr>
                                @endif

                                @if ($order->hasCoupon())
                                    <tr>
                                        <td>
                                            {{ trans('order::orders.coupon') }}
                                            (<span class="coupon-code">{{ $order->coupon->code }}</span>)
                                        </td>
                                        <td>
                                            &#8211;{{ $order->discount->amount() }}
                                        </td>
                                    </tr>
                                @endif

                                @foreach ($order->taxes as $tax)
                                    <tr>
                                        <td>{{ $tax->name }}</td>
                                        <td class="text-right">
                                            {{ $tax->order_tax->amount->amount() }}
                                        </td>
                                    </tr>
                                @endforeach

                                <tr>
                                    <td>{{ trans('order::print.total_amount') }}</td>
                                    <td>
                                        {{ $order->total->amount() }}
                                    </td>
                                </tr>

                                <tr>
                                    <td>{{ trans('order::print.due_collection') }}</td>
                                    <td>{{ $order->due_amount->format($order->currency) }}
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // window.print();
    </script>
</body>

</html>
