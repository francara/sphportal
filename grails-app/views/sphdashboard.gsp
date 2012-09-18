<!doctype html>
<html>
<head>
<meta name="layout" content="sph" />
<title>Dashboard</title>
<style type="text/css" media="screen">
#leftTopPn {
	height: 300px;
}

#rightTopPn {
	height: 300px;
}

#leftBottomPn {
	height: 300px;
}

#rightBottomPn {
	height: 300px;
}
</style>

</head>
<body>
    <div class="grid_16">
        <div id="leftTopPn" class="grid_8 alpha" style="background-color: #25567B;">
            <table id="grade">
                <tr><td></td></tr>
            </table>
        </div>
        <div id="rightTopPn" class="grid_8 omega" style="background-color: #2A4580;"></div>
        <div class="clear"></div>

        <div id="leftBottomPn" class="grid_8 alpha" style="background-color: #2A4580;"></div>
        <div id="rightBottomPn" class="grid_8 omega" style="background-color: #25567B;"></div>
    </div>

    <script type="text/javascript">
					// We use a document ready jquery function.
					jQuery(document).ready(
							function() {
								jQuery("#grade").jqGrid(
										{
											datatype : "clientSide",
                      height: 180 , width: 400,
                      scrollOffset: 1,
											colNames : [ 'Horário', 'Seg','Ter', 'Qua', 'Qui', 'Sex', 'Sab', 'Dom', 'Fer' ],
											colModel : [ {
												name : 'hora',
												index : 'hora',
												width : 50  ,
												sorttype : "text"
											}, {
												name : 'seg',
												index : 'seg',
												width : 30,
												sorttype : "int"
											}, {
												name : 'ter',
												index : 'ter',
												width : 30,
												sorttype : "int"
											}, {
												name : 'qua',
												index : 'qua',
												width : 30,
												sorttype : "int"
											}, {
												name : 'qui',
												index : 'qui',
												width : 30,
												sorttype : "int"
											}, {
												name : 'sex',
												index : 'sex',
												width : 30,
												sorttype : "int"
											}, {
												name : 'sab',
												index : 'sab',
												width : 30,
												sorttype : "int"
											}, {
												name : 'dom',
												index : 'dom',
												width : 30,
												sorttype : "int"
											}, {
												name : 'fer',
												index : 'fer',
												width : 30,
												sorttype : "int"
											} ],
											rowNum : 4,
											viewrecords : true,
                      onCellSelect : function(rowid, iCol, content, e) {
                          var cm = jQuery("#grade").jqGrid("getGridParam", "colModel");
                          var colName = cm[iCol];
                          $(e.target).toggleClass('ui-state-highlight');
                          //alert(colName['index']);                          
                      },
                      ondblClickRow: function (rowid, iRow, iCol, e) {
                            $(e.target).toggleClass('ui-state-highlight');
                        }                      
										});

								var grade = [ 
                      {hora : "08:00", seg : "0", ter: "0", qua: "0", qui:"0", sex:"0", sab:"0", dom:"0", fer: "0"},
                      {hora : "09:00", seg : "0", ter: "1", qua: "0", qui:"0", sex:"0", sab:"0", dom:"0", fer: "0"},
                      {hora : "10:00", seg : "0", ter: "0", qua: "0", qui:"0", sex:"0", sab:"0", dom:"0", fer: "0"},
                      {hora : "11:00", seg : "0", ter: "0", qua: "0", qui:"0", sex:"0", sab:"0", dom:"0", fer: "0"},
                      {hora : "12:00", seg : "0", ter: "0", qua: "0", qui:"0", sex:"0", sab:"0", dom:"0", fer: "0"},
                      {hora : "13:00", seg : "0", ter: "0", qua: "0", qui:"0", sex:"0", sab:"0", dom:"0", fer: "0"},
                      {hora : "14:00", seg : "0", ter: "0", qua: "0", qui:"0", sex:"0", sab:"0", dom:"0", fer: "0"},
                      {hora : "15:00", seg : "0", ter: "0", qua: "0", qui:"0", sex:"0", sab:"0", dom:"0", fer: "0"} 
								];
								for ( var i = 0; i <= 9; i++) {
									jQuery("#grade").addRowData(i + 1, grade[i]);
                  if (grade[i].seg == 1) jQuery("#grade").setCell (i + 1, 'seg','',{ background:'#ff0000'})
                  if (grade[i].ter == 1) jQuery("#grade").setCell (i + 1, 'ter','',{ background:'#ff0000'})
                  if (grade[i].qua == 1) jQuery("#grade").setCell (i + 1, 'qua','',{ background:'#ff0000'})
                  if (grade[i].qui == 1) jQuery("#grade").setCell (i + 1, 'qui','',{ background:'#ff0000'})
                  if (grade[i].sex == 1) jQuery("#grade").setCell (i + 1, 'sex','',{ background:'#ff0000'})
                  if (grade[i].sab == 1) jQuery("#grade").setCell (i + 1, 'sab','',{ background:'#ff0000'})
                  if (grade[i].dom == 1) jQuery("#grade").setCell (i + 1, 'dom','',{ background:'#ff0000'})
                  if (grade[i].fer == 1) jQuery("#grade").setCell (i + 1, 'fer  ','',{ background:'#ff0000'})
								}
							});
				</script>
</body>
</html>
