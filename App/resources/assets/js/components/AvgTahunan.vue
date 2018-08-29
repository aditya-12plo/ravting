<template>
 <div> 
    <section class="content-header">
 <vue-toast ref='toast'></vue-toast>
	  <p><h3 align="center"><b>AVERAGE CAPEX B2S - TAHUN {{this.$route.params.tahun}} </b></h3></p>
    </section>

	 <loading :show="isLoading"></loading>
	 
	<!-- @modal --->
	<div class="container-fluid display-page" id="display-post-category" >
	
	
<!-- @view --->
        <modal  v-if="modal.get('view')" @close="modal.set('view', false)" >
        <template slot="header"><h4 align="center">BILL OF QUANTITY ACTUAL</h4></template>
        <template slot="body" >
			<div class="modal-body">
		<div class="col-sm-12">
 

 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="email">Project ID :  {{datasProject.projectid}}</label>
                        
                    </div>
                    </div>
					
	 <div class="col-sm-6">				
					
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="budget">Status Project :  {{ datasProject.status }}</label>
                    </div>
					
 </div>
 
   
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="proc">Proc :  {{datasProject.proc}}</label>
                        
                    </div>
 </div>
 
  
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="ubis">Ubis :  {{datasProject.ubis}}</label>
                        
                    </div>
 </div>
 
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="tower">Tinggi Tower :  {{ datasProject.tinggitower }}</label>
                        
                    </div>

 </div>
 
 <div class="col-sm-6">
 
					
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="infratype">Infra Type :  {{datasProject.infratype}}</label>
                        
                    </div>

 </div>
 
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="towerprovider">Tower Provider :  {{ datasProject.towerprovider }}</label>
                        
                    </div>

 </div>
 
  
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="mitra">Usulan Mitra :  {{ datasProject.mitra }}</label>
                    </div>

 </div>
 
  
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="sitename">Area :  {{datasProject.area}}</label>
                        
                    </div>
 </div>
 
 
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="area">Regional :  {{datasProject.regional}}</label>
                        
                    </div>

 </div>
 
 
 <div class="col-sm-6">
                     <!-- form Group -->
                    <div class="form-group">
                        <label for="Cluster">Cluster :  {{ datasProject.cluster }}</label>
                        
                    </div>

 </div>
 
 
 <div class="col-sm-6">
 
					
					
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="siteid">Site ID :  {{datasProject.siteid}}</label>
                        
						</div>
						
 </div>
 
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="sitename">Site Name :  {{datasProject.sitename}}</label>
                        
                    </div>
					
 </div>
 
 
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="provinsi">Provinsi :  {{ datasProject.provinsi }}</label>
                        
                    </div>

 </div>
 
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="kabupaten">Kabupaten :  {{ datasProject.kabupaten }}</label>
                        
                    </div>

 </div>
 
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="Kordinate">Kordinate : <a :href="'http://www.google.com/maps/place/'+datasProject.latituted+','+datasProject.longitude" target="_blank">Cek Lokasi</a></label>
                        
                    </div>

 <div class="col-sm-3">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="longitude">Longitude :  {{datasProject.longitude}}</label>
						
                    </div>

 </div>
 <div class="col-sm-3">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="latituted">Latituted :  {{this.datasProject.latituted}}</label>
						
                    </div>

 </div>
     
 </div>   
 
  <div class="col-sm-12">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="Upload">Komunikasi Project :  <div v-if="this.pesanlengkap.length > 0"><button type="button" class="btn btn-default" @click="modal.set('message', true)">Lihat Pesan</button></div> </label>
                    </div>

 </div>
 
 
 
 <div class="col-sm-12" style="padding-top: 25px;">
 
     
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="pono">Mitra Implementasi :  {{datasProject.clusterimplementation}}</label>
                    </div>

 </div>
     
 
  
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="Upload">Dokumen Upload :  <font v-if="datasProject.filename"><a v-bind:href="url+datasProject.filename" target="_blank"><button type="button" class="btn btn-success">Download</button></a></font> </label>
                    </div>
 </div>
  
  
 <div class="col-sm-12" style="padding-top:50px;">
 <table class="table">
	  <tr>
        <td align="center"><b>NO</b></td>
        <td align="center" colspan="2"><b>ITEM PEKERJAAN</b></td>
        <td align="center"><b>SATUAN</b></td>
        <td align="center"><b>VOLUME</b></td>
        <td align="center"><b>VOLUME AKTUAL</b></td>
        <td align="center"><b>HARGA SATUAN</b></td>
        <td align="center"><b>HARGA TOTAL</b></td>
      </tr>
	  
	  <tr>
        <td align="left"><b>1</b></td>
        <td align="left" colspan="2"><b>Pekerjaan Pra-Implementasi</b></td>
        <td align="center"></td>
        <td align="center"></td>
        <td align="center"></td>
        <td align="right"></td>
        <td align="right"></td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left" style="padding: 5px;"><b>1.1</b></td>
        <td align="left"><b>Site Investigation Survey (SIS)</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(datasProject.sis)}}</td>
        <td align="right">{{formatNumberRupiah(datasProject.sis)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>1.2</b></td>
        <td align="left"><b>Site Acquisition dan Jasa Perolehan lahan</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(datasProject.sitac)}}</td>
        <td align="right">{{formatNumberRupiah(datasProject.sitac)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b> 1.3</b></td>
        <td align="left"><b>Jasa Perolehan Ijin Mendirikan Bangunan (IMB) tower dan Perijinan</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(datasProject.imb)}}</td>
        <td align="right">{{formatNumberRupiah(datasProject.imb)}}</td>
      </tr>
	  
	  <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>
	  
	  <tr>
        <td align="left"><b>2</b></td>
        <td align="left" colspan="2"><b>Sewa Lahan (11 tahun include PPh)</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(datasProject.lahan)}}</td>
        <td align="right">{{formatNumberRupiah(datasProject.lahan)}}</td>
      </tr>
	  
	   <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>
	  
	  
	  <tr>
        <td align="left"><b>3</b></td>
        <td align="left" colspan="2"><b>Tower {{datasProject.tower}} M</b></td>
        <td align="center">LS</td>
        <td align="center">{{this.dataStandard.tonase}}</td>
        <td align="center">{{this.dataStandard.tonase}}</td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.biayatower)}}</td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.biayatower*this.dataStandard.tonase)}}</td>
      </tr>
	  
	  
	  <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>
	  
	  
	  <tr>
        <td align="left"><b>4</b></td>
        <td align="left" colspan="2"><b>Pekerjaan Implementasi (Standard)</b></td>
        <td align="center"></td>
        <td align="center"></td>
        <td align="center"></td>
        <td align="right"></td>
        <td align="right"></td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>4.1</b></td>
        <td align="left"><b>Erection Tower</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.erection_tower)}}</td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.erection_tower)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>4.2</b></td>
        <td align="left"><b>Transportasi</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.transportasi)}}</td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.transportasi)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>4.3</b></td>
        <td align="left"><b>Pondasi Greenfiled</b></td>
        <td align="center">LS</td>
        <td align="center">{{this.dataStandard.pondasi_greenfiled}}</td>
        <td align="center">{{this.dataStandard.pondasi_greenfiled}}</td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.pondasi)}}</td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.pondasi_greenfiled*dataStandard.pondasi)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>4.4</b></td>
        <td align="left"><b>BTS Outdoor</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.bts_outdoor)}}</td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.bts_outdoor)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>4.5</b></td>
        <td align="left"><b>ME</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.me)}}</td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.me)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>4.6</b></td>
        <td align="left"><b>F & Y (10mx12m)</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.fy)}}</td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.fy)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>4.7 </b></td>
        <td align="left"><b>PLN Connect</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.pln_connect)}}</td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.pln_connect)}}</td>
      </tr>
	  
	  <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>
	  
	  
	  <tr>
        <td align="left"><b>5</b></td>
        <td align="left" colspan="2"><b>Pekerjaan Non Standard </b></td>
        <td align="center"></td>
        <td align="center"></td>
        <td align="center"></td>
        <td align="right"></td>
        <td align="right"></td>
      </tr>
	   <tr v-for="(roww,index) in this.tambahan">
 <td align="left"> </td>
 <td align="left"><b>5.{{index+1}}</b></td>
 <td align="left"><b>{{roww.pekerjaan}}</b></td>
 <td align="center">{{roww.satuan}}</td>
 <td align="center">{{roww.qty}}</td>
 <td align="center">{{roww.qty}}</td>
