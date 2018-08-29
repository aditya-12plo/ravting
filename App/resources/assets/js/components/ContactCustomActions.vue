 <template>
    <div class="contact-button-actions">
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
                      axios.get('/tenant/DetailMessage/'+ data.project_id).then((response) => {
                    this.$root.$emit('viewitem', response.data , index);
                }).catch(error => {
        if (! _.isEmpty(error.response)) {
                    if (error.response.status = 500) {
                        this.$router.push('/server-error');
                    }
          }
                    });
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
    .contact-button-actions button.ui.button {
      padding: 8px 8px;
    }
    .contact-button-actions button.ui.button > i.icon {
      margin: auto !important;
    }
  </style>