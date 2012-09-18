<script type="text/javascript">
    var childCount = ${contatoInstance?.fones?.size()} + 0;

    function addFone(){
      var clone = $("#fone_clone").clone()
      var htmlId = 'fones['+childCount+'].';
      var foneInput = clone.find("input[id$=telefone]");

      clone.find("input[id$=id]")
             .attr('id',htmlId + 'id')
             .attr('name',htmlId + 'id');
      clone.find("input[id$=deleted]")
              .attr('id',htmlId + 'deleted')
              .attr('name',htmlId + 'deleted');
      clone.find("input[id$=new]")
              .attr('id',htmlId + 'new')
              .attr('name',htmlId + 'new')
              .attr('value', 'true');
      foneInput.attr('id',htmlId + 'telefone')
              .attr('name',htmlId + 'telefone');
      clone.find("select[id$=tipo]")
              .attr('id',htmlId + 'tipo')
              .attr('name',htmlId + 'tipo');

      clone.attr('id', 'fone'+childCount);
      $("#childList").append(clone);
      clone.show();
      foneInput.focus();
      childCount++;
    }

    //bind click event on delete buttons using jquery live
    $('.del-fone').live('click', function() {
        //find the parent div
        var prnt = $(this).parents(".fone-div");
        //find the deleted hidden input
        var delInput = prnt.find("input[id$=deleted]");
        //check if this is still not persisted
        var newValue = prnt.find("input[id$=new]").attr('value');
        //if it is new then i can safely remove from dom
        if(newValue == 'true'){
            prnt.remove();
        }else{
            //set the deletedFlag to true
            delInput.attr('value','true');
            //hide the div
            prnt.hide();
        }
    });

</script>

<div id="childList" style="float:left">
    <g:each var="fone" in="${contatoInstance.fones}" status="i">
        
        <!-- Render the fone template (_fone.gsp) here -->
        <g:render template='/cliente/contato/fone' model="['fone':fone,'i':i,'hidden':false]"/>
        <!-- Render the fone template (_fone.gsp) here -->
        
    </g:each>
</div>
<a href="#" class="fg-button ui-state-default fg-button-icon-left ui-corner-all"
    onclick="addFone();">
    <span class="ui-icon ui-icon-circle-plus"></span> Adicionar Telefone
</a>
