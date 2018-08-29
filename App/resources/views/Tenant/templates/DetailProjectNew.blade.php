@extends('layouts.TenantApp2')
@section('content-tenant')

<section class="content-header">
      <h1 align="center">Detail Proyek</h1>
    </section>

	
	 <section class="content">
	 <a href="/tenant/TGetProject/"><button type="button" class="btn btn-primary">Kembali</button></a>
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
 <table class="table">
    <thead>
      <tr>
        <th colspan="2">{{$header->projectdescription}}</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Nama Site</td>
        <td>{{$header->sitename}}</td>
      </tr>
      
      <tr>
        <td>ID Proyek</td>
        <td>{{$header->projectid}}</td>
      </tr>
      
      <tr>
        <td>Regional</td>
        <td>{{$header->regional}}</td>
      </tr>
      
      <tr>
        <td>Tinggi Tower</td>
        <td>{{$header->tower}} M</td>
      </tr>
    </tbody>
  </table>
  
  @if(count($detail) > 0)
 <table class="table">
    <thead>
      <tr>
        <th colspan="5">Implementasi Pekerjaan Standar</th>
      </tr>
    </thead>
    <tbody>
	<tr>
        <td><div align="center">Item Pekerjaan</div></td>
        <td><div align="center">satuan </div></td>
        <td><div align="center">volume</div> </td>
        <td><div align="center">Harga </div></td>
        <td><div align="center">Total Harga</div></td>
      </tr>
	  @php $gt=0; @endphp
	@foreach($detail->implementation as $key => $m)
	@php $ttl = ceil($m->unitprice*$m->volume); @endphp
      <tr>
        <td>{{$m->workitem}} (<b>{{$m->standartimplementation_detail_description}}</b>)</td>
        <td align="center">{{$m->unit}}</td>
        <td align="center">{{$m->volume}}</td>
        <td align="center">Rp. {{number_format($m->unitprice,2,',','.')}}</td>
        <td align="center">{{number_format($ttl,2,',','.')}}</td>
      </tr>
	 @php $gt = $gt+$ttl; @endphp
	  @endforeach
	  <thead>
      <tr>
        <td colspan="4" align="center"><b>Total Implementasi Pekerjaan Standar</b></td>
        <td><b>Rp. {{number_format($gt,2,',','.')}}</b></td>
      </tr>
    </tbody>
  </table>
  @endif
  
  <button class="add_field_button btn btn-primary">Add More Fields</button>
  <div class="input_fields_wrap">
    <div><input type="text" name="mytext[]"></div>
</div>
    </div>
    </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->


<!-- jQuery 2.2.3 -->
<script src="{{asset('adminthamplate/plugins/jQuery/jquery-2.2.3.min.js')}}"></script>
<script>
  // untuk cek ekstensi file foto
$(document).ready(function () {
$('input[name=file]').change(function () {
var val = $(this).val().toLowerCase();
var regex = new RegExp("(.*?)\.(jpg|png|jpeg|pdf)$");
 if(!(regex.test(val))) {
$(this).val('');
alert('Format Dokumen Harus .jpg / .png / .jpeg / .pdf ');
} }); });

$(document).ready(function() {
    var max_fields      = 20; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID
    
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
            $(wrapper).append('sss'); //add input box
        }
        else
        {
 alert('Maksimal 20 Kolom');       	
        }
    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })
});
</script>
@endsection