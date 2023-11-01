<div class="col-md-12">
    <div class="form-group">
        <label for="delivery-address">
        	Customer Address<span>*</span>
        </label>
 
        <textarea
            name="customer_address"
            v-model="form.customer_address"
            cols="30"
            rows="3"
            id="delivery-address"
            class="form-control"
            autocomplete="-new-address"
        ></textarea> 
        
		<span
			class="error-message"
			v-if="errors.has('customer_address')"
			v-text="errors.get('customer_address')"
		>
		</span>

    </div> 
</div>
