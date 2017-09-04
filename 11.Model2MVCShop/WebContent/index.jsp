<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	 <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<style>
       body {
            background-color : black;
        }
	
	  
           iframe{
        min-height:100%;
        min-width:1024px;
        width:100%;
        height:auto;
        position:fixed;
        top:1;
        left:0;
        }
        
        @media screen and (max-width: 1024px){
        	iframe{
        		left:50%;
        		margin-left: -512px:
        	}
        }
        
        div#container{
        	position:relative;
        }
        
        
	
	
	</style>
   	
	<script type="text/javascript">
		
		$( function() {
			$("a[href='#' ]:contains('Sign up')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		$( function() {
			$("a[href='#' ]:contains('Login')").on("click" , function() {
				self.location = "/user/login"
			});
		});
		
	</script>	
	
</head>

<body>


<%-- <jsp:include page="/layout/toolbar.jsp" /> --%>


	<div class="navbar  navbar-default">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">
        	<p width = "150" height = "150" >adidas</p>
        	</a>
			
			<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 
	                 <li><a href="#">Login</a></li>
	                 <li><a href="#">Sign up</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
   	
   	
<div class="container">
		
		<div class="row">
	   		
	 	 	<div class="col-md-9">
				
				<iframe  width="1350" height="1000" src="https://www.youtube.com/embed/LG7Rr_vlB8I?autoplay=1&rel=0&roop=1" frameborder="0" allowfullscreen></iframe>

			  		<!-- <div class="text-center">
			  			<a class="btn btn-info btn-lg" href="#" role="button">Sign up</a>
			  			<a class="btn btn-info btn-lg" href="#" role="button">Login</a>
			  		</div>
			  	 -->
			  	</div>
	        </div>
	 	 	
		</div>
   	
	
		

</body>

</html>