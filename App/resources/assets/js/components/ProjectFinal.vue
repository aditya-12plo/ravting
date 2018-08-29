<template>
 <div> 
    <section class="content-header">
 <vue-toast ref='toast'></vue-toast>
      <h1 align="center">
      List Project Final
      </h1>
    </section>
 <loading :show="isLoading"></loading>
 
 
<div class="container-fluid display-page" id="display-post-category" >

<!-- @view -->
        <modal  v-if="modal.get('view')" @close="modal.set('view', false)" >
        <template slot="header"><h4 align="center">BILL OF QUANTITY ACTUAL {{forms.projectid}}</h4></template>
        <template slot="body" >
			<div class="modal-body">
		<div class="col-sm-12">
 
 
   
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="proc">Proc :  {{forms.proc}}</label>
                        
                    </div>
 </div>
 
  
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="ubis">Ubis :  {{forms.ubis}}</label>
                        
                    </div>
 </div>
 
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="tower">Tinggi Tower :  {{ forms.tinggitower }}</label>
                        
                    </div>

 </div>
 
 <div class="col-sm-6">
 
					
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="infratype">Infra Type :  {{forms.infratype}}</label>
                        
                    </div>

 </div>
 
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="towerprovider">Tower Provider :  {{ forms.towerprovider }}</label>
                        
                    </div>

 </div>
 
  
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="mitra">Mitra :  {{ forms.mitra }}</label>
                    </div>

 </div>
 
  
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="sitename">Area :  {{forms.area}}</label>
                        
                    </div>
 </div>
 
 
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="area">Regional :  {{forms.regional}}</label>
                        
                    </div>

 </div>
 
 
 <div class="col-sm-6">
                     <!-- form Group -->
                    <div class="form-group">
                        <label for="Cluster">Cluster :  {{ forms.cluster }}</label>
                        
                    </div>

 </div>
 
 
 <div class="col-sm-6">
 
					
					
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="siteid">Site ID :  {{forms.siteid}}</label>
                        
						</div>
						
 </div>
 
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="sitename">Site Name :  {{forms.sitename}}</label>
                        
                    </div>
					
 </div>
 
 
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="provinsi">Provinsi :  {{ forms.provinsi }}</label>
                        
                    </div>

 </div>
 
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="kabupaten">Kabupaten :  {{ forms.kabupaten }}</label>
                        
                    </div>

 </div>
 
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="Kordinate">Kordinate : <a :href="'http://www.google.com/maps/place/'+forms.latituted+','+forms.longitude" target="_blank">Cek Lokasi</a></label>
                        
                    </div>

 <div class="col-sm-3">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="longitude">Longitude :  {{forms.longitude}}</label>
						
                    </div>

 </div>
 <div class="col-sm-3">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="latituted">Latituted :  {{this.forms.latituted}}</label>
						
                    </div>

 </div>
     
 </div>   
 
  <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="Upload">Komunikasi Project :  <div v-if="this.pesanlengkap.length > 0"><button type="button" class="btn btn-default" @click="modal.set('message', true)">Lihat Pesan</button></div> </label>
                    </div>

 </div>
 
 
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="Upload">Dokumen Upload :  <font v-if="forms.filename"><a v-bind:href="url+forms.filename" target="_blank"><button type="button" class="btn btn-success">Download</button></a></font> </label>
                    </div>
 </div>
 
 <div class="col-sm-12" style="padding-top: 25px;">

 <div class="col-sm-12" style="padding-top:50px;" v-if="this.forms.infratype === 'UNTAPPED'">
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
        <td align="right">{{formatNumberRupiah(forms.sis)}}</td>
        <td align="right">{{formatNumberRupiah(forms.sis)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>1.2</b></td>
        <td align="left"><b>Site Acquisition dan Jasa Perolehan lahan</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(forms.sitac)}}</td>
        <td align="right">{{formatNumberRupiah(forms.sitac)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b></b></td>
        <td align="left"><b>1.3</b></td>
        <td align="left"><b>Biaya Retribusi IMB </b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(forms.imb)}}</td>
        <td align="right">{{formatNumberRupiah(forms.imb)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b></b></td>
        <td align="left"><b>1.4</b></td>
        <td align="left"><b>Biaya Jasa Pengurusan IMB </b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(forms.imb_jasa)}}</td>
        <td align="right">{{formatNumberRupiah(forms.imb_jasa)}}</td>
      </tr>
	  
	  <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>
	  
	  <tr>
        <td align="left"><b>2</b></td>
        <td align="left" colspan="2"><b>Sewa Lahan (Include PPh)</b></td>
        <td align="center">LS</td>
        <td align="center">{{forms.qty_lahan}}</td>
        <td align="center">{{forms.qty_lahan}}</td>
        <td align="right">{{formatNumberRupiah(forms.lahan)}}</td>
        <td align="right">{{formatNumberRupiah(forms.qty_lahan*forms.lahan)}}</td>
      </tr>
	  
	   <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>
	  
	  
	  <tr>
        <td align="left"><b>3</b></td>
        <td align="left" colspan="2"><b>Tower {{forms.tinggitower}}</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(forms.biayatower)}}</td>
        <td align="right">{{formatNumberRupiah(forms.biayatower)}}</td>
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
        <td align="left"><b>CME</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(forms.cme)}}</td>
        <td align="right">{{formatNumberRupiah(forms.cme)}}</td>
      </tr>
	
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>4.2</b></td>
        <td align="left"><b>PLN Connect</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(forms.pln)}}</td>
        <td align="right">{{formatNumberRupiah(forms.pln)}}</td>
      </tr>
	
	  <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>
	  
	  
	  <tr>
        <td align="left"><b>5</b></td>
        <td align="left" colspan="2"><b>Pekerjaan Non Standard</b></td>
        <td align="center"></td>
        <td align="center"></td>
        <td align="center"></td>
        <td align="right"></td>
        <td align="right"></td>
      </tr>
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>5.1</b></td>
        <td align="left"><b>CME</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(forms.addcme)}}</td>
        <td align="right">{{formatNumberRupiah(forms.addcme)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>5.2</b></td>
        <td align="left"><b>PLN</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(forms.addpln)}}</td>
        <td align="right">{{formatNumberRupiah(forms.addpln)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>5.3</b></td>
        <td align="left"><b>Transport</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(forms.addtransport)}}</td>
        <td align="right">{{formatNumberRupiah(forms.addtransport)}}</td>
      </tr>
	  
	  
	  <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>

	
	  <tr>
        <td align="center" colspan="6"><h4><b>Total Pekerjaan Standard :</b></h4></td>
        <td align="right" colspan="2"><h4><b>{{formatNumberRupiah(this.totalBiayaStandardUNTAPPED())}}</b></h4></td>
      </tr>

      <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>

      <tr>
        <td align="center" colspan="6"><h4><b>Total Pekerjaan Non Standard :</b></h4></td>
        <td align="right" colspan="2"><h4><b>{{formatNumberRupiah(totalBiayaTambahanUNTAPPED())}}</b></h4></td>
      </tr>

      
      <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>

      <tr>
        <td align="center" colspan="6"><h4><b>Total CAPEX :</b></h4></td>
        <td align="right" colspan="2"><h4><b>{{formatNumberRupiah(TotalCapexUNTAPPED())}}</b></h4></td>
      </tr>


	  
	  </table>
  </div>
 
 
 
 <div class="col-sm-12" style="padding-top:50px;" v-else>
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
        <td align="right">{{formatNumberRupiah(forms.sis)}}</td>
        <td align="right">{{formatNumberRupiah(forms.sis)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>1.2</b></td>
        <td align="left"><b>Site Acquisition dan Jasa Perolehan lahan</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(forms.sitac)}}</td>
        <td align="right">{{formatNumberRupiah(forms.sitac)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b></b></td>
        <td align="left"><b>1.3</b></td>
        <td align="left"><b>Biaya Retribusi IMB </b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(forms.imb)}}</td>
        <td align="right">{{formatNumberRupiah(forms.imb)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b></b></td>
        <td align="left"><b>1.4</b></td>
        <td align="left"><b>Biaya Jasa Pengurusan IMB </b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(forms.imb_jasa)}}</td>
        <td align="right">{{formatNumberRupiah(forms.imb_jasa)}}</td>
      </tr>
	  
	  <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>
	  
	  <tr>
        <td align="left"><b>2</b></td>
        <td align="left" colspan="2"><b>Sewa Lahan (Include PPh)</b></td>
        <td align="center">LS</td>
        <td align="center">{{forms.qty_lahan}}</td>
        <td align="center">{{forms.qty_lahan}}</td>
        <td align="right">{{formatNumberRupiah(forms.lahan)}}</td>
        <td align="right">{{formatNumberRupiah(forms.qty_lahan*forms.lahan)}}</td>
      </tr>
	  
	   <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>
	  
	  
	  <tr>
        <td align="left"><b>3</b></td>
        <td align="left" colspan="2"><b>Tower {{forms.tower}} M</b></td>
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
        <td align="left"><b>F & Y </b></td>
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
        <td align="center" colspan="6"><h4><b>Total Pekerjaan Standard :</b></h4></td>
        <td align="right" colspan="2"><h4><b>
{{formatNumberRupiah(this.totalBiayaStandardB2S())}}
        </b></h4></td>
      </tr>

      <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>

      <tr>
        <td align="center" colspan="6"><h4><b>Total Pekerjaan Non Standard :</b></h4></td>
        <td align="right" colspan="2"><h4><b>{{formatNumberRupiah(total(this.tambahan))}}</b></h4></td>
      </tr>

      
      <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>

      <tr>
        <td align="center" colspan="6"><h4><b>Total CAPEX :</b></h4></td>
        <td align="right" colspan="2"><h4><b>{{formatNumberRupiah(TotalCapexB2S())}}</b></h4></td>
      </tr>

	  
	  </table>
  </div>
 
 
 
 
 
 </div>
 </div>


                </div>
               <div class="modal-footer" v-if="this.noprpo.length > 0">
                    <button type="button" class="btn btn-default" @click="modal.set('view', false)">Close</button>
					<button type="button" class="btn btn-warning" @click="modal.set('prpo', true)">No PR & PO</button>
					<button type="button" class="btn btn-success" @click.prevent="DownloadExcel()">Download Excel</button>
					<button type="button" class="btn btn-primary" @click.prevent="print()">Print</button>
                </div>	
               <div class="modal-footer" v-else>
                    <button type="button" class="btn btn-default" @click="modal.set('view', false)">Close</button>
					<button type="button" class="btn btn-success" @click.prevent="DownloadExcel()">Download Excel</button>
					<button type="button" class="btn btn-primary" @click.prevent="print()">Print</button>
                </div>	
        </template>
        </modal>

		

