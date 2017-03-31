<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<body>
<div class="col-md-8 col-md-offset-2">
<div class="content-footer" style="padding:10px;margin-left: 50px;">
<hr/>
<h3>Help our Research</h3>
<b>For more details, <a href="contact">click here</a></b>
<br/><br/>
<div id="subs" >
  <div class="form-group">
  	<div id="serverMessage"></div><br/>
    <label for="email">Email address:</label>
    <input type="text" class="form-control" id="email" name="email">
    <span id="emailError" style="color:red;"></span>
  </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <div class="form-group">
    <label for="pwd">Twitter Handle:</label>
    <input type="text" class="form-control" id="twitter" name="twitter">
    <span id="twitterHandleError" style="color:red;"></span>
  </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/><br/>
  <button  type="submit" class="btn btn-default" onclick="return submitForm();">Submit</button>
</div>
</div></div>

</body>
<script type="text/javascript">
function validateFields(){
	var validate=true;
	var email=document.getElementById("email").value.trim();
	document.getElementById("emailError").innerHTML="";
	var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    
	if (email == null || email === undefined || email=="" || !re.test(email) ) {
        document.getElementById("emailError").innerHTML="Enter a valid email ID";
		validate= false; } 
	if(email.substring(email.length-4)!=".edu"){
    	document.getElementById("emailError").innerHTML="Enter an email ID ending in .edu";
		validate= false;
    }
	//check for twitter handle
	var twitter=document.getElementById("twitter").value.trim();
	document.getElementById("twitterHandleError").innerHTML="";
	if (twitter == null || twitter === undefined || twitter=="") {
        document.getElementById("twitterHandleError").innerHTML="Enter a valid twitter handle";
		validate= false; } 

    return validate;
}

function submitForm(){
	var result = validateFields();
	
	if(result==true){
		var twitter=document.getElementById("twitter").value.trim();
		var email=document.getElementById("email").value.trim();
		
		var data = {}
		data["email"] = email;
		data["twitter"] = twitter;
		
		$.ajax({
			type : "POST",
			url : "subscription",
			data :data,
			dataType : "json",
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				
				if(data.error==true){
					document.getElementById("serverMessage").style.color="red";
				}
				else{
					document.getElementById("serverMessage").style.color="green";
				}
				document.getElementById("serverMessage").innerHTML=data.msg;
			},
			error : function(e) {
				console.log("ERROR: ", e);
				alert(e);
			},
			done : function(e) {
				console.log("DONE");
			}
		});
	}
	
}

</script>
</html>