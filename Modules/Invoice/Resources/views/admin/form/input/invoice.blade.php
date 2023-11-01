<div class="col-md-12">
    <div class="form-group">
        <label for="invoice_number">
            Invoice Number <span>  </span>
        </label> 
 
        <input 
            type="text"
            name="invoice_number"
            v-model="form.invoice_number"
            id="invoice_number"
            class="form-control"
            autocomplete="-new-invoice_number"
        > 
		<small  class="form-text text-muted">
			if you blank this, It will generate automatic
		</small>

		<span
			class="error-message"
			v-if="errors.has('invoice_number')"
			v-text="errors.get('invoice_number')"
		>
		</span>
	
    </div>
</div> 
