import { defineConfig } from 'vite';

export default defineConfig({
  server: {
    allowedHosts: ['all', 'https://brown-tips-report.loca.lt']
  }
});