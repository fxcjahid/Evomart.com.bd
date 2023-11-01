<div class="col-md-12">
    <div class="form-group">
        <label for="email">
            {{ trans('checkout::attributes.customer_email') }}
        </label>

        <input 
            type="text"
            name="customer_email"
            v-model="form.customer_email"
            id="email" class="form-control"
            autocomplete="-email"
        >
 
        
    </div>
</div>
