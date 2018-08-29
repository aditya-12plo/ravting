<template>
 <div> 
    <section class="content-header">
 <vue-toast ref='toast'></vue-toast>
      <h1 align="center">
       Tracking Project Status
      </h1>
    </section>

<div class="container-fluid display-page" id="display-post-category" >
 
<!-- @view --->
        <modal  v-if="modal.get('view')" @close="modal.set('view', false)" >
        <template slot="header"><h4 align="center">Biaya Implementasi Project {{PesanData.projectdescription }}</h4></template>
        <div v-show="loading"><i class="fa fa-spinner fa-spin"></i> Loading Data</div>
        <template slot="body" >
                <div class="modal-body">
<!-- for header  -->            
                    <div class="form-group">
                    <div class="table-responsive">
  <table class="table">
     
      <tr>
        <td><h5 align="left"><b>Project ID</b></h5></td>
        <td colspan="4"><h5 align="left"><b>{{PesanData.projectid}}</b></h5></td>
      </tr>  
      <tr>
        <td><h5 align="left"><b>Nilai Project</b></h5></td>
        <td colspan="4"><h5 align="left"><b>{{formatNumberRupiah(PesanData.projectprice)}}</b></h5></td>
      </tr>  
	  <tr>
        <td><h5 align="left"><b>Tenant</b></h5></td>
        <td colspan="4"><h5 align="left"><b>{{PesanData.name}}</b></h5></td>
      </tr>
      <tr>
        <td><h5 align="left"><b>Nama Lokasi</b></h5></td>
        <td colspan="4"><h5 align="left"><b>{{PesanData.sitename}}</b></h5></td>
      </tr>
      <tr>
        <td><h5 align="left"><b>Daerah</b></h5></td>
        <td colspan="4"><h5 align="left"><b>{{PesanData.regional}}</b></h5></td>
      </tr>
      <tr>
        <td><h5 align="left"><b>Tinggi Tower</b></h5></td>
        <td colspan="4"><h5 align="left"><b>{{PesanData.tower}} M</b></h5></td>
      </tr>
      <tr>
        <td><h5 align="left"><b>File Download</b></h5></td>
        <td colspan="4"><div class="form-group"><div v-if="PesanData.filename"><a v-bind:href="url+PesanData.filename" target="_blank"> download </a></div>
                    </div></td>
      </tr>
	  <tr v-if="PesanData.status_id > 0">
        <td><h5 align="left"><b>Komunikasi Project</b></h5></td>
        <td colspan="5"><button type="submit" class="btn btn-default" @click.prevent="CheckMessage()">Lihat</button></td>
      </tr>
       <tr>
        <td colspan="5"> <div style="height: 50px; overflow:hidden;"></div></td>
      </tr>
      <tr>
        <td colspan="5"><h4 align="center"><b>BIAYA PEKERJAAN STANDAR</b></h4></td>
      </tr>
      <tr>
        <td><center><b>ITEM PEKERJAAN</b></center></td>
        <td><center><b>SAT</b></center></td>
        <td><center><b>VOLUME</b></center></td>
        <td><center><b>HARGA SATUAN</b></center></td>
        <td><center><b>TOTAL</b></center></td>
      </tr>
       <tr v-for="item of this.standart">
        <td>{{item.workitem}}</td>
        <td><center>{{item.unit}}</center></td>
        <td>{{item.volume}}</td>
        <td>{{formatNumberRupiah(item.unitprice)}}</td>
        <td>{{formatNumberRupiah(formatNumber(item.volume * item.unitprice))}}</td>
       
      </tr>
         <tr>
        <td colspan="4"><center><b>Total Biaya Pekerjaan Standart</b></center></td>
        <td><b>{{formatNumberRupiah(formatNumber(total(this.standart)))}}</b></td>
      </tr>
       <tr>
        <td colspan="5"> <div style="height: 50px; overflow:hidden;"></div></td>
      </tr>
	    <tr>
        <td colspan="6"> <div style="height: 50px; overflow:hidden;"></div></td>
      </tr>
      <tr>
        <td colspan="5"><h4 align="center"><b>BIAYA PEKERJAAN TAMBAHAN</b></h4></td>
      </tr>
      <tr>
        <td><center><b>ITEM PEKERJAAN</b></center></td>
        <td><center><b>SAT</b></center></td>
        <td><center><b>VOLUME</b></center></td>
        <td><center><b>HARGA SATUAN</b></center></td>
        <td><center><b>TOTAL</b></center></td>
      </tr>
       <tr v-for="item of this.tambahan">
        <td>{{item.workitem}}</td>
        <td><center>{{item.unit}}</center></td>
        <td>{{item.volume}}</td>
        <td>{{formatNumberRupiah(item.unitprice)}}</td>
        <td>{{formatNumberRupiah(formatNumber(item.volume * item.unitprice))}}</td>
       
      </tr>
         <tr>
        <td colspan="4"><center><b>Total Biaya Pekerjaan Tambahan</b></center></td>
        <td><b>{{formatNumberRupiah(formatNumber(total(this.tambahan)))}}</b></td>
      </tr>
      <tr>
        <td colspan="5"> <div style="height: 50px; overflow:hidden;"></div></td>
      </tr>  <tr>
        <td colspan="5"> <div style="height: 50px; overflow:hidden;"></div></td>
      </tr>
      <tr>
        <td colspan="5"><h4 align="center"><b>PENGURANGAN BIAYA PEKERJAAN</b></h4></td>
      </tr>
      <tr>
        <td><center><b>ITEM PEKERJAAN</b></center></td>
        <td><center><b>SAT</b></center></td>
        <td><center><b>VOLUME</b></center></td>
        <td><center><b>HARGA SATUAN</b></center></td>
        <td><center><b>TOTAL</b></center></td>
      </tr>
       <tr v-for="item of this.reduction">
        <td>{{item.workitem}}</td>
        <td><center>{{item.unit}}</center></td>
        <td>{{item.volume}}</td>
        <td>{{formatNumberRupiah(item.unitprice)}}</td>
        <td>{{formatNumberRupiah(formatNumber(item.volume * item.unitprice))}}</td>
       
      </tr>
         <tr>
        <td colspan="4"><center><b>Total Pengurangan Biaya Pekerjaan</b></center></td>
        <td><b>{{formatNumberRupiah(formatNumber(total(this.reduction)))}}</b></td>
      </tr>
	    <tr>
        <td colspan="5"> <div style="height: 50px; overflow:hidden;"></div></td>
      </tr>  <tr>
        <td colspan="5"> <div style="height: 50px; overflow:hidden;"></div></td>
      </tr>
	   <tr>
        <td colspan="4"><center><b>Total Biaya Pekerjaan</b></center></td>
        <td><b>{{formatNumberRupiah(formatNumber((total(this.standart)+total(this.tambahan))-total(this.reduction)))}}</b></td>
      </tr>
  </table>
