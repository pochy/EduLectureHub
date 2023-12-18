<script setup lang="ts">
import { onMounted } from 'vue'
import axios from 'axios'
import { Lecture } from '../types'

onMounted(async () => {
  const res = await axios.get('api/lectures')
  const data = res.data as Lecture[]
  console.log(data)
  console.log(data[0].title)
})
</script>

<template>
  <main>Lectures</main>
</template>
