 <div class="col-md-12">
    <div class="form-group">
        <label for="customer_first_name">
            Customer Name<span> * </span>
        </label>

        <input
            type="text"
            name="customer_name"
            v-model="form.customer_name"
            id="customer_name"
            class="form-control"
            autocomplete="-new-name"
        > 

		<span
			class="error-message"
			v-if="errors.has('customer_name')"
			v-text="errors.get('customer_name')"
		>
		</span>

    </div>
</div>

 