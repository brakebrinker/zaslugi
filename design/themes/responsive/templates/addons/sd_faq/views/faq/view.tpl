{capture name="tabsbox"}
<div class="ty-footer-form-block ty-faq">
    <form action="{""|fn_url}" method="post" name="faq_form">
        {if $user_info.email}
            {$text_email = ''}
            {$email = $user_info.email}
            {$hint = false}
            {$user_id = $user_info.user_id}
        {else}
            {$text_email = __("enter_email")}
            {$email = ''}
            {$hint = true}
            {$user_id = 0}
        {/if}
        <input type="hidden" name="redirect_url" value="{$config.current_url}" />
        <input type="hidden" name="user_id" value="{$user_id}" />
        <input type="hidden" name="email" value="{$email}" />
        <h3>{__("sd_faq.text_add_question")}</h3>
        {if $user_id}
            {if $user_info.firstname || $user_info.lastname}
                <h4>{$user_info.firstname} {$user_info.lastname} ({$email})</h4>
            {else}
                <div class="ty-footer-form-block__form ty-control-group ty-input-append">
                    <label class="cm-required hidden" for="name">{__("sd_faq.enter_first_name_last_name")}</label>
                    <input type="text" name="name" id="name" size="20" value="{__("sd_faq.enter_first_name_last_name")}" class="cm-hint ty-input-text" />
                </div>
                <div class="ty-footer-form-block__form ty-control-group ty-input-append">
                    ({$email})
                </div>
            {/if}
        {else}
            <div class="ty-footer-form-block__form ty-control-group ty-input-append">
                <label class="cm-required hidden" for="name">{__("sd_faq.enter_first_name_last_name")}</label>
                <input type="text" name="name" id="name" size="20" value="{__("sd_faq.enter_first_name_last_name")}" class="cm-hint ty-input-text" />
            </div>
            <div class="ty-footer-form-block__form ty-control-group ty-input-append">
                <label class="cm-required cm-email hidden" for="subscr_email">{__("enter_email")}</label>
                <input type="text" name="email" id="subscr_email" size="20" value="{__("enter_email")}" class="cm-hint ty-input-text" />
            </div>
        {/if}
        <div class="ty-control-group ty-input-append">
            <label class="cm-required hidden" for="question">{__("sd_faq.your_question")}</label>
            <textarea name="question" cols="81" rows="4" class="cm-hint ty-sd_faq_texarea" id="question">{__("sd_faq.your_question")}</textarea>
        </div>
        {hook name="faq:add_post"}{/hook}
        <div class="buttons-container sd_faq-buttons-container">
            {include file="buttons/button.tpl" but_name="dispatch[faq.add_question]" but_text={__("send")} but_meta="ty-btn__secondary" but_id="save_question_but"}
        </div>
    </form>
</div>

<div class="ty-sd_faq-question-list">
    {if $questions}
        {include file="common/pagination.tpl"}
        {foreach from=$questions item="question"}
           <div class="ty-sd-faq-question">
		    <div class="ty-sd-faq-question__question">
		    <span class="ty-sd-faq-question__date">{$question.create_time|date_format:"`$settings.Appearance.date_format`"}</span>
		    <span class="ty-sd-faq-question__name">
		    {if $question.user_id}
		      {$question.firstname} {$question.lastname}
		    {else}
		      {$question.name}
		    {/if}
		    </span>
		    
		    {$question.question|replace:"\n":"<br>" nofilter}
		    </div>
		    <div class="ty-sd-faq-question__answer">
		    <span class="ty-sd-faq-question__date">{$question.response_time|date_format:"`$settings.Appearance.date_format`"}</span>
		    <span class="ty-sd-faq-question__name">zaslugi.com</span>
		    {$question.response|replace:"\n":"<br>" nofilter}
		    </div>
           </div>
        {/foreach}
        {include file="common/pagination.tpl"}
    {else}
        <p class="ty-no-items">{__("no_data")}</p>
    {/if}
</div>
{/capture}

{include file="common/tabsbox.tpl" content=$smarty.capture.tabsbox}

{capture name="mainbox_title"}{__("sd_faq.faq")}{/capture}