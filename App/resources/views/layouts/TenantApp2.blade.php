<!DOCTYPE html>
<html ng-app="main-App">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>E-BAMS (Tenant)</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <meta http-equiv="author" content="@adit_xxx_">
  <meta name="csrf-token" content="{{ csrf_token() }}">

   <link rel="stylesheet" href="{{asset('AdminLTE/bootstrap/css/bootstrap.min.css')}}">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="{{asset('AdminLTE/dist/css/AdminLTE.min.css')}}">
  <link rel="stylesheet" href="{{asset('AdminLTE/dist/css/skins/_all-skins.min.css')}}">

  <link rel="stylesheet" href="{{asset('css/custom.css')}}">
<link rel="stylesheet" href="{{ asset('/css/app.css') }}">




</head>
<body class="hold-transition skin-blue fixed sidebar-mini">

<div class="wrapper" id="app">

  <header class="main-header">
    <!-- Logo -->
    <a href="/tenant" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>TNT</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>TENANT</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

    
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      
     
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header" align="center" style="color:white;"><h5><strong>MENU</strong></h5></li>
        <li>
          <a href="/tenant">
          <i class="fa fa-circle-o text-red"></i> <span>Dashboard</span>
          </a>
        </li>
<li class="treeview"><a onClick="window.location.replace('/tenant#/TProject');window.location.reload();"><i class="fa fa-circle-o text-blue"></i> <span>List Project </span></a></li>
<li class="treeview"><a onClick="window.location.replace('/tenant#/TProjectRepair');window.location.reload();"><i class="fa fa-circle-o text-blue"></i> <span>Project Repair</span></a></li>
<li class="treeview"><a onClick="window.location.replace('/tenant#/TProjectReject');window.location.reload();"><i class="fa fa-circle-o text-blue"></i> <span>Project Reject</span></a></li>
<li class="treeview"><a onClick="window.location.replace('/tenant#/TProjectProses');window.location.reload();"><i class="fa fa-circle-o text-blue"></i> <span>Status Project</span></a></li>
<li class="treeview"><a onClick="window.location.replace('/tenant#/TProjectSelesai');window.location.reload();"><i class="fa fa-circle-o text-blue"></i> <span>Project Final</span></a></li>

<li class="treeview">
          <a>
            <i class="fa fa-circle-o text-red"></i> <span>User</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
<li><a href="/tenant#/TProfile"><i class="fa fa-circle-o"></i>Profile</a></li>
<li><a href="" onclick="event.preventDefault();document.getElementById('logout-form').submit();"><i class="fa fa-circle-o"></i>Sign out</a></li>
<form id="logout-form" action="{{ route('tenant.logout') }}" method="POST" style="display: none;">
                                            {{ csrf_field() }}
                                        </form>
          </ul>
        </li>

      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">


@include('layouts/alertforadmin')
@yield('content-tenant')

 
  </div>
  <!-- /.content-wrapper -->



  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 1.0
    </div>
    <strong>Copyright &copy; 2017-{{date('Y')}} <a href="http://www.mitratel.co.id/" target="_blank">PT Dayamitra Telekomunikasi</a>.</strong> All rights
    reserved.
  </footer>


</div>
<!-- ./wrapper -->






<script>
    window.Laravel =  <?php echo json_encode([
            'csrfToken' => csrf_token(),
        ]); ?>
</script>
<script src="{{ asset('/js/app.js') }}"></script>


<!-- jQuery 2.2.3 -->
<script src="{{asset('AdminLTE/plugins/jQuery/jquery-2.2.3.min.js')}}"></script>


<script src="{{asset('AdminLTE/bootstrap/js/bootstrap.min.js')}}"></script>

<!-- SlimScroll -->
<script src="{{asset('AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js')}}"></script>
<!-- FastClick -->
<script src="{{asset('AdminLTE/plugins/fastclick/fastclick.js')}}"></script>
<!-- AdminLTE App -->
<script src="{{asset('AdminLTE/dist/js/app.min.js')}}"></script>
<!-- AdminLTE for demo purposes -->
<script src="{{asset('AdminLTE/dist/js/demo.js')}}"></script>

@include('vendor.roksta.toastr')

</body>
</html>
