<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 100px;
            background-color : black;
        }
        
        *{color:white}
        
    .carousel-inner > .item > img {
      top: 0;
      left: 0;
      min-width: 100%;
      min-height: 100%;
    } 
    
      label {
    display: inline-block;
    width: 5em;
  }
		
   	</style>
   	
   	 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   	<script type="text/javascript">
   	
   	/* $(function(){
	   	$(".first-slide").on("click",function(){
	   		self.location = "/product/listProduct?menu=search";
	   		});
	   	}); */
	   	
	 	$(function(){
		   	$(".item").on("click",function(){
		   		self.location = "/product/listProduct?menu=search";
		   		});
		   	});
	   	
	   	$( function() {
	   	    $( document ).tooltip({
	   	      track: true
	   	    });
	   	  } );
	   	
	  /*  	$(function(){
	   		$('#myCarousel').on('slid.bs.carousel',function(){
	   			self.location="/product/listProduct?menu=search";
	   		});
	   	}); */
	</script>
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	
	<h1 align="center"><p>Impossible is Nothing</p></h1>
<div class="container">

      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        
        <div class="carousel-inner" role="listbox">
           
          <div class="item active">
          
      		<label for="item">
      		</label>  
            <img class="first-slide" src="../images/uploadFiles/10.jpg" alt="First slide"  title="Click Images">
            <div class="carousel-caption" >
            <div class="container">
          		
          		
          		
          		</div>
          		</div>
          		</div>
          <div class="item">
          <label for="item">
      		</label>  
            <img class="second-slide" src="../images/uploadFiles/8.jpg" alt="Second slide"  title="Click Images" >
            <div class="container">
            <div class="carousel-caption">
          		</div>
          		</div>
          		</div>
          <div class="item">
          <label for="item">
      		</label>  
            <img class="third-slide" src="../images/uploadFiles/13.jpg" alt="Third slide" title="Click Images" >
            <div class="container">
            <div class="carousel-caption">
          		</div>
          		</div>
          		</div>
          		</div>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
      
      </div> 


</body>

</html>