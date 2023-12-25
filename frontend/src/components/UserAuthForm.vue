<script setup lang="ts">
import { ref } from 'vue'
import { Loader2 } from 'lucide-vue-next'

// import router from '../router'
import { AxiosResponse } from 'axios'
import { cn } from '@/lib/utils'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { login } from '../api/auth'
import { User } from '../types/user'

const isLoading = ref(false)
interface LoginForm {
  email: string
  password: string
}

const loginForm = ref<LoginForm>({
  email: 'test@example.com',
  password: 'password1'
})
async function onSubmit(event: Event) {
  event.preventDefault()
  isLoading.value = true

  // setTimeout(() => {
  //   isLoading.value = false
  // }, 3000)
  await login(loginForm.value.email, loginForm.value.password)
    .then((res: AxiosResponse<User, any> | AxiosResponse<unknown, any> | undefined) => {
      if (res?.status === 200) {
        console.log(res)
        // router.push('/schedule')
        location.href = '/'
      } else {
        alert('メールアドレスかパスワードが間違っています。')
      }
    })
    .catch(() => {
      alert('ログインに失敗しました。')
    })
    .finally(() => {
      isLoading.value = false
    })
}
</script>

<template>
  <div :class="cn('grid gap-6', $attrs.class ?? '')">
    <form @submit="onSubmit">
      <div class="grid gap-2">
        <div class="grid gap-1">
          <Label class="sr-only" for="email"> Email </Label>
          <Input
            id="email"
            placeholder="name@example.com"
            type="email"
            auto-capitalize="none"
            auto-complete="email"
            auto-correct="off"
            :disabled="isLoading"
            v-model="loginForm.email"
            required
          />
        </div>
        <div class="grid gap-1">
          <Label class="sr-only" for="password"> Password </Label>
          <Input
            id="password"
            placeholder="password"
            type="password"
            auto-capitalize="none"
            auto-complete="password"
            auto-correct="off"
            :disabled="isLoading"
            v-model="loginForm.password"
            required
          />
        </div>
        <Button :disabled="isLoading">
          <Loader2 v-if="isLoading" class="mr-2 h-4 w-4 animate-spin" />
          ログイン
        </Button>
      </div>
    </form>
  </div>
</template>
