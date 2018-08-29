<template>
 <div> 
    <section class="content-header">
 <vue-toast ref='toast'></vue-toast>
      <h1 align="center">
       List Project Approval
      </h1>
    </section>
 <loading :show="isLoading"></loading>
<div class="container-fluid display-page" id="display-post-category">
 

<!-- @view -->
        <modal  v-if="modal.get('view')" @close="modal.set('view', false)">
        <template slot="header"><h4 align="center">BILL OF QUANTITY ACTUAL {{forms.projectid}}</h4></template>
        <template slot="body" style="overflow-x:auto;">
		<form method="POST" action="" @submit.prevent="SubmitData()" enctype="multipart/form-data">
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
                    <div class="form-group" v-if="forms.infratype==='UNTAPPED'">
                        <label for="tower">Tinggi Tower :  {{ forms.tinggitower }}</label>
                        
                    </div>

                    <!-- form Group -->
                    <div class="form-group" v-else>
                        <label for="tower">Tinggi Tower :  {{ forms.kode_tower_depan }} <select v-model="forms.tower" v-on:change="sortBy" required>
						<option v-for="pilih in optionstower" :value="pilih.tower">{{ pilih.tower }}</option>
						</select> {{ forms.kode_tower_belakang }}</label>
                        
                    </div>

 </div>
 
<div class="col-sm-6">
  <!-- form Group -->
                    <div class="form-group">
                        <label for="infratype">Infra Type</label>
<select class="form-control border-input" v-model="forms.infratype" required >
            <option value="">Pilih Satu</option>
            <option v-for="pilih in pilihan" :value="pilih">{{ pilih }}</option>
            </select>
          <span class="label label-danger" v-for="error of errorNya['infratype']">
                        {{ error }}
                    </span>
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
                        <label for="">Mitra</label>
<input class="form-control border-input" placeholder="Mitra" v-model="forms.mitra"  type="text" required>
                         <span class="label label-danger" v-for="error of errorNya['mitra']">
                        {{ error }}
                    </span>
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
                    <div class="form-group" v-if="forms.infratype==='UNTAPPED'">
                        <label for="Cluster">Cluster :  {{ forms.cluster }}</label>
                        
                    </div>

                    <!-- form Group -->
                    <div class="form-group" v-else>
                        <label for="Cluster">Cluster :  <select v-model="forms.cluster" v-on:change="sortBy" required>
						<option v-for="pilih in optionscluster" :value="pilih.cluster">{{ pilih.cluster }}</option>
						</select></label>
                        
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
                        <label for="sitename">Site Name</label>
                        <input class="form-control border-input" placeholder="Site Name" v-model="forms.sitename"  type="text" required>
                        <span class="label label-danger" v-for="error of errorNya['sitename']">
                        {{ error }}
                    </span>
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
                        <label for="kabupaten">Kab / Kota</label>
<input class="form-control border-input" placeholder="Kabupaten / Kota" v-model="forms.kabupaten"  type="text" required>
  <span class="label label-danger" v-for="error of errorNya['kabupaten']">
                        {{ error }}
                    </span>
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
                        <label for="longitude">Longitude :  </label>
						<input type="text" v-model="forms.longitude" class="form-control" placeholder="Longitude" required>
						<span class="label label-danger" v-for="error of errorNya['longitude']">
                        {{ error }}
                    </span>
                    </div>

 </div>
 <div class="col-sm-3">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="latituted">Latituted :  </label>
						<input type="text" v-model="forms.latituted" class="form-control" placeholder="Latituted" required>
						<span class="label label-danger" v-for="error of errorNya['latituted']">
                        {{ error }}
                    </span>
                    </div>

 </div>
     
 </div>   
 
       
 
  
 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="Upload">Upload Dokumen Jika Ada :  </label>
<input type="file" class="form-control" name="file_name" id="file_name" v-on:change="newAvatar"> 
<span class="label label-danger" v-for="error of errorNya['file_name']">
                        {{ error }}
                    </span>