<!-- @nomor pr & po -->
        <modal  v-if="modal.get('prpo')" @close="modal.set('prpo', false)">
        <template slot="header"><h4 align="center">NO PO & PO {{forms.projectid}}</h4></template>
        <template slot="body" >
<form method="POST" action="" @submit.prevent="SubmitData()" enctype="multipart/form-data">
  <div class="modal-body">
        <div class="col-sm-12"> 
 
 
 <div class="col-sm-12" style="padding-top: 25px;">


 <table class="table">


	   <tr>
 <td align="left"><b>NO</b> </td>
 <td align="left"><b>Nama Pekerjaan</b></td>
 <td align="left"><b>No PR</b></td>
 <td align="left"><b>No PO</b></td>
   
    </tr>
      
    </tr>
 <tr v-for="(roww,index) in this.noprpo">
<td align="left"><b>{{index+1}}</b></td>
 <td>{{roww.workjobs}}</td>
 <td>{{roww.nopr}}</td>
 <td>{{roww.po}}</td>

      
    </tr>
      
      
      </table>

 
 
 
 
 </div>
 </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="modal.set('prpo', false)" >Close</button>
					<button type="submit" class="btn btn-primary">Submit</button>
                </div>
                </form>
        </template>
        </modal>

		
<!-- @message -->
        <modal  v-if="modal.get('message')" @close="modal.set('message', false)"  >
        <template slot="header" ><h4>Komunikasi Project</h4></template>
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

