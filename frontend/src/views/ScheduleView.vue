<script setup lang="ts">
import ScheduleCard from '@/components/ScheduleCard.vue'
import { onMounted, reactive, ref } from 'vue'
import { Lecture } from '../types'
import apiClient from '../api/client'
const schedules = [{ time: 1 }, { time: 2 }, { time: 3 }, { time: 4 }, { time: 5 }, { time: 6 }]
const day_of_weeks = [{ dow: 1 }, { dow: 2 }, { dow: 3 }, { dow: 4 }, { dow: 5 }, { dow: 6 }]

const lectures = ref([] as Lecture[])

const data = reactive({
  lectures: lectures
})

onMounted(async () => {
  const res = await apiClient.get('schedules')
  const respData = res.data as Lecture[]
  data.lectures = respData.slice().sort((a, b) => {
    if (a.day_of_week > b.day_of_week) {
      return 1
    } else if (a.day_of_week < b.day_of_week) {
      return -1
    } else {
      return 0
    }
  })
})
</script>
<template>
  <main class="container p-0 lg:px-4 mx-auto max-w-6xl">
    <table
      width="320"
      height="480"
      class="min-w-full min-h-full table-fixed bg-white text-xs lg:text-base"
    >
      <thead>
        <tr>
          <th></th>
          <th class="border-4 border-white bg-gray-50 p-2">月</th>
          <th class="border-4 border-white bg-gray-50 p-2">火</th>
          <th class="border-4 border-white bg-gray-50 p-2">水</th>
          <th class="border-4 border-white bg-gray-50 p-2">木</th>
          <th class="border-4 border-white bg-gray-50 p-2">金</th>
          <th class="border-4 border-white bg-gray-50 p-2">土</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="schedule in schedules" v-bind:key="schedule.time">
          <th class="border-4 border-white bg-gray-50 p-2 max-w-1">{{ schedule.time }}</th>
          <template v-for="day_of_week in day_of_weeks" v-bind:key="day_of_week.dow">
            <ScheduleCard
              v-if="data.lectures.length > 0"
              msg="hoge"
              v-bind:lectures="data.lectures"
              v-bind:period="schedule.time"
              v-bind:day_of_week="day_of_week.dow"
            />
          </template>
        </tr>
      </tbody>
    </table>
  </main>
</template>
