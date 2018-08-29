<!DOCTYPE html>
<html ng-app="main-App">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>MITRATel-RAVTING (MITRATEL Electronic Review & Approval Budgeting)</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <meta http-equiv="author" content="@adit_xxx_">
  <meta name="csrf-token" content="{{ csrf_token() }}">

   <link rel="stylesheet" href="{{asset('/public/AdminLTE/bootstrap/css/bootstrap.min.css')}}">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="{{asset('public/AdminLTE/dist/css/AdminLTE.min.css')}}">
  <link rel="stylesheet" href="{{asset('public/AdminLTE/dist/css/skins/_all-skins.min.css')}}">

  <link rel="stylesheet" href="{{asset('public/css/custom.css')}}">
<link rel="stylesheet" href="{{ asset('public/css/app.css') }}">

<script src="//www.amcharts.com/lib/3/amcharts.js"></script>
<script src="//www.amcharts.com/lib/3/pie.js"></script>


</head>
<body class="hold-transition skin-blue fixed sidebar-mini">

<div class="wrapper" id="app">

  <header class="main-header">
    <!-- Logo -->
    <a href="/karyawan" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>MITRAT<span style="color:red;">el</span>-<span style="color:black;">RAVTING</span></b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>MITRAT<span style="color:red;">el</span>-<span style="color:black;">RAVTING</span></b></span>
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
          <a href="/karyawan">
          <i class="fa fa-dashboard"></i> <span>Dashboard</span>
          </a>
        </li>   
		

@if(Auth::guard('karyawan')->user()->level == 'MANAGER AREA')
<li><a onClick="window.location.replace('/karyawan#/AProjectListMA');window.location.reload();"> <i class="fa fa-edit"></i> <span>List Project Approval</span></a> </li>	
<li><a onClick="window.location.replace('/karyawan#/AProjectRepairMA');window.location.reload();"><i class="fa fa-pencil"></i><span>Project Repair</span></a></li>			
<li><a onClick="window.location.replace('/karyawan#/AProjectStatusMA');window.location.reload();"><i class="fa fa-exchange"></i> <span>Tracking Project</span></a></li>	
<li><a onClick="window.location.replace('/karyawan#/KProjectRejectMA');window.location.reload();"><i class="fa fa-trash-o"></i><span>Project Reject</span></a></li>
<li><a onClick="window.location.replace('/karyawan#/KProjectFinalMA');window.location.reload();"> <i class="fa fa-star-o"></i> <span>List Project Final</span></a></li>
@endif

@if(Auth::guard('karyawan')->user()->level == 'GENERAL MANAGER AREA')

<li><a onClick="window.location.replace('/karyawan#/AProjectReviwerPMA');window.location.reload();"><i class="fa fa-edit"></i><span>Project Approval</span></a></li>			
<li><a onClick="window.location.replace('/karyawan#/AProjectRepairPMA');window.location.reload();"><i class="fa fa-pencil"></i><span>Project Repair</span></a></li>	
<li><a onClick="window.location.replace('/karyawan#/AProjectStatus');window.location.reload();"><i class="fa fa-exchange"></i> <span>Tracking Project</span></a></li>	
<li><a onClick="window.location.replace('/karyawan#/KProjectRejectMA');window.location.reload();"><i class="fa fa-trash-o"></i><span>Project Reject</span></a></li>
<li><a onClick="window.location.replace('/karyawan#/KProjectFinalMA');window.location.reload();"> <i class="fa fa-star-o"></i> <span>List Project Final</span></a></li>
@endif



