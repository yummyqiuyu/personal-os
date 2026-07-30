# 小悠 · Personal OS

AI 驱动的人生操作系统。

## 部署步骤

### 1. 在 Supabase 中执行 SQL 建表

打开 Supabase Dashboard → SQL Editor → 粘贴 `init.sql` 中的内容 → 点击 Run。

### 2. 在 GitHub 创建仓库

1. 登录 GitHub → 点击右上角 **+** → **New repository**
2. Repository name 填 `personal-os`
3. 选择 **Public**（GitHub Pages 需要）
4. 点击 **Create repository**

### 3. 推送代码到 GitHub

在本地终端执行：

```bash
cd /path/to/personal-os-repo
git add .
git commit -m "Initial commit: Personal OS v1.0"
git remote add origin https://github.com/yummyqiuyu/personal-os.git
git branch -M main
git push -u origin main
```

### 4. 开启 GitHub Pages

1. 打开仓库页面 → Settings → Pages（左侧菜单）
2. Source 选择 **Deploy from a branch**
3. Branch 选择 **main** / **root**
4. 点击 Save
5. 等待 1-2 分钟，访问 `https://yummyqiuyu.github.io/personal-os`

## 技术栈

- 前端：纯 HTML/CSS/JS（无框架）
- 后端：Supabase（Auth + PostgreSQL）
- 部署：GitHub Pages（免费 CDN）
- 天气 API：Open-Meteo（免费）
