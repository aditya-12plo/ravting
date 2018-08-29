<template>
 <div> 
    <section class="content-header">
 <vue-toast ref='toast'></vue-toast>
      <h1 align="center">
       Biaya Implementasi Standard
      </h1>
    </section>
<loading :show="isLoading"></loading>
<div class="container-fluid display-page" id="display-post-category" >
 <!-- @view --->
        <modal  v-if="modal.get('view')" @close="modal.set('view', false)"  >
        <template slot="header" ><h4 align="center">Detail Biaya Implementasi Standar</h4></template>
        <template slot="body" >
                <div class="modal-body">
 <div class="col-sm-6">

                    <!-- form Group -->
                    <div class="form-group">
                        <label for="Regional">Regional :  {{ forms.regional }}</label>
</div>
                    </div>

 <div class="col-sm-6">					
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="regional">Cluster :  {{ forms.cluster }}</label>
                        
                    </div>
                    </div>
					
					
 <div class="col-sm-6">				
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="tower">Tinggi Tower :  {{ formatTower(forms.tower) }}</label>
                        
                    </div>
	
	
</div>					
					
				
					
 <div class="col-sm-6">				
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="tonase">TONASE :  {{ formatNumberRupiah(forms.tonase) }}</label>
                        
                    </div>
</div>					
					
					
					
 <div class="col-sm-6">				
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="pondasi">Pondasi (M3) :  {{ formatNumber(forms.pondasi) }}</label>
                        
                    </div>
</div>					
						
					
 <div class="col-sm-6">				
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="biayatower">Tower (tonase * {{ formatNumberRupiah(forms.biayatower) }}):  {{ formatNumberRupiah(forms.tonase * forms.biayatower) }}</label>
						
                    </div>
</div>					
					
						
 <div class="col-sm-6">				
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="erection_tower">Erection Tower :  {{ formatNumberRupiah(forms.erection_tower) }}</label>
                        
                    </div>
</div>					
					
 <div class="col-sm-6">				
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="transportasi">Transportasi :  {{ formatNumberRupiah(forms.transportasi) }}</label>
                        
                    </div>
</div>					
					
					
						
 <div class="col-sm-6">				
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="pondasi_greenfiled">Pondasi Greenfiled (pondasi (M3) * {{ formatNumber(forms.pondasi_greenfiled) }}): {{ formatNumberRupiah(forms.pondasi*forms.pondasi_greenfiled) }} </label>
                        
                    </div>
</div>					
					
					
					
 <div class="col-sm-6">				
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="bts_outdoor">BTS Outdoor :  {{ formatNumberRupiah(forms.bts_outdoor) }}</label>
                        
                    </div>
</div>					
	
					
					
 <div class="col-sm-6">				
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="me">ME :  {{ formatNumberRupiah(forms.me) }}</label>
                        
                    </div>
</div>					
					
					
 <div class="col-sm-6">				
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="fy">F & Y  :  {{ formatNumberRupiah(forms.fy) }}</label>
                        
                    </div>
</div>					
	
					
					
 <div class="col-sm-6">				
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="pln_connect">PLN Connect :  {{ formatNumberRupiah(forms.pln_connect) }}</label>
                        
                    </div>
</div>					
	
					
 <div class="col-sm-12">	

					<br>
					<br> 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="ttl">Total CME :  {{ formatNumberRupiah((forms.tonase * forms.biayatower)+(forms.pondasi*forms.pondasi_greenfiled)+forms.pln_connect+forms.fy+forms.me+forms.bts_outdoor+forms.transportasi+forms.erection_tower) }}</label>
                        
                    </div>
</div>					
	



                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="modal.set('view', false)" >Close</button>
                </div>
        </template>
        </modal>

<!-- @upload Modal--->
        <modal  v-if="modal.get('upload')" @close="modal.set('upload', false)" >
        <template slot="header" ><h4>Upload Biaya Implementasi</h4></template>
        <template slot="body" >
            <form method="POST" action="" enctype="multipart/form-data" @submit.prevent="uploadBooks()">
                <div class="modal-body">
				
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="name">File Upload</label>
                       <input type="file" name="file_name" id="file_name" v-on:change="newAvatar" required>
                         
                    </div>
<div class="col-sm-12">
<span class="label label-danger" v-for="(error,index) in errorNya['file_name']">
                        {{ error }}<br>
 </span>
</div>
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="name">Download Template Project : <a href="/template/standartimplementation.xlsx" target="_blank">Download</a></label>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="modal.set('upload', false)" >Close</button>
                    <button type="submit" class="btn btn-success">Upload</button>
                </div>

            </form>
        </template>
        </modal>


