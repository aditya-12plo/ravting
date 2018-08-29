<template>
 <div> 
    <section class="content-header">
 <vue-toast ref='toast'></vue-toast>
      <h1 align="center">
        List Project Baru
      </h1>
    </section>

<div class="container-fluid display-page" id="display-post-category" >


<!-- @viewtenantproject --->
        <modal  v-if="modal.get('viewtenantproject')" @close="modal.set('viewtenantproject', false)"  >
        <template slot="header" ><h4 align="center">Biaya Implementasi Project {{forms.header.projectdescription }}</h4></template>
		<div v-show="loading"><i class="fa fa-spinner fa-spin"></i> Loading Data</div>
        <template slot="body" >
		<form method="POST" action="" @submit.prevent="updateItem()" enctype="multipart/form-data">
                <div class="modal-body">

                    <!-- form Group -->
                    <div class="form-group">
                        <label for="projectid">Project ID : {{forms.header.projectid}}</label>
                    </div>

                    <!-- form Group -->
                    <div class="form-group">
                        <label for="sitename">Lokasi : {{forms.header.sitename}}</label>
                    </div>

                    <!-- form Group -->
                    <div class="form-group">
                        <label for="area">Area : {{forms.header.area}}</label>
                    </div>



                    <!-- form Group -->
                    <div class="form-group">
                        <label for="regional">Regional : {{forms.header.regional}}</label>
                    </div>


                    <!-- form Group -->
                    <div class="form-group">
                        <label for="tower">Tinggi Tower : {{forms.header.tower}} M</label>
                    </div>

					
					  <div v-if="forms.detail">
<div class="table-responsive">
  <table class="table table-striped" align="center">
