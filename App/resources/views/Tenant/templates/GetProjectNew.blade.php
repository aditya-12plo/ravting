@extends('layouts.TenantApp2')

@section('content-tenant')


         <!-- DataTables -->
  <link rel="stylesheet" href="{{asset('adminthamplate/plugins/datatables/dataTables.bootstrap.css')}}">
<section class="content-header">
      <h1 align="center">List Proyek Baru</h1>
    </section>

 <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
				
            <div class="form-group" align="right">
				<form method="get" action="/tenant/TGetProject" enctype="multipart/form-data">
					<input type="text" name="cari" id="cari" required/>
					<button type="submit" class="btn btn-md btn-primary">Cari</button>
					<a href="/tenant/TGetProject" class="btn btn-md btn-danger">Reset</a> 
				</form>
			</div>
			</div>
            <!-- /.box-header -->
            <div class="box-body">
              <table  class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th><div align="center">ID Proyek</div></th>
                  <th><div align="center">Nama Site</div></th>
                  <th><div align="center">Tinggi Tower</div></th>
                  <th><div align="center">Tanggal Proyek</div></th>
                  <th><div align="center">Aksi</div></th>
                </tr>
                </thead>
                <tbody>
    <?php $a=0;?>       
@foreach($show as $key => $m)
                <tr>
                  <td>{{ $m->projectid }}</td>
                  <td>{{ $m->sitename }}</td>
                  <td align="center">{{ $m->tower }} M</td>
                  <td align="center">{{ $m->created_at }}</td>
                  <td align="center"><a href="/tenant/TDetailProject/{{Crypt::encryptString($m->id)}}"><button class="btn btn-sm"><i class="glyphicon glyphicon-zoom-in"></i></a></button>	
                  </td>
                </tr>
            <?php $a++;?> 			
 @endforeach   
                </tbody>
              </table>
			  <div class="form-group" align="right">
				{{ $show->appends(Request::only('cari'))->links() }}
				<div>	
            </div>
							
            <!-- /.box-body -->
          </div>
          <!-- /.box -->


        </div>
        </div>
        <!-- /.col -->
      </div>
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->



<!-- jQuery 2.2.3 -->
<script src="{{asset('adminthamplate/plugins/jQuery/jquery-2.2.3.min.js')}}"></script>
<!-- DataTables -->
<script src="{{asset('adminthamplate/plugins/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('adminthamplate/plugins/datatables/dataTables.bootstrap.min.js')}}"></script>

<script>
  $(function () {
    $("#tabel1").DataTable();
     });
</script>



@endsection