<td align="right">{{formatNumberRupiah(roww.harga)}}</td>
<td align="right">{{formatNumberRupiah(roww.qty * roww.harga)}}</td>
      
    </tr>
	  
	  
	  <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>

	  <tr>
        <td colspan="6"><h4 align="center"><b>Total Pekerjaan Standard :</b></h4></td>
        <td colspan="2"><h4 align="right"><b>{{formatNumberRupiah(datasProject.sis+datasProject.sitac+datasProject.imb+datasProject.lahan+(this.dataStandard.tonase*this.dataStandard.biayatower)+this.dataStandard.erection_tower+this.dataStandard.transportasi+(this.dataStandard.pondasi_greenfiled*this.dataStandard.pondasi)+this.dataStandard.bts_outdoor+this.dataStandard.me+this.dataStandard.fy+this.dataStandard.pln_connect)}}</b></h4></td>
      </tr>

	  <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>

	  <tr>
        <td colspan="6"><h4 align="center"><b>Total Pekerjaan Non Standard :</b></h4></td>
        <td colspan="2"><h4 align="right"><b>{{formatNumberRupiah(totalTambahan(this.tambahan))}}</b></h4></td>
      </tr>

	  
	  <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>

	  <tr>
        <td colspan="6"><h4 align="center"><b>Total CAPEX :</b></h4></td>
        <td colspan="2"><h4 align="right"><b>{{formatNumberRupiah(datasProject.sis+datasProject.sitac+datasProject.imb+datasProject.lahan+(this.dataStandard.tonase*this.dataStandard.biayatower)+this.dataStandard.erection_tower+this.dataStandard.transportasi+(this.dataStandard.pondasi_greenfiled*this.dataStandard.pondasi)+this.dataStandard.bts_outdoor+this.dataStandard.me+this.dataStandard.fy+this.dataStandard.pln_connect+totalTambahan(this.tambahan))}}</b></h4></td>
      </tr>

	  
	  <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>

	  <tr>
        <td colspan="6"><h4 align="center"><b>Plafon :</b></h4></td>
        <td colspan="2"><h4 align="right"><b>{{formatNumberRupiah(datasProject.budget)}}</b></h4></td>
      </tr>

	  
	  </table>
  </div>
 
 
 
 
 
 </div>
 </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="modal.set('view', false)">Close</button>
					<button type="button" class="btn btn-success" @click.prevent="DownloadExcel()">Download Excel</button>
					<button type="button" class="btn btn-primary" @click.prevent="print()">Print</button>
                </div>	
        </template>
        </modal>
 
 
 
