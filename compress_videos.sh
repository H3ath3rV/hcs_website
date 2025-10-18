#!/bin/bash

# Video Compression Script for His Church School Website
# This script will create optimized versions of your hero videos

echo "🎬 Video Compression Script for His Church School Website"
echo "=================================================="

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "❌ FFmpeg is not installed. Please install it first:"
    echo "   macOS: brew install ffmpeg"
    echo "   Ubuntu: sudo apt install ffmpeg"
    echo "   Windows: Download from https://ffmpeg.org/"
    exit 1
fi

# Create optimized directory
mkdir -p images/optimized

echo "📹 Compressing desktop video (1920x1080)..."
# Desktop video - High quality but smaller file size
ffmpeg -i images/hero_video_1920x1080.mp4 \
    -c:v libx264 \
    -preset slow \
    -crf 23 \
    -maxrate 2M \
    -bufsize 4M \
    -c:a aac \
    -b:a 128k \
    -movflags +faststart \
    -pix_fmt yuv420p \
    images/optimized/hero_video_1920x1080_optimized.mp4

echo "📱 Compressing mobile video..."
# Mobile video - Lower bitrate for faster loading
ffmpeg -i images/hero_video_mobile.mp4 \
    -c:v libx264 \
    -preset slow \
    -crf 25 \
    -maxrate 1M \
    -bufsize 2M \
    -c:a aac \
    -b:a 96k \
    -movflags +faststart \
    -pix_fmt yuv420p \
    images/optimized/hero_video_mobile_optimized.mp4

echo "✅ Video compression complete!"
echo ""
echo "📊 File size comparison:"
echo "Original desktop video: $(du -h images/hero_video_1920x1080.mp4 | cut -f1)"
echo "Optimized desktop video: $(du -h images/optimized/hero_video_1920x1080_optimized.mp4 | cut -f1)"
echo ""
echo "Original mobile video: $(du -h images/hero_video_mobile.mp4 | cut -f1)"
echo "Optimized mobile video: $(du -h images/optimized/hero_video_mobile_optimized.mp4 | cut -f1)"
echo ""
echo "🔄 To use the optimized videos:"
echo "1. Replace the original files with the optimized ones"
echo "2. Or update the HTML to point to the optimized versions"
echo ""
echo "💡 Additional optimization tips:"
echo "- Consider creating WebM versions for even better compression"
echo "- Use a CDN for faster global delivery"
echo "- Implement lazy loading for non-critical videos"
