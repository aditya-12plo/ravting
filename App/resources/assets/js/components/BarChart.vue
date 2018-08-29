<script>
import {Bar} from 'vue-chartjs'
import accounting from 'accounting'
 export default ({
  extends: Bar,
  props: ["data", "options"],
  mounted () {
	this.renderLineChart();
  },
     computed: {
    chartData: function() {
      return this.data;
    }
	},
   methods: {
   formatNumberRupiah (value) {
      return accounting.formatMoney(value,  "Rp. ", 2, ".", ",")
    },
    renderLineChart: function() {
    this.renderChart({
      labels: this.data.regional,
      datasets: [
		{
          label: 'Capex',
          borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: '#dd4b39',
          data: this.data.capex
        }
      ]
    }, {responsive: true, maintainAspectRatio: false});      
    }
  },
  
		watch: {
    data: function() {
     //this._chart.destroy();
      //this.renderChart(this.data, this.options);
      this.renderLineChart();
    }
  }

})
</script>