<tr>
        <td colspan="6"><h4 align="center"><b>BIAYA PEKERJAAN STANDAR</b></h4></td>
      </tr>
	  <tr>
        <td align="center"><b>ITEM PEKERJAAN</b></td>
        <td align="center"><b>SATUAN</b></td>
        <td align="center"><b>VOLUME</b></td>
        <td align="center"><b>HARGA SATUAN</b></td>
        <td align="center"><b>TOTAL</b></td>
        <td align="center"></td>
      </tr>
      
      <tr v-for="item of forms.detail.implementation">
        <td>{{item.workitem}} ( {{item.description2}} )</td>
        <td align="center"><center>{{item.unit}}</center></td>
        <td align="center"><center>{{item.volume}}</center></td>
        <td>{{formatNumberRupiah(item.unitprice)}}</td>
        <td>{{formatNumberRupiah(formatNumber(item.unitprice * item.volume))}}</td>
		<td align="center"></td>
       
      </tr>
	  <tr>
        <td align="center" colspan="4">Total Biaya Pekerjaan Standar (A)</td>
        <td><b>{{formatNumberRupiah(formatNumber(total(forms.detail.implementation)))}}</b></td>
		<td align="center"></td>
      </tr>
	  <tr>
        <td colspan="6"><span class="label label-danger" v-for="error of errorNya">
                        {{ error }}
                    </span>
                    <span class="label label-success" v-for="ok of berhasilNya">
                        {{ ok }}
                    </span></td>
      </tr>
	  <tr>
        <td align="left" colspan="6">Upload Dokumen Jika Diperlukan :
		<input type="file" name="file_name" id="file_name" v-on:change="newAvatar"> 
		<br>
		<button type="submit" class="btn btn-primary" @click.prevent="uploadItem()">Upload File</button> <font v-if="forms.header.filename"><a v-bind:href="url+forms.header.filename" target="_blank"><button type="button" class="btn btn-success">Download</button></a> <button type="submit" class="btn btn-danger" @click.prevent="DeleteFile()">Hapus File</button></font> 
		</td>
       
		</tr>
		 <tr>
        <td colspan="6"> <div style="height: 50px; overflow:hidden;"></div></td>
      </tr>
       
      <tr>
        <td colspan="6"> <div style="height: 50px; overflow:hidden;"></div></td>
      </tr>
	   <tr>
        <td align="center" colspan="6"><h4 align="center"><b>BIAYA PEKERJAAN TAMBAHAN</b></h4></td>
      </tr>
	  
		<tr>
        <td align="center" colspan="6"><a @click="addRow"><button type="button" class="button btn-primary">+ Biaya</button></a></td>
      </tr>
	  <tr>
        <td>ITEM PEKERJAAN</td>
        <td>SAT</td>
        <td>VOLUME</td>
        <td>HARGA SATUAN</td>
        <td>TOTAL</td>
		<td align="center"></td>
      </tr>
	  <tr v-for="(row,index) in tambahan">
        <td><input type="text" v-model="row.workitem" class="form-control" required autofocus></td>
      <td><input type="text" v-model="row.unit"  maxlength="10" class="form-control" required></td>
      <td><input v-on:keypress="isNumber()"  maxlength="4" v-model="row.volume" class="form-control" required></td>
      <td><input v-on:keypress="isNumber()"  maxlength="13" v-model="row.unitprice" class="form-control" required></td>
      <td>{{formatNumberRupiah(formatNumber(row.volume * row.unitprice))}}</td>
      <td><button type="button" class="button btn-danger" @click="removeRow(index)">Hapus</button></td>
    </tr>
	<tr>
        <td align="center" colspan="4">Total Biaya Pekerjaan Tambahan</td>
        <td colspan="1"><b>{{formatNumberRupiah(formatNumber(total(tambahan)))}}</b></td>
      </tr>
	   <tr>
        <td colspan="6"> <div style="height: 50px; overflow:hidden;"></div></td>
      </tr>
       
      <tr>
        <td colspan="6"> <div style="height: 50px; overflow:hidden;"></div></td>
      </tr>
	<tr>
        <td align="center" colspan="6"><h4 align="center"><b>PENGURANGAN BIAYA PEKERJAAN</b></h4></td>
      </tr>
	  
		<tr>
        <td align="center" colspan="6"><a @click="addRowMin"><button type="button" class="button btn-primary">+ Biaya</button></a></td>
      </tr>
	  <tr>
        <td>ITEM PEKERJAAN</td>
        <td>SAT</td>
        <td>VOLUME</td>
        <td>HARGA SATUAN</td>
        <td>TOTAL</td>
		<td align="center"></td>
      </tr>
	  <tr v-for="(row,index) in pengurangan">
        <td><input type="text" v-model="row.workitem" class="form-control" required autofocus></td>
      <td><input type="text" v-model="row.unit"  maxlength="10" class="form-control" required></td>
      <td><input v-on:keypress="isNumber()"  maxlength="4" v-model="row.volume" class="form-control" required></td>
      <td><input v-on:keypress="isNumber()"  maxlength="13" v-model="row.unitprice" class="form-control" required></td>
      <td>{{formatNumberRupiah(formatNumber(row.volume * row.unitprice))}}</td>
      <td><button type="button" class="button btn-danger" @click="removeRowMin(index)">Hapus</button></td>
    </tr>
    <tr>
        <td align="center" colspan="4">Total Pengurangan Biaya Pekerjaan</td>
        <td colspan="1"><b>{{formatNumberRupiah(formatNumber(total(pengurangan)))}}</b></td>
      </tr>
	  <tr>
        <td align="center" colspan="6"><h4 align="center"><b>PENGURANGAN BIAYA IMPLEMENTASI</b></h4></td>
      </tr>
    <tr>
        <td align="center" colspan="4"><h4>Grand Total Biaya Pekerjaan</h4></td>
        <td colspan="1"><b>{{formatNumberRupiah(formatNumber((total(forms.detail.implementation) + total(tambahan)) - total(pengurangan)))}}</b></td>
      </tr>
  </table>
  </div>
  </div>
