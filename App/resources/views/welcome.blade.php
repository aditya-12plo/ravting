<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>el-RAVTING (Electronic Review Approval Budgeting)</title>
  <meta name="keywords" content="el-RAVTING (Electronic Review Approval Budgeting)">
  <meta name="description" content="el-RAVTING (Electronic Review Approval Budgeting)">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="/assets/flat-icon/flaticon.css">
  <link rel="stylesheet" href="/temp/styles/styles.css">
    <!-- Scripts -->
    <script>
        window.Laravel = {!! json_encode([
            'csrfToken' => csrf_token(),
        ]) !!};
    </script>
</head>
<body>
  <div class="main-wrapper">
    <header class="header header--bg">
      <div class="container">
        
        <div class="header__content text-center">
		 <!-- <a href="/karyawan/login" class="button button--hover">Login</a> -->
		
<!-- login here -->

	<div class="container">
    <div class="row" align="center">
		<img src="/assets/images/e-mapping.png" class="img-responsive" alt="el-RAVTING (Electronic Review Approval Budgeting)" align="center">

        <div class="col-md-4">
		</div>
		
        <div class="col-md-4">
            <div class="panel panel-default">
			 <div class="panel-heading"><h1 style="color:black;"><b>Welcome</b></h1></div>
               <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="{{ route('karyawan.login') }}">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="col-md-4 control-label">E-Mail Address</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" required autofocus>

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <label for="password" class="col-md-4 control-label">Password</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control" name="password" value="" required>

                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> Remember Me
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-8 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Login
                                </button>

                                <a class="btn btn-link" href="{{ route('karyawan.password.request') }}">
                                    Forgot Your Password?
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
       </div>
	   
	   
	   
        <div class="col-md-4">
		</div>
		
	   
    </div>
</div> 
		 
<!-- login -->		 
		 
        </div>
		
      </div>
    </header>
    
  </div>
    
    
  

  <script src="/assets/jquery/jquery-3.2.1.min.js"></script>
  <script src="/assets/bootstrap/js/bootstrap.min.js"></script>
 <script src="{{ asset('/js/app.js') }}"></script>

</body>
</html>





