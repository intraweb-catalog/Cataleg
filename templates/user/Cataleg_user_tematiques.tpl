{*<pre>{$prioritats|print_r}</pre>*}
{pageaddvar name='javascript' value='jQuery'}
{if $prioritats}
    {foreach from=$prioritats item="prioritat" key="k"}
        <h3>{$prioritat.ordre}.- {$prioritat.prioritat}</h3>        
        {if count($prioritat.tematiques) gt 0}
            <table class="z-datatable">
                <thead>
                    <tr>
                        <th with="25%">{gt text='Temàtica'}</a></th>
                        <th with="25%">{gt text='Persona de contacte'}</a></th>
                        <th with="15%">{gt text='Correu'}</a></th>
                        <th with="15%">{gt text='Telèfon'}</a></th>
                        <th with="1%">{img modname='core' set='icons/extrasmall' src='group.png' __title='Es disposa de formadors/es' __alt='Es disposa de formadors/es'}</th>
                        <th with="5%" style="text-align:center">{gt text='Accions'}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$prioritat.tematiques item="tematica"}
                        <tr id="row_{$tematica.impunitId}">
                            <td>{$tematica.tematica}</td>
                            <td>{$tematica.pContacte}</td>
                            <td>{$tematica.email}</td>
                            <td>{$tematica.telContacte}</td>                    
                            <td>{if $tematica.dispFormador}{img modname='core' set='icons/extrasmall' src='button_ok.png' __title='Es disposa de formadors/es' __alt='Es disposa de formadors/es'}{/if}</td>
                            <td style="text-align:center">
                                {*<a href="{modurl modname='Cataleg' type='user' func='editTematica' m=e impunitId=$tematica.impunitId uid=$tematica.uniId}">{img modname='core' set='icons/extrasmall' src='xedit.png' __title='Edita' __alt='Edita'}</a>*}
                                <a href="javascript:editOn('row_{$tematica.impunitId}');">{img modname='core' set='icons/extrasmall' src='xedit.png' __title='Edita' __alt='Edita'}</a>
                                <span style="padding-left:3px"><button type="button" style="border:0px;background-color:transparent;" title='Esborra' alt='Esborra' onclick="javascript:esborra2({$tematica.impunitId}, '{$tematica.tematica}', '{$tematica.pContacte}');">{img modname='core' set='icons/extrasmall' src='14_layer_deletelayer.png'}</button></span>
                            </td>
                        </tr>
                        <tr class="hide" id="row_{$tematica.impunitId}e">

                    <form class="z-form" action="{modurl modname='Cataleg' type='user' func='updateTematica'}" method="post" enctype="multipart/form-data">
                        <input type="hidden" id="impunitId" value="{$tematica.impunitId}">
                        <td><input id="tematica" value="{$tematica.tematica}" required></td>
                        <td><input id="pContacte" value="{$tematica.pContacte}" required></td>
                        <td><input id="email" value="{$tematica.email}"></td>
                        <td><input id="telContacte" value="{$tematica.telContacte}"></td>                    
                        <td><input type="checkbox" id="dispFormador" {if $tematica.dispFormador} checked=""{/if}></td>
                        <td style="text-align:center">
                            <a href="{modurl modname='Cataleg' type='user' func='editTematica' m=e impunitId=$tematica.impunitId uid=$tematica.uniId}">{img modname='core' set='icons/extrasmall' src='edit.png' __title='Aplica els canvis' __alt='Aplica els canvis'}</a>                     
                            <a href="javascript:editOff('row_{$tematica.impunitId}');">{img modname='core' set='icons/extrasmall' src='button_cancel.png' __title='Cancel·la' __alt='Cancel·la'}</a>
                        </td>          
                    </form>
                </tr>
            {/foreach}
        </tbody>
    </table>
{else}
    <br><span style="color:lightgray; text-align:right"><h4>{gt text="Encara no s'ha especificat cap temàtica"}</h4></span>
    <hr>
{/if}
{* Per afegir una nova temàtica *}
<div class="hide" id="row_{$tematica.impunitId}a">
    {*<form  id="frm_{$tematica.impunitId}a" class="z-form" method="post" enctype="multipart/form-data">*}
        <div class="z-formrow">
        <table class="z-datatable">
            <thead>
                <tr>
                    <th width="25%">{gt text='Nova temàtica'}</a></th>
                    <th width="25%">{gt text='Persona de contacte'}</a></th>
                    <th width="15%">{gt text='Correu'}</a></th>
                    <th width="15%">{gt text='Telèfon'}</a></th>
                    <th width="1%">{img modname='core' set='icons/extrasmall' src='group.png' __title='Es disposa de formadors/es' __alt='Es disposa de formadors/es'}</th>
                    <th width="5%"style="text-align:center">{gt text='Accions'}</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <form  id="frm_{$tematica.impunitId}a" class="z-form" method="post" enctype="multipart/form-data">
            <input type="hidden" id="impunitId" value="">
            <td><input type="text" id="tematica" value="" size="25" required></td>
            <td><input id="pContacte" value="" size="25" required></td>
            <td><input id="email" value="" size="10"></td>
            <td><input id="telContacte" value="" size="10"></td>                    
            <td><input type="checkbox" id="dispFormador"></td>
            <td style="text-align:center">
                <a href="javascript:addOn('{$tematica.impunitId}a')">{img modname='core' set='icons/extrasmall' src='edit_add.png' __title='Aplica els canvis' __alt='Aplica els canvis'}</a>                     
                <a href="javascript:addOff('row_{$tematica.impunitId}a')">{img modname='core' set='icons/extrasmall' src='button_cancel.png' __title='Cancel·la' __alt='Cancel·la'}</a>
            </td>    
                    </form>
            </tr>
            </tbody></table>
        </div>
    {*</form>*}
</div>
<div>
    <a href="javascript:addOn('{$tematica.impunitId}a')"> {*href="{modurl modname='Cataleg' type='admin' func='editTematica' priId=$k m=a uid=$uniId}">*}{gt text="Afegeix una temàtica"}</a>
</div>
{/foreach}

{else}
    <h4>{gt text="Encara no s'ha creat cap unitat implicada"}</h4>
{/if}


<script>
    function esborra2(impunitId, tema, pContacte) {
        var $mess = '{{gt text="Heu triat esborrar la temàtica "}} \'' + tema + " - " + pContacte + '\'\n\n{{gt text="Voleu esborrar-la?"}}';
        if (confirm($mess)) {
            window.location = "index.php?module=Cataleg&type=admin&func=deleteImpunit&impunitId=" + impunitId;
        }
    }

    function editOn(row) {
        jQuery('#' + row).addClass('hide');
        jQuery('#' + row + 'e').removeClass('hide');
    }

    function editOff(row) {
        jQuery('#' + row).removeClass('hide');
        jQuery('#' + row + 'e').addClass('hide');
    }

    function addOn(row) {
        //document.getElementById('frm_'+row).submit();        
        jQuery('#row_' + row).removeClass('hide');
    }

    function addOff(row) {
        jQuery('#' + row).addClass('hide');
    }
</script>