<pre>{$prioritats|print_r}</pre>
{if $prioritats}
{foreach from=$prioritats item="prioritat"}
    <h3>{$prioritat.ordre}.- {$prioritat.prioritat}</h3>        
        {if count($prioritat.tematiques) gt 0}
            <table class="z-datatable">
                <thead>
                    <tr>
                       <th with="15%">{gt text='Temàtica'}</a></th>
                       <th with="20%">{gt text='Persona de contacte'}</a></th>
                       <th>{gt text='Correu'}</a></th>
                       <th>{gt text='Telèfon'}</a></th>
                       <th>{gt text=''}</th>
                       <th style="text-align:center">{gt text='Accions'}</th>
                    </tr>
                </thead>
                <tbody>
                {foreach from=$prioritat.tematiques item="tematica"}
                <tr>
                    <td>{$tematica.tematica}</td>
                    <td>{$tematica.pContacte}</td>
                    <td>{$tematica.telContacte}</td>
                    <td>{$tematica.email}</td>
                    <td>{$tematica.dispFormador}</td>
                    <td style="text-align:center"><a href="{modurl modname='Cataleg' type='admin' func='editImpunit' impunitId=$prioritat.impunitId}">{img modname='core' set='icons/extrasmall' src='xedit.png' __title='Edita' __alt='Edita'}</a><span style="padding-left:3px"><button type="button" style="border:0px;background-color:transparent;" title='Esborra' alt='Esborra' onclick="javascript:esborra2({$impunit.impunitId},'{$impunit.pContacte}');">{img modname='core' set='icons/extrasmall' src='14_layer_deletelayer.png'}</button></span></td>
                </tr>
                {/foreach}
                </tbody>
            </table>
        {else}
        <br><span style="color:lightgray; text-align:right"><h4>{gt text="Encara no s'ha especificat cap temàtica"}</h4></span>
        <hr>
        {/if}
{/foreach}
       
{else}
    <h4>{gt text="Encara no s'ha creat cap unitat implicada"}</h4>
{/if}
<div>
   <a href="{modurl modname='Cataleg' type='admin' func='addImpunit' priId=$prior.priId}">{gt text="Afegeix una unitat implicada"}</a>
</div>

<script>
    function esborra2($impunitId,$pContacte) {
        var $mess = '{{gt text="Heu triat la persona de contacte"}} \''+$pContacte+'\'\n\n{{gt text="Voleu esborrar-la?"}}';
        if (confirm($mess)) {
            window.location = "index.php?module=Cataleg&type=admin&func=deleteImpunit&impunitId="+$impunitId;
        }
    }
</script>