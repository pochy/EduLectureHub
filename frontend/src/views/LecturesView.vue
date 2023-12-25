<script setup lang="ts">
import { onMounted, reactive, ref, computed } from 'vue'
import { Lecture } from '../types'
import apiClient from '../api/client'
import { useRoute } from 'vue-router'
import { Clock3, GraduationCap, Loader2, Plus, Minus } from 'lucide-vue-next'
import { Button } from '@/components/ui/button'
import router from '../router'
import { dayOfWeekLabel, periodLabel } from '@/utils/lecture'

const isLoading = ref(false)
const route = useRoute()
const period = computed(() => route.query.period)
const day_of_week = computed(() => route.query.day_of_week)

const lectures = ref([] as Lecture[])

const data = reactive({
  lectures: lectures
})

onMounted(async () => {
  const res = await apiClient.get('lectures', {
    params: {
      period: period.value,
      day_of_week: day_of_week.value
    }
  })
  const respData = res.data as Lecture[]
  data.lectures = respData
  console.log(respData)
})

const handleUnRegister = async (schedules_id: number) => {
  console.log('delete', schedules_id)
  isLoading.value = true

  setTimeout(() => {
    isLoading.value = false
  }, 3000)

  await apiClient.delete(`schedules/${schedules_id}`)
}

const handleRegister = async (lecture_id: number) => {
  isLoading.value = true

  setTimeout(() => {
    isLoading.value = false
  }, 3000)

  await apiClient.post('schedules', {
    lecture_id: lecture_id
  })
}

const handleLectureShow = (lecture_id: number) => {
  router.push(`/lectures/${lecture_id}`)
}
</script>

<template>
  <main class="container px-4 mx-auto max-w-96">
    <h1 class="text-xl font-bold text-center mb-2">講義一覧</h1>
    <div
      @click="handleLectureShow(lecture.id)"
      v-for="lecture in lectures"
      v-bind:key="lecture.id"
      class="border-b last:border-b p-4 flex hover:bg-gray-100 hover:cursor-pointer"
    >
      <div class="flex-1">
        <h2 class="text-xl mb-2">{{ lecture.title }}</h2>
        <p class="text-sm">
          <Clock3 color="#6DB632" :size="20" class="inline" /><span class="align-middle ml-1"
            >{{ dayOfWeekLabel(lecture.day_of_week) }} ({{ periodLabel(lecture.period) }})</span
          >
        </p>
        <p class="text-sm">
          <GraduationCap color="#6DB632" :size="22" class="inline" /><span
            class="align-middle ml-1"
            >{{ lecture.teacher_name }}</span
          >
        </p>
      </div>
      <div class="flex-1 flex items-center justify-end">
        <template v-if="lecture.schedules_id">
          <Button
            @click="handleUnRegister(lecture.schedules_id)"
            class="bg-white border-[#51c85f] border-2 text-[#51c85f] hover:bg-[#51c85f] hover:text-white"
          >
            <Loader2 v-if="isLoading" class="mr-2 h-4 w-4 animate-spin" />
            <Minus v-else class="mr-2 h-4 w-4" />
            解除</Button
          >
        </template>
        <template v-else>
          <Button @click="handleRegister(lecture.id)">
            <Loader2 v-if="isLoading" class="mr-2 h-4 w-4 animate-spin" />
            <Plus v-else class="mr-2 h-4 w-4" />
            登録</Button
          >
        </template>
      </div>
    </div>
  </main>
</template>
