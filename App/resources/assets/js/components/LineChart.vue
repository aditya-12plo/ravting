<script>
import {Bar} from 'vue-chartjs'

export default {
  extends: Bar,
  props: ["data"],
  data () {
    return {
      gradient: null,
      gradient2: null,
      gradient3: null,
    }
  },
   methods: {
    renderLineChart: function() {
    this.renderChart({
      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
      datasets: [
        {
          label: 'Project Reject',
          borderColor: '#FC2525',
          pointBackgroundColor: 'white',
          borderWidth: 1,
          pointBorderColor: 'white',
          backgroundColor: this.gradient,
          data: this.data.dataB
        },
		{
          label: 'Project Final',
          borderColor: '#05CBE1',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: this.gradient2,
          data: this.data.dataA
        },
		{
          label: 'Project Progress',
          borderColor: '#92bd00',
          pointBackgroundColor: 'white',
          pointBorderColor: 'white',
          borderWidth: 1,
          backgroundColor: this.gradient3,
          data: this.data.dataC
        }
      ],
	  options: {
		scales: {
        yAxes: [{
          gridLines: {
            display: true
          },
          ticks: {
		   autoSkip: false,
		   beginAtZero:true,
           min: 0,        
		   stepSize:10,
          }
        }]
      }
	  }
	  
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
	
    this.gradient3.addColorStop(0, 'rgba(0, 146, 189, 0.5)')
    this.gradient3.addColorStop(0.5, 'rgba(0,  146, 189, 0.25)');
    this.gradient3.addColorStop(1, 'rgba(0, 146, 189, 0)');
	this.renderLineChart(this.data, this.options);
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
      this.renderLineChart();
    }
  }

}
</script>