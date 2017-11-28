{assign var="page_id" value=$addons.sd_personal_data.personal_data_page_id}

{if $page_id}
    <div class="cm-field-container">
        <label for="personal_data_agreement_{$id}" class="cm-check-agreement cm-required">
            <input type="checkbox" id="personal_data_agreement_{$id}" name="accept_agreement" value="Y" class="cm-agreement checkbox" />{__("personal_data_conditions_you_accept")}
            <a data-ca-target-id="personal_data_agreement_dialog{$id}" href="{fn_url("pages.view&page_id=`$page_id`")}" class="cm-dialog-opener cm-dialog-auto-size">{__("with_personal_data_processing_agreement")}</a>
        </label>
    </div>

    <div id="personal_data_agreement_dialog{$id}" class="hidden" title="{__("personal_data_processing_agreement")}"></div>

    {if !$hide_custome_error}
        <script type="text/javascript">
            (function(_, $) {
                $.ceFormValidator('registerValidator', {
                    class_name: 'cm-check-agreement',
                    message: '{__("checkout_terms_n_conditions_alert")|escape:javascript}',
                    func: function(id) {
                        return $('#' + id).prop('checked');
                    }
                });
            }(Tygh, Tygh.$));
        </script>
    {/if}
{/if}