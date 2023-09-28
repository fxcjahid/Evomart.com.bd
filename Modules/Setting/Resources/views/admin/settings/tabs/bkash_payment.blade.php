<div class="row">
    <div class="col-md-8">
        {{ Form::checkbox('bkash_transfer_enabled', trans('setting::attributes.bank_transfer_enabled'), trans('Enable Bkash Transfer'), $errors, $settings) }}
        {{ Form::text('translatable[bkash_transfer_label]', trans('setting::attributes.translatable.bank_transfer_label'), $errors, $settings, ['required' => true]) }}
        {{ Form::textarea('translatable[bkash_transfer_description]', trans('setting::attributes.translatable.bank_transfer_description'), $errors, $settings, ['rows' => 3]) }} 
    </div>
</div>
