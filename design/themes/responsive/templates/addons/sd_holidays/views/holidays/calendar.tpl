{script src="js/tygh/tabs.js"}

{capture name="tabsbox"}
<div class="sd_calendar" id="months_list">
    {$url = "holidays.calendar"}
    {$result_ids = "months_list"}
    <div class="cm-j-tabs cm-track cm-j-tabs-disable-convertation clearfix">
        <ul class="ty-tabs__list" id="holidays_tabs">
            {foreach from=$holidays_tree key="tab_id" item="month"}
                {assign var="tab_name" value="month_`$tab_id`"}
                {if $tab_id == $active_tab || (!$active_tab && $holidays_tree[$month_id])}
                    {$active = $tab_id}
                {/if}
                {$first_holidays = $holidays_tree|reset}

                <li id="month_{$tab_id}" class="ty-tabs__item{if $tab_id == $active_tab || (!$active_tab && $holidays_tree[$month_id])} active{/if}">
                    <a class="ty-tabs__a cm-ajax cm-ajax-full-render" data-ca-target-id="{$result_ids}" href="{"`$url`?active_tab=`$tab_id`"|fn_url}">{$month.description}</a>
                </li>
            {/foreach}
        </ul>
    </div>
    <div class="cm-tabs-content cm-j-content-disable-convertation tabs-content clearfix">
        {foreach from=$holidays_tree key="tab_id" item="month"}
            <table class="{if $active != $tab_id}hidden{/if}" id="content_holidays_{$tab_id}" width="100%">
                {foreach from=$month.holidays key="holiday_id" item="holiday"}
                    <tr>
                        <td class="span3">{$holiday.day} {$month.description_u}</td>
                        <td class="span9">{$holiday.description}</td>
                        <td class="span4"><a href="{"holidays.products_view?holiday_id=`$holiday.holiday_id`"|fn_url}">{__("addons.sd_holidays.get_products")}</a></td>
                    </tr>
                {/foreach}
            <!--content_holidays_{$tab_id}--></table>
        {/foreach}
    </div>
<!--months_list--></div>
<div class="ty-footer-form-block sd_calendar">
    <form action="{""|fn_url}" method="post" name="subscribe_form">
        <input type="hidden" name="redirect_url" value="{$config.current_url}" />
        <h3>{__("addons.sd_holidays.subscribe_to_congratulations")}</h3>
        <div class="ty-footer-form-block__form ty-control-group ty-input-append">
            <label class="cm-required cm-email hidden" for="subscr_email">{__("email")}</label>
            {if $user_info.email}
                {$text_value = $user_info.email}
            {else}
                {$text_value = __("enter_email")}
            {/if}
            <input type="text" name="subscribe_email" id="subscr_email" size="20" value="{$text_value}" class=" {if !$user_info.email}cm-hint{/if} ty-input-text" />
            {include file="buttons/go.tpl" but_name="holidays.add_subscriber" alt=__("go")}
        </div>
    </form>
</div>
{/capture}

{include file="common/tabsbox.tpl" content=$smarty.capture.tabsbox}

{capture name="mainbox_title"}{__("addons.sd_holidays.holidays")}{/capture}