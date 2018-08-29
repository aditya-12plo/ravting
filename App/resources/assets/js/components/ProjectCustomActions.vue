 <template>
    <div class="project-button-actions">
      <button class="btn btn-sm" @click="itemAction('view-item', rowData, rowIndex)"><i class="glyphicon glyphicon-zoom-in"></i></button>
    </div>

  </template>

  <script>

  export default {
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
      
    
  }
  </script>

  <style>
    .project-button-actions button.ui.button {
      padding: 8px 8px;
    }
    .project-button-actions button.ui.button > i.icon {
      margin: auto !important;
    }
  </style>