<!-- @update --->
        <modal  v-if="modal.get('edit')" @close="modal.set('edit', false)"  >
        <template slot="header" ><h4>Form Perubahan Data Biaya Standar</h4></template>
        <template slot="body" >		
		
       <form method="POST" action="" @submit.prevent="updateItem()">   
		<div class="modal-body">
                   
                    
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="Regional">Regional : </label>
                        <input type="text" v-model="forms.regional" class="form-control" id="regional" placeholder="Regional" required>
						<span class="label label-danger" v-for="error of errorNya['regional']">
                        {{ error }}
                    </span>
					<span class="label label-danger" v-for="error of errorbiaya" align="center">
                        {{ error }}
                    </span>
                    </div>
					
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="cluster">Cluster :  {{ this.forms.cluster }}</label>
						<input type="text" v-model="forms.cluster" class="form-control" id="regional" placeholder="Cluster" required>
                        <span class="label label-danger" v-for="error of errorNya['cluster']">
                        {{ error }}
                    </span>
					<span class="label label-danger" v-for="error of errorbiaya" align="center">
                        {{ error }}
                    </span>
                    </div>
					
					
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="tower">Tinggi Tower :  {{ formatTower(this.forms.tower) }}</label>
						<money v-model="forms.tower" class="form-control border-input" placeholder="Tinggi Tower" v-bind="tower"></money>
                         <span class="label label-danger" v-for="error of errorNya['tower']">
                        {{ error }}
                    </span>
					<span class="label label-danger" v-for="error of errorbiaya" align="center">
                        {{ error }}
                    </span>
                    </div>

					

					
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="tonase">Tonase :  {{ this.forms.tonase }}</label>
						<money v-model="forms.tonase" class="form-control border-input" placeholder="Tonase" v-bind="tower"></money>
                         <span class="label label-danger" v-for="error of errorNya['tonase']">
                        {{ error }}
                    </span>
                    </div>

					
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="pondasi">Pondasi (M3) :  {{ formatNumberRupiah(this.forms.pondasi) }}</label>
						<money v-model="forms.pondasi" class="form-control border-input" placeholder="Pondasi (M3)" v-bind="money"></money>
                         <span class="label label-danger" v-for="error of errorNya['pondasi']">
                        {{ error }}
                    </span>
                    </div>

				
					
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="biayatower">Biaya Tower :  {{ formatNumberRupiah(this.forms.pondasi) }}</label>
						<money v-model="forms.biayatower" class="form-control border-input" placeholder="Biaya Tower" v-bind="money"></money>
                         <span class="label label-danger" v-for="error of errorNya['biayatower']">
                        {{ error }}
                    </span>
                    </div>

					
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="erection_tower">Erection Tower :  {{ formatNumberRupiah(this.forms.erection_tower) }}</label>
						<money v-model="forms.erection_tower" class="form-control border-input" placeholder="Erection Tower" v-bind="money"></money>
                         <span class="label label-danger" v-for="error of errorNya['erection_tower']">
                        {{ error }}
                    </span>
                    </div>

					
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="transportasi">Transportasi :  {{ formatNumberRupiah(this.forms.transportasi) }}</label>
						<money v-model="forms.transportasi" class="form-control border-input" placeholder="Transportasi" v-bind="money"></money>
                         <span class="label label-danger" v-for="error of errorNya['transportasi']">
                        {{ error }}
                    </span>
                    </div>

					
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="pondasi_greenfiled">Jumlah Pondasi Greenfiled :  {{ this.forms.pondasi_greenfiled }}</label>
						<money v-model="forms.pondasi_greenfiled" class="form-control border-input" placeholder="Jumlah Pondasi Greenfiled" v-bind="qty"></money>
                         <span class="label label-danger" v-for="error of errorNya['pondasi_greenfiled']">
                        {{ error }}
                    </span>
                    </div>


                    <!-- form Group -->
                    <div class="form-group">
                        <label for="bts_outdoor">Biaya BTS Outdoor :  {{ formatNumberRupiah(this.forms.bts_outdoor) }}</label>
						<money v-model="forms.bts_outdoor" class="form-control border-input" placeholder="Biaya BTS Outdoor" v-bind="money"></money>
                         <span class="label label-danger" v-for="error of errorNya['bts_outdoor']">
                        {{ error }}
                    </span>
                    </div>


                    <!-- form Group -->
                    <div class="form-group">
                        <label for="me">Biaya ME :  {{ formatNumberRupiah(this.forms.me) }}</label>
						<money v-model="forms.me" class="form-control border-input" placeholder="Biaya ME" v-bind="money"></money>
                         <span class="label label-danger" v-for="error of errorNya['me']">
                        {{ error }}
                    </span>
                    </div>


                    <!-- form Group -->
                    <div class="form-group">
                        <label for="fy">Biaya F & Y  :  {{ formatNumberRupiah(this.forms.fy) }}</label>
						<money v-model="forms.fy" class="form-control border-input" placeholder="Biaya F & Y " v-bind="money"></money>
                         <span class="label label-danger" v-for="error of errorNya['fy']">
                        {{ error }}
                    </span>
                    </div>



                    <!-- form Group -->
                    <div class="form-group">
                        <label for="pln_connect">Biaya PLN Connect :  {{ formatNumberRupiah(this.forms.pln_connect) }}</label>
						<money v-model="forms.pln_connect" class="form-control border-input" placeholder="Biaya PLN Connect" v-bind="money"></money>
                         <span class="label label-danger" v-for="error of errorNya['pln_connect']">
                        {{ error }}
                    </span>
                    </div>


                    <!-- form Group -->
                    <div class="form-group">
                        <label for="ttl">Total CME :  {{ formatNumberRupiah((forms.tonase * forms.biayatower)+(forms.pondasi*forms.pondasi_greenfiled)+forms.pln_connect+forms.fy+forms.me+forms.bts_outdoor+forms.transportasi+forms.erection_tower) }}</label>
						
                    </div>



                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="modal.set('edit', false)" >Close</button>
                    <button type="submit" class="btn btn-success">Edit</button>
                </div>
				</form>
        </template>
        </modal>


 <!-- @delete --->
        <modal v-if="modal.get('delete')" @close="modal.set('delete', false)"  >
        <template slot="header" ><h4>Hapus Data Biaya Implementasi Standart</h4></template>
        <template slot="body" >

            <form method="POST" action="" @submit.prevent="destroyItem( submitSelectedItems )">
                <div class="modal-body">
                    <p>Are you Sure that you want to delete this  ?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="modal.set('delete', false)" >Close</button>
                    <button type="submit" class="btn btn-success">Delete</button>
                </div>
            </form>
        </template>
        </modal>
