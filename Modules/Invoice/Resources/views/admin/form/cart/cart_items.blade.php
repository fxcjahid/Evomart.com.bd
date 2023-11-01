<div class="col-md-12"
    :class="{ loading:laodingCart }" 
    style="min-height: 60px;">

    <div v-if="! cartIsNotEmpty" class="table table-borderless invoic-cart-table"> 
        <div class="table-text">Product Listing</div> 
        <div class="item-list" v-for="product in productList" :key="product.id">
            <div class="d-flex">
                <div class="base-image">
                    <img :src="product.image" alt="product image" >
                </div>
                <div class="details">
                    <div class="title" v-text="product.name"></div>
                    <div class="content" >  

                        <div class="list-inline product-options" v-if="false" v-for="option in product.options">
                            
                            <div class="form-group variant-check">
                                <div class="row">
                                    <div class="col-xl-4 col-lg-6">
                                        <label v-text="option.name"></label>
                                    </div>

                                    <div class="col-xl-10 col-lg-12 option-values"> 
                                        
                                        <div class="form-check" v-for="values in option.values">
                                            <input
                                                type="checkbox" 
                                                :name=" 'options[' +option.id+ '][]'"
                                                :id="'option-' +option.id+ '-value-' +values.id"  
                                                :value="values.id"
                                                :key="'option-' +option.id+ '-value-' +values.id"
                                                @change="updateCheckedPrice(product,$event,values.price.inCurrentCurrency.amount)"
                                            >  
                                            <label 
                                                :for="'option-' +option.id+ '-value-' +values.id"
                                                v-text=" values.label + [ values.price.amount != null ? ( ' + ' + values.price.formatted ) : '' ] ">
                                            </label> 
                                        </div> 
                                    
                                    </div>
                                </div>
                            </div>



                        </div> 
                        <ul class="list-varitant">
                            <label>Quantity : </label>
                            <div class="number-picker">
                                <div class="input-group-quantity"> 
                                    <input
                                        type="number"
                                        :value="product.quantity"
                                        min="1" 
                                        step="1"
                                        v-numericOnly
                                        v-modal="form.product_quantity"
                                        name="product_quantity"
                                        class="form-control input-number input-quantity" 
                                        @input="updateQuantity(product, $event.target.value)" 
                                    > 
                                </div>
                            </div>
                        </ul>
                        <ul class="list-varitant">
                            <label>Price : </label>
                            <span class="product-price" v-html="product.price.amount"></span>
                        </ul>

                    </div>
                </div>
            </div>
        </div>  
    </div>
</div> 