@if(Auth::guard('karyawan')->user()->level == 'MANAGER UBIS')
<li><a onClick="window.location.replace('/karyawan#/AProjectReviwerMU');window.location.reload();"><i class="fa fa-edit"></i><span>Project Approval</span></a></li>			
<li><a onClick="window.location.replace('/karyawan#/AProjectRepairMU');window.location.reload();"><i class="fa fa-pencil"></i><span>Project Repair</span></a></li>			
<li><a onClick="window.location.replace('/karyawan#/AProjectListK');window.location.reload();"> <i class="fa fa-newspaper-o"></i> <span>List Project Baru</span></a> </li>	
<li><a onClick="window.location.replace('/karyawan#/AProjectStatusK');window.location.reload();"><i class="fa fa-exchange"></i> <span>Tracking Project</span></a></li>	
<li><a onClick="window.location.replace('/karyawan#/KProjectReject');window.location.reload();"><i class="fa fa-trash-o"></i><span>Project Reject</span></a></li>
<li><a onClick="window.location.replace('/karyawan#/KProjectFinal');window.location.reload();"> <i class="fa fa-star-o"></i> <span>List Project Final</span></a></li>

<li class="treeview">
          <a href="#">
           <i class="fa fa-bar-chart"></i> <span>AVG Project</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu menu-open">
            <li>
              <a href="#"><i class="fa fa-circle-o"></i> B2S
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu menu-open">
@foreach ($tahunprojectb2s as $b2s)		  
<li><a onClick="window.location.replace('/karyawan#/ProjectAVGB2S/{{$b2s->tahun}}');window.location.reload();"><i class="fa fa-circle-o"></i> {{$b2s->tahun}}</a></li>
@endforeach                  
                </li>
              </ul>
            </li>
			
			
             <li>
              <a href="#"><i class="fa fa-circle-o"></i> UNTAPPED
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu menu-open">
@foreach ($tahunprojectuntp as $utp)		  
<li><a onClick="window.location.replace('/karyawan#/ProjectAVGUntp/{{$utp->tahun}}');window.location.reload();"><i class="fa fa-circle-o"></i> {{$utp->tahun}}</a></li>
@endforeach                  
                </li>
              </ul>
            </li>
			
			
			
          </ul>
        </li>
@endif


@if(Auth::guard('karyawan')->user()->level == 'GENERAL MANAGER UBIS')
<li><a onClick="window.location.replace('/karyawan#/AProjectReviwerGMU');window.location.reload();"><i class="fa fa-edit"></i><span>Project Approval</span></a></li>			
<li><a onClick="window.location.replace('/karyawan#/AProjectRepairGMU');window.location.reload();"><i class="fa fa-pencil"></i><span>Project Repair</span></a></li>			
<li><a onClick="window.location.replace('/karyawan#/AProjectListK');window.location.reload();"> <i class="fa fa-newspaper-o"></i> <span>List Project Baru</span></a> </li>	
<li><a onClick="window.location.replace('/karyawan#/AProjectStatusK');window.location.reload();"><i class="fa fa-exchange"></i> <span>Tracking Project</span></a></li>	
<li><a onClick="window.location.replace('/karyawan#/KProjectReject');window.location.reload();"><i class="fa fa-trash-o"></i><span>Project Reject</span></a></li>
<li><a onClick="window.location.replace('/karyawan#/KProjectFinal');window.location.reload();"> <i class="fa fa-star-o"></i> <span>List Project Final</span></a></li>

<li class="treeview">
          <a href="#">
           <i class="fa fa-bar-chart"></i> <span>AVG Project</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu menu-open">
            <li>
              <a href="#"><i class="fa fa-circle-o"></i> B2S
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu menu-open">
@foreach ($tahunprojectb2s as $b2s)		  
<li><a onClick="window.location.replace('/karyawan#/ProjectAVGB2S/{{$b2s->tahun}}');window.location.reload();"><i class="fa fa-circle-o"></i> {{$b2s->tahun}}</a></li>
@endforeach                  
                </li>
              </ul>
            </li>
			
			
             <li>
              <a href="#"><i class="fa fa-circle-o"></i> UNTAPPED
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu menu-open">
@foreach ($tahunprojectuntp as $utp)		  
<li><a onClick="window.location.replace('/karyawan#/ProjectAVGUntp/{{$utp->tahun}}');window.location.reload();"><i class="fa fa-circle-o"></i> {{$utp->tahun}}</a></li>
@endforeach                  
                </li>
              </ul>
            </li>
			
			
			
          </ul>
        </li>
@endif


