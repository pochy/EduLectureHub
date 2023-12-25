<script setup lang="ts">
import { onMounted, reactive, ref } from 'vue'
import { useRoute } from 'vue-router'
import { Clock3, GraduationCap, Loader2, Plus, Minus, CalendarDays } from 'lucide-vue-next'
import { Lecture } from '@/types'
import apiClient from '@/api/client'
import { Button } from '@/components/ui/button'
import useLecture from '@/composable/useLecture'
import { dayOfWeekLabel, periodLabel } from '@/utils/lecture'

const route = useRoute()
const { register, unRegister, isLoading } = useLecture()

const lecture = ref({} as Lecture)

const data = reactive({
  lecture: lecture
})

const handleUnRegister = async (schedules_id: number) => {
  const result = await unRegister(schedules_id)
  const respData = result.data as Lecture
  data.lecture.schedules_id = respData.id
}

const handleRegister = async (lecture_id: number) => {
  const result = await register(lecture_id)
  const respData = result.data as Lecture
  data.lecture.schedules_id = respData.id
}

onMounted(async () => {
  const res = await apiClient.get(`lectures/${route.params.id}`)
  const respData = res.data as Lecture
  data.lecture = respData
})
</script>

<template>
  <main class="container px-4 mx-auto max-w-96">
    <h1 class="text-xl font-bold">{{ data.lecture.title }}</h1>
    <p class="mt-6 mb-1">授業詳細</p>
    <table class="text-left min-w-full min-h-full">
      <tbody>
        <tr class="border-b">
          <th class="p-2 pl-0 w-20">
            <Clock3 color="#6DB632" :size="20" class="inline" />
            <span class="align-middle ml-1">講義名</span>
          </th>
          <td>{{ data.lecture.title }}</td>
        </tr>
        <tr class="border-b">
          <th class="p-2 pl-0">
            <GraduationCap color="#6DB632" :size="22" class="inline" />
            <span class="align-middle ml-1">教員</span>
          </th>
          <td>{{ data.lecture.teacher_name }}</td>
        </tr>
        <tr class="border-b">
          <th class="p-2 pl-0">
            <CalendarDays color="#6DB632" :size="20" class="inline" />
            <span class="align-middle ml-1"></span>曜日
          </th>
          <td>{{ dayOfWeekLabel(data.lecture.day_of_week) }}</td>
        </tr>
        <tr>
          <th class="p-2 pl-0">
            <Clock3 color="#6DB632" :size="20" class="inline" />
            <span class="align-middle ml-1">時限</span>
          </th>
          <td>{{ periodLabel(data.lecture.period) }}</td>
        </tr>
      </tbody>
    </table>
    <div class="text-center w-full">
      <template v-if="data.lecture.schedules_id">
        <Button
          @click="handleUnRegister(data.lecture.schedules_id)"
          class="bg-white border-[#51c85f] border-2 text-[#51c85f] hover:bg-[#51c85f] hover:text-white"
        >
          <Loader2 v-if="isLoading" class="mr-2 h-4 w-4 animate-spin" />
          <Minus v-else class="mr-2 h-4 w-4" />
          解除</Button
        >
      </template>
      <template v-else>
        <Button @click="handleRegister(data.lecture.id)">
          <Loader2 v-if="isLoading" class="mr-2 h-4 w-4 animate-spin" />
          <Plus v-else class="mr-2 h-4 w-4" />
          登録</Button
        >
      </template>
    </div>
  </main>
</template>
