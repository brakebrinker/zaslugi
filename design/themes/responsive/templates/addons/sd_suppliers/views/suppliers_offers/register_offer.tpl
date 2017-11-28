<div class="ty-form-builder" id="content_general">
    <form action="{fn_url('suppliers_offers.register_offer')}" method="POST" id="supplier_offer_form">

        {hook name="suppliers_offers:register_offer_form_fields"}

        {$_country = $supplier.country|default:$settings.General.default_country}

        <div class="ty-control-group">
            <label for="supplier_country" class="ty-control-group__title cm-profile-field">{__("country")}</label>
            <select id="supplier_country" class="ty-form-builder__country cm-country" name="offer[country]">
                <option value="">- {__("select_country")} -</option>
                {foreach from=$countries item="country" key="code"}
                <option {if $_country == $code}selected="selected"{/if} value="{$code}">{$country}</option>
                {/foreach}
            </select>
        </div>

        <div class="ty-control-group">
            <label for="supplier_city" class="ty-control-group__title cm-profile-field cm-required">{__("city")}</label>
            <input type="text" id="supplier_city" name="offer[city]" value="{$supplier.city}" class="ty-input-text">
        </div>

        <div class="ty-control-group ty-profile-field__item">
            <label for="supplier_company" class="ty-control-group__title cm-profile-field">{__("supplier_company")}</label>
            <input type="text" id="supplier_company" name="offer[company]" value="{$supplier.company}" class="ty-input-text">
        </div>

        <div class="ty-control-group ty-profile-field__item">
            <label for="supplier_contact_person" class="ty-control-group__title cm-profile-field cm-required">{__("supplier_contact_person")}</label>
            <input type="text" id="supplier_contact_person" name="offer[contact_person]" value="{$supplier.contact_person}" class="ty-input-text">
        </div>

        <div class="ty-control-group ty-profile-field__item">
            <label for="supplier_phone" class="ty-control-group__title cm-profile-field cm-required">{__("phone")}</label>
            <input type="text" id="supplier_phone" name="offer[phone]" value="{$supplier.phone}" class="ty-input-text">
        </div>

        <div class="ty-control-group ty-profile-field__item">
            <label for="supplier_fax" class="ty-control-group__title cm-profile-field">{__("fax")}</label>
            <input type="text" id="supplier_fax" name="offer[fax]" value="{$supplier.fax}" class="ty-input-text">
        </div>

        <div class="ty-control-group ty-profile-field__item">
            <label for="supplier_email" class="ty-control-group__title cm-profile-field cm-required cm-email">{__("email")}</label>
            <input type="text" id="supplier_email" name="offer[email]" value="{$supplier.email}" class="ty-input-text">
        </div>

        <div class="ty-control-group ty-profile-field__item">
            <label for="supplier_offer" class="ty-control-group__title cm-profile-field cm-required">{__("supplier_your_offer")}</label>
            <textarea id="supplier_offer" name="offer[offer]" class="ty-input-text" rows="10">{$supplier.offer}</textarea>
        </div>

        {/hook}

        <div class="ty-profile-field__buttons buttons-container">
            {include file="buttons/button.tpl" but_name="dispatch[suppliers_offers.register_offer]" but_text="{__("send")}" but_meta="ty-btn__secondary"}
        </div>
    </form>
</div>
