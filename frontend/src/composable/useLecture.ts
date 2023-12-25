import { ref } from 'vue'
import apiClient from '@/api/client'
import router from '@/router'

export default () => {
  const isLoading = ref(false)
  const unRegister = async (schedules_id: number) => {
    isLoading.value = true
    const result = await apiClient.delete(`schedules/${schedules_id}`)
    isLoading.value = false
    return result
  }

  const register = async (lecture_id: number) => {
    isLoading.value = true
    const result = await apiClient.post('schedules', {
      lecture_id: lecture_id
    })
    isLoading.value = false
    return result
  }

  const handleLectureShow = (lecture_id: number) => {
    router.push(`/lectures/${lecture_id}`)
  }

  return {
    register,
    unRegister,
    handleLectureShow,
    isLoading
  }
}