@if(Auth::guard('karyawan')->user()->level == 'EXECUTIVE GENERAL MANAGER UBIS')
<li><a onClick="window.location.replace('/karyawan#/AProjectReviwerEGMU');window.location.reload();"><i class="fa fa-edit"></i> <span>Project Approval</span></a></li>			
<li><a onClick="window.location.replace('/karyawan#/AProjectRepairEGMU');window.location.reload();"><i class="fa fa-pencil"></i> <span>Project Repair</span></a></li>			
<li><a onClick="window.location.replace('/karyawan#/AProjectListK');window.location.reload();"> <i class="fa fa-newspaper-o"></i> <span>List Project Baru</span></a> </li>	
<li><a onClick="window.location.replace('/karyawan#/AProjectStatusK');window.location.reload();"><i class="fa fa-exchange"></i> <span>Tracking Project</span></a></li>	
<li><a onClick="window.location.replace('/karyawan#/KProjectReject');window.location.reload();"><i class="fa fa-trash-o"></i> <span>Project Reject</span></a></li>
<li><a onClick="window.location.replace('/karyawan#/KProjectFinal');window.location.reload();"> <i class="fa fa-star-o"></i> <span>List Project Final</span></a></li>

<li class="treeview">
          <a href="#">
           <i class="fa fa-bar-chart"></i> <span>AVG Project</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu menu-open">
            <li>
              <a href="#"><i class="fa fa-circle-o"></i> B2S
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu menu-open">
@foreach ($tahunprojectb2s as $b2s)		  
<li><a onClick="window.location.replace('/karyawan#/ProjectAVGB2S/{{$b2s->tahun}}');window.location.reload();"><i class="fa fa-circle-o"></i> {{$b2s->tahun}}</a></li>
@endforeach                  
                </li>
              </ul>
            </li>
			
			
             <li>
              <a href="#"><i class="fa fa-circle-o"></i> UNTAPPED
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu menu-open">
@foreach ($tahunprojectuntp as $utp)		  
<li><a onClick="window.location.replace('/karyawan#/ProjectAVGUntp/{{$utp->tahun}}');window.location.reload();"><i class="fa fa-circle-o"></i> {{$utp->tahun}}</a></li>
@endforeach                  
                </li>
              </ul>
            </li>
			
			
			
          </ul>
        </li>
@endif



@if(Auth::guard('karyawan')->user()->level == 'DIRECTOR')
<li><a onClick="window.location.replace('/karyawan#/AProjectReviwerBOD');window.location.reload();"><i class="fa fa-edit"></i><span>Project Approval</span></a></li>			
<li><a onClick="window.location.replace('/karyawan#/AProjectListK');window.location.reload();"> <i class="fa fa-pencil"></i> <span>List Project Baru</span></a> </li>	
<li><a onClick="window.location.replace('/karyawan#/AProjectStatusK');window.location.reload();"><i class="fa fa-newspaper-o"></i> <span>Tracking Project</span></a></li>	
<li><a onClick="window.location.replace('/karyawan#/KProjectReject');window.location.reload();"><i class="fa fa-exchange"></i><span>Project Reject</span></a></li>
<li><a onClick="window.location.replace('/karyawan#/KProjectFinal');window.location.reload();"> <i class="fa fa-star-o"></i> <span>List Project Final</span></a></li>

<li class="treeview">
          <a href="#">
           <i class="fa fa-bar-chart"></i> <span>AVG Project</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu menu-open">
            <li>
              <a href="#"><i class="fa fa-circle-o"></i> B2S
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu menu-open">
@foreach ($tahunprojectb2s as $b2s)		  
<li><a onClick="window.location.replace('/karyawan#/ProjectAVGB2S/{{$b2s->tahun}}');window.location.reload();"><i class="fa fa-circle-o"></i> {{$b2s->tahun}}</a></li>
@endforeach                  
                </li>
              </ul>
            </li>
			
			
             <li>
              <a href="#"><i class="fa fa-circle-o"></i> UNTAPPED
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu menu-open">
@foreach ($tahunprojectuntp as $utp)		  
<li><a onClick="window.location.replace('/karyawan#/ProjectAVGUntp/{{$utp->tahun}}');window.location.reload();"><i class="fa fa-circle-o"></i> {{$utp->tahun}}</a></li>
@endforeach                  
                </li>
              </ul>
            </li>
			
			
			
          </ul>
        </li>
		@endif