<!-- @Detail regional --->
        <modal  v-if="modal.get('regional')" @close="modal.set('regional', false)"  >
        <template slot="header" ><h4 align="center">Detail regional</h4></template>
        <template slot="body" >
                <div class="modal-body">

  <table class="table" style="overflow-x:auto;">
   <thead>
      <tr>
        <th><h5 align="center"><b>DETAIL</b></h5></th>
        <th><h5 align="center"><b>PROJECTID</b></h5></th>
        <th><h5 align="center"><b>AREA</b></h5></th>
        <th><h5 align="center"><b>REGIONAL</b></h5></th>
        <th><h5 align="center"><b>TOWER</b></h5></th>
        <th><h5 align="center"><b>CAPEX</b></h5></th>
      </tr>
    </thead>
    <tbody>
	<tr v-for="item in this.datasProjectRegional">
        <td align="center"><button class="btn btn-sm" @click="itemActionDetailProject(item)"><i class="glyphicon glyphicon-zoom-in">Detail</i></button></td>
        <td align="left">{{item.projectid}}</td>
        <td align="left">{{item.area}}</td>
        <td align="left">{{item.regional}}</td>
        <td align="left">{{item.tinggitower}}</td>
        <td align="right">{{formatNumberRupiah(item.capex)}}</td>
      </tr>
    </tbody>
  </table>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="modal.set('regional', false)" >Close</button>
					
                </div>
				</form>
        </template>
        </modal>
 <!-- @Detail regional --->
 
 
 
 
<!-- @Detail area --->
        <modal  v-if="modal.get('area')" @close="modal.set('area', false)"  >
        <template slot="header" ><h4 align="center">Detail regional</h4></template>
        <template slot="body" >
                <div class="modal-body">

  <table class="table" style="overflow-x:auto;">
   <thead>
      <tr>
        <th><h5 align="center"><b>DETAIL</b></h5></th>
        <th><h5 align="center"><b>PROJECTID</b></h5></th>
        <th><h5 align="center"><b>AREA</b></h5></th>
        <th><h5 align="center"><b>REGIONAL</b></h5></th>
        <th><h5 align="center"><b>TOWER</b></h5></th>
        <th><h5 align="center"><b>CAPEX</b></h5></th>
      </tr>
    </thead>
    <tbody>
	<tr v-for="item in this.datasProjectArea">
        <td align="center"><button class="btn btn-sm" @click="itemActionDetailProject(item)"><i class="glyphicon glyphicon-zoom-in">Detail</i></button></td>
        <td align="left">{{item.projectid}}</td>
        <td align="left">{{item.area}}</td>
        <td align="left">{{item.regional}}</td>
        <td align="left">{{item.tinggitower}}</td>
        <td align="right">{{formatNumberRupiah(item.capex)}}</td>
      </tr>
    </tbody>
  </table>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="modal.set('area', false)" >Close</button>
					
                </div>
				</form>
        </template>
        </modal>
 <!-- @Detail area --->
 
 
 
 
 <!-- @message --->
        <modal  v-if="modal.get('message')" @close="modal.set('message', false)"  >
        <template slot="header" ><h4 align="center">Komunikasi Project</h4></template>
        <template slot="body" >
                <div class="modal-body">

<div class="col-sm-12" v-if="this.pesanlengkap.length > 0">				
<div v-for="(row,index) in this.pesanlengkap" style="border: 1px solid grey;">				
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="pengirim">Pengirim : {{row.name}}</label><br>
                        <label for="jabatan">Posisi : {{row.level}}</label><br>
                        <label for="stts">Status : {{row.status}}</label><br>
                        <label for="pesan">Pesan : {{row.message}}</label><br>
                        <label for="time">Waktu : {{row.created_at}}</label><br>
                    </div>
</div>
</div>
<div class="col-sm-12" v-else>
 <!-- form Group -->
                    <div class="form-group">
                        <label for="pengirim">Belum Ada Komunikasi Project</label><br>
                    </div>
</div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="modal.set('message', false)" >Close</button>
					
                </div>
				</form>
        </template>
        </modal>
  <!-- @message --->
 
 
	
	</div>
	<!-- @modal --->
	
	
	
	
	

   <section class="content">
      <div class="row">
      
	<div class="col-md-12">
	
 
	<div class="col-md-12">
	 <div class="col-md-6">
<div class="small">
	  <p><h3 align="center"><b>DATA CAPEX NASIONAL </b></h3></p>