<div v-else>
	  <tr>
        <td colspan="6">Biaya Implementasi Standar Belum Di Input</td>
      </tr>
	    </div>

                </div>
                <div class="modal-footer">
				 <div v-if="forms.detail">
                    <button type="button" class="btn btn-default" @click="modal.set('viewtenantproject', false)" >Close</button>
                    <button type="submit" class="btn btn-success">Submit</button>
					</div>
				 <div v-else>
                    <button type="button" class="btn btn-default" @click="modal.set('viewtenantproject', false)" >Close</button>
                   </div>
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
      <td colspan="3"><input type="text" v-model="filterText" class="form-control" @keyup.enter="doFilter" placeholder="Project ID / Site Name"></td>
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
     api-url="/tenant/GetProject"
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
Vue.component('tenant-project-button', require('./ProjectCustomActionsTenantProject.vue'))
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
  },
  data () {
    return {
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
	 berhasilNya: [],
	pilihan: [],
	tambahan: [],
	pengurangan: [],
	url:'/files/',
    errors: new Errors() ,
    forms:new CrudForm({index:'',  id:'' , header:[] , detail:[]}) ,
    modal:new CrudModal({viewtenantproject:false}),
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
          name: 'projectid',
      title: 'Project ID',
      titleClass: 'text-center',
          dataClass: 'text-center',
        },
        {
          name: 'sitename',
      title: 'Project Site Name',
      titleClass: 'text-center',
          dataClass: 'text-center',
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
          title: 'Tanggal Pengirim Project',
          titleClass: 'text-center',
          dataClass: 'text-center',
          callback: 'formatDate|DD-MM-YYYY'
        },
        {
          name: '__component:tenant-project-button',
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
   addRow: function(){
       this.tambahan.push({workitem:"",unit:"",volume:"",unitprice:""});
    },
   addRowMin: function(){
       this.pengurangan.push({workitem:"",unit:"",volume:"",unitprice:""});
    },
    removeRow: function(row){
    //console.log(row);
    this.tambahan.splice(row,1)
    },
    removeRowMin: function(row){
    //console.log(row);
    this.pengurangan.splice(row,1)
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
          
            viewitemtenantproject(item ,index = this.indexOf(item)){
			 this.forms.header = item;
			 this.forms.detail =  this.detailisibiaya(item.id);
			 this.tambahan = [];
			 this.pengurangan = [];
			 this.modal.set('viewtenantproject', true);
            }  ,
			detailisibiaya(kode)
			{
			axios.get('/tenant/GetProjectDetail/'+kode).then((response) => {
                this.forms.setFillItem(response.data);
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
        this.tambahan = []
        this.pengurangan = []
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
      total.push(val.volume * val.unitprice) // the value of the current key.
  });

  return total.reduce(function(total, num){ return total + num }, 0);

},

uploadItem() {

  let masuk = new FormData();
   masuk.set('projectid', this.forms.header.id)
   masuk.set('file_name', this.file_name)
              axios.post('/tenant/uploadfile' , masuk)
                    .then(response => {
if(response.data.file_name)
{
  this.errorNya = {file_name:[response.data.file_name]};
   this.berhasilNya = '';
}
if(response.data.success)
{
                  
				  axios.get('/tenant/GetProjectDetail/'+ this.forms.header.id).then((response) => {
                    this.errorNya = '';
                  this.file_name = '';
					this.forms=response.data;
                }).catch(error => {
        if (! _.isEmpty(error.response)) {
                    if (error.response.status = 500) {
                        this.$router.push('/server-error');
                    }
          }
                    });
					
                 this.berhasilNya = {success:[response.data.success]};
}
                    })
                    .catch(error => {
                        this.errorNya = error.response.data;
                         this.berhasilNya = '';
                    });  

},
DeleteFile() {

  let masuk = new FormData();
   masuk.set('projectid', this.forms.header.id)
   masuk.set('file_name', this.file_name)
              axios.post('/tenant/deletefile' , masuk)
                    .then(response => {
if(response.data.file_name)
{
  this.errorNya = {file_name:[response.data.file_name]};
   this.berhasilNya = '';
}
if(response.data.success)
{
                  
				  axios.get('/tenant/GetProjectDetail/'+ this.forms.header.id).then((response) => {
                    this.errorNya = '';
                  this.file_name = '';
					this.forms=response.data;
                }).catch(error => {
        if (! _.isEmpty(error.response)) {
                    if (error.response.status = 500) {
                        this.$router.push('/server-error');
                    }
          }
                    });
					
                 this.berhasilNya = {success:[response.data.success]};
}
                    })
                    .catch(error => {
                        this.errorNya = error.response.data;
                         this.berhasilNya = '';
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
  
   updateItem() {
 var masuk ={projectid:this.forms.header.id,standart:this.forms.detail.implementation,addtional:this.tambahan,reduction:this.pengurangan};

              axios.post('/tenant/AddImplementations', masuk)
                    .then(response => {
if(response.data.success)
{
                  this.berhasilNya = '';
                  this.errorNya = '';
				   this.tambahan = [];
				   this.pengurangan = [];
                  this.file_name = '';
                this.resetFilter();
                 this.modal.set('viewtenantproject', false);
                 this.submitted = this.showTime('success',response.data.success);
}
if(response.data.errorNya)
{
  this.errorNya = {file_name:[response.data.errorNya]};
}
                    })
                    .catch(error => {
                        this.errorNya = error.response.data;
                    });  	
            },

onLoading() {
     this.loading = true;
    },
    onLoaded() {
      this.loading = false;
    },
    onLoadingError() {
                this.loading = true;
                axios.get('/tenant/GetProject').then((response) => {
                    this.dataNya = response.data;
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
            this.$root.$on('viewitemtenantproject', function(data,index){
              self.viewitemtenantproject(data,index);
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
  width: 90%;
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
  margin: 10px 0;
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