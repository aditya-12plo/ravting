<template>
<form @submit.prevent="submitBooks" method="POST">
  <transition name="modal" id="modal-template">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">

          <div class="modal-header">
            <slot name="header">
              default header
            </slot>
          </div>


          <div class="modal-body">
            <slot name="body">


              <div class="form-group">
                <label>Title :</label>
                  <input type="text" name="title" class="form-control" v-model="dataNya.title" placeholder="Title" required>
                  <span class="label label-danger" v-for="error of errors['title']">
                        {{ error }}
                    </span>
              </div>
              <!-- /.form group -->


              <div class="form-group">
                <label>Author :</label>
                  <input type="text" name="author" class="form-control" v-model="dataNya.author" placeholder="Author" required>
                  <span class="label label-danger" v-for="error of errors['author']">
                        {{ error }}
                    </span>
              </div>
              <!-- /.form group -->


              <div class="form-group">
                <label>QTY :</label>
                  <input type="number" name="qty" class="form-control" v-model="dataNya.qty" placeholder="QTY" required>
                   <span class="label label-danger" v-for="error of errors['qty']">
                        {{ error }}
                    </span>
              </div>
              <!-- /.form group -->


            </slot>
          </div>

          <div class="modal-footer">
            <slot name="footer">
         
              <button type="submit" class="btn btn-block btn-primary btn-lg">Submit</button>&nbsp;&nbsp;
              <button type="button" class="btn btn-block btn-default btn-lg" @click="$emit('close')">Close</button>
            </slot>
          </div>
        </div>
      </div>
    </div>
  </transition>
   </form>
</template>
<script>
    export default {
        data(){
            return {
                dataNya: {title : '',author: '',qty:''},
                loading: false,
                formNya : "",
                errors: [],
                submitted: false,
                token: localStorage.getItem('token')
            }
        },
        methods: {
            submitBooks() {

            axios.post('/books', this.dataNya)
                    .then(response => {
                this.errors = '';

                this.$router.push('/crud');
                this.submitted = true;
                
                    })
                    .catch(error => {
                        this.errors = error.response.data;
                    })
                    $('#showModal').modal('hide');
            }
        }
    }
</script>
<style>
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

.modal-container {
  width: 50%;
  margin: 0px auto;
  padding: 10px 20px;
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