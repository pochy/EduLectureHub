import { createRouter, createWebHistory } from 'vue-router'
import HomeViewVue from '../views/HomeView.vue'
import LecturesViewVue from '../views/LecturesView.vue'
import LectureDetailVue from '../views/LectureDetailView.vue'
import { isAuthentificated } from '../utils/auth-data'
import ScheduleViewVue from '@/views/ScheduleView.vue'

export const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeViewVue
    },
    {
      path: '/schedule',
      name: 'schedule',
      component: ScheduleViewVue,
      meta: { requiresAuth: true }
    },
    {
      path: '/lectures',
      name: 'lectures',
      component: LecturesViewVue,
      meta: { requiresAuth: true }
    },
    {
      path: '/lectures/:id',
      name: 'lecture-detail',
      component: LectureDetailVue,
      meta: { requiresAuth: true }
    }
  ]
})

router.beforeEach(async (to) => {
  if (to.meta.requiresAuth && !isAuthentificated()) {
    return { name: 'login' }
  }
  if (to.name === 'home' && isAuthentificated()) {
    return { name: 'schedule' }
  }
})

export default router
