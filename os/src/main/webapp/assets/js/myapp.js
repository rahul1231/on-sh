$(function(){
	
	switch(menu){
		
	case 'About Us':
		$('#about').addClass('active');
		break;
	case 'Contact Us':
		$('#contact').addClass('active');
		break;
	case 'All Products':
		$('#listProducts').addClass('active');
		break;
	case 'Manage Products':
		$('#manageProducts').addClass('active');
		break;
	case 'Home':
		$('#home').addClass('active');
		break;
	default:
		if(menu=='Home') break;
		$('#listProducts').addClass('active');
		$('#a_'+menu).addClass('active');
		break;
	}

	
	//create a dataset
	
	var $table=$('#productListTable');
	
	
	
	if($table.length){
		console.log('Inside the table!');
		var jsonUrl='';
		
		if(window.categoryId==''){
			jsonUrl=window.contextRoot+'/json/data/all/products';
			
		}else{
			
			jsonUrl=window.contextRoot+'/json/data/category/'+window.categoryId+'/products';
		}
		$table.DataTable({
			lengthMenu:[[3,5,10,-1],['3 records','5 records','10 records','ALL']],
			pageLength:5,
			ajax:{
				url:jsonUrl,
				dataSrc:''
			},
			columns:[
				{
					data:'code',
					mRender:function(data,type,row){
						return '<img src="'+window.contextRoot+'/resources/images/'+data+'.png" class="dataTableImg"/>';
					}
				},
				{
					data:'name'
				},
				{
					data:'brand'
				},
				{
					data:'unitPrice'
				},
				{
					data:'quantity',
					mRender:function(data,type,row){
						if(data<1){
							return '<span style="color:red">Out of Stock!</span>';
						}
						return data;
					}
				},
				{
					data:'id',
					bSortable:false,
					mRender:function(data,type,row){
						var str='';
						
						str+='<a href="'+window.contextRoot+'/show/'+data+'/product" class="btn btn-primary"><span class="fa fa-eye"></span></a>&#160;';
						
						if(row.quantity<1){
							str+='<a href="javascript:void(0)" class="btn btn-danger"><span class="fa fa-shopping-cart disabled"></span></a>';
						}
						else{
							str+='<a href="'+window.contextRoot+'/cart/add/'+data+'/product" class="btn btn-success"><span class="fa fa-shopping-cart"></span></a>&#160;';
						}
					
						return str;
					}
				}
				]
			
		});
	}
	
	var $alert=$('.alert');
	
	if($alert.length){
		
		setTimeout(function(){
			$alert.fadeOut('slow');
		},3000);
	}
	
	
	//toggle switch
	$('.switch input[type="checkbox"]').on('change',function(){
		
		var checkbox=$(this);
		var checked=checkbox.prop('checked');
		var dMsg=(checked)? 'You want to activate the product?':
							'You want to deactivate the product?';
		var value=checkbox.prop('value');
		
		bootbox.confirm({
			
			size:'medium',
			title:'Product Activation & Deactivation',
			message:dMsg,
			callback:function(confirmed){
				if(confirmed){
					console.log(value);
					bootbox.alert({
						
						size:'medium',
						title:'Information',
						message:'You are going to perform operation on product '+value
						
					});
				}
				else{
					checkbox.prop('checked',!checked);
				}
			}
			
		});
		
	});
	
	
	
	
	
	

});
