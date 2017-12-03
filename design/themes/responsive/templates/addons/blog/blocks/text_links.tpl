{** block-description:blog.text_links **}

{assign var="parent_id" value=$block.content.items.parent_page_id}
{if $items}
<div class="ty-blog-text-links">
    <!-- <ul> -->
    {foreach from=$items item="page" name="fe_blog"}
        <div class="ty-discussion-post__content ty-scroller-discussion-list__item">
            <span class="ty-blog-text-links__date">{$page.timestamp|date_format:$settings.Appearance.date_format}</span>
            <div class="review-title">Новости</div>
            {hook name="discussion:items_list_row"}
            <span class="ty-discussion-post__author">{$page.page}</span>
            <div class="ty-discussion-post {cycle values=", ty-discussion-post_even"}" id="post_{$post.post_id}">
                <div class="ty-discussion-post__message">{$page.page}</div>
                {if $discussion.type == "C" || $discussion.type == "B"}
                <!-- <div class="ty-discussion-post__message">{$page.page}</div> -->
                {/if}
            </div>
<!--             <pre>{$page|@print_r} </pre> -->
            <a href="{"pages.view?page_id=`$page.page_id`"|fn_url}">Подробнее...</a>
            {/hook}
        </div>
<!--         <li class="ty-blog-text-links__item">
            <div class="ty-blog-text-links__date">{$page.timestamp|date_format:$settings.Appearance.date_format}</div>
            <a href="{"pages.view?page_id=`$page.page_id`"|fn_url}" class="ty-blog-text-links__a">{$page.page}</a>
        </li> -->
    {/foreach}
    <!-- </ul> -->
<!--     {if $parent_id}
        <div class="ty-mtb-xs ty-left">
            {include file="buttons/button.tpl" but_href="pages.view?page_id=`$parent_id`" but_text=__("view_all") but_role="text" but_meta="ty-btn__secondary blog-ty-text-links__button"}
        </div>
    {/if} -->
</div>
{/if}