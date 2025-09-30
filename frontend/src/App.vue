<template>
  <div class="app-container">
    <!-- 灰色遮罩 -->
    <div v-if="activeDropdown" class="page-overlay" @click="closeDropdown"></div>

    <!-- 顶部导航栏 -->
    <header class="navbar">
      <div class="nav-container">
        <div class="logo">Inspirational</div>

        <nav class="desktop-nav">
          <!-- 关于我们下拉 -->
          <div class="dropdown" @click.stop="toggleDropdown('about')">
            <span class="nav-link">
              关于我们
              <span class="arrow" :class="{ 'active': activeDropdown === 'about' }"></span>
            </span>
            <div v-if="activeDropdown === 'about'" class="dropdown-content">
              <h4>关于我们</h4>
              <p>公司简介</p>
              <p>团队介绍</p>
              <p>发展历程</p>
            </div>
          </div>

          <!-- 联系我们下拉 -->
          <div class="dropdown" @click.stop="toggleDropdown('contact')">
            <span class="nav-link">
              联系我们
              <span class="arrow" :class="{ 'active': activeDropdown === 'contact' }"></span>
            </span>
            <div v-if="activeDropdown === 'contact'" class="dropdown-content">
              <h4>联系我们</h4>
              <p>邮箱: support@example.com</p>
              <p>电话: 123-456-7890</p>
              <p>在线客服</p>
            </div>
          </div>
        </nav>
      </div>
    </header>

    <!-- 主体内容 -->
    <main class="container">
      <div class="left">
        <h2 class="discount">
            Up to <span class="highlight">75%</span> off Website builder
        </h2>
        <h1 class="title">Create a website with ease</h1>
        <ul class="features">
          <li><span class="check">✔</span> Free domain name</li>
          <li><span class="check">✔</span> Build your site fast, with AI</li>
          <li><span class="check">✔</span> 24/7 live customer support</li>
        </ul>
          <div>
            <button class="start-btn" @click="fetchMessage">Start now</button>
            <p v-if="backendMsg">{{ backendMsg }}</p>
          </div>
      </div>
      <div class="right">
        <img src="../files/demo-picture.png" alt="demo" />
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

const activeDropdown = ref('')
const backendMsg = ref('')

function toggleDropdown(name) {
  activeDropdown.value = activeDropdown.value === name ? '' : name
}

function closeDropdown() {
  activeDropdown.value = ''
}

async function fetchMessage() {
  const res = await axios.get('/api/offer')
  backendMsg.value = res.data.message
}

</script>

<style>
body {
  margin: 0;
  font-family: Arial, sans-serif;
}

/* 整个页面容器 */
.app-container {
  position: relative;
}

/* 整页灰色遮罩 */
.page-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.3);
  z-index: 1000;
}

/* 顶部导航栏 */
.navbar {
  background-color: white;
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
  position: sticky;
  top: 0;
  z-index: 1002; /* 高于遮罩 */
}

.nav-container {
  display: flex;
  align-items: center;
  padding: 15px 40px;
  gap: 40px;
}

.logo {
  font-size: 1.5rem;
  font-weight: 700;
  color: #5a2dff;
}

/* 导航栏左对齐 */
.desktop-nav {
  display: flex;
  gap: 20px;
  align-items: center;
}

/* 导航标签 */
.nav-link {
  cursor: pointer;
  font-size: 15px;
  font-weight: 500;
  color: #333;
  display: flex;
  align-items: center;
  gap: 4px;
  user-select: none;
}

/* 下拉箭头 - 两条线交叉组成倒三角 */
.arrow {
  display: inline-block;
  width: 12px;
  height: 12px;
  position: relative;
}

.arrow {
  display: inline-block;
  width: 0;
  height: 0;
  border-left: 6px solid transparent;
  border-right: 6px solid transparent;
  border-top: 6px solid currentColor; /* 箭头颜色 */
  vertical-align: middle;
  margin-left: 4px; /* 与文字的间距 */
}

/* 可选：悬停效果 */
.arrow:hover {
  border-top-color: #5a2dff; /* 悬停时变色 */
}

/* 下拉框 */
.dropdown {
  position: relative;
  z-index: 1003; /* 高于遮罩 */
}

.dropdown-content {
  position: absolute;
  top: 40px;
  left: 0;
  background: white;
  padding: 30px;
  box-shadow: 0 12px 24px rgba(0,0,0,0.2);
  border-radius: 10px;
  min-width: 300px; /* 增大窗口宽度 */
  max-width: 500px; /* 设置最大宽度 */
}

/* 下拉框内容 */
.dropdown-content h4 {
  margin: 0 0 15px 0;
  font-size: 18px;
  color: #5a2dff;
}

.dropdown-content p {
  margin: 8px 0;
  cursor: pointer;
  font-size: 14px;
  color: #333;
}

.dropdown-content p:hover {
  color: #5a2dff;
}

/* 主体内容 */
.container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 60px 40px;
  max-width: 1200px;
  margin: 0 auto;
}

.left {
  max-width: 50%;
}

.discount {
  color: rgb(0, 0, 0);
  font-size: 18px;
  margin-bottom: 10px;
}

.discount .highlight {
  color: #5a2dff; /* 紫色 */
  font-weight: bold;
}

.title {
  font-size: 36px;
  font-weight: bold;
  color: #5a2dff;
  margin-bottom: 20px;
}

.features {
  list-style: none;
  padding: 0;
  margin-bottom: 20px;
}

.features li {
  margin-bottom: 12px; /* 数字越大，间距越大，可以自己调 */
  font-size: 16px;     /* 可选，顺便让文字更清晰 */
  line-height: 1.6;    /* 增加行高 */
}

.features .check {
  color: #28a745; /* 绿色，可以改成你喜欢的 */
  font-weight: bold;
  margin-right: 6px;
}

.start-btn {
  background-color: #5a2dff;
  color: white;
  padding: 12px 24px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
}

.right img {
  max-width: 400px;
  border-radius: 8px;
}
</style>
