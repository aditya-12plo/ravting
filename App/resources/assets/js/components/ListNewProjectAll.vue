<template>
 <div> 
 <link rel="stylesheet" href="/css/vue2-autocomplete.css">
    <section class="content-header">
 <vue-toast ref='toast'></vue-toast>
      <h1 align="center">
       List Project Baru
      </h1>
    </section>
<loading :show="isLoading"></loading>
<div class="container-fluid display-page" id="display-post-category" >
 
<!-- @view -->
        <modal  v-if="modal.get('view')" @close="modal.set('view', false)"  >
        <template slot="header"><h4 align="center">Detail Project {{forms.projectid}}</h4></template>
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
                        <label for="mitra">Usulan Mitra :  {{ forms.mitra }}</label>
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
                        <label for="cluster">Cluster :  {{forms.cluster}}</label>
                        
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

 </div>

 
 <div class="col-sm-6">
 

                    <!-- form Group -->
                    <div class="form-group">
                        <label for="sis">Site Investigation Survey (SIS) :  <br>{{ formatNumberRupiah(forms.sis) }}</label>
                    </div>
					
 </div>
 
 
 <div class="col-sm-6">
 

                    <!-- form Group -->
                    <div class="form-group">
                        <label for="sitac">Site Acquisition dan Jasa Perolehan lahan (SITAC) :  <br>{{ formatNumberRupiah(forms.sitac) }}</label>
                    </div>
					
 </div>
 
 <div class="col-sm-6">
 

                    <!-- form Group -->
                    <div class="form-group">
                        <label for="imb"> Biaya Retribusi IMB :  <br>{{ formatNumberRupiah(forms.imb) }}</label>
                    </div>
					
 </div>
 
 <div class="col-sm-6">
 

                    <!-- form Group -->
                    <div class="form-group">
                        <label for="imb"> Biaya Jasa Pengurusan IMB :  <br>{{ formatNumberRupiah(forms.imb_jasa) }}</label>
                    </div>
					
 </div>
 
 <div class="col-sm-6">
 

                    <!-- form Group -->
                    <div class="form-group">
                        <label for="biayatower">Biaya Tower {{forms.tinggitower}} :  <br>{{ formatNumberRupiah(forms.biayatower) }}</label>
                    </div>
					
 </div>
 
 

 <div class="col-sm-6">
 
                    <!-- form Group -->
                    <div class="form-group">
                        <label for="created_at">Waktu Input :  {{forms.created_at}}</label>
                    </div>

 </div>
 

 
 
 </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="modal.set('view', false)" >Close</button>
                </div>
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
          <button class="btn" @click.prevent="resetFilter">Reset</button>
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
      api-url="/karyawan/GetNewProject"
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