@if(Auth::guard('karyawan')->user()->level == 'STAFF PROCUREMENT')

<li><a onClick="window.location.replace('/karyawan#/AProjectReviwerSP');window.location.reload();"><i class="fa fa-edit"></i><span>Project Approval</span></a></li>			
<li><a onClick="window.location.replace('/karyawan#/AProjectRepairSP');window.location.reload();"><i class="fa fa-pencil"></i><span>Project Repair</span></a></li>			
<li><a onClick="window.location.replace('/karyawan#/AProjectListK');window.location.reload();"> <i class="fa fa-newspaper-o"></i> <span>List Project Baru</span></a> </li>	
<li><a onClick="window.location.replace('/karyawan#/AProjectStatusK');window.location.reload();"><i class="fa fa-exchange"></i> <span>Tracking Project</span></a></li>	
<li><a onClick="window.location.replace('/karyawan#/KProjectReject');window.location.reload();"><i class="fa fa-trash-o"></i><span>Project Reject</span></a></li>
<li><a onClick="window.location.replace('/karyawan#/KProjectFinal');window.location.reload();"> <i class="fa fa-star-o"></i> <span>List Project Final</span></a></li>

<li class="treeview">
          <a href="#">
           <i class="fa fa-bar-chart"></i> <span>AVG Project</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu menu-open">
            <li>
              <a href="#"><i class="fa fa-circle-o"></i> B2S
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu menu-open">
@foreach ($tahunprojectb2s as $b2s)		  
<li><a onClick="window.location.replace('/karyawan#/ProjectAVGB2S/{{$b2s->tahun}}');window.location.reload();"><i class="fa fa-circle-o"></i> {{$b2s->tahun}}</a></li>
@endforeach                  
                </li>
              </ul>
            </li>
			
			
             <li>
              <a href="#"><i class="fa fa-circle-o"></i> UNTAPPED
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu menu-open">
@foreach ($tahunprojectuntp as $utp)		  
<li><a onClick="window.location.replace('/karyawan#/ProjectAVGUntp/{{$utp->tahun}}');window.location.reload();"><i class="fa fa-circle-o"></i> {{$utp->tahun}}</a></li>
@endforeach                  
                </li>
              </ul>
            </li>
			
			
			
          </ul>
        </li>



@endif


@if(Auth::guard('karyawan')->user()->level == 'ADMINISTRATOR')
<li class="treeview">
          <a>
            <i class="fa fa-circle-o text-blue"></i> <span> Project & CME</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
<li><a onClick="window.location.replace('/karyawan#/KProjectEdit');window.location.reload();"><i class="fa fa-circle-o"></i>Project</a></li>
<li><a onClick="window.location.replace('/karyawan#/KProjectUpload');window.location.reload();"><i class="fa fa-circle-o"></i>Upload Project</a></li>
<li><a onClick="window.location.replace('/karyawan#/KStandartImplementation');window.location.reload();"><i class="fa fa-circle-o"></i>Biaya Implementasi Standard</a></li>
          </ul>
        </li>
		<li class="treeview">
          <a>
            <i class="fa fa-user-plus"></i> <span>User Akses</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
<li><a onClick="window.location.replace('/karyawan#/KListUser');window.location.reload();"><i class="fa fa-circle-o"></i>List User</a></li>
<li><a onClick="window.location.replace('/karyawan#/KListUserLog');window.location.reload();"><i class="fa fa-circle-o"></i>User Activity</a></li>

          </ul>
        </li>
		
@endif


@if(Auth::guard('karyawan')->user()->level == 'OFFICER PROCUREMENT')
<li><a onClick="window.location.replace('/karyawan#/KProjectUpload');window.location.reload();"><i class="fa fa-circle-o"></i>Upload Project</a></li>
<li><a onClick="window.location.replace('/karyawan#/KStandartImplementation');window.location.reload();"><i class="fa fa-circle-o"></i>Biaya Implementasi Standard</a></li>
@endif