</div>


   <section class="content">
      <div class="row">
      <div class="col-md-12">


<br>

<div class="filter-bar">

<div class="dropdown form-inline pull-right">
                <label>Per Page:</label>

                <select class="form-control" v-model="perPage">
                    <option :value=10>10</option>
                    <option :value=25>25</option>
                    <option :value=50>50</option>
                    <option :value=75>75</option>
                    <option :value=100>100</option>
                </select>
            </div>
             <form class="form-inline">
<div style="overflow-x:auto;">
  <table>
  <tr>
      <td><label>Date From :</label></td>
      <td><date-picker :date="startTime" :option="option" @keyup.enter="doFilter"></date-picker></td>
      <td><label>&nbsp;&nbsp;Date To :</label></td>
      <td><date-picker :date="endtime" :option="option" @keyup.enter="doFilter"></date-picker></td>
    </tr>
    <tr>
      <td><label>Search for:</label></td>
      <td colspan="3"><input type="text" v-model="filterText" class="form-control" @keyup.enter="doFilter" placeholder="Projectid / Cluster"></td>
    </tr>
     <tr>
      <td colspan="4" style="padding-top: 1%;"></td>
    </tr>
    <tr>
      <td colspan="4"><button class="btn btn-success" @click.prevent="doFilter">Go</button>&nbsp;
          <button class="btn" @click.prevent="resetFilter">Reset</button>&nbsp;
		 <button type="button" class="btn btn-danger"  @click="sumSelectedItems()">Export Data</button>
		  </td>
    </tr>
