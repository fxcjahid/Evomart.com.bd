<div class="col-md-12 payment-method" v-if="!hasNoPaymentMethod">

    <h6 class="title">
        {{ trans('storefront::checkout.payment_method') }}
    </h6>

    <div class="payment-method-form">
        <div class="form-group">
            <div class="form-radio" v-for="(gateway, name) in gateways" :key="name">
                <input
                    type="radio"
                    name="payment_method"
                    v-model="form.payment_method"
                    :value="name"
                    :id="name" 
                > 
                <label :for="name" v-text="gateway.label"></label> 
            </div> 
			<span
				class="error-message"
				v-if="errors.has('payment_method')"
				v-text="errors.get('payment_method')"
			>
			</span>
        </div>
    </div>

</div>

 