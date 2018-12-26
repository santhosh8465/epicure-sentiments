 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Data Mining with Big Data</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
    <link href="css/plugins/timeline.css" rel="stylesheet">
    <link href="css/sb-admin-2.css" rel="stylesheet">
    <link href="css/plugins/morris.css" rel="stylesheet">
    <link href="css/home.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
    <script src="js/springy.js"></script>
    <script src="js/springyui.js"></script>
    <script>
    $(function(){
    	$( "#GraphDetails" ).hide();
   	 $("#clusterForm").submit(function(){
   	  var formInput=$(this).serialize();
   	var graph = new Springy.Graph();
   	  $.getJSON('ClusteringAction.action', formInput,function(data) {
   		if(data.locationList !=null)
   			{
   			$.each(data.locationList, function(key, val) {
   	            // Whatever you what to do, eg.
   	   			var michael = graph.newNode(
   						{
   							label: val.location,
   							allData:val,
   						}
   						);
   	            
   	        });
   			}
   		
   		if(data.hashTagList !=null)
			{
			$.each(data.hashTagList, function(key, val) {
	            // Whatever you what to do, eg.
	   			var michael = graph.newNode(
						{
							label: val.hashTag,
							allData:val,
						}
						);
	            
	        });
			}
   		if(data.retweetList !=null)
		{
		$.each(data.retweetList, function(key, val) {
            // Whatever you what to do, eg.
   			var michael = graph.newNode(
					{
						label: val.retweetCount,
						allData:val,
					}
					);
            
        });
		}
   		
   	  });
   	jQuery(function(){
   	  var springy = window.springy = jQuery('#springydemo').springy({
   	    graph: graph,
   	    nodeSelected: function(node){
   	    	console.log(node.data.allData.id);
   	     $.getJSON('ResponseAction.action?ids='+node.data.allData.id,function(data) {
   	    	 console.log(data);
   	    	$('#result td').remove();
   	    	$.each(data.responseList, function(key, val) {
   	    			var eachRow='<tr bgcolor="pink"> <td style="color:red"> '+ val.id +'</td> <td style="color:blue">'+val.name +'</td>  <td style="color:blue"> '+ val.location +'</td>  <td style="color:blue"> '+ val.retweetCount +'</td> <td style="color:blue"> '+ val.hashTag +'</td> <td style="color:blue"> '+ val.text +'</td> <td style="color:blue"> '+ val.createdAt +'</td> </tr>';
   	    	 $('#result').append(eachRow);
   	    	});
   	    	
   	    	 $( "#GraphDetails" ).dialog({
	    		 	title:'Result',
	    	        maxWidth:800,
	    	        maxHeight: 500,
	    	        width: 700,
	    	        height: 500,
	    	        modal: true,});
   	     });
   	    }
   	  });
   	});
   	  return false;
   	 
   	 });
   	  
   	})
 </script> 
 <center><h1><img src="images/headd.png"></h1></center>
</head>
<body>
<form action="" id="clusterForm">

	<div id="GraphDetails">
	<table id="result" cellspacing="20" width="100%" style="border:1px solid rgb(177, 210, 228);">
  	<tbody>
  	<tr style="">
    <th bgcolor="browne" align="left">ID</th>
    <th bgcolor="browne" align="left">Name</th>
    <th bgcolor="browne" align="left">Location</th>
    <th bgcolor="browne" align="left">Retweet Count</th>
    <th bgcolor="browne" align="left">Hash Tag</th>
    <th bgcolor="browne" align="left">Text</th>
    <th bgcolor="browne" align="left">Created At</th>
  	</tr>
  	</tbody>
	</table>
</div>
    <div id="wrapper" style="background-color: pink;background:url(images/pa.jpg)">
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                </li>
            </ul>
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a class="active" href="home.jsp"><i class=""></i>Home</a>
                        </li>
                        <!--   <li>
                            <a class="active" href="flume.jsp"><i class=""></i>Flume</a>
                        </li>
                         <li>
                            <a class="active" href="hdfs.jsp"><i class=""></i>Hive</a>
                        </li> -->
                        <li>
                            <a class="active" href="home.jsp"><i class=""></i>Reports</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div id="page-wrapper" style="background-color: pink;background:url(images/pa.jpg)">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><font  color=red>Spectral Clustering </font></h1>
                    <table>
   					 <tr>
   					 <td  colspan="1">
   					 <label><b>Type</b></label>
   					 </td>
   					 <td colspan="1">
   					 <select name="mode">
   					 <option value="Location">Location</option>
   					 <option value="HashTags">HashTags</option>
   					 <option value="retweet">Retweet-Count</option>
   					 </select>
   					 </td>
   					 </tr>
					 <tr  align="center">
					 <td  colspan="2">
					 <input id="submit" type="submit" value="Submit" />
					 </td>
					 </tr>
  				    </table>
                </div>
                
            </div>
            <div class="row">
             <canvas id="springydemo" width="1040" height="1000" />
            </div>
            
            
        </div>
    </div>
    <div >
          
            </div>
    </form>
</body>

</html>