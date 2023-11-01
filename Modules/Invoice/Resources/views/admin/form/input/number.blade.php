<div class="col-md-12">
    <div class="form-group">
        <label for="customer_phone">
            {{ trans('checkout::attributes.customer_phone') }} <span> * </span>
        </label> 
 
        <input 
            type="tel"
            name="customer_phone"
            v-model="form.customer_phone"
            id="customer_phone"
            class="form-control"
            autocomplete="-new-number"
        > 

		<span
			class="error-message"
			v-if="errors.has('customer_phone')"
			v-text="errors.get('customer_phone')"
		>
		</span>

    </div>
</div>