</div>


   <section class="content">
      <div class="row">
      <div class="col-md-12">

        <button type="button" class="btn btn-primary"  @click="UploadItem()">
            <i class="glyphicon glyphicon-plus"></i>
            Tambah Data baru
        </button> 
<br>
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
      <td colspan="3"><input type="text" v-model="filterText" class="form-control" @keyup.enter="doFilter" placeholder="Tinggi Tower / Cluster"></td>
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
	<div v-show="loading"><i class="fa fa-spinner fa-spin"></i> Loading Data</div>
    <vuetable ref="vuetable"
      api-url="/karyawan/GetBiayaStandart"
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


import {Money} from 'v-money'
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
import loading from '../Loading'
import BooksCustomActions from '../BooksCustomActions'
Vue.use(VueEvents)
window.axios = require('axios')
window.eventBus = new Vue()
 Vue.component('modal', Modal)
export default {
  components: {
    Vuetable,
    VuetablePagination,
    VuetablePaginationInfo,
    'vue-toast': VueToast,
    'date-picker': myDatepicker,
    'custom-actions': BooksCustomActions,
	Money,
	loading,
  },
  data () {
    return {
	 isLoading: false,
	 	 tower: {
          decimal: '',
          thousands: '',
          prefix: '',
          precision: 0,
          masked: false
        },
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
        precision: 2,
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
    dataTower:'',
    dataCluster:'',
    dataRegional:'',
    dataWork:'',
	file_name:'',
	errorbiaya: '',
	pilihan: [],
	tambahan: [],
    errors: new Errors() ,
    forms:new CrudForm({index:'',  id:'' , tower:'', cluster:'' , tonase:'' ,  regional:'' ,  pondasi:'', biayatower:'', erection_tower:'' , transportasi:'' ,  pondasi_greenfiled:'' , bts_outdoor:'' , me:'' , fy:'' , pln_connect:'' , created_at:''}) ,
    modal:new CrudModal({create:false , view:false  , edit:false , delete:false, upload:false }),
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
          name: 'regional',
		  title: 'Regional',
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
          name: 'tower',
		  title: 'Tinggi Tower',
		  titleClass: 'text-center',
          dataClass: 'text-center',
		  callback: 'formatTower'
        },
        {
          name: 'created_at',
          title: 'Tanggal Input',
          titleClass: 'text-center',
          dataClass: 'text-center',
          callback: 'formatDate|DD-MM-YYYY'
        },
        {
          name: '__component:custom-actions',
          title: 'Actions',
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
  filterEventsByCategory(arr,filter){
  return  this.dataBiaya.work.filter(arr => arr.category === filter)
  },
   addRow: function(){
      this.dataWork.push({pekerjaan:"",satuan:"",qty:"",harga:""});
    },
    removeRow: function(row){
    //console.log(row);
    this.dataWork.splice(row,1)
    },
     newAvatar(event) {
               let files = event.target.files || e.dataTransfer.files;
               if (files.length) this.file_name = files[0];
                
           },
  fetchIt(){
   this.isLoading = true;
                axios.get('/karyawan/GetProfileProcurementReviewerOfficer').then((response) => {
                    this.dataNya = response.data;
                    this.isLoading = false
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
            deleteItem(item ,index = this.indexOf(item)){
               this.submitSelectedItems = item;
                this.modal.set('delete', true);
            }  ,
            editItem(item ,index = this.indexOf(item)){
				this.forms.setFillItem(item , index );
				this.modal.set('edit', true);
                
            }  ,
			            UploadItem() {
                this.forms.reset();
                this.errors.clearAll();
                this.modal.set('upload', true);
            } ,
            viewItem(item ,index = this.indexOf(item)){

				this.forms.setFillItem(item , index );
				this.modal.set('view', true);	
            }  ,
            createItem() {
				this.forms.reset();
				this.tambahan=[];
                this.errors.clearAll();
                this.modal.set('create', true);
                
            } ,
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
      return accounting.formatNumber(value, 0)
    },
	  total: function(data){

  let total = [];

  Object.entries(data).forEach(([key, val]) => {
      total.push(val.qty * val.harga) // the value of the current key.
  });

  return total.reduce(function(total, num){ return total + num }, 0);

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
			uploadBooks() {

  let masuk = new FormData();
   masuk.set('file_name', this.file_name)
              axios.post('/karyawan/uploadbiaya' , masuk)
                    .then(response => {
if(response.data.file_name)
{
this.resetFilter();
  this.errorNya = [{file_name:'Silahkan cek kembali file yang anda masukan dan sesuaikan dengan format yang kami berikan'}];
}
if(response.data.success)
{				 this.modal.set('upload', false);
                  this.errorNya = '';
                  this.file_name = '';
				  this.resetFilter();
                  this.submitted = this.showTime('success',response.data.success);
}
                    }).catch(error => {
					this.resetFilter();
                        this.errorNya = [{file_name:'Silahkan cek kembali file yang anda masukan dan sesuaikan dengan format yang kami berikan'}];
                    });  
},	
    submitBooks() {
	var masuk = {tower:this.forms.tower,regional:this.forms.regional,description:this.forms.description,standart:this.tambahan};
            axios.post('/karyawan/BiayaStandart', masuk)
                    .then(response => {
					if(response.data.regional)
{
  this.errorNya = {regional:[response.data.regional]};
   this.berhasilNya = '';
}
					if(response.data.biaya)
{
  this.errorNya = {biaya:[response.data.biaya]};
   this.berhasilNya = '';
}
if(response.data.success)
{
                this.pilihan = '';
                this.tambahan = [];
                this.errorNya = '';
                this.resetFilter();
                 this.modal.set('create', false);
                 this.submitted = this.showTime('success',response.data.success);
                    }
					})
                    .catch(error => {
                        this.errorNya = error.response.data;
                    });
                
                    
            },

   updateItem() {
axios.put('/karyawan/UpdateBiayaStandard/'+ this.forms.id , this.forms)
                    .then(response => {
if(response.data.biaya)
{
                this.errorbiaya = [response.data.biaya];
}
if(response.data.success)
{
                this.errorbiaya = '';
                this.errorNya = '';
                this.resetFilter();
                 this.modal.set('edit', false);
                 this.submitted = this.showTime('success',response.data.success);
				 }
                    })
                    .catch(error => {
                        this.errorNya = error.response.data;
                    });
	
            },

            destroyItem(item){
			
                axios.delete('/karyawan/DeleteBiayaStandart/'+item.regional+'/'+item.cluster+'/'+item.tower)
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
                axios.get('/karyawan/GetBiayaStandart').then((response) => {
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
            this.$root.$on('edititem', function(data,index){
               self.editItem(data,index);
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
  width: 80%;
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