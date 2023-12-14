import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  server: {
    host: true,
    port: 5173,
    proxy: {
      "^/api": {
        // docker-compose.ymlに記載しているbackendのIPを指定
        target: "http://backend:3000",
        changeOrigin: true,
      },
    },
  },
});
