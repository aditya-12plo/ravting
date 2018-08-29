<template>
 <div> 
    <section class="content-header">
 <vue-toast ref='toast'></vue-toast>
      <h1 style="padding-top: 1%;font-size: 40px;font-family:'Brush Script MT';" align="left">
       "Efficiency and Cost Effectiveness is Everything"
      </h1>
    </section>
 <loading :show="isLoading"></loading>

 
 
 


   <section class="content">
      <div class="row">
      <div class="col-md-12">

	<div class="col-sm-12">
	
	
<div class="col-sm-12">	
	<div class="col-sm-4">				
<table class="table table-bordered">
      <tr>
        <td><h1 align="center"><b>PROJECT {{this.tahun}}</b></h1></td>
      </tr>
    </table>
	<br>
	<table class="table table-bordered" style="overflow-x:auto;">
      <tr>
        <td colspan="2"><h1 align="center"><b>B2S</b></h1></td>
      </tr>
      <tr>
        <td align="left"><b>ORDER</b></td>
        <td align="center"><b>{{this.JumlahDataB2S.ordernya}}</b></td>
      </tr>
      <tr>
        <td align="left"><b>NOT YET SUBMIT</b></td>
        <td align="center"><b>{{this.JumlahDataB2S.ordernya - this.JumlahDataB2S.prog - this.JumlahDataB2S.canc - this.JumlahDataB2S.fin}}</b></td>
      </tr>
      <tr>
        <td align="left"><b>PROSES APPROVAL</b></td>
        <td align="center"><b>{{this.JumlahDataB2S.prog}}</b></td>
      </tr>
      <tr>
        <td align="left"><b>DROP</b></td>
        <td align="center"><b>{{this.JumlahDataB2S.canc}}</b></td>
      </tr>
      <tr>
        <td align="left"><b>APPROVED</b></td>
        <td align="center"><b>{{this.JumlahDataB2S.fin}}</b></td>
        
      </tr>
    </table>
</div>
	
	<div v-if="this.status==='true'">
	<div class="col-sm-4">				
<div class="small">
<p><h3 align="center"><b>CAPEX {{this.areanya}} B2S</b></h3></p>
    <line-placapb2sNya :height="300" :data="this.areaB2S"></line-placapb2sNya>
  </div>
</div>
	</div>
	<div v-else>
	
	<div class="col-sm-4">				
<div class="small">
<p><h3 align="center"><b>CAPEX NASIONAL B2S</b></h3></p>
    <line-placapb2sNya :height="300" :data="this.placapb2s"></line-placapb2sNya>
  </div>
</div>

	</div>
	
	
	<div class="col-sm-4">				
<div class="small">
<p><h3 align="center"><b>JUMLAH SITE B2S</b></h3></p>
    <line-chartB2s :height="300" :data="this.JumlahDataB2S"></line-chartB2s>
  </div>
</div>
</div>
	
	
	<div class="col-sm-12">
	<div class="col-sm-4">				

	<table class="table table-bordered" style="overflow-x:auto;">
      <tr>
        <td colspan="2"><h1 align="center"><b>UNTAPPED</b></h1></td>
      </tr>
      <tr>
        <td align="left"><b>ORDER</b></td>
        <td align="center"><b>{{this.PesanData.tableUNTAPPED.ordernya}}</b></td>
      </tr>
      <tr>
        <td align="left"><b>NOT YET SUBMIT</b></td>
        <td align="center"><b>{{this.PesanData.tableUNTAPPED.ordernya - this.JumlahDataUTP.prog - this.JumlahDataUTP.canc - this.JumlahDataUTP.fin}}</b></td>
      </tr>
      <tr>
        <td align="left"><b>PROSES APPROVAL</b></td>
        <td align="center"><b>{{this.JumlahDataUTP.prog}}</b></td>
      </tr>
      <tr>
        <td align="left"><b>DROP</b></td>
        <td align="center"><b>{{this.JumlahDataUTP.canc}}</b></td>
      </tr>
      <tr>
        <td align="left"><b>APPROVED</b></td>
        <td align="center"><b>{{this.JumlahDataUTP.fin}}</b></td>
        
      </tr>
    </table>
</div>
	
	<div v-if="this.status==='true'">
	<div class="col-sm-4">				
<div class="small">
<p><h3 align="center"><b>CAPEX {{this.areanya}} UNTAPPED</b></h3></p>
    <line-placapunpnYA :height="300" :data="this.areaUTP"></line-placapunpnYA>
  </div>
</div>

</div>
<div v-else>	
	<div class="col-sm-4">				
<div class="small">
<p><h3 align="center"><b>CAPEX NASIONAL UNTAPPED</b></h3></p>
    <line-placapunpnYA :height="300" :data="this.placapunp"></line-placapunpnYA>
  </div>
</div>

</div>
	
	<div class="col-sm-4">				
<div class="small">
<p><h3 align="center"><b>JUMLAH SITE UNTAPPED</b></h3></p>
    <line-chartUp :height="300" :data="this.JumlahDataUTP"></line-chartUp>
  </div>
</div>
</div>
	
	
	
