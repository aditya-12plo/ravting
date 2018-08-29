<template>
 <div> 
    <section class="content-header">
 <vue-toast ref='toast'></vue-toast>
      <h1 align="center">
Grafik Project <div v-if="!this.selected">{{this.tahunNya}} </div><div else>{{this.selected}}</div>
      </h1>
    </section>


   <section class="content">
      <div class="row">
	  
      <div class="col-md-12">

 <form method="POST" action="" @submit.prevent="itemAction()">
 <div class="form-group">
 Filter Berdasarkan tahun : &nbsp;</label>
  <select v-model="selected" class="form-control" id="sel1" required>
<option v-for="item of pilihTahun" :value="item">{{item}}</option>
  </select>
</div>

 <div class="form-group">
 <button type="submit" class="btn btn-success">Submit</button>
</div>


</form>       
    
<div class="small">
    <line-chart :data="this.dataGrafik" :options="{responsive: true, maintainAspectRatio: false}"></line-chart>
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
 import LineChart from './LineChart'
import accounting from 'accounting'
import {Money} from 'v-money'
import moment from 'moment'
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

 
 
export default {
  components: {
    Vuetable,
    VuetablePagination,
    VuetablePaginationInfo,
     'vue-toast': VueToast,
     'date-picker': myDatepicker,
	 Money,
	 LineChart,
	
  },
  data () {
    return {
	dataGrafik: {},
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
	tahunNya: '',
	sitenametenant: '',
	contract: '',
	jobs: '',
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
	total:this.qty*this.unitprice,
	}]
	}] ,
    modal:new CrudModal({view:false, reject:false, approve:false,  repair:false, message:false}),
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
    loading: false,
    loading2: false,
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
          name: 'cluster',
		  title: 'Cluster',
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
          name: 'projectprice',
		  title: 'Nilai Project',
		  titleClass: 'text-center',
          dataClass: 'text-center',
		  callback: 'formatNumberRupiah'
        },
        {
          name: 'capex',
		  title: 'Total CAPEX',
		  titleClass: 'text-center',
          dataClass: 'text-center',
		  callback: 'formatNumberRupiah'
        },
        {
          name: 'created_at',
          title: 'Tanggal Input Project',
          titleClass: 'text-center',
          dataClass: 'text-center',
		  callback: 'formatDate|DD-MM-YYYY'
        },
        {
          name: '__component:project-button-actions',
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
	  itemAction(){	  
 axios.get('/karyawan/DataGrafik?tahun='+this.selected).then((response) => {
                  this.dataGrafik = response.data;
});	 
      }, 
	  tahun(){	  
 axios.get('/karyawan/DataGrafik?tahun='+this.selected).then((response) => {
                  this.dataGrafik = response.data;
});	 
      },
	  tahun2(){
                axios.get('/karyawan/years').then((response) => {
                  this.pilihTahun = response.data.tahun;
                  this.tahunNya = response.data.sekarang;
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
  	  total: function(data){

  let total = [];

  Object.entries(data).forEach(([key, val]) => {
      total.push(val.qty * val.unitprice) // the value of the current key.
  });

  return total.reduce(function(total, num){ return total + num }, 0);

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

  ApproveData(){
			axios.get('/karyawan/GetMessageNya/'+this.PesanData.id).then((response) => {
                this.pesannya=response.data;
				 this.message = '';
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
			            DownloadExcel(){
            //console.log(this.PesanData.header.id);
				axios({
  url: '/karyawan/downloadExcel',
  method: 'POST',
  data: this.PesanData,
  responseType: 'blob', // important
}).then((response) => {
  const url = window.URL.createObjectURL(new Blob([response.data]));
  const link = document.createElement('a');
  link.href = url;
  link.setAttribute('download', this.PesanData.header.projectid+'.xls');
  document.body.appendChild(link);
  link.click();
});
            },
   ApproveItem() {

var masuk ={id:this.PesanData.header.id,projectid:this.PesanData.header.projectid,projectimplementationid:this.PesanData.header.projectimplementationid,message:this.message,standard:this.standard,addtional:this.tambahan,level:'EXECUTIVE GENERAL MANAGER',statusnya:'UBIS - EXECUTIVE GENERAL MANAGER'};
	  
axios.post('/karyawan/ApproveProjectOfficer', masuk)
                    .then(response => {
if(response.data.success)
{
                  this.errorNya = '';
				   this.message = '';
                this.resetFilter();
                 this.modal.set('approve', false);
                 this.modal.set('view', false);
                 this.submitted = this.showTime('success',response.data.success);
}
                    })
                    .catch(error => {
                        this.errorNya = error.response.data;
                    });  
		
            },
   RepairItem() {
var masuk ={id:this.PesanData.header.id,message:this.message,level:'MANAGER UBIS',statusnya:'REPAIR UBIS - MANAGER'};

axios.post('/karyawan/RepairItemProject', masuk).then(response => {
if(response.data.success)
{
                  this.errorNya = '';
				   this.message = '';
                this.resetFilter();
                 this.modal.set('reject', false);
                 this.modal.set('view', false);
                 this.submitted = this.showTime('success',response.data.success);
}
                    })
                    .catch(error => {
                        this.errorNya = error.response.data;
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
		
            SubmitData(){

                   this.errorNya = '';
				   this.message = '';
                this.modal.set('approve', true); 
               
            }  ,
            viewItem(item ,index = this.indexOf(item)){
 axios.get('/karyawan/GetProjectDetailProses/'+ item.id).then((response) => {

                   this.errorNya = '';
                   this.PesanData= response.data;
                   this.standard= response.data.standard;
                   this.tambahan= response.data.additional;
				   this.berhasilNya = '';
                this.modal.set('view', true); 
                }).catch(error => {
        if (! _.isEmpty(error.response)) {
                    if (error.response.status = 500) {
                        this.$router.push('/server-error');
                    }
          }
                    });
               
            }  ,
			DeleteFile() {

  let masuk = new FormData();
   masuk.set('projectid', this.PesanData.header.id)
              axios.post('/karyawan/deletefile' , masuk)
                    .then(response => {
if(response.data.file_name)
{
  this.errorNya = {file_name:[response.data.file_name]};
   this.berhasilNya = '';
}
if(response.data.success)
{
                  
	this.errors.clearAll();
	this.filename = '';
	this.file_name = '';
	this.errorNya = '';
 this.berhasilNya = {success:[response.data.success]};
}
                    })
                    .catch(error => {
                        this.errorNya = error.response.data;
                         this.berhasilNya = '';
                    });  

},
			uploadItem() {

  let masuk = new FormData();
   masuk.set('id', this.PesanData.header.id)
   masuk.set('file_name', this.file_name)
              axios.post('/karyawan/uploaddokumen' , masuk)
                    .then(response => {
if(response.data.file_name)
{
  this.errorNya = {file_name:[response.data.file_name]};
   this.berhasilNya = '';
}
if(response.data.success)
{
	this.errors.clearAll();
	this.filename = response.data.filename;
	this.file_name = '';
	this.errorNya = '';
 this.berhasilNya = {success:[response.data.success]};
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
			this.tahun2();
			 this.tahun();
			 

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