---
thumbnail: /thumbnail/display_images_in_neovim.png
title: عرض الصور في نيوفيم
pubDate: March 21 2026
tags:
  - neovim
---
### **المقدمة**
إذا كنت مستخدما لمحرر نيوفيم فستجد أنه لايدعم عرض الصورة بشكل افتراضي وبالتالي فهو يعرض الكود الخاص بها فقط وتضطر لفتحها من مدير الملفات أو برنامج آخر وهذا غير محبذ لبعض المستخدمين٬ ففي هذه المقالة سنغطي هذا الموضوع٬ وسنحل هذه المشكلة باستخدام إضافة تدعى image.nvim

### **أولا: تعريف بإضافة image.nvim**
وهي إضافة لنيوفيم تعرض الصور داخل المحرر باستخدام بروتوكول الرسومات الخاص بـ Kitty فهي تمكنك من عرض صور PNG و JPG و GIF مباشرة داخل المحرر٬ ومن الطرفيات التي تدعم هذا البروتوكول: kitty و Ghossty وكذلك Konsole. تدعم هذه اﻹضافة أيضا عرض الصور في ملفات markdown فعند كتابة:

```markdown
![وصف الصورة](./images/example.png)
```

ستظهر الصورة مباشرة تحت النص


### **ثانيا: تثبيت وإعداد اﻹضافة**
1. ### **تثبيت ImageMagick**
وهي الأداة الأساسية لمعالجة الصور:

```bash
# Debian/Ubuntu
sudo apt install imagemagick

# Arch Linux
sudo pacman -S imagemagick

# macOS
brew install imagemagick
```
 
2. ### **تثبيت اﻹضافة باستخدام lazy.nvim**
أنشئ ملف جديد `lua/plugins/image.lua`:

```lua
return {
  "3rd/image.nvim",
  build = false,
  opts = {
    backend = "kitty",
    processor = "magick_cli",
    max_height_window_percentage = 50, -- تحديد حجم الصورة الأقصى
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
    integrations = {
      markdown = {
        enabled = true, -- عرض الصور في ملفات Markdown
        clear_in_insert_mode = false,
        download_remote_images = true, -- تحميل الصور من الروابط
        only_render_image_at_cursor = false, 
        only_render_image_at_cursor_mode = "popup",
      },
    },
  },
}
```

### **ثالثا: إعدادات Tmux**

إذا كنت تستخدم **Tmux** مع Kitty، أضف هذه الإعدادات في `tmux.conf./~`:

```bash
# إعدادات image.nvim
set -gq allow-passthrough on
set -g visual-activity off
set-option -g focus-events on
```

ثم أعد تحميل الإعدادات:

```bash
tmux source-file ~/.tmux.conf
```

### **الخاتمة**
رابط اﻹضافة على github لمزيد من التفصيل 
<a href="https://github.com/3rd/image.nvim" target="_blank"><b>image.nvim<b></a>