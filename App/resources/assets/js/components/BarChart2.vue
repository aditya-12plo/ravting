<script>
import {Bar} from 'vue-chartjs'

export default {
  extends: Bar,
  props: ["data", "options"],
  data () {
    return {
      gradient: null,
      gradient2: null,
    }
  },
   methods: {
    renderLineChartKedua: function() {
    this.renderChart({
      labels: this.data.area,
      datasets: [
        {
          label: 'Budget',
          borderColor: '#FC2525',
          pointBackgroundColor: 'white',
          borderWidth: 1,
          pointBorderColor: 'white',
          backgroundColor: this.gradient,
          data: this.data.budget
        },
		{
          label: 'Capex',
          borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: this.gradient2,
          data: this.data.capex
        }
      ]
    }, {responsive: true, maintainAspectRatio: false});      
    }
  },
  mounted () {
	this.gradient = this.$refs.canvas.getContext('2d').createLinearGradient(0, 0, 0, 450)
    this.gradient2 = this.$refs.canvas.getContext('2d').createLinearGradient(0, 0, 0, 450)
    this.gradient3 = this.$refs.canvas.getContext('2d').createLinearGradient(0, 0, 0, 450)

    this.gradient.addColorStop(0, 'rgba(255, 0,0, 0.5)')
    this.gradient.addColorStop(0.5, 'rgba(255, 0, 0, 0.25)');
    this.gradient.addColorStop(1, 'rgba(255, 0, 0, 0)');
    
    this.gradient2.addColorStop(0, 'rgba(0, 231, 255, 0.9)')
    this.gradient2.addColorStop(0.5, 'rgba(0, 231, 255, 0.25)');
    this.gradient2.addColorStop(1, 'rgba(0, 231, 255, 0)');
	
	this.renderLineChartKedua();
  },
   computed: {
    chartData: function() {
      return this.data;
    }
	},
		watch: {
    data: function() {
     // this._chart.destroy();
      //this.renderChart(this.data, this.options);
      this.renderLineChartKedua();
    }
  }

}
</script>