<div class="table-responsive">
  <table class="table" style="overflow-x:auto;">
   <thead>
      <tr>
        <th><h5 align="center"><b>DETAIL</b></h5></th>
        <th><h5 align="center"><b>PROJECTID</b></h5></th>
        <th><h5 align="center"><b>AREA</b></h5></th>
        <th><h5 align="center"><b>REGIONAL</b></h5></th>
        <th><h5 align="center"><b>TOWER</b></h5></th>
        <th><h5 align="center"><b>CAPEX</b></h5></th>
      </tr>
    </thead>
    <tbody v-if="this.dataNas">
	<tr v-for="item in this.dataNas">
        <td align="center"><button class="btn btn-sm" @click="itemActionDetailProject(item)"><i class="glyphicon glyphicon-zoom-in">Detail</i></button></td>
        <td align="left">{{item.projectid}}</td>
        <td align="left">{{item.area}}</td>
        <td align="left">{{item.regional}}</td>
        <td align="left">{{item.tinggitower}}</td>
        <td align="right">{{formatNumberRupiah(item.capex)}}</td>
      </tr>
	
	<tr>
        <td align="center" colspan="4">TOTAL CAPEX NASIONAL</td>
        <td align="right" colspan="2">{{formatNumberRupiah(total(this.dataNas))}}</td>
      </tr>
	
	<tr>
        <td align="center" colspan="4">AVERAGE CAPEX NASIONAL</td>
        <td align="right" colspan="2">{{formatNumberRupiah(total(this.dataNas)/this.dataNas.length)}}</td>
      </tr>
	
    </tbody>
    <tbody v-else>
	<tr>
        <td colspan="5"><h5 align="center"><b>Data Masih Kosong</b></h5></td>
      </tr>
    </tbody>
  </table>
</div>
	  </div>
  </div>

  
  
	 <div class="col-md-6">
<div class="small">
	  <p><h3 align="center"><b>AVERAGE CAPEX NASIONAL </b></h3></p>
    <pie-nasional :height="300" :data="this.dataRegional"></pie-nasional>
  </div>
  </div>
  
  
  </div>
	
	
	
	
	<div class="col-md-12">
	 <div class="col-md-6">
<div class="small">
	  <p><h3 align="center"><b>DATA CAPEX REGIONAL </b></h3></p>
<div class="table-responsive">
  <table class="table" style="overflow-x:auto;">
   <thead>
      <tr>
	  <th><h5 align="center"><b>DETAIL</b></h5></th>
        <th><h5 align="center"><b>REGIONAL</b></h5></th>
        <th><h5 align="center"><b>CAPEX</b></h5></th>
      </tr>
    </thead>
    <tbody v-if="this.dataReg">
	<tr v-for="item in this.dataReg">
	<td align="center"><button class="btn btn-sm" @click="itemActionDetailRegional(item.regional)"><i class="glyphicon glyphicon-zoom-in">Detail</i></button></td>
        <td align="left">{{item.regional}}</td>
        <td align="right">{{formatNumberRupiah(item.capexNya / item.total)}}</td>
      </tr>
	
	<tr>
        <td align="center" colspan="2">TOTAL CAPEX REGIONAL</td>
        <td align="right">{{formatNumberRupiah(totalRegional(this.dataReg))}}</td>
      </tr>
	
	<tr>
        <td align="center" colspan="2">AVERAGE CAPEX REGIONAL</td>
        <td align="right">{{formatNumberRupiah(totalRegional(this.dataReg)/this.dataReg.length)}}</td>
      </tr>
	
    </tbody>
    <tbody v-else>
	<tr>
        <td colspan="3"><h5 align="center"><b>Data Masih Kosong</b></h5></td>
      </tr>
    </tbody>
  </table>
</div>
	  </div>
  </div>

  

  
	 <div class="col-md-6">
<div class="small">
	  <p><h3 align="center"><b>AVERAGE CAPEX REGIONAL </b></h3></p>
    <pie-regional :height="300" :data="this.dataRegional"></pie-regional>
  </div>
  </div>
  
  
  </div>
	
	
	


	
	
	<div class="col-md-12">
	 <div class="col-md-6">
<div class="small">
	  <p><h3 align="center"><b>DATA CAPEX AREA </b></h3></p>
<div class="table-responsive">
  <table class="table" style="overflow-x:auto;">
   <thead>
      <tr>
        <th><h5 align="center"><b>DETAIL</b></h5></th>
        <th><h5 align="center"><b>AREA</b></h5></th>
        <th><h5 align="center"><b>CAPEX</b></h5></th>
      </tr>
    </thead>
    <tbody v-if="this.dataAre">
	<tr v-for="item in this.dataAre">
        <td align="center"><button class="btn btn-sm" @click="itemActionDetailArea(item.area)"><i class="glyphicon glyphicon-zoom-in">Detail</i></button></td>
        <td align="left">{{item.area}}</td>
        <td align="right">{{formatNumberRupiah(item.capexNya / item.total)}}</td>
      </tr>
	
	<tr>
        <td align="center" colspan="2">TOTAL CAPEX AREA</td>
        <td align="right">{{formatNumberRupiah(totalRegional(this.dataAre))}}</td>
      </tr>
	
	<tr>
        <td align="center" colspan="2">AVERAGE CAPEX AREA</td>
        <td align="right">{{formatNumberRupiah(totalRegional(this.dataAre)/this.dataAre.length)}}</td>
      </tr>
	
    </tbody>
    <tbody v-else>
	<tr>
        <td colspan="3"><h5 align="center"><b>Data Masih Kosong</b></h5></td>
      </tr>
    </tbody>
  </table>
