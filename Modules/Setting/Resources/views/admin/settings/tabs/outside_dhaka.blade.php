<div class="row">
    <div class="col-md-8">
        {{ Form::checkbox('outside_dhaka_enabled', trans('setting::attributes.status'), trans('setting::settings.tabs.outside_dhaka'), $errors, $settings) }}
        {{ Form::text('translatable[outside_dhaka_label]', trans('setting::attributes.label'), $errors, $settings, ['required' => true]) }}
        {{ Form::number('outside_dhaka_cost', trans('setting::attributes.cost'), $errors, $settings, ['min' => 0, 'required' => true]) }}
    </div>
</div>
