<template>
 <div id="parent"> 
    <section class="content-header">
 <vue-toast ref='toast'></vue-toast>
      <h1 align="center">
       List Final Project
      </h1>
    </section>

<div class="container-fluid display-page" id="display-post-category" >
 
<!-- @view --->
        <modal  v-if="modal.get('view')" @close="modal.set('view', false)" >
        <template slot="header"><h4 align="center">Biaya Implementasi Project {{PesanData.header.projectdescription }}</h4></template>
        <div v-show="loading"><i class="fa fa-spinner fa-spin"></i> Loading Data</div>
        <template slot="body" >
                <div class="modal-body">
<!-- for header  -->            
                    <div class="form-group">
                    <div class="table-responsive">
   <table class="table">
      
      <tr>
        <td><h5 align="left"><b>Project ID</b></h5></td>
        <td colspan="5"><h5 align="left"><b>{{PesanData.header.projectid}}</b></h5></td>
      </tr>  
	  <tr>
        <td><h5 align="left"><b>Tenant</b></h5></td>
        <td colspan="5"><h5 align="left"><b>{{PesanData.header.name}}</b></h5></td>
      </tr>
      <tr>
        <td><h5 align="left"><b>Nama Lokasi</b></h5></td>
        <td colspan="5"><h5 align="left"><b>{{PesanData.header.sitename}}</b></h5></td>
      </tr>
      <tr>
        <td><h5 align="left"><b>Daerah</b></h5></td>
        <td colspan="5"><h5 align="left"><b>{{PesanData.header.regional}}</b></h5></td>
      </tr>
      <tr>
        <td><h5 align="left"><b>Nilai Project</b></h5></td>
        <td colspan="5"><h5 align="left"><b>{{formatNumberRupiah(PesanData.header.projectprice)}}</b></h5></td>
      </tr>
      <tr>
        <td><h5 align="left"><b>Tinggi Tower</b></h5></td>
        <td colspan="5"><h5 align="left"><b>{{PesanData.header.tower}} M</b></h5></td>
      </tr>
      <tr>
        <td><h5 align="left"><b>File Upload</b></h5></td>
        <td colspan="5"><div class="form-group"><div v-if="PesanData.header.filename"><a v-bind:href="url+PesanData.header.filename" target="_blank"> download </a></div>
                    </div></td>
      </tr>
	  
      <tr>
        <td colspan="6"><h4 align="center"></h4></td>
      </tr>
      <tr>
        <td colspan="6"><h4 align="center"><b>IMPLEMENTASI PEKERJAAN STANDART</b></h4></td>
      </tr>
      <tr>
        <td colspan="1"><center><b>ITEM PEKERJAAN</b></h5></center></td>
        <td><center><b>SAT</b></h5></center></td>
        <td><center><b>VOLUME</b></h5></center></td>
        <td><center><b>HARGA SATUAN</b></h5></center></td>
        <td><b>HARGA TOTAL</b></td>
      </tr>
       <tr v-for="item of PesanData.standart">
        <td colspan="1">{{item.workitem}}</td>
        <td><center>{{item.unit}}</center></td>
        <td><center>{{item.volume}}</center></td>
        <td>{{formatNumberRupiah(item.unitprice)}}</td>
        <td>{{formatNumberRupiah(formatNumber(item.total))}}</td>
       
      </tr>
         <tr>
        <td colspan="4"><center><b>Total Biaya Pekerjaan Standart</b></center></td>
        <td colspan="1"><b>{{formatNumberRupiah(formatNumber(total(PesanData.standart)))}}</b></td>
      </tr>
	  
      <tr>
        <td colspan="6"> <div style="height: 50px; overflow:hidden;">
    
  </div></td>
      </tr>
       
      <tr>
        <td colspan="6"> <div style="height: 50px; overflow:hidden;">
     
  </div></td>
      </tr>
      
      <tr>
        <td colspan="6"><h4 align="center"><b>IMPLEMENTASI PEKERJAAN ADDITIONAL</b></h4></td>
      </tr>
      <tr>
        <td colspan="1"><center><b>ITEM PEKERJAAN</b></center></td>
        <td><center><b>SAT</b></center></td>
        <td><center><b>VOLUME</b></center></td>
        <td><center><b>HARGA SATUAN</b></center></td>
        <td><center><b>HARGA TOTAL</b></center></td>
      </tr>
       <tr v-for="item of PesanData.additional">
        <td colspan="1">{{item.workitem}}</td>
        <td><center>{{item.unit}}</center></td>
        <td><center>{{item.volume}}</center></td>
        <td>{{formatNumberRupiah(item.unitprice)}}</td>
        <td>{{formatNumberRupiah(formatNumber(item.total))}}</td>
       
      </tr>
         <tr>
        <td colspan="4"><center><b>Total Biaya Pekerjaan Additional</b></center></td>
        <td colspan="1"><b>{{formatNumberRupiah(formatNumber(total(PesanData.additional)))}}</b></td>
      </tr>
	  
       <tr>
        <td colspan="6"> <div style="height: 50px; overflow:hidden;">
    
  </div></td>
      </tr>
       
      <tr>
        <td colspan="6"> <div style="height: 50px; overflow:hidden;">
   
  </div></td>
      </tr>
      <tr>
        <td colspan="6"><h4 align="center"><b>IMPLEMENTASI PEKERJAAN REDUCTION</b></h4></td>
      </tr>
      <tr>
        <td colspan="1"><center><b>ITEM PEKERJAAN</b></center></td>
        <td><center><b>SAT</b></center></td>
        <td><center><b>VOLUME</b></center></td>
        <td><center><b>HARGA SATUAN</b></center></td>
        <td><center><b>HARGA TOTAL</b></center></td>
      </tr>
       <tr v-for="item of PesanData.reduction">
        <td colspan="1">{{item.workitem}}</td>
        <td><center>{{item.unit}}</center></td>
        <td><center>{{item.volume}}</center></td>
        <td>{{formatNumberRupiah(item.unitprice)}}</td>
        <td>{{formatNumberRupiah(formatNumber(item.total))}}</td>
       
      </tr>
         <tr>
        <td colspan="4"><center><b>Total Biaya Pekerjaan Reduction</b></center></td>
        <td colspan="1"><b>{{formatNumberRupiah(formatNumber(total(PesanData.reduction)))}}</b></td>
      </tr>
	  
	   
      <tr>
        <td colspan="6"> <div style="height: 50px; overflow:hidden;">
    
  </div></td>
      </tr>
       
      <tr>
        <td colspan="6"> <div style="height: 50px; overflow:hidden;">
   
  </div></td>
      </tr>
      
	  </tr>
         <tr>
        <td colspan="4"><center><b>Grand Total Biaya Pekerjaan</b></center></td>
        <td colspan="1"><b>{{formatNumberRupiah(formatNumber((total(PesanData.standart)+total(PesanData.additional))- total(PesanData.reduction)))}}</b></td>
      </tr>
	  
  </table>
