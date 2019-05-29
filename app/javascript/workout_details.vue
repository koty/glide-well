<template>
  <div id="app">
    <table class="table">
      <thead><th>kind</th><th>distance(m)</th><th>times</th><th>interval(sec)</th><th>note</th></thead>
      <tbody>
      <tr v-for="(detail, index) in details">
        <td><select v-model="detail.menu_kind">
          <option value="1">swim</option>
          <option value="2">kick</option>
          <option value="3">paddle</option>
          <option value="3">IM</option>
        </select></td>
        <td><input type="number" v-model="detail.distance" class="input-item" /></td>
        <td><input type="number" v-model="detail.times" class="input-item" /></td>
        <td><input type="number" v-model="detail.interval" class="input-item" />{{toMinutes(detail.interval)}}</td>
        <td><textarea v-model="detail.note" class="input-item" /></td>
        <td><button @click="deleteRow(index)">del</button></td>
      </tr>
      </tbody>
    </table>
    <button @click="addRow" class="btn">add row</button>
    <button @click="saveDetails" class="btn btn-primary" :disabled="details.length === 0">詳細保存</button>
  </div>
</template>

<script>
export default {
  data: () => {
    return {
      details: []
    }
  },
  mounted: async function() {
    const workout_id = location.pathname.split('/')[2];
    const response = await fetch(`/workout_details/${workout_id}/`);
    this.details = await response.json();
  },
  methods: {
    addRow: function() {
      this.details.push({ menu_kind: 1, times: 4, interval: 210, note: ''});
    },
    deleteRow: function(index) {
      this.details.splice(index, 1);
    },
    saveDetails: function() {
      // /workouts/6/edit
      const workout_id = location.pathname.split('/')[2];
      const method = "POST";
      const body = JSON.stringify({workout_details: this.details});
      const csrfToken = document.getElementsByName('csrf-token')[0].content;
      const headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      };
      fetch(`/workout_details/${workout_id}/`, {method, headers, body});
    },
    toMinutes: function (seconds) {
      if (!seconds) {
        return ''
      }
      const min = Math.floor(seconds / 60)
      const sec = seconds - (60 * min)
      return `${min}min ${sec}sec`
    }
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
  .input-item {
    width: 50px;
  }
</style>
