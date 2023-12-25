import path from 'path'
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src')
    }
  },
  server: {
    host: true,
    port: 5173,
    watch: {
      usePolling: true
    },
    proxy: {
      '^/api': {
        // docker-compose.ymlに記載しているbackendのIPを指定
        target: 'http://backend:3000',
        changeOrigin: true
      }
    },
    hmr: {
      path: '_vite/ws-hmr'
    }
  }
})
