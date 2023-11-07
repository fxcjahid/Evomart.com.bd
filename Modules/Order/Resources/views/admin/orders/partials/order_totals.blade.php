<div class="order-totals-wrapper">
    <div class="row">
        <div class="order-totals pull-right">
            <div class="table-responsive">
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
