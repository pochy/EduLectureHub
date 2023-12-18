import { createRouter, createWebHistory } from 'vue-router'
import HomeViewVue from '../views/HomeView.vue'
import LecturesViewVue from '../views/LecturesView.vue'

export const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeViewVue
    },
    {
      path: '/lectures',
      name: 'lectures',
      component: LecturesViewVue
    }
  ]
})
export default router