</table>
 </div>
       </form>
       
    




    </div>
    <br>
    <div style="overflow-x:auto;">
    <vuetable ref="vuetable"
      api-url="/karyawan/GetProjectFinalAll"
      :fields="fields"
      pagination-path=""
      :per-page="perPage"
      :css="css.table"
      :append-params="moreParams"
      @vuetable:cell-clicked="onCellClicked"
      @vuetable:pagination-data="onPaginationData"
	  @vuetable:loading="onLoading"        
		@vuetable:load-error="onLoadingError"        
		@vuetable:load-success="onLoaded"
    ></vuetable>
    <div class="vuetable-pagination">
      <vuetable-pagination-info ref="paginationInfo"
        info-class="pagination-info"
      ></vuetable-pagination-info>
      <vuetable-pagination ref="pagination"
        :css="css.pagination"
        @vuetable-pagination:change-page="onChangePage"
      ></vuetable-pagination>
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



import accounting from 'accounting'
import moment from 'moment'
import '!!vue-style-loader!css-loader!vue-toast/dist/vue-toast.min.css'
import VueToast from 'vue-toast'
import myDatepicker from 'vue-datepicker'
import Vuetable from 'vuetable-2/src/components/Vuetable'
import VuetablePagination from 'vuetable-2/src/components/VuetablePagination'
import VuetablePaginationInfo from 'vuetable-2/src/components/VuetablePaginationInfo'
import Vue from 'vue'
import VueEvents from 'vue-events'
import JsonExcel from 'vue-json-excel'
Vue.component('downloadExcel', JsonExcel)
Vue.use(VueEvents)
import loading from './Loading'
window.axios = require('axios')
window.eventBus = new Vue()
Vue.component('child-component-ListProject', {
  template: `<div class="tenant-project-selesai-button-actions">
      <button class="btn btn-sm" @click="itemAction('view-item', rowData, rowIndex)"><i class="glyphicon glyphicon-zoom-in"></i></button>
    </div>`,
  props: {
      rowData: {
        type: Object,
        required: true
      },
      rowIndex: {
        type: Number
      }
    },
    methods: {
      itemAction (action, data, index) {
      if(action === "view-item")
      {
      this.$root.$emit('viewitem', data , index);
      }
      else
      {
alert('error');
      }
        
      }
      }
})
 Vue.component('modal', Modal)