</div>	



      </div>
      </div>
      </section>
    </div>
</template>
<script>
    
import accounting from 'accounting'
import {Money} from 'v-money'
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
import SimpleVueValidation from 'simple-vue-validator'
var Validator = SimpleVueValidation.Validator
Vue.use(SimpleVueValidation);
import loading from './Loading'
Vue.use(VueEvents)
window.axios = require('axios')
window.eventBus = new Vue()


Vue.component("line-placapunpnYA", {
  extends: VueCharts.Bar,
  props: ["data"],
  data () {
      return {
        datacollection: {
          //Data to be represented on x-axis
         labels: ['TOWER UNTAPPED'],
        datasets: [
          {
		   label: 'PLAFON ('+this.data.jumlah+') ('+this.formatGrafikNumberRupiah(this.data.budget)+')',
          borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#dd4b39',
          data: [this.data.budget] 
		  },
		{
          label: 'CAPEX ('+this.data.jumlah+') ('+this.formatGrafikNumberRupiah(this.data.capex)+' )',
          borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#1451A1',
          data: [this.data.capex]
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
		  methods: { 
    formatGrafikNumberRupiah (value) {
      return accounting.formatMoney(value,  "Rp. ", 2, ".", ",")
    },
},
    mounted () {
    //renderChart function renders the chart with the datacollection and options object.
      this.renderChart(this.datacollection, this.options)
    }
})


Vue.component("line-placapb2sNya", {
  extends: Bar,
  props: ["data"],
  data () {
      return {
        datacollection: {
          //Data to be represented on x-axis
          labels: ['TOWER B2S'],
        datasets: [
		{
          label: 'PLAFON ('+this.data.jumlah+') ('+this.formatGrafikNumberRupiah(this.data.budget)+')',
          borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#dd4b39',
          data: [this.data.budget]
        },
		{
          label: 'CAPEX ('+this.data.jumlah+') ('+this.formatGrafikNumberRupiah(this.data.capex)+' )',
          borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#1451A1',
          data: [this.data.capex]
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
	  methods: { 
    formatGrafikNumberRupiah (value) {
      return accounting.formatMoney(value,  "Rp. ", 2, ".", ",")
    },
},
    mounted () {
    //renderChart function renders the chart with the datacollection and options object.
      this.renderChart(this.datacollection, this.options)
    }
})

Vue.component("line-chartB2s", {
  extends: VueCharts.Bar,
  props: ["data"],
  data () {
      return {
        datacollection: {
          //Data to be represented on x-axis
          labels: ['ORDER','APPROVED'],
         datasets: [
          {
		   label: 'ORDER ('+this.data.ordernya+')',
          borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#dd4b39',
          data: [this.data.ordernya] 
		  },
		{
          label: 'APPROVED ('+this.data.fin+')',
          borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#1451A1',
          data: [this.data.fin]
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
				stepSize:20,
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



Vue.component("line-chartUp", {
  extends: VueCharts.Bar,
  props: ["data"],
  data () {
      return {
        datacollection: {
          //Data to be represented on x-axis
         labels: ['ORDER','APPROVED'],
         datasets: [
          {
		   label: 'ORDER ('+this.data.ordernya+')',
          borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#dd4b39',
          data: [this.data.ordernya] 
		  },
		{
          label: 'APPROVED ('+this.data.fin+')',
          borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#1451A1',
          data: [this.data.fin]
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
				stepSize:20,
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
	 Money,
	 loading,
  },
  data () {
    return {
	
    JumlahDataB2S:[],
    JumlahDataUTP:[],
    PesanData:[],
    grafixuntp:'',
    status:'',
    areanya:'',
    tahun:'',
    placapb2s:'',
    placapunp:'',
    areaUTP:[],
    areaB2S:[],
	isLoading: false,
      }
  },
          watch: {
        'delayOfJumps': 'resetOptions',
        'maxToasts': 'resetOptions',
        'position': 'resetOptions',
        },
  methods: {
     
getUser(){
                axios.get('/karyawan/AreaProfile').then((response) => {
				this.status = response.data.status;
				this.areanya = response.data.area;
                });

},
  
fetchIt(){
                axios.get('/karyawan/GetHome').then((response) => {
                    this.PesanData = response.data;
					var DataUntapped = response.data.placapUNTAPPED;
					var DataB2SNya = response.data.placapb2s;
                    this.tahun = response.data.tahun;
                    this.JumlahDataB2S = response.data.tableB2s;
                    this.JumlahDataUTP = response.data.tableUNTAPPED;
                   this.placapb2s = response.data.placapb2s;
                 this.placapunp = response.data.placapUNTAPPED;
                    this.placapb2sarea = {area:response.data.area,capex:response.data.capexarea};
                  this.areaUTP = response.data.areaUTPUser;
                  this.areaB2S = response.data.areaUser;
					
                });
            },

    formatNumberRupiah (value) {
      return accounting.formatMoney(value,  "Rp. ", 2, ".", ",")
    },
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
			this.getUser();

        }

}
</script>
<style>
  .small {
    max-width: 100%;
    margin:  5% auto;
  }
</style>