</div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="modal.set('view', false)" >Close</button>
					<a v-bind:href="urlDetail+PesanData.id" target="_blank"><button type="button" class="btn btn-success">Download Excel</button></a>
                </div>
        </template>
        </modal>

		

		
<!-- @message --->
        <modal  v-if="modal.get('message')" @close="modal.set('message', false)"  >
        <template slot="header" ><h4 align="center">Detail Komunikasi Project</h4></template>
		<div v-show="loading"><i class="fa fa-spinner fa-spin"></i> Loading Data</div>
        <template slot="body" >
                <div class="modal-body">

				
                    <!-- form Group -->
                    <div class="form-group" v-for="(row,index) in this.pesannya">
                        <label for="pengirim">Pengirim : {{row.name}}</label><br>
                        <label for="jabatan">Jabatan : {{row.level}}</label><br>
                        <label for="stts">Status Project : {{row.status}}</label><br>
                        <label for="pesan">Pesan : {{row.message}}</label><br>
                        <label for="time">Waktu : {{row.created_at}}</label><br>
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
      <td colspan="3"><input type="text" v-model="filterText" class="form-control" @keyup.enter="doFilter" placeholder="ID Proyek"></td>
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
      api-url="/karyawan/GetProjectProgress"
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
	pilihan: [],
	 urlDetail:'/karyawan/downloadExcel/',
    errors: new Errors() ,
    forms:new CrudForm({index:'',  id:'' , projectdescription:'' , projectid:'' , sitename:'', tenantid:'' , regional:'', tower:'' , projectprice:'' , projectprice:'' , projectfortenant:'' , created_at:''}) ,
    modal:new CrudModal({view:false  , message:false }),
     errorNya: [],
     token: localStorage.getItem('token'),
    submitted: false,
    submitSelectedItems:[] ,
	url:'/files/',
	tambahan: [],
	reduction: [],
	standart: [],
    displayItems:[] ,
	PesanData:[],
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
		  title: 'ID Proyek',
		  titleClass: 'text-center',
          dataClass: 'text-center'
        },
        {
          name: 'sitename',
		  title: 'Nama Site',
		  titleClass: 'text-center',
          dataClass: 'text-center'
        },
        {
          name: 'name',
		  title: 'Nama Tenant',
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
          name: 'projectprice',
		  title: 'Nilai Project',
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
   axios.get('/karyawan/GetProjectDetailProses/'+ item.id).then((response) => {

                   this.errorNya = '';
                   this.PesanData= response.data.header;
                   this.standart=response.data.standart;
                   this.tambahan=response.data.additional;
                   this.reduction=response.data.reduction;
                this.modal.set('view', true); 
                });
            }  ,
			CheckMessage() {
			axios.get('/karyawan/GetMessageNya/'+this.PesanData.id).then((response) => {
                this.pesannya=response.data;
                this.modal.set('message', true);
                });
            },
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
	  total: function(data){

  let total = [];

  Object.entries(data).forEach(([key, val]) => {
      total.push(val.volume * val.unitprice) // the value of the current key.
  });

  return total.reduce(function(total, num){ return total + num }, 0);

},
	  total2: function(data){

  let total2 = [];

  Object.entries(data).forEach(([key, val]) => {
      total2.push(val.total) // the value of the current key.
  });

  return total2.reduce(function(total2, num){ return total2 + num }, 0);

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
	var masuk = {projectid:this.forms.projectid,sitename:this.forms.sitename,projectdescription:this.forms.projectdescription,regional:this.forms.regional,tenantid:this.forms.tenantid.tenantid,tower:this.forms.tower,projectprice:this.forms.projectprice};
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

   updateItem() {
   if(this.forms.tenantid.tenantid == '')
   {
     	var rubah = {projectid:this.forms.projectid,sitename:this.forms.sitename,projectdescription:this.forms.projectdescription,regional:this.forms.regional,tower:this.forms.tower,projectprice:this.forms.projectprice};
   }
   else
   {
      	var rubah = {projectid:this.forms.projectid,sitename:this.forms.sitename,projectdescription:this.forms.projectdescription,regional:this.forms.regional,tenantid:this.forms.tenantid.tenantid,tower:this.forms.tower,projectprice:this.forms.projectprice};  
   }

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
     this.loading = true;
    },
    onLoaded() {
      this.loading = false;
    },
    onLoadingError() {
                this.loading = true;
                axios.get('karyawan/GetProjectProgress').then((response) => {
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