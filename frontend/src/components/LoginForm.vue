<script lang="ts">
import { defineComponent, reactive, toRefs } from 'vue'
import router from '../router'
import { AxiosResponse } from 'axios'
import { login } from '../api/auth'
import { User } from '../types/user'

export default defineComponent({
  name: 'LoginForm',
  setup() {
    const formData = reactive({
      email: '',
      password: ''
    })

    return {
      ...toRefs(formData),
      handleLogin: async () => {
        await login(formData.email, formData.password)
          .then((res: AxiosResponse<User, any> | AxiosResponse<unknown, any> | undefined) => {
            if (res?.status === 200) {
              console.log(res)
              router.push('/')
            } else {
              alert('メールアドレスかパスワードが間違っています。')
            }
          })
          .catch(() => {
            alert('ログインに失敗しました。')
          })
      }
    }
  }
})
</script>

<template>
  <div>
    <label for="email"> Email </label>
    <input v-model="email" id="Email" type="text" placeholder="Email" />
  </div>
  <div>
    <label for="password"> Password </label>
    <input v-model="password" id="password" type="password" placeholder="******************" />
  </div>
  <button @click="handleLogin()">Sign In</button>
</template>
