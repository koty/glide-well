<template>
  <div id="app">
    <table class="table">
      <thead><th>kind</th><th>distance</th><th>times</th><th>interval</th><th>note</th></thead>
      <tbody>
      <tr v-for="(detail, index) in details">
        <td><select v-model="detail.menu_kind">
          <option value="1">swim</option>
          <option value="2">kick</option>
          <option value="3">paddle</option>
          <option value="3">IM</option>
        </select></td>
        <td><input type="text" v-model="detail.distance" /></td>
        <td><input type="number" v-model="detail.times" /></td>
        <td><input type="number" v-model="detail.interval" /></td>
        <td><textarea v-model="detail.note" /></td>
        <td><button @click="deleteRow(index)">del</button></td>
      </tr>
      </tbody>
    </table>
    <button @click="addRow">add row</button>
    <button @click="saveDetails">詳細保存</button>
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
      this.details.push({ menu_kind: 1, times: 4, interval: 3.5, note: ''});
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
    }
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
