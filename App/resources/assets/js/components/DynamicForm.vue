<template>
 <div>
<td>
    <div class="form-group" :class="{error: validation.hasError('workitem')}">
      <div class="content"><input type="text" class="form-control" v-model="workitem" placeholder="Item Pekerjaan" /></div>
      <div class="message">{{ validation.firstError('workitem') }}</div>
    </div>
</td>
<td>
    <div class="form-group" :class="{error: validation.hasError('unit')}">
      <div class="content"><input type="text" class="form-control" v-model="unit" placeholder="Satuan" /></div>
      <div class="message">{{ validation.firstError('unit') }}</div>
    </div>
</td>
<td>
    <div class="form-group" :class="{error: validation.hasError('volume')}">
      <div class="content"><input type="text" class="form-control" v-model="volume" placeholder="Volume" /></div>
      <div class="message">{{ validation.firstError('volume') }}</div>
    </div>
</td>
<td>
    <div class="form-group" :class="{error: validation.hasError('unitprice')}">
      <div class="content"><input type="text" class="form-control" v-model="unitprice" placeholder="Harga" /></div>
      <div class="message">{{ validation.firstError('unitprice') }}</div>
    </div>
</td>

  </div>
  </template>
<script>
 var Vue = require('vue');
  var SimpleVueValidation = require('simple-vue-validator');
  var Validator = SimpleVueValidation.Validator;

  Vue.use(SimpleVueValidation);

  module.exports = {
    data: function () {
      return {
        workitem: '',
        unit: '',
        volume: '',
        unitprice: ''
      };
    },
    validators: {
      workitem: function(value) {
        return Validator.value(value).required();
      },
      unit: function(value) {
        return Validator.value(value).required();
      },
      volume: function(value) {
        return Validator.value(value).required().digit();
      },
      unitprice: function(value) {
        return Validator.value(value).required().digit();
      },
    },
    methods: {
      validate: function() {
        return this.$validate()
          .then(function(success) {
            if (success) {
              return {workitem: this.workitem,unit: this.unit,volume: this.volume,unitprice: this.unitprice}
            }
          }.bind(this));
      },
      reset: function() {
        this.validation.reset();
      }
    }
  }
</script>