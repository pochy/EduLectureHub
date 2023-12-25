<script setup lang="ts">
import { ref } from 'vue'
import { logout } from '../api/auth'
// import router from '../router'
import { isAuthentificated } from '../utils/auth-data'
import { X } from 'lucide-vue-next'
import { Menu } from 'lucide-vue-next'

const handleLogout = () => {
  logout().then(() => {
    // router.push('/')
    location.href = '/'
  })
}

const mobileMenuOpen = ref(false)
</script>

<template>
  <header class="bg-white" v-if="isAuthentificated()">
    <nav
      class="mx-auto flex max-w-7xl items-center justify-between p-6 lg:px-8"
      aria-label="Global"
    >
      <div class="flex lg:flex-1">
        <router-link class="-m-1.5 p-1.5" to="/">
          <span class="sr-only">LESSON SCHEDULE</span>
          <img class="h-20 w-auto" src="../assets/logo.svg" alt="" />
        </router-link>
      </div>
      <div class="flex lg:hidden">
        <button
          type="button"
          class="-m-2.5 inline-flex items-center justify-center rounded-md p-2.5 text-gray-700"
          @click="mobileMenuOpen = true"
        >
          <span class="sr-only">Open main menu</span>
          <Menu class="h-6 w-6" aria-hidden="true" />
        </button>
      </div>
      <div class="hidden lg:flex lg:gap-x-12">
        <div class="relative">
          <router-link
            class="text-xl font-semibold leading-6 text-gray-900 hover:bg-[#D2F1DB] p-1.5"
            to="/schedule"
            >スケジュール</router-link
          >
          <router-link
            class="text-xl font-semibold leading-6 text-gray-900 hover:bg-[#D2F1DB] p-1.5"
            to="/lectures"
            >講義一覧</router-link
          >
        </div>
      </div>
      <div class="hidden lg:flex lg:flex-1 lg:justify-end">
        <button @click="handleLogout()">ログアウト</button>
      </div>
    </nav>
    <Dialog as="div" class="lg:hidden" @close="mobileMenuOpen = false" :open="mobileMenuOpen">
      <div class="fixed inset-0 z-10" />
      <DialogPanel
        class="fixed inset-y-0 right-0 z-10 w-full overflow-y-auto bg-white px-6 py-6 sm:max-w-sm sm:ring-1 sm:ring-gray-900/10"
      >
        <div class="flex items-center justify-between">
          <router-link class="" to="/">
            <span class="sr-only">LESSON SCHEDULE</span>
            <img class="h-20 w-auto" src="../assets/logo.svg" alt="" />
          </router-link>
          <button
            type="button"
            class="-m-2.5 rounded-md p-2.5 text-gray-700"
            @click="mobileMenuOpen = false"
          >
            <span class="sr-only">Close menu</span>
            <X class="h-6 w-6" aria-hidden="true" />
          </button>
        </div>
        <div class="mt-6 flow-root">
          <div class="-my-6 divide-y divide-gray-500/10">
            <div class="space-y-2 py-6">
              <router-link
                class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-[#D2F1DB]"
                to="/schedule"
                >スケジュール</router-link
              >
              <router-link
                class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-[#D2F1DB] p-1.5"
                to="/lectures"
                >講義一覧</router-link
              >
            </div>
            <div class="py-6">
              <button
                class="-mx-3 block rounded-lg px-3 py-2.5 text-base font-semibold leading-7"
                @click="handleLogout()"
              >
                ログアウト
              </button>
            </div>
          </div>
        </div>
      </DialogPanel>
    </Dialog>
  </header>
</template>