export default {
  components: {
    Vuetable,
    VuetablePagination,
    VuetablePaginationInfo,
    'vue-toast': VueToast,
    'date-picker': myDatepicker,
	loading,
  },
  data () {
    return {
	isLoading: false,
	  json_fields: {
            'BILL OF QUANTITY ACTUAL': '',
            '': '',
            'CLUSTER': 'header.cluster',
            
        },
		json_meta: [
            [
                {
                    'key': 'charset',
                    'value': 'utf-8'
                }
            ]
        ],
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
        format: 'YYYY-MM-DD',
        placeholder: 'YYYY-MM-DD',
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
	file_name:'',
	pilihan: [],
	url:'/files/',
	urlDetail:'/karyawan/downloadExcel/',
	tambahan: [],
	noprpo: [],
	formsDatas: [],
    errors: new Errors() ,
	PesanData:[],
    forms:new CrudForm({index:'',  id:'',projectimplementationid:'' ,no_doc:'', tinggitower:'' , proc:'' ,  ubis:'' , projectid:'' , sitename:'', siteid:'' , area:'', regional:'', cluster:'', kode_tower_depan:'' ,  tower:''  ,  kode_tower_belakang:'' , longitude:'' , latituted:'' , towerprovider:''  , infratype:'' , budget:'' ,  sis:'' ,  sitac:'' ,  imb:'' , imb_jasa:'' ,  qty_lahan:'' ,    lahan:'' ,  biayatower:'' ,  cme:'' ,   pln:'' ,   addtransport:'' ,  addpln:'' ,  addcme:'' , provinsi:''  , kabupaten:''  , mitra:'',towerimplementation:'',mitraimplementation :'' ,clusterimplementation:'', budget:'',created_at:''}) ,
    modal:new CrudModal({prpo:false,view:false  , delete:false , message:false}),
     errorNya: [],
     token: localStorage.getItem('token'),
    submitted: false,
    submitSelectedItems:[] ,
    displayItems:[] ,
     dataNya: {name : '', level:''},
    perPage: 10,
    loading: false,
      fields: [
        {
          name: '__sequence',
          title: 'No',
          titleClass: 'text-center',
          dataClass: 'text-center'
        },
        {
          name: '__checkbox:id',
          titleClass: 'text-center',
          dataClass: 'text-center',
        },
        {
          name: 'projectid',
		  title: 'Project ID',
		  titleClass: 'text-center',
          dataClass: 'text-center'
        },
        {
          name: 'infratype',
		  title: 'Infra Type',
		  titleClass: 'text-center',
          dataClass: 'text-center'
        },
        {
          name: 'area',
		  title: 'Area',
		  titleClass: 'text-center',
          dataClass: 'text-center'
        },
        {
          name: 'tinggitower',
		  title: 'Tinggi Tower',
		  titleClass: 'text-center',
          dataClass: 'text-center'
        },
        {
          name: 'capex',
		  title: 'Total CAPEX',
		  titleClass: 'text-center',
          dataClass: 'text-center',
		  callback: 'formatNumberRupiah'
        },
        {
          name: 'status',
		  title: 'Status',
		  titleClass: 'text-center',
          dataClass: 'text-center'
        },
        {
          name: 'created_at',
		  title: 'Tanggal Input Project',
          titleClass: 'text-center',
          dataClass: 'text-center',
          callback: 'formatDate|DD-MM-YYYY'
        },
        {
          name: '__component:child-component-ListProject',
          title: 'BOQ',
          titleClass: 'text-center',
          dataClass: 'text-center'
        }
      ],
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
  sumSelectedItems() {
  this.isLoading = true;
   var ttl = this.$refs.vuetable.selectedTo;
   if(ttl.length <= 0)
   {
   alert ('Pilih Data Yang Ingin Di Export');
   }
   else
   {
                var join_selected_values = ttl.join(","); 
                //console.log(ttl);  
var masuk = {data:ttl};		
			axios({
  url: '/karyawan/downloadExcelData',
  method: 'POST',
  data: masuk,
 responseType: 'blob', // important
}).then((response) => {
  const url = window.URL.createObjectURL(new Blob([response.data]));
  const link = document.createElement('a');
  link.href = url;
  link.setAttribute('download', 'ExportData.xls');
  document.body.appendChild(link);
  link.click();


});
                   

   }
     this.isLoading = false;
  },
  
     TotalCapexB2S: function(){

  let TotalCapexB2S = this.forms.sis + this.forms.sitac + this.forms.imb  + this.forms.imb_jasa  + (this.forms.qty_lahan*this.forms.lahan) + (this.dataStandard.tonase * this.dataStandard.biayatower) + this.dataStandard.erection_tower + this.dataStandard.transportasi + (this.dataStandard.pondasi_greenfiled * this.dataStandard.pondasi) + this.dataStandard.bts_outdoor + this.dataStandard.me + this.dataStandard.fy + this.dataStandard.pln_connect + this.total(this.tambahan);

  return TotalCapexB2S;

},
      TotalCapexUNTAPPED: function(){

  let TotalCapexUNTAPPED = this.forms.sis + this.forms.sitac + this.forms.imb  + this.forms.imb_jasa  + (this.forms.qty_lahan*this.forms.lahan) + this.forms.biayatower + this.forms.cme + this.forms.pln + this.forms.addcme + this.forms.addpln + this.forms.addtransport;

  return TotalCapexUNTAPPED;

},
      totalBiayaTambahanUNTAPPED: function(){

  let totalBiayaTambahanUNTAPPED = this.forms.addcme + this.forms.addpln + this.forms.addtransport;

  return totalBiayaTambahanUNTAPPED;

},
      totalBiayaStandardB2S: function(){

  let totalBiayaStandardB2S = this.forms.sis + this.forms.sitac + this.forms.imb  + this.forms.imb_jasa  + (this.forms.qty_lahan*this.forms.lahan) + (this.dataStandard.tonase * this.dataStandard.biayatower) + this.dataStandard.erection_tower + this.dataStandard.transportasi + (this.dataStandard.pondasi_greenfiled * this.dataStandard.pondasi) + this.dataStandard.bts_outdoor + this.dataStandard.me + this.dataStandard.fy + this.dataStandard.pln_connect;

  return totalBiayaStandardB2S;

},
      totalBiayaStandardUNTAPPED: function(){

  let totalBiayaStandardUNTAPPED = this.forms.sis + this.forms.sitac + this.forms.imb  + this.forms.imb_jasa + (this.forms.qty_lahan*this.forms.lahan) + this.forms.biayatower + this.forms.cme + this.forms.pln;

  return totalBiayaStandardUNTAPPED;

},
   addRow: function(){
      this.tambahan.push({workitem:"",unit:"",volume:"",unitprice:"",description2:""});
    },
    removeRow: function(row){
    //console.log(row);
    this.tambahan.splice(row,1)
    },
     newAvatar(event) {
               let files = event.target.files || e.dataTransfer.files;
               if (files.length) this.file_name = files[0];
                
           },
  fetchIt(){
  this.isLoading = true;
                axios.get('/karyawan/GetProfileOffice').then((response) => {
                    this.dataNya = response.data;
                    this.isLoading = false;
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
            DownloadExcel(){
this.isLoading = true;
var masuk = {palanya:this.forms,standard:this.dataStandard,additional:this.tambahan,noprpo:this.noprpo,pesan:this.approved};		
			axios({
  url: '/karyawan/downloadExcel',
  method: 'POST',
  data: masuk,
 responseType: 'blob', // important
}).then((response) => {
  const url = window.URL.createObjectURL(new Blob([response.data]));
  const link = document.createElement('a');
  link.href = url;
  link.setAttribute('download', this.forms.projectid+'.xls');
  document.body.appendChild(link);
  link.click();
  this.isLoading = false;

});
            },
			 
            print(){
var masuk = {palanya:this.forms,standard:this.dataStandard,additional:this.tambahan,noprpo:this.noprpo,pesan:this.approved};		
				axios({
  url: '/karyawan/print',
  method: 'POST',
  data: masuk,
  responseType: 'blob', // important
}).then((response) => {
  const url = window.URL.createObjectURL(new Blob([response.data]));
  const link = document.createElement('a');
  link.href = url;
  link.setAttribute('download', this.forms.projectid+'.pdf');
  document.body.appendChild(link);
  link.click();
});
            },
			 
			 
            viewItem(item ,index = this.indexOf(item)){
			this.isLoading = true;
 axios.get('/karyawan/GetProjectDetailProses/'+item.id+'/'+item.projectimplementationid+'/'+item.regional+'/'+item.area).then((response) => {
                this.forms.setFillItem(item , index );
				this.errors.clearAll();
				this.dataStandard = response.data.standard;
				this.approved = response.data.pesan;
				this.noprpo = response.data.noprpo;
				this.tambahan = response.data.additional;
				this.optionscluster = response.data.vcluster;
				this.optionstower = response.data.vtower;
				this.mitraNya = item.mitraimplementation;
				this.levelnya = response.data.levelnya;
				 this.pesanlengkap = response.data.pesanlengkap;
				 this.errorNya = '';
				 this.berhasilNya = '';
				 this.isLoading = false;
                this.modal.set('view', true);
                });
            }  ,
        doFilter () {
        		if(!this.startTime.time && !this.endtime.time)
		{
		this.$events.fire('filter-set', this.filterText, this.startTime.time, this.endtime.time )
		}
		else if(this.startTime.time && !this.endtime.time)
		{
		this.$events.fire('filter-set', this.filterText, this.startTime.time, this.endtime.time )
		}
		else if(!this.startTime.time && this.endtime.time)
		{
		this.$events.fire('filter-set', this.filterText, this.startTime.time, this.endtime.time )
		}
		else if(this.startTime.time && this.endtime.time)
		{ 
		if(this.endtime.time < this.startTime.time)
		{
		alert('Input Date Wrong');
		}
		else
		{
		this.$events.fire('filter-set', this.filterText, this.startTime.time, this.endtime.time )
		}
		}
		else
		{
		this.$events.fire('filter-set', this.filterText, this.startTime.time, this.endtime.time )
		}
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
      resetFilter () {
        this.filterText = ''
        this.tambahan = ''
         this.startTime.time = ''
        this.endtime.time = ''
        this.forms.CrudForm = ''
        this.$events.fire('filter-reset')
      },
    allcap (value) {
      return value.toUpperCase()
    },
    formatNumber (value) {
      return accounting.formatNumber(value, 2)
    },
	  total: function(data){

  let total = [];

  Object.entries(data).forEach(([key, val]) => {
      total.push(val.qty * val.harga) // the value of the current key.
  });

  return total.reduce(function(total, num){ return total + num }, 0);

},
   CheckMessage() {
			axios.get('/karyawan/GetMessageNya/'+this.formsDatas.id).then((response) => {
                this.pesannya=response.data;
                this.modal.set('message', true);
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
	formatTower (value) {
      return accounting.formatMoney(value,  {
  symbol: " M",precision: 0,format: "%v %s"})
    },
	formatNumberRupiah (value) {
      return accounting.formatMoney(value,  "Rp. ", 2, ".", ",")
    },
    formatDate (value, fmt = 'D M YYYY') {
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
            destroyItem(kode){
                axios.delete('/karyawan/DeleteProjectReject/'+ kode)
                    .then(response => {
                this.errorNya = '';
                this.resetFilter();
                 this.modal.set('delete', false);
                 this.submitted = this.showTime('success',response.data.success);

                    })
                    .catch(error => {
                        this.errorNya = error.response.data;
                    });
                   

            },
onLoading() {
     this.isLoading = true;
    },
    onLoaded() {
      this.isLoading = false;
    },
    onLoadingError() {
                this.isLoading = true;
                axios.get('/karyawan/GetProjectFinalAll').then((response) => {
                    this.dataNya = response.data;
                    this.isLoading = false;
                }).catch(error => {
				if (! _.isEmpty(error.response)) {
                    if (error.response.status = 500) {
                        this.$router.push('/server-error');
                    }
					else
					{
                        this.isLoading = false;
					}
					}
                    });
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
            this.$root.$on('deleteitem', function(data,index){
               self.deleteItem(data,index);
            });
        },
		          mounted() {
            //console.log(this.token);
            this.fetchIt();
             this.resetOptions();

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
.modal-container {
  width: 95%;
  margin: 0px auto;
  padding: 20px 30px;
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
  margin: 20px 0;
     max-height: calc(100vh - 210px);
    overflow-y: auto;
}
.modal-default-button {
  float: right;
}
/*
 * The following styles are auto-applied to elements with
 * transition="modal" when their visibility is toggled
 * by Vue.js.
 *
 * You can easily play with the modal transition by editing
 * these styles.
 */
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
</style>