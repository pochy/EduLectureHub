<script setup lang="ts">
import { onMounted, ref } from 'vue'
import axios from 'axios'

const message = ref<string>('')
onMounted(async () => {
  const res = await axios.get('api')
  message.value = res.data.message
})
</script>

<template>
  <main>
    <h1>Home</h1>
    <div>{{ message }}</div>
  </main>
</template>
