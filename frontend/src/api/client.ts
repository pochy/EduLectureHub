import { getAuthDataFromStorage, removeAuthDataFromStorage } from '@/utils/auth-data'
import axios from 'axios'
import { logout } from './auth'

export const client = axios.create({
  baseURL: '/api'
})

client.interceptors.request.use((config) => {
  const auth = getAuthDataFromStorage()
  console.log('Auth', auth)
  if (auth['access-token']) {
    Object.entries(auth).forEach(([key, value]) => {
      config.headers.set(key, value)
    })
  }
  return config
})

client.interceptors.response.use(
  (response) => {
    return response
  },
  (error) => {
    switch (error.response?.status) {
      case 401:
        removeAuthDataFromStorage()
        location.href = '/'
        console.log('401')
        break
      default:
        break
    }
    return Promise.reject(error)
  }
)

export default client