@if(Auth::guard('karyawan')->user()->level == 'MANAGER PROCUREMENT')
<li><a onClick="window.location.replace('/karyawan#/AProjectReviwerMP');window.location.reload();"><i class="fa fa-edit"></i><span>Project Approval</span></a></li>		
<li><a onClick="window.location.replace('/karyawan#/AProjectListK');window.location.reload();"> <i class="fa fa-newspaper-o"></i> <span>List Project Baru</span></a> </li>	
<li><a onClick="window.location.replace('/karyawan#/AProjectStatusK');window.location.reload();"><i class="fa fa-exchange"></i> <span>Tracking Project</span></a></li>	
<li><a onClick="window.location.replace('/karyawan#/KProjectReject');window.location.reload();"><i class="fa fa-trash-o"></i><span>Project Reject</span></a></li>
<li><a onClick="window.location.replace('/karyawan#/KProjectFinal');window.location.reload();"> <i class="fa fa-star-o"></i> <span>List Project Final</span></a></li>

<li class="treeview">
          <a href="#">
           <i class="fa fa-bar-chart"></i> <span>AVG Project</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu menu-open">
            <li>
              <a href="#"><i class="fa fa-circle-o"></i> B2S
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu menu-open">
@foreach ($tahunprojectb2s as $b2s)		  
<li><a onClick="window.location.replace('/karyawan#/ProjectAVGB2S/{{$b2s->tahun}}');window.location.reload();"><i class="fa fa-circle-o"></i> {{$b2s->tahun}}</a></li>
@endforeach                  
                </li>
              </ul>
            </li>
			
			
             <li>
              <a href="#"><i class="fa fa-circle-o"></i> UNTAPPED
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu menu-open">
@foreach ($tahunprojectuntp as $utp)		  
<li><a onClick="window.location.replace('/karyawan#/ProjectAVGUntp/{{$utp->tahun}}');window.location.reload();"><i class="fa fa-circle-o"></i> {{$utp->tahun}}</a></li>
@endforeach                  
                </li>
              </ul>
            </li>
			
			
			
          </ul>
        </li>
@endif
<li>
          <a href="/android/el-ravting.apk" target="_blank">
          <i class="fa fa-android"></i> <span>Download APK</span>
          </a>
        </li>

<li class="treeview">
          <a>
            <i class="fa fa-book"></i> <span>Buku Panduaan </span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
<li><a href="/manualbook/BUKU-PANDUAN-PENGGUNAAN-el-RAVTING-WEBSITE.pdf" target="_blank"><i class="fa fa-circle-o"></i>Website</a></li>
<li><a href="/manualbook/BUKU PANDUAN MITRATel-RAVTING ANDROID.pdf" target="_blank"><i class="fa fa-circle-o"></i>Android</a></li>
          </ul>
        </li>
<li class="treeview">
          <a>
            <i class="fa fa-user"></i> <span>User</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
<li><a href="/karyawan#/KProfile"><i class="fa fa-circle-o"></i>Profile</a></li>
<li><a  onclick="event.preventDefault();document.getElementById('logout-form').submit();"><i class="fa fa-circle-o"></i>Sign out</a></li>
<form id="logout-form" action="{{ route('karyawan.logout') }}" method="POST" style="display: none;">
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



@yield('content-karyawan')

 
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
<script src="{{ asset('public/js/app.js') }}"></script>


<!-- jQuery 2.2.3 -->
<script src="{{asset('public/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js')}}"></script>


<script src="{{asset('public/AdminLTE/bootstrap/js/bootstrap.min.js')}}"></script>

<!-- SlimScroll -->
<script src="{{asset('public/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js')}}"></script>
<!-- FastClick -->
<script src="{{asset('public/AdminLTE/plugins/fastclick/fastclick.js')}}"></script>
<!-- AdminLTE App -->
<script src="{{asset('public/AdminLTE/dist/js/app.min.js')}}"></script>
<!-- AdminLTE for demo purposes -->
<script src="{{asset('public/AdminLTE/dist/js/demo.js')}}"></script>

@include('vendor.roksta.toastr')

</body>
</html>
