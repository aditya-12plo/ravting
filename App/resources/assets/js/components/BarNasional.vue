<script>
  //Importing Bar class from the vue-chartjs wrapper
  import {Bar} from 'vue-chartjs'
  //Exporting this so it can be used in other components
  export default ({
  extends: Bar,
  props: ["dataNas"],
    data () {
      return {
        datacollection: {
          //Data to be represented on x-axis
          labels: ['B2S'],
         datasets: [
          {
		  label: 'CAPEX NASIONAL',
            borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#dd4b39',
		  data: ['74546545']
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
	//console.log(this.dataNas);
    //renderChart function renders the chart with the datacollection and options object.
      this.renderChart(this.datacollection, this.options)
    }
  })
</script>