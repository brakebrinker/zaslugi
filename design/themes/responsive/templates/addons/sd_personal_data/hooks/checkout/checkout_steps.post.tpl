{if ($settings.Checkout.disable_anonymous_checkout == "Y" && !$auth.user_id) || ($settings.Checkout.disable_anonymous_checkout != "Y" && !$auth.user_id && !$contact_info_population) || $smarty.session.failed_registration == true}
    {include file="addons/sd_personal_data/views/components/personal_data_agreement.tpl"}
{/if}
