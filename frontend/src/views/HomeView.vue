<script setup lang="ts">
import { onMounted, ref } from 'vue'
import axios from 'axios'
import UserAuthForm from '../components/UserAuthForm.vue'

const message = ref<string>('')
onMounted(async () => {
  const res = await axios.get('api')
  message.value = res.data.message
})
</script>

<template>
  <main>
    <div
      class="container relative h-screen flex-col items-center justify-center grid lg:max-w-none lg:grid-cols-2 lg:px-0"
    >
      <div class="relative hidden h-full flex-col bg-muted p-10 text-white dark:border-r lg:flex">
        <div class="absolute inset-0 bg-[#D2F1DB]" />
        <div class="relative h-full w-full z-20 flex justify-center items-center">
          <img class="h-60 w-auto" src="../assets/logo.svg" alt="Lesson Schedule" />
        </div>
      </div>
      <div class="lg:p-8">
        <div class="mx-auto flex w-full flex-col justify-center space-y-6 sm:w-[350px]">
          <div class="flex flex-col space-y-2 text-center">
            <h1 class="text-2xl font-semibold tracking-tight">ログイン</h1>
            <p class="text-sm text-muted-foreground">
              メールアドレスとパスワードを入力してください。
            </p>
          </div>
          <UserAuthForm />
        </div>
      </div>
    </div>
  </main>
</template>
