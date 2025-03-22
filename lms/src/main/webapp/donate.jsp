	<div class="form-group">
    	<i class="fas fa-user"></i>
    	<label for="stuname" class="pl-2 font-weight-bold">Name</label>
    	<input type="text" class="form-control" placeholder="Name" name="name" id="stuname" required>
   	</div>
   	<div class="form-group">
   		<i class="fas fa-envelope"></i>
   		<label for="stuemail" class="pl-2 font-weight-bold">Email</label>
   		<input type="email" class="form-control" placeholder="Email" name="email" id="stuemail" required>
     	<small class="form-text">We'll never share your email with anyone else.</small>
   	</div>
	<div class="form-group">
    	<i class="fas fa-phone"></i>
    	<label for="stuphone" class="pl-2 font-weight-bold">Phone</label>
    	<input type="text" class="form-control" placeholder="Phone" name="phone" id="stuphone" pattern="^\d{10}$" required>
   	</div>
   	<div class="form-group">
     	<i class="far fa-money-bill-alt"></i>
     	<label for="stupass" class="pl-2 font-weight-bold">Amount</label>
     	<input type="number" class="form-control" placeholder="Amount" name="amount" id="stupass" required min=1>
   	</div>
	<div class="form-group">
    	<i class="fa fa-credit-card"></i>
    	<label for="stuocc" class="pl-2 font-weight-bold">Card Number</label>
    	<input type="text" class="form-control" placeholder="xxxx xxxx xxxx xxxx" pattern="^\d{4} \d{4} \d{4} \d{4}$" required>
   	</div>
	<div class="form-group">
    	<i class="fa fa-calendar"></i>
    	<label for="stuocc" class="pl-2 font-weight-bold">Expiry Date</label>
    	<input type="date" class="form-control" required>
   	</div>
	<div class="form-group">
    	<i class="fas fa-tasks"></i>
    	<label for="stuocc" class="pl-2 font-weight-bold">CVV</label>
    	<input type="text" class="form-control" placeholder="xxx" maxlength=3 pattern="^\d{3}$" required>
   	</div>
   	