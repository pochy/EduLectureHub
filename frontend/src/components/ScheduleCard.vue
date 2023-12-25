<script setup lang="ts">
import { Lecture } from '@/types'
import router from '../router'

const handleCellClick = (period: number, day_of_week: number) => {
  router.push(`/lectures?period=${period}&day_of_week=${day_of_week}`)
}

const handleLectureShow = (lecture_id: number) => {
  router.push(`/lectures/${lecture_id}`)
}

const props = defineProps<{
  lectures: Lecture[]
  period: number
  day_of_week: number
}>()

const lecture = props.lectures.find(
  (lecture) => lecture.period === props.period && lecture.day_of_week === props.day_of_week
)
if (lecture) {
  console.log('ScheduleCard', props.lectures, props.period, props.day_of_week, lecture)
}
</script>

<template>
  <template v-if="lecture">
    <td
      @click="handleLectureShow(lecture.id)"
      class="text-center border-4 border-white bg-[#EFF8F2] p-1 lg:p-2 cursor-pointer hover:bg-[#D2F1DB]"
    >
      {{ lecture?.title }}
    </td>
  </template>
  <template v-else>
    <td
      @click="handleCellClick(props.period, props.day_of_week)"
      class="text-center border-4 border-white bg-gray-50 p-1 lg:p-2 cursor-pointer hover:bg-[#D2F1DB]"
    ></td>
  </template>
</template>

<style scoped></style>
