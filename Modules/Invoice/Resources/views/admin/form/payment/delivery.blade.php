<div class="col-md-12">
    <div class="form-group row">
        <label class="col-sm-9 col-form-label" for="shipping_city">
            Delivery Charge :
        </label>
        <div class="col-sm-3">
            <input type="text"
                   name="shipping_city"
                   id="shipping_city"
				   v-model="form.shipping_cost"
                   class="form-control total-price text-right"
                   autocomplete="-new-payment-delivery">
        </div>
 
    </div>
</div>
