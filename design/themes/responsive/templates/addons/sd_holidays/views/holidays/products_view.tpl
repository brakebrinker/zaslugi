<div id="holiday_products_{$block.block_id}">
{if $products}
{assign var="layouts" value=""|fn_get_products_views:false:0}
{if $category_data.product_columns}
    {assign var="product_columns" value=$category_data.product_columns}
{else}
    {assign var="product_columns" value=$settings.Appearance.columns_in_products_list}
{/if}

{if $layouts.$selected_layout.template}
    {include file="`$layouts.$selected_layout.template`" columns=$product_columns}
{/if}

{else}
<p class="ty-no-items cm-pagination-container">{__("text_no_products")}</p>
{/if}
<!--holiday_products_{$block.block_id}--></div>

{capture name="mainbox_title"}{__("addons.sd_holidays.products_for_holiday")}&nbsp;{$holiday.description}{/capture}