<%@include file="config.jsp"%>
<%
	if(session.getAttribute("is_login")==null){
		response.sendRedirect("loginorsignup.jsp");
		return;
	}
	
	String stuEmail = session.getAttribute("stuLogEmail").toString();
	String oid = Integer.toString(new java.util.Random().nextInt(90000000) + 10000000);
	session.setAttribute("course_id", request.getParameter("cid"));
%>
<!DOCTYPE html>
<html lang="en">
	<head>
   		<meta charset="UTF-8">
   		<meta name="viewport" content="width=device-width, initial-scale=1.0">
   		<meta http-equiv="X-UA-Compatible" content="ie=edge">
	    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	    <link rel="stylesheet" type="text/css" href="css/all.min.css">
	    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="css/style.css" />
		<title>Checkout</title>
  	</head>
  	<body>
  		<div class="container mt-5">
    		<div class="row">
    			<div class="col-sm-6 offset-sm-3 jumbotron">
    				<h3 class="mb-5">Welcome to Sarwang Shiksha Payment Page</h3>
    				<form method="post" action="paymentdone.jsp" id="myform">
      					<div class="form-group row">
       						<label for="ORDER_ID" class="col-sm-4 col-form-label">Order ID</label>
       						<div class="col-sm-8">
         						<input id="ORDER_ID" class="form-control" tabindex="1" maxlength="20" size="20" name="ORDER_ID" autocomplete="off" value="<%=oid%>" readonly>
       						</div>
      					</div>
      					<div class="form-group row">
       						<label for="CUST_ID" class="col-sm-4 col-form-label">Student Email</label>
       						<div class="col-sm-8">
         						<input id="CUST_ID" class="form-control" tabindex="2" maxlength="12" size="12" name="CUST_ID" autocomplete="off" value="<%=stuEmail%>" readonly>
       						</div>
      					</div>
      					<div class="form-group row">
       						<label for="TXN_AMOUNT" class="col-sm-4 col-form-label">Amount</label>
       						<div class="col-sm-8">
        						<input title="TXN_AMOUNT" class="form-control" tabindex="10" type="text" name="TXN_AMOUNT" value='<%=request.getParameter("id")%>' readonly>
       						</div>
      					</div>
      					<div class="form-group row">
       						<label for="TXN_AMOUNT" class="col-sm-4 col-form-label">Card Holder Name</label>
       						<div class="col-sm-8">
        						<input class="form-control" type="text" value='' required>
       						</div>
      					</div>
      					<div class="form-group row">
       						<label for="TXN_AMOUNT" class="col-sm-4 col-form-label">Card Number</label>
       						<div class="col-sm-8">
        						<input class="form-control" type="text" value='' placeholder="xxxx xxxx xxxx xxxx" pattern="^\d{4} \d{4} \d{4} \d{4}$" required>
       						</div>
      					</div>      					
      					<div class="form-group row">
       						<label for="TXN_AMOUNT" class="col-sm-4 col-form-label">Expiry Date</label>
       						<div class="col-sm-4">
        						<input class="form-control" type="date" value='' required>
       						</div>
       					</div>
      					<div class="form-group row">       					
       						<label for="TXN_AMOUNT" class="col-sm-4 col-form-label">CVV</label>
       						<div class="col-sm-4">
        						<input class="form-control" type="password" placeholder="xxx" pattern="^\d{3}$" maxlength=3 value='' required>
       						</div>
      					</div>      					
      					<div class="text-center">
        					<input type="submit" value="Pay Now" class="btn btn-success">
        					<a href="courses.jsp" class="btn btn-secondary">Cancel</a>
      					</div>
     				</form>
     				<small class="form-text text-muted">Note: Complete Payment by Clicking Checkout Button</small>
     			</div>
    		</div>
  		</div>
		<script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD"></script>

		<script>
      		paypal.Buttons({
          		createOrder: function(data, actions) {
              		return actions.order.create({
                  		purchase_units: [{
                      		amount: {
                          		value: <%=request.getParameter("id")!=null?request.getParameter("id"):""%>
                      		}
                  		}]
              		});
          		},
          		onApprove: function(data, actions) {
              		return actions.order.capture().then(function(details) {
                  		alert('Transaction completed by ' + details.payer.name.given_name + '!');
                  		document.getElementById("myform").submit()
              		});
          		}
      		}).render('#paypal-button-container');
  		</script>
	    <script type="text/javascript" src="js/jquery.min.js"></script>
	    <script type="text/javascript" src="js/popper.min.js"></script>
	    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	    <script type="text/javascript" src="js/all.min.js"></script>
	    <script type="text/javascript" src="js/custom.js"></script>
	</body>
</html>