</div>
	  </div>
  </div>

  

  
	 <div class="col-md-6">
<div class="small">
	  <p><h3 align="center"><b>AVERAGE CAPEX AREA </b></h3></p>
    <pie-area :height="300" :data="this.dataRegional"></pie-area>
  </div>
  </div>
  
  
  
  </div>
	
	
	
	
	
	
  
  
  </div>




      
      </div>
      </section>
    </div>
</template>
<script>
     /* ------------------------------------------------------------------------------------- ERRORS
         ---------------------------------------------------------------------------------------------------- */
        class Errors{
            constructor(){
                this.errors = {};
            }
            get(field){
                if(this.errors[field]){
                    return  this.errors[field][0];
                }
            }
            record(errors){
                this.errors = errors.response.data;
            }
            any(){
                return Object.keys(this.errors).length > 0;
            }
            has(field){
                return this.errors.hasOwnProperty(field);
            }
            clear(field){
                if(field) delete this.errors[field];
                this.errors = {};
            }
            clearAll(){
                this.errors = "";
            }
        }
        /* ------------------------------------------------------------------------------------- CRUD FORM
         ---------------------------------------------------------------------------------------------------- */
        class CrudForm {
            constructor(data) {
                this.originalData = data;
                for(let field in data){
                    this[field] = data[field];
                }
            }
            reset(){
                for(let field in this.originalData){
                    this[field] = '';
                }
            }
            /*  Set a value to the temp , verify if has this item and update  */
            setFillItem(item , index){
                for(let field in this.originalData){
                    if(field in item){
                        this[field] = item[field];
                    }else{
                        // if is index
                        if(field == 'index'){ this[field] = index; }
                    }
                }
            }
            data(){
                let data = Object.assign({} , this);
                delete data.originalData;
                delete data.errors;
                return data;
            }
        }
        /* ------------------------------------------------------------------------------------- CRUD MODAL
         ---------------------------------------------------------------------------------------------------- */
        class CrudModal{
            constructor(data){
                this.modal = data;
            }
            get(value){
                if(this.modal[value]){
                    return this.modal[value];
                }
            }
            set(data , value){
                this.modal[data] = value;
            }
        }
        // -----------------------------------------------------------------------------------------------  COMPONENT MODAL
        const Modal = {
            template: `   <transition name="modal">
                                <div class="modal-mask">
                                  <div class="modal-wrapper">
                                    <div :class="modalStyle">
                                    <a class="close-modal" @click="$emit('close')" ></a>
                                      <div class="modal-header">
                                           <p class="modal-card-title"><slot name="header" class="modal-card-title "></slot></p>
                                      </div>
                                        <slot name="body">
                                          default body
                                        </slot>
                                    </div>
                                  </div>
                                </div>
                              </transition>` ,
            props: {
                modalsize: {type: String},
            } ,
            computed: {
                modalStyle() {
                    return this.modalsize == null ? 'modal-container' : this.modalsize + ' modal-container';
                },
                created(){

                }
            }
        };
    
    
    
Vue.component('project-button-actions', require('./ProjectCustomActions.vue'))
Vue.component('DynamicForm', require('./DynamicForm.vue'))
import VueCharts from 'vue-chartjs'
import { Bar, Line } from 'vue-chartjs'
import accounting from 'accounting'
import {Money} from 'v-money'
import moment from 'moment'
import loading from './Loading'
import '!!vue-style-loader!css-loader!vue-toast/dist/vue-toast.min.css'
import VueToast from 'vue-toast'
import myDatepicker from 'vue-datepicker'
import Vuetable from 'vuetable-2/src/components/Vuetable'
import VuetablePagination from 'vuetable-2/src/components/VuetablePagination'
import VuetablePaginationInfo from 'vuetable-2/src/components/VuetablePaginationInfo'
import Vue from 'vue'
import vSelect from 'vue-select'
import VueEvents from 'vue-events'
import SimpleVueValidation from 'simple-vue-validator'
var Validator = SimpleVueValidation.Validator
Vue.use(SimpleVueValidation);
Vue.use(VueEvents)
window.axios = require('axios')
window.eventBus = new Vue()
 Vue.component('modal', Modal)
 Vue.component('v-select', vSelect)
 
 
 Vue.component("pie-nasional", {
  extends: VueCharts.Bar,
  props: ["data"],
  mounted() {
    this.renderLineChart();
  },
  computed: {
    chartData: function() {
      return this.data;
    }
  },
  methods: {
    renderLineChart: function() {
    this.renderChart(
      {
        labels: this.data.infratype,
        datasets: [
          {
		  label: 'CAPEX NASIONAL',
            borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#dd4b39',
			data: this.data.capexnasional
          }
        ],
		options: {
    scales: {
        yAxes: [{
            type: 'linear',
            position: 'bottom',
            ticks: {
			beginAtZero: true,
			 min: 0,  // My use case requires starting at zero
			stepSize: 50,
			
            }
        }]
    }
}
      },
      { responsive: true, maintainAspectRatio: false }
    );      
    }
  },
  watch: {
    data: function() {
      this.renderLineChart();
    }
  }
})

 Vue.component("pie-regional", {
  extends: VueCharts.Bar,
  props: ["data", "options"],
  mounted() {
    this.renderLineChart();
  },
  computed: {
    chartData: function() {
      return this.data;
    }
  },
  methods: {
    renderLineChart: function() {
    this.renderChart(
      {
        labels: this.data.regional,
        datasets: [
          {
		  label: 'CAPEX',
            borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#dd4b39',
			data: this.data.capex
          }
        ],
		options: {
    scales: {
        yAxes: [{
            type: 'linear',
			stepSize: 50,
			maxTicksLimit: 3,
            position: 'bottom',
            min: 0,  // My use case requires starting at zero
            beginAtZero: true,
            ticks: {
                callback: function(value, index, values) {
                    // Make sure a tick is not a fractional value
                    if (Math.floor(value) === value) {
                        return value;
                    }
                }
            }
        }]
    }
}
      },
      { responsive: true, maintainAspectRatio: false }
    );      
    }
  },
  watch: {
    data: function() {
      //this._chart.destroy();
      //this.renderChart(this.data, this.options);
      this.renderLineChart();
    }
  }
})

