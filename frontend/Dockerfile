# --- Stage 1: Build artifacts using Bun ---
    FROM oven/bun:1 AS builder
    WORKDIR /app
    
    # Copy lockfile and manifest
    COPY bun.lockb package.json ./
    
    # Install all dependencies fast with Bun
    RUN bun install
    
    # Copy the rest of your source
    COPY . .
    
    # Run your build script (adjust to your setup)
    RUN bun run build
    
    # --- Stage 2: Final image with Node.js runtime ---
    FROM node:18-alpine AS runtime
    WORKDIR /app
    
    # Copy only production dependencies using extracted node_modules
    COPY --from=builder /app/node_modules ./node_modules
    COPY --from=builder /app/package.json ./
    
    # Copy built output
    COPY --from=builder /app/build ./build
    
    # Expose port (adjust if needed)
    EXPOSE 3000
    ENV NODE_ENV=production
    
    CMD ["node", "build"]
    