<span class="label label-success" v-if="berhasilNya">
                        {{ berhasilNya }}
                    </span>
                        <br>    
        <button type="submit" class="btn btn-primary" @click.prevent="uploadItem()">Upload File</button> <font v-if="forms.filename"><a v-bind:href="url+forms.filename" target="_blank"><button type="button" class="btn btn-success">Download</button></a> <button type="submit" class="btn btn-danger" @click.prevent="DeleteFile()">Hapus File</button></font> 
        <br>

                    </div>
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
        <td align="left"><b></b></td>
        <td align="left"><b>1.1</b></td>
        <td align="left"><b>Site Investigation Survey (SIS)</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(forms.sis)}}</td>
        <td align="right">{{formatNumberRupiah(forms.sis)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b></b></td>
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
        <td align="center"><money v-model="forms.qty_lahan" class="form-control border-input" v-bind="tower"></money></td>
        <td align="center">{{this.forms.qty_lahan}}</td>
        <td align="right"><money v-model="forms.lahan" class="form-control border-input" v-bind="uang"></money>                          
<span class="label label-danger" v-for="error of errorNya['lahan']">
                        {{ error }}
                    </span></td>
        <td align="right">{{formatNumberRupiah(this.forms.qty_lahan*this.forms.lahan)}}</td>
      </tr>
	  
	   <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>
	  
	  
	  <tr v-if="this.forms.biayatower >= 0">
        <td align="left"><b>3</b></td>
        <td align="left" colspan="2"><b>Tower {{forms.tinggitower}}</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right"><money v-model="forms.biayatower" class="form-control border-input" v-bind="uang"></money></td>
        <td align="right">{{formatNumberRupiah(this.forms.biayatower)}}</td>
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
        <td align="left"><b></b></td>
        <td align="left"><b>4.1</b></td>
        <td align="left"><b>CME</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right"><money v-model="forms.cme" class="form-control border-input" v-bind="uang"></money></td>
        <td align="right">{{formatNumberRupiah(this.forms.cme)}}</td>
      </tr>
	
	  <tr>
        <td align="left"><b></b></td>
        <td align="left"><b>4.2</b></td>
        <td align="left"><b>PLN Connect</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
         <td align="right"><money v-model="forms.pln" class="form-control border-input" v-bind="uang"></money></td>
        <td align="right">{{formatNumberRupiah(this.forms.pln)}}</td>
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
        <td align="left"><b></b></td>
        <td align="left"><b>5.1</b></td>
        <td align="left"><b>CME</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
         <td align="right"><money v-model="forms.addcme" class="form-control border-input" v-bind="uang"></money></td>
        <td align="right">{{formatNumberRupiah(this.forms.addcme)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b></b></td>
        <td align="left"><b>5.2</b></td>
        <td align="left"><b>PLN</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
         <td align="right"><money v-model="forms.addpln" class="form-control border-input" v-bind="uang"></money></td>
        <td align="right">{{formatNumberRupiah(this.forms.addpln)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b></b></td>
        <td align="left"><b>5.3</b></td>
        <td align="left"><b>Transport</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right"><money v-model="forms.addtransport" class="form-control border-input" v-bind="uang"></money></td>
        <td align="right">{{formatNumberRupiah(this.forms.addtransport)}}</td>
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
        <td align="left"><b>1.1</b></td>
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
        <td align="left"><b> </b></td>
        <td align="left"><b>1.3</b></td>
        <td align="left"><b>Biaya Retribusi IMB </b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right">{{formatNumberRupiah(forms.imb)}}</td>
        <td align="right">{{formatNumberRupiah(forms.imb)}}</td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>1.4</b></td>
        <td align="left"><b> Biaya Jasa Pengurusan IMB </b></td>
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
        <td align="center"><money v-model="forms.qty_lahan" class="form-control border-input" v-bind="tower"></money></td>
        <td align="center">{{this.forms.qty_lahan}}</td>
        <td align="right"><money v-model="forms.lahan" class="form-control border-input" v-bind="uang"></money>                          
<span class="label label-danger" v-for="error of errorNya['lahan']">
                        {{ error }}
                    </span></td>
        <td align="right">{{formatNumberRupiah(this.forms.qty_lahan*this.forms.lahan)}}</td>
      </tr>
	  
	   <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>
	  
	  
	  <tr>
        <td align="left"><b>3</b></td>
        <td align="left" colspan="2"><b>Tower {{forms.tower}} M</b></td>
        <td align="center">LS</td>
        <td align="center"><money v-model="dataStandard.tonase" class="form-control border-input" placeholder="Biaya Tower" v-bind="qty"></money></td>
        <td align="center">{{this.dataStandard.tonase}}</td>
        <td align="right"><money v-model="dataStandard.biayatower" class="form-control border-input" placeholder="Biaya Tower" v-bind="uang"></money></td>
        <td align="right">{{formatNumberRupiah(this.dataStandard.biayatower * this.dataStandard.tonase)}}</td>
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
        <td align="right"><money v-model="dataStandard.erection_tower" class="form-control border-input" placeholder="Biaya Tower" v-bind="uang"></money></td>
        <td align="right"><money v-bind:value="dataStandard.erection_tower" class="form-control border-input" placeholder="Biaya Tower" v-bind="uang" disabled></money></td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>4.2</b></td>
        <td align="left"><b>Transportasi</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right"><money v-model="dataStandard.transportasi" class="form-control border-input" placeholder="Biaya Transportasi" v-bind="uang"></money></td>
        <td align="right"><money v-bind:value="dataStandard.transportasi" class="form-control border-input" placeholder="Biaya Transportasi" v-bind="uang" disabled></money></td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>4.3</b></td>
        <td align="left"><b>Pondasi Greenfiled</b></td>
        <td align="center">LS</td>
        <td align="center"><money v-model="dataStandard.pondasi_greenfiled" class="form-control border-input" placeholder="Biaya Pondasi Greenfiled" v-bind="qty"></money></td>
        <td align="center">{{this.dataStandard.pondasi_greenfiled}}</td>
        <td align="right"><money v-model="dataStandard.pondasi" class="form-control border-input" placeholder="Biaya Pondasi Greenfiled" v-bind="uang"></money></td>
        <td align="right"><money v-bind:value="dataStandard.pondasi_greenfiled*dataStandard.pondasi" class="form-control border-input" placeholder="Biaya Pondasi Greenfiled" v-bind="uang" disabled></money></td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>4.4</b></td>
        <td align="left"><b>BTS Outdoor</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right"><money v-model="dataStandard.bts_outdoor" class="form-control border-input" v-bind="uang"></money></td>
        <td align="right"><money v-bind:value="dataStandard.bts_outdoor" class="form-control border-input" v-bind="uang" disabled></money></td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>4.5</b></td>
        <td align="left"><b>ME</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right"><money v-model="dataStandard.me" class="form-control border-input" v-bind="uang"></money></td>
        <td align="right"><money v-bind:value="dataStandard.me" class="form-control border-input" v-bind="uang" disabled></money></td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>4.6</b></td>
        <td align="left"><b>F & Y </b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right"><money v-model="dataStandard.fy" class="form-control border-input" v-bind="uang"></money></td>
        <td align="right"><money v-bind:value="dataStandard.fy" class="form-control border-input" v-bind="uang" disabled></money></td>
      </tr>
	  
	  <tr>
        <td align="left"><b> </b></td>
        <td align="left"><b>4.7</b></td>
        <td align="left"><b>PLN Connect</b></td>
        <td align="center">LS</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="right"><money v-model="dataStandard.pln_connect" class="form-control border-input" v-bind="uang"></money></td>
        <td align="right"><money v-bind:value="dataStandard.pln_connect" class="form-control border-input" v-bind="uang" disabled></money></td>
      </tr>
	  
	  <tr>
        <td align="left" colspan="8"><div style="height: 15px; overflow:hidden;"></div></td>
      </tr>
	  
	  
	  <tr>
        <td align="left"><b>5</b></td>
        <td align="left" colspan="2"><b>Pekerjaan Non Standard <button type="button" class="button btn-primary" @click="addRow">+ Biaya</button></b></td>
        <td align="center"></td>
        <td align="center"></td>
        <td align="center"></td>
        <td align="right"></td>
        <td align="right"></td>
      </tr>
	   <tr v-for="(roww,index) in this.tambahan">
 <td><button type="button" class="button btn-danger" @click="removeRow(index)"><i class="glyphicon glyphicon-remove"></i></button></td>
 <td align="left"><b>5.{{index+1}}</b></td>
 <td>
 <input type="text" v-model="roww.pekerjaan" maxlength="200" class="form-control" placeholder="Nama Pekerjaan" autofocus required></td>
 <td><input type="text" v-model="roww.satuan" maxlength="10" class="form-control" placeholder="Satuan" required></td>
 <td> <money v-model="roww.qty" maxlength="15" class="form-control border-input" placeholder="Qty" v-bind="qty"></money></td>
 <td align="right"> <input type="text" v-model="roww.qty" maxlength="200" class="form-control" placeholder="Volume Aktual" disabled>
</td>
<td>
	  <money v-model="roww.harga" maxlength="20" class="form-control border-input" placeholder="Harga Satuan" v-bind="uang"></money> </td>
     	  
 <td>
  <money v-bind:value="roww.qty * roww.harga" class="form-control border-input" placeholder="Total" v-bind="uang" disabled></money> 
</td>
      
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
                <div class="modal-footer">
               <button type="button" class="btn btn-default" @click="modal.set('view', false) & modal.set('simulasi', false)" >Close</button>
               <button type="button" class="btn btn-info" @click="SimulasiData()" >Simulasi Capex</button>
			   <button type="submit" class="btn btn-success">Submit</button>
				</div>
				</form>
        </template>
        </modal>

			
		

	<!-- @simulasi -->
        <modal  v-if="modal.get('simulasi')" @close="modal.set('simulasi', false)" style="width: 50%;margin: 0px auto;padding: 10px 20px;background-color: none;border-radius: 2px;box-shadow: 0 2px 8px rgba(0, 0, 0, .33);transition: all .3s ease; font-family: Helvetica, Arial, sans-serif;">
        <template slot="header" ><h4 align="center">Simulasi CAPEX</h4></template>
        <template slot="body">
  <div class="modal-body">
				
<div class="col-sm-12">				
<div class="small">
    <SimulasiManagerArea :height="300" :data="this.simulasiNyaKedua"></SimulasiManagerArea>
  </div>
</div>	
					
<div class="col-sm-12">				
<div class="table-responsive">
  <table class="table">
  <tr>
   <td><h3 align="center"></h3></td>
   <td><h3 align="center">{{this.simulasiNyaKedua.barNya.regional}} (<b>{{this.simulasiNyaKedua.regional.rgljumlahNya}} SITE</b>)</h3></td>
   <td><h3 align="center">{{this.simulasiNyaKedua.barNya.area}} (<b>{{this.simulasiNyaKedua.area.arejumlahNya}} SITE</b>)</h3></td>
   </tr>
   <tr>
   <td><h5 align="center">PLAFON</h5></td>
   <td><h5 align="center">{{formatNumberRupiah(this.simulasiNyaKedua.regional.budgetNya)}}</h5></td>
   <td><h5 align="center">{{formatNumberRupiah(this.simulasiNyaKedua.area.budgetNya)}}</h5></td>
   </tr>
   <tr>
   <td><h5 align="center">CAPEX</h5></td>
   <td><h5 align="center">{{formatNumberRupiah(this.simulasiNyaKedua.regional.capexNya)}}</h5></td>
   <td><h5 align="center">{{formatNumberRupiah(this.simulasiNyaKedua.area.capexNya)}}</h5></td>
   </tr>
  </table>
  </div>
</div>	
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="modal.set('simulasi', false)" >Close</button>
                </div>
           
        </template>
        </modal>

			
			
<!-- @approve -->
        <modal  v-if="modal.get('approve')" @close="modal.set('approve', false)">
        <template slot="header" ><h4 align="center">Kirim Pesan Project Approval</h4></template>
        <template slot="body" >

            <form method="POST" action="" @submit.prevent="ApproveItem()">
                <div class="modal-body">

<div class="col-sm-12" v-if="this.pesannya.length > 0">			
                    <!-- form Group -->
                    <div class="form-group" v-for="(row,index) in this.pesannya">
                        <label for="pengirim">Pengirim : {{row.name}}</label><br>
                        <label for="jabatan">Jabatan : {{row.level}}</label><br>
                        <label for="stts">Status Project : {{row.status}}</label><br>
                        <label for="pesan">Pesan : {{row.message}}</label><br>
                        <label for="time">Waktu : {{row.created_at}}</label><br>
                    </div>

</div>
<div class="col-sm-12" v-else>
 <!-- form Group -->
                    <div class="form-group">
                        <label for="pengirim">Belum Ada Komunikasi Project</label><br>
                    </div>
</div>

				
                   <div class="form-group">
  <label for="message">Pesan:</label>
  <textarea v-model="message" class="form-control" rows="5" id="message" placeholder="Pesan" required></textarea>
<span class="label label-danger" v-for="error of errorNya">
                        {{ error }}
                    </span>
  </div>

                   <div class="form-group">
 <span class="label label-danger" v-for="error of errorNya['datamasuk']">
                        {{ error }}
                    </span>
  </div>



                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="modal.set('approve', false)" >Close</button>
                    <button type="submit" class="btn btn-primary">Kirim</button>
                </div>
            </form>
        </template>
        </modal>


</div>


   <section class="content">
      <div class="row">
      <div class="col-md-12">


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
      <td colspan="3"><input type="text" v-model="filterText" class="form-control" @keyup.enter="doFilter" placeholder="ID Project"></td>
    </tr>
     <tr>
      <td colspan="4" style="padding-top: 1%;"></td>
    </tr>
    <tr>
      <td colspan="4"><button class="btn btn-success" @click.prevent="doFilter">Go</button>
          <button class="btn" @click.prevent="resetFilter">Reset</button></td>
    </tr>
</table>
 </div>
       </form>
       
    




    </div>
    <br>
    <div style="overflow-x:auto;">
	<vuetable ref="vuetable"
      api-url="/karyawan/GetNewProjectMA"
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

import vSelect from 'vue-select'		
import {Money} from 'v-money'
import accounting from 'accounting'
import VueCharts from 'vue-chartjs'
import { Bar, Line } from 'vue-chartjs'
import moment from 'moment'
import '!!vue-style-loader!css-loader!vue-toast/dist/vue-toast.min.css'
import VueToast from 'vue-toast'
import myDatepicker from 'vue-datepicker'
import Vuetable from 'vuetable-2/src/components/Vuetable'
import VuetablePagination from 'vuetable-2/src/components/VuetablePagination'
import VuetablePaginationInfo from 'vuetable-2/src/components/VuetablePaginationInfo'
import Vue from 'vue'
import VueEvents from 'vue-events'
import loading from './Loading'
Vue.use(VueEvents)
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
 
 

Vue.component("SimulasiManagerArea", {
  extends: Bar,
  props: ["data"],
  data () {
      return {
        datacollection: {
          //Data to be represented on x-axis
         labels: [this.data.barNya.regional,this.data.barNya.area],
        datasets: [
          {
           label: 'PLAFON',
          borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#dd4b39',
          data: [this.data.regional.budgetNya,this.data.area.budgetNya] 
          },
        {
          label: 'CAPEX',
          borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#1451A1',
          data: [this.data.regional.capexNya,this.data.area.capexNya]
        }
        ]
        },
        //Chart.js options that controls the appearance of the chart
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true,
                min: 0,           
                stepSize:100000000,
              },
              gridLines: {
                display: true
              }
            }],
            xAxes: [ {
              gridLines: {
                display: false
              }
            }]
          },
          legend: {
            display: true
          },
          responsive: true,
          maintainAspectRatio: false
        }
      }
    },
    mounted () {
    //renderChart function renders the chart with the datacollection and options object.
      this.renderChart(this.datacollection, this.options)
    }
})



export default {
  components: {
    Vuetable,
    VuetablePagination,
    VuetablePaginationInfo,
    'vue-toast': VueToast,
    'date-picker': myDatepicker,
	'v-select': vSelect,
	Money,
	loading,
  },
  data () {
    return {
	isLoading: false,
	uang: {
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
	tower: {
        decimal: ',',
        thousands: '.',
        prefix: '',
        suffix: '',
        precision: 0,
        masked: false
        },
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
	statusNya:'',
	file_name:'',
	pilihan: ['UNTAPPED','B2S'],
	tambahan: {},
	optionscluster: [],
	optionstower: [],
	selectedtower: '',
	message: '',
	sitenametenant: '',
	sitenamepo: '',
	contract: '',
	mitraNya: '',
	towerpilihan: '',
	clusterpilihan: '',
	jobs: '',
	url:'/files/',
    errors: new Errors() ,
    forms:new CrudForm({index:'',  id:'' ,filename:'' ,  tinggitower:'' , proc:'' ,  ubis:'' , projectid:'' , sitename:'', siteid:'' , area:'', regional:'', cluster:'', kode_tower_depan:'' ,  tower:''  ,  kode_tower_belakang:'' , longitude:'' , latituted:'' , towerprovider:''  , infratype:'' , budget:'' ,  sis:'' ,  sitac:'' ,  imb:'' , imb_jasa:'' , qty_lahan:'', lahan:'' ,  biayatower:'' ,  cme:'' ,   pln:'' ,   addtransport:'' ,  addpln:'' ,  addcme:'' , provinsi:''  , kabupaten:''  , mitra:'' , created_at:''}) ,
    modal:new CrudModal({view:false,simulasi:false, reject:false, approve:false,  repair:false, message:false}),
     dataStandard: [],
	 simulasiNya: [],
	 simulasiNyaKedua: [],
	 dataWork:'',
     errorNya: [],
	 PesanData:[],
	 towerdancluster:[],
	 pesannya: '',
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
          name: 'tinggitower',
		  title: 'Tinggi Tower',
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
          name: 'cluster',
		  title: 'Cluster',
		  titleClass: 'text-center',
          dataClass: 'text-center'
        },
        {
          name: 'created_at',
		  title: 'Tanggal Input',
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
      sortBy: function() {
axios.get('/karyawan/GetDetailStandartImplementationMA/'+this.forms.regional+'/'+this.forms.cluster+'/'+this.forms.tower).then((response) => {
				this.dataStandard = response.data.standard;
                });	
    },
     addRow: function(){
      this.tambahan.push({pekerjaan:"",satuan:"",qty:"",harga:""});
	  
    },
    removeRow: function(row){
    //console.log(row);
    this.tambahan.splice(row,1)
    },
      TotalCapexB2S: function(){

  let TotalCapexB2S = this.forms.sis + this.forms.sitac + this.forms.imb  + this.forms.imb_jasa + (this.forms.qty_lahan*this.forms.lahan) + (this.dataStandard.tonase * this.dataStandard.biayatower) + this.dataStandard.erection_tower + this.dataStandard.transportasi + (this.dataStandard.pondasi_greenfiled * this.dataStandard.pondasi) + this.dataStandard.bts_outdoor + this.dataStandard.me + this.dataStandard.fy + this.dataStandard.pln_connect + this.total(this.tambahan);

  return TotalCapexB2S;

},
      TotalCapexUNTAPPED: function(){

  let TotalCapexUNTAPPED = this.forms.sis + this.forms.sitac + this.forms.imb  + this.forms.imb_jasa + (this.forms.qty_lahan*this.forms.lahan) + this.forms.biayatower + this.forms.cme + this.forms.pln + this.forms.addcme + this.forms.addpln + this.forms.addtransport;

  return TotalCapexUNTAPPED;

},
      totalBiayaTambahanUNTAPPED: function(){

  let totalBiayaTambahanUNTAPPED = this.forms.addcme + this.forms.addpln + this.forms.addtransport;

  return totalBiayaTambahanUNTAPPED;

},
      totalBiayaStandardB2S: function(){

  let totalBiayaStandardB2S = this.forms.sis + this.forms.sitac + this.forms.imb  + this.forms.imb_jasa + (this.forms.qty_lahan*this.forms.lahan) + (this.dataStandard.tonase * this.dataStandard.biayatower) + this.dataStandard.erection_tower + this.dataStandard.transportasi + (this.dataStandard.pondasi_greenfiled * this.dataStandard.pondasi) + this.dataStandard.bts_outdoor + this.dataStandard.me + this.dataStandard.fy + this.dataStandard.pln_connect;

  return totalBiayaStandardB2S;

},
      totalBiayaStandardUNTAPPED: function(){

  let totalBiayaStandardUNTAPPED = this.forms.sis + this.forms.sitac + this.forms.imb  + this.forms.imb_jasa + (this.forms.qty_lahan*this.forms.lahan) + this.forms.biayatower + this.forms.cme + this.forms.pln;

  return totalBiayaStandardUNTAPPED;

},
  	  total: function(data){

  let total = [];

  Object.entries(data).forEach(([key, val]) => {
      total.push(val.qty * val.harga) // the value of the current key.
  });

  return total.reduce(function(total, num){ return total + num }, 0);

},
  	  totalkedua: function(data){

  let totalkedua = [];

  Object.entries(data).forEach(([key, val]) => {
  Object.entries(val.subcategory).forEach(([key2, v]) => {

	totalkedua.push(v.qty * v.unitprice) // the value of the current key.
  
  });
  });

  return totalkedua.reduce(function(totalkedua, num){ return totalkedua + num }, 0);

},
     newAvatar(event) {
               let files = event.target.files || e.dataTransfer.files;
               if (files.length) this.file_name = files[0];
                
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
		   isNumber: function(evt) {
      evt = (evt) ? evt : window.event;
      var charCode = (evt.which) ? evt.which : evt.keyCode;
      if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
        evt.preventDefault();;
      } else {
        return true;
      }
    },
	SubmitData(){
			axios.get('/karyawan/GetMessageNya/'+this.forms.id).then((response) => {
                this.pesannya=response.data;
				 this.message = '';
				 this.berhasilNya = '';
                 this.modal.set('approve', true); 
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
               
               
            }  ,	
		   ApproveItem() {

 var masuk ={id:this.forms.id,infratype:this.forms.infratype,projectid:this.forms.projectid,sitename:this.forms.sitename,kabupaten:this.forms.kabupaten,longitude:this.forms.longitude,latituted:this.forms.latituted,qty_lahan:this.forms.qty_lahan,lahan:this.forms.lahan,cme:this.forms.cme,pln:this.forms.pln,addtransport:this.forms.addtransport,addpln:this.forms.addpln,addcme:this.forms.addcme,biayatower:this.forms.biayatower,towerimplementation:this.forms.tower,clusterimplementation:this.forms.cluster,mitra:this.forms.mitra,standard:this.dataStandard,addtional:this.tambahan,message:this.message,area:this.forms.area,created:this.forms.created_at,statusnya:'AREA - GENERAL MANAGER AREA'};

              axios.post('/karyawan/ApprovalProjectMU', masuk)
                    .then(response => {
					if(response.data.datamasuk)
{
this.resetFilter();
  this.errorNya = {datamasuk:[response.data.datamasuk]};
}
if(response.data.success)
{
                  this.errorNya = '';
				   this.message = '';
				    this.berhasilNya = '';
                this.resetFilter();
                 this.modal.set('approve', false);
                 this.modal.set('simulasi', false);
                 this.modal.set('view', false);
                 this.submitted = this.showTime('success',response.data.success);
}
                    })
                    .catch(error => {
                        this.errorNya = error.response.data;
                    });  
                    
				
            },
		 viewItem(item ,index = this.indexOf(item)){
this.isLoading = true;
			axios.get('/karyawan/GetDetailStandartImplementationArea/'+item.regional+'/'+item.cluster+'/'+item.tower+'/'+item.area+'/'+item.infratype).then((response) => {
                if(response.data.standard)
                {
                this.dataStandard = response.data.standard;
                }
                else
                {
                this.dataStandard = {biayatower:0,bts_outdoor:0,erection_tower:0,fy:0,me:0,pln_connect:0,pondasi:0,pondasi_greenfiled:0,tonase:0,transportasi:0};
                }              
			   this.forms.setFillItem(item , index );
				this.errors.clearAll();
				this.tambahan = [];
				this.optionscluster = response.data.vcluster;
				this.optionstower = response.data.vtower;
				this.simulasiNya ='';
                this.simulasiNyaKedua = '';
				 this.errorNya = '';
				 this.berhasilNya = '';
				 this.isLoading = false;
                this.modal.set('view', true);
				
                });
            }  ,
		 
 SimulasiData(){
axios.get('/karyawan/simulasi/'+this.forms.area+'/'+this.forms.regional+'/'+this.forms.cluster+'/'+this.forms.infratype).then((response) => {
                if(this.forms.infratype==='UNTAPPED')
                {
                var ttl = this.forms.sis+this.forms.sitac+this.forms.imb+this.forms.imb_jasa+(this.forms.qty_lahan*this.forms.lahan)+this.forms.biayatower+this.forms.cme+this.forms.pln+this.forms.addcme+this.forms.addpln+this.forms.addtransport;
                
                if(response.data.regional)
				{
				var rglbudgetNya = (response.data.regional.budgetNya+this.forms.budget)/(response.data.regional.total+1);
				var rglcapexNya = (response.data.regional.capexNya+ttl)/(response.data.regional.total+1);
				var rgljumlahNya = response.data.regional.total+1;
				}
				else
				{
				var rglbudgetNya = (0+this.forms.budget)/(0+1);
				var rglcapexNya = (0+ttl)/(0+1);
				var rgljumlahNya = 1;
				}
				
                if(response.data.area)
				{
				var arebudgetNya = (response.data.area.budgetNya+this.forms.budget)/(response.data.area.total+1);
                var arecapexNya = (response.data.area.capexNya+ttl)/(response.data.area.total+1);
                var arejumlahNya = response.data.area.total+1;
				}
				else
				{
				var arebudgetNya = (0+this.forms.budget)/(0+1);
                var arecapexNya = (0+ttl)/(0+1);
                var arejumlahNya = 1;
				}
				
				if(response.data.nasional)
				{
                var nslbudgetNya = (response.data.nasional.budgetNya+this.forms.budget)/(response.data.nasional.total+1);
                var nslcapexNya = (response.data.nasional.capexNya+ttl)/(response.data.nasional.total+1);
                var nsljumlahNya = response.data.nasional.total+1;
				}
				else
				{
				var nslbudgetNya = (0+this.forms.budget)/(0+1);
                var nslcapexNya = (0+ttl)/(0+1);
                var nsljumlahNya = 1;
				}
                this.simulasiNyaKedua = 
                {
                barNya:{'regional' : this.forms.regional,'area' : this.forms.area,'nasional' : 'NASIONAL'},
                regional:{'budgetNya' : rglbudgetNya,'capexNya' : rglcapexNya,'rgljumlahNya' :rgljumlahNya},
                area:{'budgetNya' : arebudgetNya, 'capexNya' : arecapexNya, 'arejumlahNya' : arejumlahNya},
                nasional:{'budgetNya' : nslbudgetNya,'capexNya' : nslcapexNya,'nsljumlahNya' : nsljumlahNya}
                };
                }
                else
                {
                var ttl = (this.forms.sis+this.forms.sitac+this.forms.imb+this.forms.imb_jasa+(this.forms.qty_lahan*this.forms.lahan)+(this.dataStandard.tonase*this.dataStandard.biayatower)+this.dataStandard.erection_tower+this.dataStandard.transportasi+(this.dataStandard.pondasi_greenfiled*this.dataStandard.pondasi)+this.dataStandard.bts_outdoor+this.dataStandard.me+this.dataStandard.fy+this.dataStandard.pln_connect+this.total(this.tambahan));
                
				if(response.data.regional)
				{
				var rglbudgetNya = (response.data.regional.budgetNya+this.forms.budget)/(response.data.regional.total+1);
                var rglcapexNya = (response.data.regional.capexNya+ttl)/(response.data.regional.total+1);
                var rgljumlahNya = response.data.regional.total+1;
                }
				else
				{
				var rglbudgetNya = (0+this.forms.budget)/(0+1);
                var rglcapexNya = (0+ttl)/(0+1);
                var rgljumlahNya = 1;
                }
				
				if(response.data.area)
				{
				var arebudgetNya = (response.data.area.budgetNya+this.forms.budget)/(response.data.area.total+1);
                var arecapexNya = (response.data.area.capexNya+ttl)/(response.data.area.total+1);
                var arejumlahNya = response.data.area.total+1;
                }
				else
				{
				var arebudgetNya = (0+this.forms.budget)/(0+1);
                var arecapexNya = (0+ttl)/(0+1);
                var arejumlahNya =1;
                }
				
				
				if(response.data.nasional)
				{
				var nslbudgetNya = (response.data.nasional.budgetNya+this.forms.budget)/(response.data.nasional.total+1);
                var nslcapexNya = (response.data.nasional.capexNya+ttl)/(response.data.nasional.total+1);
                var nsljumlahNya = response.data.nasional.total+1;
                }
				else
				{
				var nslbudgetNya = (0+this.forms.budget)/(0+1);
                var nslcapexNya = (0+ttl)/(0+1);
                var nsljumlahNya = 1;
                }
				
				
				this.simulasiNyaKedua = 
                {
                barNya:{'regional' : this.forms.regional,'area' : this.forms.area,'nasional' : 'NASIONAL'},
                regional:{'budgetNya' : rglbudgetNya,'capexNya' : rglcapexNya,'rgljumlahNya' : rgljumlahNya},
                area:{'budgetNya' : arebudgetNya,'capexNya' : arecapexNya,'arejumlahNya' : arejumlahNya},
                nasional:{'budgetNya' : nslbudgetNya,'capexNya' : nslcapexNya,'nsljumlahNya' : nsljumlahNya}
                };
                }
                });
                
                this.modal.set('simulasi', true);
                      

            }  ,
			
			uploadItem() {
this.isLoading = true;
  let masuk = new FormData();
   masuk.set('id', this.forms.id)
   masuk.set('file_name', this.file_name)
              axios.post('/karyawan/uploaddokumen' , masuk)
                    .then(response => {
if(response.data.file_name)
{
this.isLoading = false;
  this.errorNya = {file_name:[response.data.file_name]};
   this.berhasilNya = '';
}
if(response.data.success)
{
this.isLoading = false;
	this.forms.filename = response.data.filename;
	this.file_name = '';
	this.errorNya = '';
 this.berhasilNya = response.data.success;
}
                    })
                    .catch(error => {
                        this.errorNya = error.response.data;
                         this.berhasilNya = '';
                    });  

},
DeleteFile() {
this.isLoading = true;
  let masuk = new FormData();
   masuk.set('projectid', this.forms.id)
              axios.post('/karyawan/deletefile' , masuk)
                    .then(response => {
if(response.data.file_name)
{
this.isLoading = false;
  this.errorNya = {file_name:[response.data.file_name]};
   this.berhasilNya = '';
}
if(response.data.success)
{
                  
	this.isLoading = false;
	this.forms.filename = '';
	this.file_name = '';
	this.errorNya = '';
	 this.berhasilNya = response.data.success;
}
                    })
                    .catch(error => {
                        this.errorNya = error.response.data;
                         this.berhasilNya = '';
                    });  

},
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
      resetFilter () {
        this.filterText = ''
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
	
	formatTower (value) {
      return accounting.formatMoney(value,  {
  symbol: " M",precision: 0,format: "%v %s"})
    },
	formatNumberRupiah (value) {
        var pindahan = Number((value).toFixed(2)); 
      return accounting.formatMoney(pindahan ,  "Rp. ", 2, ".", ",")
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
			fetchIt(){
			this.isLoading = true;
                axios.get('/karyawan/GetProfileAreaM').then((response) => {
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
			        d: function() {
           return this.statusNya;
		  // console.log(this.statusNya);
        },	

onLoading() {
     this.isLoading = true;
    },
    onLoaded() {
      this.isLoading = false;
    },
    onLoadingError() {
                this.isLoading = true;
                axios.get('karyawan/GetNewProjectMA').then((response) => {
                    this.dataNya = response.data;
                    this.isLoading = false
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
    computed: {
	

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
            this.$root.$on('edititem', function(data,index){
               self.editItem(data,index);
            });
            this.$root.$on('deleteitem', function(data,index){
               self.deleteItem(data,index);
            });
        },
		          mounted() {
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
  padding: 10px 20px;
  background-color: #fff;
  border-radius: 2px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, .33);
  transition: all .3s ease;
  font-family: Helvetica, Arial, sans-serif;
}
.modal-simulasi {
  width: 50%;
  margin: 0px auto;
  padding: 10px 20px;
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