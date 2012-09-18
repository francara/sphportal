
/* 
 * ==============================================
 * =========   GradeHorarioController   =========
 * ==============================================
 *
 * JQuery component.
 */
function GradeHorarioController(grade, tabid) {
	GradeHorarioController.prototype.tabid = "#" + tabid;
	GradeHorarioController.prototype.self = this;
	
	this.grade = grade
	
	/*
	 * ----------------------------
	 * ---------   init   ---------
	 * 
	 * Inicializa a visualizacao do grid.
	 */
	this.init = function(callbackClick, callbackDbClick) {
		jQuery(this.tabid).jqGrid(
	            {
	              datatype : "clientSide",
	              height : 250,
	              width : 400,
	              //scrollOffset : 2,
	              scrollrows: true,
	              colNames : [ 'Horario', 'Seg', 'Ter', 'Qua', 'Qui',
	                  'Sex', 'Sab', 'Dom', 'Fer' ],
	              colModel : grade.model, 
	              rowNum : 4,
	              viewrecords : true,
	              onCellSelect : callbackClick,
	              ondblClickRow : callbackDbClick
	            });
	    
		  var data = grade.grade;
		  for ( var i = 0; i <= 23; i++) {
		      jQuery(this.tabid).addRowData(i + 1, ' ');
		      jQuery(this.tabid).setCell(i + 1, 'hora', data[i].hora);            
		      if (data[i].seg == 1)
		        jQuery(this.tabid).setCell(i + 1, 'seg', '', {background : '#ff0000'});
		      if (data[i].ter == 1)
		        jQuery(this.tabid).setCell(i + 1, 'ter', '', {background : '#ff0000'});
		      if (data[i].qua == 1)
		        jQuery(this.tabid).setCell(i + 1, 'qua', '', {background : '#ff0000'});
		      if (data[i].qui == 1)
		        jQuery(this.tabid).setCell(i + 1, 'qui', '', {background : '#ff0000'});
		      if (data[i].sex == 1)
		        jQuery(this.tabid).setCell(i + 1, 'sex', '', {background : '#ff0000'});
		      if (data[i].sab == 1)
		        jQuery(this.tabid).setCell(i + 1, 'sab', '', {background : '#ff0000'});
		      if (data[i].dom == 1)
		        jQuery(this.tabid).setCell(i + 1, 'dom', '', {background : '#ff0000'});
		      if (data[i].fer == 1)
		        jQuery(this.tabid).setCell(i + 1, 'fer', '', {background : '#ff0000'});
		    }
		    jQuery(this.tabid).jqGrid('setSelection',19);
		    jQuery(this.tabid).resetSelection();
	}
    
	this.onClick = function(x, y, content, e) {
		var sel = this.grade.select(x,y);
		
        var cm = jQuery(this.tabid).jqGrid("getGridParam", "colModel");
        var colName = cm[y];
        
        if (sel == 1) {
        	console.log("cat-1");
        	jQuery(e.target).addClass('grid-cell-cat-1');
        } else {
        	console.log("cat-0");
        	jQuery(e.target).removeClass('grid-cell-cat-0');
        	jQuery(e.target).removeClass('grid-cell-cat-1');        	
//        	jQuery(e.target).toggleClass('grid-cell-cat-0');		
        }
        
	}
	
	this.onDbClick = function(x,y) {
		console.log("DbClick");
	}
	
	this.dragSt = function(x,y) {
		
	}
	
	this.dragEnd = function(x,y) {
		
	}
	
	/*
	 * ----------------------------
	 * ---------   load   ---------
	 * 
	 * Loads json data from the specified url.
	 */
	this.load = function() {
		
	}
	
	/*
	 * ----------------------------
	 * ---------   post   ---------
	 * 
	 * Converts the 'grade' to json and post it.
	 */
	this.post = function() {
		var jsonGrade = JSON.stringify(this.grade.grade)
		alert(jsonGrade);
	    jQuery.get("http://localhost:8080/sphportal/gradeHorario/updateGrade", "grade="+jsonGrade);		
	}
	
}

/* 
 * ====================================
 * =========   GradeHorario   =========
 * ====================================
 *
 * Model
 */
function GradeHorario() {
	this.model = [ 
	              {name : 'hora',index : 'hora',width : 50,sorttype : "text"}, 
	              {name : 'seg',index : 'seg',width : 30,sorttype : "int"}, 
	              {name : 'ter',index : 'ter',width : 30,sorttype : "int"}, 
	              {name : 'qua',index : 'qua',width : 30,sorttype : "int"}, 
	              {name : 'qui',index : 'qui',width : 30,sorttype : "int"}, 
	              {name : 'sex',index : 'sex',width : 30,sorttype : "int"}, 
	              {name : 'sab',index : 'sab',width : 30,sorttype : "int"}, 
	              {name : 'dom',index : 'dom',width : 30,sorttype : "int"}, 
	              {name : 'fer',index : 'fer',width : 30,sorttype : "int"}
	              ];
	this.plainModel = ["seg","ter","qua","qui","sex","sab","dom","fer"];
	
	this.grade = [ 
	              { hora : "00:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "01:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "02:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "03:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "04:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "05:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "06:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "07:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "08:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "09:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "10:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "11:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "12:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "13:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "14:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "15:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "16:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "17:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "18:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "19:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "20:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "21:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "22:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "23:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 }, 
		          { hora : "24:00", seg : 0, ter : 0, qua : 0, qui : 0, sex : 0, sab : 0, dom : 0, fer : 0 } 
		          ];
		
	/* 
	 * Categories
	 * 0: Normal
	 * 1 .. N: Classified
	 */
	this.category = 0;
	/* Lista de categorias inicializadas pelo 'init()'. */
	this.categories = [0];
	
	/*
	 * ----------------------------
	 * ---------   Init   ---------
	 * 
	 * Parametro: catJoson = [{nome: String, color:String}]
	 */
	this.init = function(catJson) {
		
	}
	
	/*
	 * Seleciona a grade com a categoria.
	 */
	this.select = function(x,y) {
		console.log("Selecionado elemento: (" + x + "," + y +")");
		
		var day = this.getField(y);
		var sel = this.grade[x][day];
		if (sel == 0) this.grade[x][day] = 1;
		else this.grade[x][day] = 0;
		
		return this.grade[x][day];
	}
	
	this.getField = function(y) {
		return this.plainModel[y];
	}
	
}