Vue.component('project-button-actions', require('./ProjectCustomActions.vue'))
import accounting from 'accounting'
import {Money} from 'v-money'
import Autocomplete from 'vue2-autocomplete-js'
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
Vue.component('custom-actions', require('./BooksCustomActions.vue'))
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
	Autocomplete, 
	Money,
	loading,
  },
  data () {
    return {
	isLoading: false,
	 money: {
          decimal: ',',
          thousands: '.',
          prefix: 'Rp. ',
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
	file_name:'',
	pilihan: [],
    errors: new Errors() ,
    forms:new CrudForm({index:'',  id:'' , tinggitower:'' , proc:'' ,  ubis:'' , projectid:'' , sitename:'', siteid:'' , area:'', regional:'', cluster:'', kode_tower_depan:'' ,  tower:''  ,  kode_tower_belakang:'' , longitude:'' , latituted:'' , towerprovider:''  , infratype:'' , budget:'' ,  sis:'' ,  sitac:'' ,  imb:'' , imb_jasa:'' ,  lahan:'' ,  biayatower:'' , provinsi:''  , kabupaten:''  , mitra:'' , created_at:''}) ,
    modal:new CrudModal({create:false , view:false  , edit:false , delete:false  , upload:false }),
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
          name: 'created_at',
		  title: 'Tanggal Input',
          titleClass: 'text-center',
          dataClass: 'text-center',
          callback: 'formatDate|DD-MM-YYYY'
        },
        {
          name: '__component:project-button-actions',
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
  url: '/karyawan/downloadExcelDataBaru',
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
            deleteItem(item ,index = this.indexOf(item)){
               this.submitSelectedItems = item.id;
                this.modal.set('delete', true);
            }  ,
            editItem(item ,index = this.indexOf(item)){
						axios.get('/karyawan/GetTenant').then((response) => {
                this.pilihan = response.data;
                this.forms.setFillItem(item , index );
                this.modal.set('edit', true);
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
            viewItem(item ,index = this.indexOf(item)){
                this.forms.setFillItem(item , index );
                this.modal.set('view', true);
            }  ,
            createItem() {
			axios.get('/karyawan/GetTenant').then((response) => {
                this.pilihan = response.data;
                this.forms.reset();
                this.errors.clearAll();
                this.modal.set('create', true);
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
            } ,
            UploadItem() {
                this.forms.reset();
                this.errors.clearAll();
                this.modal.set('upload', true);
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
    submitBooks() {
	var masuk = {projectid:this.forms.projectid,sitename:this.forms.sitename,siteid:this.forms.siteid,area:this.forms.area,regional:this.forms.regional,cluster:this.forms.cluster,provinsi:this.forms.provinsi,kabupaten:this.forms.kabupaten,infratype:this.forms.infratype,towerprovider:this.forms.towerprovider,tenantid:this.forms.tenantid.tenantid,longitude:this.forms.longitude,latituted:this.forms.latituted,kode_tower_depan:this.forms.kode_tower_depan,tower:this.forms.tower,kode_tower_belakang:this.forms.kode_tower_belakang,projectprice:this.forms.projectprice};

		   axios.post('/karyawan/AddNewProject', masuk)
                    .then(response => {
                this.pilihan = '';
                this.errorNya = '';
                this.resetFilter();
                 this.modal.set('create', false);
                 this.submitted = this.showTime('success',response.data.success);
                    })
                    .catch(error => {
                        this.errorNya = error.response.data;
                    });
            },
			uploadBooks() {

  let masuk = new FormData();
   masuk.set('file_name', this.file_name)
              axios.post('/karyawan/uploadfile' , masuk)
                    .then(response => {
if(response.data.file_name)
{
this.resetFilter();
  this.errorNya = {file_name:[response.data.file_name]};
}
if(response.data.success)
{				 this.modal.set('upload', false);
                  this.errorNya = '';
                  this.file_name = '';
				  this.resetFilter();
                  this.submitted = this.showTime('success',response.data.success);
}
                    })
                    .catch(error => {
						this.resetFilter();
                        this.errorNya = error.response.data;
                    });  
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
   updateItem() {
   if(!this.forms.tenantid.tenantid)
   {
   var tt = '';
   }
   else{
   var tt = this.forms.tenantid.tenantid;
   }
     	var rubah = {projectid:this.forms.projectid,sitename:this.forms.sitename,siteid:this.forms.siteid,area:this.forms.area,regional:this.forms.regional,cluster:this.forms.cluster,provinsi:this.forms.provinsi,kabupaten:this.forms.kabupaten,infratype:this.forms.infratype,towerprovider:this.forms.towerprovider,tenantid:tt,longitude:this.forms.longitude,latituted:this.forms.latituted,kode_tower_depan:this.forms.kode_tower_depan,tower:this.forms.tower,kode_tower_belakang:this.forms.kode_tower_belakang,projectprice:this.forms.projectprice};

		   axios.put('/karyawan/UpdateNewProject/'+ this.forms.id , rubah)
                    .then(response => {
                this.errorNya = '';
                this.resetFilter();
				this.pilihan = '';
                 this.modal.set('edit', false);
                 this.submitted = this.showTime('success',response.data.success);
                    })
                    .catch(error => {
                        this.errorNya = error.response.data;
                    });
            },

            destroyItem(kode){
                axios.delete('/karyawan/KDeleteNewProject/'+ kode)
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
                axios.get('karyawan/GetNewProject').then((response) => {
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
ul.bs-autocomplete-menu {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  max-height: 200px;
  overflow: auto;
  z-index: 9999;
  border: 1px solid #eeeeee;
  border-radius: 4px;
  background-color: #fff;
  box-shadow: 0px 1px 6px 1px rgba(0, 0, 0, 0.4);
}

ul.bs-autocomplete-menu a {
  font-weight: normal;
  color: #333333;
}

.ui-helper-hidden-accessible {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
}

.ui-state-active,
.ui-state-focus {
  color: #23527c;
  background-color: #eeeeee;
}

.bs-autocomplete-feedback {
  width: 1.5em;
  height: 1.5em;
  overflow: hidden;
  margin-top: .5em;
  margin-right: .5em;
}

.loader {
  font-size: 10px;
  text-indent: -9999em;
  width: 1.5em;
  height: 1.5em;
  border-radius: 50%;
  background: #333;
  background: -moz-linear-gradient(left, #333333 10%, rgba(255, 255, 255, 0) 42%);
  background: -webkit-linear-gradient(left, #333333 10%, rgba(255, 255, 255, 0) 42%);
  background: -o-linear-gradient(left, #333333 10%, rgba(255, 255, 255, 0) 42%);
  background: -ms-linear-gradient(left, #333333 10%, rgba(255, 255, 255, 0) 42%);
  background: linear-gradient(to right, #333333 10%, rgba(255, 255, 255, 0) 42%);
  position: relative;
  -webkit-animation: load3 1.4s infinite linear;
  animation: load3 1.4s infinite linear;
  -webkit-transform: translateZ(0);
  -ms-transform: translateZ(0);
  transform: translateZ(0);
}

.loader:before {
  width: 50%;
  height: 50%;
  background: #333;
  border-radius: 100% 0 0 0;
  position: absolute;
  top: 0;
  left: 0;
  content: '';
}

.loader:after {
  background: #fff;
  width: 75%;
  height: 75%;
  border-radius: 50%;
  content: '';
  margin: auto;
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
}

@-webkit-keyframes load3 {
  0% {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}

@keyframes load3 {
  0% {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
</style>