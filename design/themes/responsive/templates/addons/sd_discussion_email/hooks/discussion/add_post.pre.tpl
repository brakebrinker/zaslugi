<div class="ty-control-group">
    <label for="dsc_email_{$obj_prefix}{$obj_id}" class="ty-control-group__title cm-required cm-email cm-trim">{__("email")}</label>
    <input type="text" name="post_data[email]" id="dsc_email_{$obj_prefix}{$obj_id}" size="50" class="ty-input-text-large" value="{if $auth.user_id}{$user_info.email}{elseif $discussion.post_data.email}{$discussion.post_data.email}{/if}" />
</div>