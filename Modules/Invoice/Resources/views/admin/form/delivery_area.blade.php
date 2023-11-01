<div class="shipping-methods">
    <h6 class="title">
        Delivery Area
    </h6>  

    <div class="form-group" v-if="!hasNoShippingMethods">
        <div class="form-radio" v-for="shippingMethod in shippingmethods">
            <input
                type="radio"
                name="shipping_method"
                v-model="form.shipping_method"
                :value="shippingMethod.name"
                :id="shippingMethod.name"
                @change="updateDeliveryCharge(shippingMethod.cost.amount)"
            > 
            <label :for="shippingMethod.name" v-text="shippingMethod.label"></label>
            <span
                v-if="shippingMethod.name == 'free_shipping' ? false : true"
                class="price-amount"
                v-html="shippingMethod.cost.inCurrentCurrency.formatted"
            ></span> 
        </div> 
 
		<span
			class="error-message"
			v-if="errors.has('shipping_method')"
			v-text="errors.get('shipping_method')"
		>
		</span>
        
    </div> 

    <span class="error-message" v-else>
        {{ trans('storefront::cart.shipping_method_is_not_configured') }}
    </span>
</div>