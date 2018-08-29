<template>

 <div>
    <section class="content-header">
             <vue-toast ref='toast'></vue-toast>
      <h1 style="padding-top: 5%;font-size: 50px;" align="center">
     Profil
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-6">

          <div class="box box-danger">
            <div class="box-header">
              <h3 class="box-title">Profile</h3>
            </div>
            <div class="box-body">
             <form @submit.prevent="submitProfile" method="POST">

              <!-- email mask -->
              <div class="form-group">
                <label>Email</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-user"></i>
                  </div>
                  <input v-model="dataNya.email" type="text" class="form-control" disabled>
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->

              <!-- level mask -->
              <div class="form-group">
                <label>Level</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-user"></i>
                  </div>
                  <input v-model="dataNya.level" type="text" class="form-control" disabled>
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->

              <!-- user mask -->
              <div class="form-group">
                <label>Name</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-user"></i>
                  </div>
                  <input type="text" name="name" class="form-control" v-model="dataNya.name" placeholder="Name" disabled>
                  <span class="label label-danger" v-for="error of errors['name']">
                        {{ error }}
                    </span>
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->

              <!-- form group
              <div class="form-group">
                <button type="submit" class="btn btn-block btn-primary btn-lg">Submit</button>
              </div>
           form group -->
 </form>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          

        </div>
        <!-- /.col (left) -->
        <div class="col-md-6">
          <div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title">Password</h3>
            </div>
            <div class="box-body">
            <form @submit.prevent="submitPassword" method="POST">
              <!-- Date -->
              <div class="form-group">
                <label>New Password</label>

                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-eye"></i>
                  </div>
                  <input type="password" name="password" v-model="dataPassword.password" class="form-control pull-right" id="password" placeholer="New Password" required>
                   <span class="label label-danger" v-for="error of errors['password']">
                        {{ error }}
                    </span>
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->

              <!-- Date range -->
              <div class="form-group">
                <label>New Password Confirmation</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-eye"></i>
                  </div>
                  <input type="password" name="password_confirmation" v-model="dataPassword.password_confirmation" class="form-control pull-right" id="password_confirmation" placeholer="New Password Confirmation" required>
                  <span class="label label-danger" v-for="error of errors['password_confirmation']">
                        {{ error }}
                    </span>
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
   <div class="form-group">
                <button type="submit" class="btn btn-block btn-primary btn-lg">Submit</button>
              </div>
              <!-- /.form group -->
             
 </form>
             

            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

         
        </div>
        <!-- /.col (right) -->
      </div>
      <!-- /.row -->
      </section>

     
 </div>

</template>


<script>
  import '!!vue-style-loader!css-loader!vue-toast/dist/vue-toast.min.css'
  import VueToast from 'vue-toast'


    export default {
        data(){
            return {
                maxToasts: 100,
                position: 'up right',
                closeBtn: true,
                dataNya: {name : ''},
                dataPassword: {password : '',
                password_confirmation: ''},
                loading: false,
                formNya : "",
                errors: [],
                token: localStorage.getItem('token'),
            }
        },
              components: {
       'vue-toast': VueToast,
      },
        methods: {
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
            submitProfile() {

            axios.post('/karyawan/ChangeName', this.dataNya)
                    .then(response => {
                this.errors = '';
                this.submitted = this.showTime('success',response.data.success);
                    })
                    .catch(error => {                       
					if (! _.isEmpty(error.response)) {
                    if (error.response.status = 422) {
                       this.errors = error.response.data;
                    }
                   else if (error.response.status = 500) {
                        this.$router.push('/server-error');
                    }
					else
					{
                         this.$router.push('/page-not-found');
					}
					}
                    })
            },
            submitPassword() {

            axios.post('/karyawan/changePassword', this.dataPassword)
                    .then(response => {
                this.errors = '';
                 this.submitted = this.showTime('success',response.data.success);
                this.dataPassword.password_confirmation = '';
                this.dataPassword.password = '';
                    })
                    .catch(error => {
					if (! _.isEmpty(error.response)) {
                    if (error.response.status = 422) {
                       this.errors = error.response.data;
                    }
                   else if (error.response.status = 500) {
                        this.$router.push('/server-error');
                    }
					else
					{
                         this.$router.push('/page-not-found');
					}
					}
                        
                    })
            },
            fetchIt(){
                this.loading = true;
                axios.get('/karyawan/GetProfile?token=' + this.token).then((response) => {
                    this.dataNya = response.data;
                    this.loading = false
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
            }
        },
              watch: {
        'delayOfJumps': 'resetOptions',
        'maxToasts': 'resetOptions',
        'position': 'resetOptions'
      },
        mounted() {
            //console.log(this.token);
            this.fetchIt();
             this.resetOptions();

        }
    }
</script>
