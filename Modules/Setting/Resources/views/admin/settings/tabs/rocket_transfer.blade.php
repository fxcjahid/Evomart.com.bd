<div class="row">
    <div class="col-md-8">
        {{ Form::checkbox('rocket_transfer_enabled', trans('setting::attributes.check_payment_enabled'), trans('Enable Rocket Transfer'), $errors, $settings) }}
        {{ Form::text('translatable[rocket_transfer_label]', trans('setting::attributes.translatable.check_payment_label'), $errors, $settings, ['required' => true]) }}
        {{ Form::textarea('translatable[rocket_transfer_description]', trans('setting::attributes.translatable.check_payment_description'), $errors, $settings, ['rows' => 3]) }} 
    </div>
</div>