</div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="modal.set('view', false)" >Close</button>
					<a v-bind:href="urlDetail+PesanData.header.id" target="_blank"><button type="button" class="btn btn-success">Download Excel</button></a>
                </div>
        </template>
        </modal>

		
		
		
			
		
<!-- @message --->
        <modal  v-if="modal.get('message')" @close="modal.set('message', false)"  >
        <template slot="header" ><h4>Detail Pesan Project</h4></template>
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
      <td colspan="4" style="padding-top: 1%;"></td>
    </tr>
    <tr>
      <td><label>Search for:</label></td>
      <td colspan="3"><input type="text" v-model="filterText" class="form-control" @keyup.enter="doFilter" placeholder="Project ID / Site Name"></td>
    </tr>
     <tr>
      <td colspan="4" style="padding-top: 2%;"></td>
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
      api-url="/tenant/GetProjectFinal"
      :fields="fields"
      pagination-path=""
      :selected-to="selectedRow"
      :per-page="perPage"
      track-by="id"
      :css="css.table"
      :multi-sort="true"
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
Vue.component('DynamicForm', require('./DynamicForm.vue'))
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
import SimpleVueValidation from 'simple-vue-validator'
var Validator = SimpleVueValidation.Validator
Vue.use(SimpleVueValidation);
Vue.use(VueEvents)
window.axios = require('axios')
window.eventBus = new Vue()
 Vue.component('modal', Modal)
Vue.component('child-component-selesai', {
  template: `<div class="tenant-project-selesai-button-actions">
      <button class="btn btn-sm" @click="itemAction('view-item-tenant-selesai-project', rowData, rowIndex)"><i class="glyphicon glyphicon-zoom-in"></i></button>
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
      if(action === "view-item-tenant-selesai-project")
      {
      this.$root.$emit('viewitemtenantprojectselesai', data , index);
      }
      else
      {
alert('error');
      }
        
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
  },
  data () {
    return {
	
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
    PesanData:[],
	message: '',
    errors: new Errors() ,
    file_name:'',
	pesannya:[],
    modal:new CrudModal({view:false, message:false}),
     berhasilNya: [],
     errorNya: [],
     workitem:[],
     url:'/files/',
     urlDetail:'/tenant/downloadExcel/',
     unit:[],
     volume:[],
     unitprice:[],
     tambahan: [],
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
          name: 'name',
      title: 'Tenant',
      titleClass: 'text-center',
          dataClass: 'text-center',
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
      title: 'Tower',
      titleClass: 'text-center',
          dataClass: 'text-center',
          callback: 'formatTower'
        },
        {
          name: 'created_at',
          title: 'Tanggal Project',
          titleClass: 'text-center',
          dataClass: 'text-center',
		  callback: 'formatDate|DD-MM-YYYY'
        },
        {
          name: '__component:child-component-selesai',
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
  addRow: function(){
      this.tambahan.push({trnya:"",unit:"",volume:"",unitprice:""});
    },
    removeRow: function(row){
    //console.log(row);
    this.tambahan.splice(row,1)
    },
  total: function(data){

  let total = [];

  Object.entries(data).forEach(([key, val]) => {
      total.push(val.volume * val.unitprice) // the value of the current key.
  });

  return total.reduce(function(total, num){ return total + num }, 0);

},
   CheckMessage() {
			axios.get('/tenant/GetMessageNya/'+this.PesanData.id).then((response) => {
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
            viewitemtenantprojectselesai(item ,index = this.indexOf(item)){
                      axios.get('/tenant/GetProjectDetailProses/'+ item.id).then((response) => {

                   this.errorNya = '';
                   this.PesanData= response.data;
                this.modal.set('view', true); 
                }).catch(error => {
        if (! _.isEmpty(error.response)) {
                    if (error.response.status = 500) {
                        this.$router.push('/server-error');
                    }
          }
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
                axios.get('/tenant/GetProjectFinal').then((response) => {
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
            this.$root.$on('viewitemtenantprojectselesai', function(data,index){
                //console.log(data);
               self.viewitemtenantprojectselesai(data,index);
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
  margin: 20px 0;
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
</style>