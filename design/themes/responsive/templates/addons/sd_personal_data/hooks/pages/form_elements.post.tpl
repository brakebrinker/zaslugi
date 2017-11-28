{if !empty($addons.sd_personal_data.add_checkbox_form_ids[$page.page_id]) && $element == $page.form.elements|end}
    <div class="sd_personal_data-agreement-checkbox">
        {include file="addons/sd_personal_data/views/components/personal_data_agreement.tpl"}
    </div>
{/if}

