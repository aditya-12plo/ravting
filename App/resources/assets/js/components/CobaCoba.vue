<script>
  //Importing Bar class from the vue-chartjs wrapper
  import {Bar} from 'vue-chartjs'
  //Exporting this so it can be used in other components
  export default ({
  extends: Bar,
  props: ["data"],
    data () {
      return {
        datacollection: {
          //Data to be represented on x-axis
          labels: [this.data.barNya.regional,this.data.barNya.area,this.data.barNya.nasional],
         datasets: [
          {
		   label: 'PLAFON',
          borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#dd4b39',
          data: [this.data.regional.budgetNya,this.data.area.budgetNya,this.data.nasional.budgetNya] 
		  },
		{
          label: 'CAPEX',
          borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#1451A1',
          data: [this.data.regional.capexNya,this.data.area.capexNya,this.data.nasional.capexNya]
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
</script>