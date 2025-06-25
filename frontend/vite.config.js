import tailwindcss from '@tailwindcss/vite';
import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
	plugins: [tailwindcss(), sveltekit()],
	server: {
		host: '0.0.0.0',
		strictPort: true,
		port: 3000,
		hmr: { protocol: 'ws', host: 'localhost' },
		watch: { usePolling: true, interval: 100 }
	}
});