Vue.component("pie-area", {
  extends: VueCharts.Bar,
  props: ["data", "options"],
  mounted() {
    this.renderLineChart();
  },
  computed: {
    chartData: function() {
      return this.data;
    }
  },
  methods: {
    renderLineChart: function() {
    this.renderChart(
      {
        labels: this.data.area,
        datasets: [
          {
		  label: 'CAPEX',
           borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#dd4b39',
			data: this.data.capexarea
          }
        ]
      },
      { responsive: true, maintainAspectRatio: false }
    );      
    }
  },
  watch: {
    data: function() {
      //this._chart.destroy();
      //this.renderChart(this.data, this.options);
      this.renderLineChart();
    }
  }
})



export default {
  components: {
    Vuetable,
    VuetablePagination,
    VuetablePaginationInfo,
     'vue-toast': VueToast,
     'date-picker': myDatepicker,
	 Money,
	 loading,
  },
  data () {
    return {
	dataRegional: [],
	datasProjectRegional: '',
	datasProjectArea: '',
	datasProject: '',
	isLoading: false,
	dataArea: {},
	money: {
          decimal: ',',
          thousands: '.',
          prefix: 'Rp. ',
          precision: 2,
          masked: false
        },
	qty: {
        decimal: ',',
        thousands: '.',
        prefix: '',
        suffix: '',
        precision: 3,
        masked: false
        },
    selectedRow: [],
    startTime: {
        time: ''
      },
      endtime: {
        time: ''
      },
  option: {
        type: 'day',
        week: ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'],
        month: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
        format: 'YYYY',
        placeholder: 'YYYY',
        inputStyle: {
          'display': 'inline-block',
          'padding': '6px',
          'line-height': '22px',
          'font-size': '16px',
          'border': '2px solid #fff',
          'box-shadow': '0 1px 3px 0 rgba(0, 0, 0, 0.2)',
          'border-radius': '2px',
          'color': '#5F5F5F'
        },
        color: {
          header: '#B799DA',
          headerText: '#f00'
        },
        buttons: {
          ok: 'Ok',
          cancel: 'Cancel'
        },
        overlayOpacity: 0.5, // 0.5 as default 
        dismissible: true // as true as default 
      },
    position: 'up right',
    closeBtn: true,
    formErrors:{},
    PesanData:[],
	gradient: null,
    gradient2: null,
	message: '',
    errors: new Errors() ,
	filename:'',
	selected:'',
	pilihTahun: [],
	pilihkode: ['UNTAPPED','B2S'],
	tahunNya: '',
	infraNya: '',
	sitenametenant: '',
	contract: '',
	avgNya: '',
	dataNas: [],
	dataReg: [],
	dataAre: [],
	file_name:'',
 	pesannya:[],
	standard:[{category:'',
	subcategory:
	[{
	project_implementation_id:'',
	category:'',
	workimplementation:'',
	unit:'',
	qty:'',
	unitprice:'',
	}]
	}] ,
    modal:new CrudModal({view:false, regional:false, area:false,  repair:false, message:false}),
     berhasilNya: [],
     errorNya: [],
     workitem:[],
     url:'/files/',
     urlDetail:'/karyawan/downloadExcel/',
     unit:[],
     volume:[],
     unitprice:[],
     tambahan: [],
     pengurangan: [],
     standart: [],
     token: localStorage.getItem('token'),
    submitted: false,
    submitSelectedItems:[],
    displayItems:[] ,
    perPage: 10,
    
      filterText: '', 
      css: {
        table: {
          tableClass: 'table table-bordered table-striped table-hover',
          ascendingIcon: 'glyphicon glyphicon-chevron-up',
          descendingIcon: 'glyphicon glyphicon-chevron-down'
        },
        pagination: {
          wrapperClass: 'pagination',
          activeClass: 'active',
          disabledClass: 'disabled',
          pageClass: 'page',
          linkClass: 'link',
          icons: {
            first: '',
            prev: '',
            next: '',
            last: '',
          },
        },
        icons: {
          first: 'glyphicon glyphicon-step-backward',
          prev: 'glyphicon glyphicon-chevron-left',
          next: 'glyphicon glyphicon-chevron-right',
          last: 'glyphicon glyphicon-step-forward',
        },
      },
      moreParams: {}
    }
  },
          watch: {
            'perPage'(newValue, oldValue) {
               this.$events.fire('filter-set', this.filterText)
            },
            'delayOfJumps': 'resetOptions',
        'maxToasts': 'resetOptions',
        'position': 'resetOptions',
        },
  methods: { 
   print(){
var masuk = {palanya:this.datasProject,standard:this.dataStandard,additional:this.tambahan,pesan:this.approved};		
				axios({
  url: '/karyawan/print',
  method: 'POST',
  data: masuk,
  responseType: 'blob', // important
}).then((response) => {
  const url = window.URL.createObjectURL(new Blob([response.data]));
  const link = document.createElement('a');
  link.href = url;
  link.setAttribute('download', this.datasProject.projectid+'.pdf');
  document.body.appendChild(link);
  link.click();
});
            },
			 
   DownloadExcel(){
this.isLoading = true;
var masuk = {palanya:this.datasProject,standard:this.dataStandard,additional:this.tambahan,pesan:this.approved};		
			axios({
  url: '/karyawan/downloadExcel',
  method: 'POST',
  data: masuk,
 responseType: 'blob', // important
}).then((response) => {
  const url = window.URL.createObjectURL(new Blob([response.data]));
  const link = document.createElement('a');
  link.href = url;
  link.setAttribute('download', this.datasProject.projectid+'.xls');
  document.body.appendChild(link);
  link.click();
  this.isLoading = false;

});
            },
	  itemAction(){	  
	  this.isLoading = true;
 axios.get('/karyawan/DataGrafikAVGB2s?tahun='+this.$route.params.tahun).then((response) => {
                  this.dataRegional = response.data;
                  this.dataNas = response.data.dataNas;
                  this.dataReg = response.data.dataReg;
                  this.dataAre = response.data.dataAre;
				  this.isLoading = false;
});	 
      },
	  itemActionDetailProject(item){	  
this.isLoading = true;
 axios.get('/karyawan/GetProjectDetailProsesGrafikB2s/'+item.id+'/'+item.projectimplementationid+'/'+item.regional+'/'+item.area).then((response) => {
 if(response.data === 'error')
{
this.isLoading = false;
this.submitted = this.showTime('error','Terjadi Kesalahan');
}
else
{				
				
				this.datasProject = response.data.project;
				this.dataStandard = response.data.standard;
				this.approved = response.data.pesan;
				this.tambahan = response.data.additional;
				this.optionscluster = response.data.vcluster;
				this.optionstower = response.data.vtower;
				this.mitraNya = item.mitraimplementation;
				this.levelnya = response.data.levelnya;
				 this.pesanlengkap = response.data.pesanlengkap;
				 this.errorNya = '';
				 this.berhasilNya = '';
				 this.isLoading = false;
                this.modal.set('regional', false);
                this.modal.set('area', false);
                this.modal.set('view', true);
 }               
				}); 	 
      }, 
	  itemActionDetailRegional(item){	  
this.isLoading = true;
 axios.get('/karyawan/GetProjectDetailRegionalB2sGrafik/'+item).then((response) => {
 if(response.data === 'error')
{
this.isLoading = false;
this.submitted = this.showTime('error','Terjadi Kesalahan');
}
else
{				
				this.datasProjectRegional = response.data.project;
				 this.isLoading = false;
                this.modal.set('regional', true);
 }               
				}); 	 
      }, 
	  itemActionDetailArea(item){	  
this.isLoading = true;
 axios.get('/karyawan/GetProjectDetailAreaB2sGrafik/'+item).then((response) => {
 if(response.data === 'error')
{
this.isLoading = false;
this.submitted = this.showTime('error','Terjadi Kesalahan');
}
else
{				
				this.datasProjectArea = response.data.project;
				 this.isLoading = false;
                this.modal.set('area', true);
 }               
				}); 	 
      }, 
   newAvatar(event) {
               let files = event.target.files || e.dataTransfer.files;
               if (files.length) this.file_name = files[0];
                
           },
  addRow: function(){
     this.tambahan.push({category:"PEKERJAAN NON STANDARD",workimplementation:"",unit:"",qty:"",unitprice:""});
    },
    removeRow: function(row){
    //console.log(row);
    this.tambahan.splice(row,1)
    },
    removeRowMin: function(row){
    //console.log(row);
    this.pengurangan.splice(row,1)
    },
  	  totalTambahan: function(data){

  let totalTambahan = [];

  Object.entries(data).forEach(([key, val]) => {
      totalTambahan.push(val.qty * val.harga) // the value of the current key.
  });

  return totalTambahan.reduce(function(totalTambahan, num){ return totalTambahan + num }, 0);

},
  	  total: function(data){

  let total = [];

  Object.entries(data).forEach(([key, val]) => {
      total.push(val.capex) // the value of the current key.
  });

  return total.reduce(function(total, num){ return total + num }, 0);

},
  	  totalRegional: function(data){

  let totalRegional = [];

  Object.entries(data).forEach(([key, val]) => {
      totalRegional.push(val.capexNya / val.total) // the value of the current key.
  });

  return totalRegional.reduce(function(totalRegional, num){ return totalRegional + num }, 0);

},
   isNumber: function(evt) {
      evt = (evt) ? evt : window.event;
      var charCode = (evt.which) ? evt.which : evt.keyCode;
      if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
        evt.preventDefault();;
      } else {
        return true;
      }
    },
fetchIt(){
                axios.get('/karyawan/GetProfileOffice').then((response) => {
                    this.dataNya = response.data;
                    this.loading = false
                }).catch(error => {
				if (! _.isEmpty(error.response)) {
                    if (error.response.status = 422) {
                       this.$router.push('/server-error');
                    }
                   else if (error.response.status = 500) {
                        this.$router.push('/server-error');
                    }
					else
					{
                         this.$router.push('/page-not-found');
					}
					}
                    });
            },

   resetOptions() {
          this.$refs.toast.setOptions({
            delayOfJumps: this.delayOfJumps,
            maxToasts: this.maxToasts,
            position: this.position
          })
        },
        showTime(kode,pesan) {
          this.$refs.toast.showToast(pesan, {
            theme: kode,
            timeLife: 3000,
          })
        },
		
      resetFilter () {
        this.filterText = ''
         this.startTime.time = ''
        this.endtime.time = ''
        this.$events.fire('filter-reset')
      },
    allcap (value) {
      return value.toUpperCase()
    },
    formatNumber (value) {
      return accounting.toFixed(value, 0)
    },
    formatNumberRupiah (value) {
      return accounting.formatMoney(value,  "Rp. ", 2, ".", ",")
    },
    formatTower (value) {
      return accounting.formatMoney(value,  {
  symbol: " M",precision: 0,format: "%v %s"})
    },
    formatDate (value, fmt = 'D MMM YYYY') {
      return (value == null)
        ? ''
        : moment(value, 'YYYY-MM-DD').format(fmt)
    },
    onPaginationData (paginationData) {
      this.$refs.pagination.setPaginationData(paginationData)
      this.$refs.paginationInfo.setPaginationData(paginationData)
    },
    onChangePage (page) {
      this.$refs.vuetable.changePage(page)
    },
    onCellClicked (data, field, event) {
      //console.log('cellClicked: ', field.title)
      this.$refs.vuetable.toggleDetailRow(data.id)
    },       
onLoading() {
     this.loading = true;
    },
    onLoaded() {
      this.loading = false;
    },
    onLoadingError() {
                this.loading = true;
                axios.get('/karyawan/GetProjectRepair').then((response) => {
                    this.loading = false
                }).catch(error => {
        if (! _.isEmpty(error.response)) {
                    if (error.response.status = 500) {
                        this.$router.push('/server-error');
                    }
          else
          {
                        this.loading = false;
          }
          }
                    });
    },      
  },
  validators: {
       workitem: function(value) {
        return Validator.value(value).required();
      },
      unit: function(value) {
        return Validator.value(value).required();
      },
      volume: function(value) {
        return Validator.value(value).required().digit();
      },
      unitprice: function(value) {
        return Validator.value(value).required().digit();
      },
    },
  events: {
    'filter-set' (filterText,startTime,endtime) {
      this.moreParams = {
        filter: filterText,min: startTime, max: endtime
      }
      Vue.nextTick(() => this.$refs.vuetable.refresh() )
    },
    'filter-reset' () {
      this.moreParams = {}
      Vue.nextTick(() => this.$refs.vuetable.refresh() )
    }
  },
 created: function() {
  let self = this;
            this.$root.$on('viewitem', function(data,index){
                //console.log(data);
               self.viewItem(data,index);
            });
        },
              mounted() {
            //console.log(this.token);
			this.fetchIt();
             this.resetOptions();
			 this.itemAction();
			 

        }

}
</script>
<style>
.pagination {
  margin: 0;
  float: right;
}
.pagination a.page {
  border: 1px solid lightgray;
  border-radius: 3px;
  padding: 5px 10px;
  margin-right: 2px;
}
.pagination a.page.active {
  color: white;
  background-color: #337ab7;
  border: 1px solid lightgray;
  border-radius: 3px;
  padding: 5px 10px;
  margin-right: 2px;
}
.pagination a.btn-nav {
  border: 1px solid lightgray;
  border-radius: 3px;
  padding: 5px 7px;
  margin-right: 2px;
}
.pagination a.btn-nav.disabled {
  color: lightgray;
  border: 1px solid lightgray;
  border-radius: 3px;
  padding: 5px 7px;
  margin-right: 2px;
  cursor: not-allowed;
}
.pagination-info {
  float: left;
}
.modal-backdrop {
z-index: -1;
}
.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, .5);
  display: table;
  transition: opacity .3s ease;
}
.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}
.modal-content {
  height: auto;
  min-height: 100%;
  border-radius: 0;
}
.modal-dialog {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}
.modal-container {
  width: 95%;
  margin: 0px auto;
  padding: 5px 10px;
  background-color: #fff;
  border-radius: 2px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, .33);
  transition: all .3s ease;
  font-family: Helvetica, Arial, sans-serif;
}
.modal-header h3 {
  margin-top: 0;
  color: #42b983;
}
.modal-body {
  margin: 5px 0;
   max-height: calc(100vh - 210px);
    overflow-y: auto;
}
.modal-default-button {
  float: right;
}

.modal-enter {
  opacity: 0;
}
.modal-leave-active {
  opacity: 0;
}
.modal-enter .modal-container,
.modal-leave-active .modal-container {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
  .small {
    max-width: 90%;
    margin:  5% auto;
  }
  
</style>