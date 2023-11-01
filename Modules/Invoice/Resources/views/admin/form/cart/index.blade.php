 <div class="row">
     <div class="col-md-12 select-products">
         {{ Form::select('selected_products', trans('invoice::invoice.invoice.product_select'), $errors, $products, [], ['class' => 'selectize col-md-12', 'v-model' => 'form.selected_products', 'id' => 'selected_products', 'multiple' => true]) }}
     </div>
 </div>
