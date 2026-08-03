# notka.uz — to'liq backup

**Backup sanasi:** 2026-08-01
**Manba:** ABBA server (abbaserver) to'liq nusxasi
**Baza dump sanasi:** 2026-07-02

Saytning barcha qismlari: frontend, backend, ma'lumotlar bazasi, media fayllar va server konfiguratsiyasi.

---

## Arxitektura

| Qism | Domen | Texnologiya | Port / Socket |
|---|---|---|---|
| Frontend | `notka.uz` | Next.js 13 (React 18, MUI, i18n: uz/ru/en) | PM2 → `localhost:3002` |
| Backend API | `api.notka.uz` | Django + DRF (loyiha nomi `orzu`) | gunicorn → `unix:/run/orzu.sock` |
| Baza | — | PostgreSQL 14, baza nomi `orzudb` | `localhost:5432` |
| Web server | — | nginx + Let's Encrypt (certbot) | 80 / 443 |

---

## Papkalar tarkibi

```
1_frontend_nextjs/notka-front/   Next.js sayt kodi (.git tarixi bilan)
2_backend_django/orzu/           Django API kodi (.env bilan)
3_database/orzudb.sql            PostgreSQL dump (24 jadval, ma'lumotlar bilan)
4_media_static/media/            Yuklangan fayllar (mahsulot, banner, yangiliklar rasmlari)
4_media_static/static/           Django collectstatic natijasi
5_landing_page/                  /var/www/notka.uz statik fayllari (index.html, logo, subscribe.php)
6_server_config/nginx/           nginx konfiguratsiyalari
6_server_config/systemd/         gunicorn servis fayllari (orzu.service, orzu.socket)
6_server_config/letsencrypt/     SSL sertifikat renewal konfiglari
```

**GitHub repo (frontend):** https://github.com/ABBA-Corp/notka-front

---

## Serverga tiklash (Ubuntu 22.04)

### 1. Ma'lumotlar bazasi

```bash
sudo -u postgres psql -c "CREATE USER backend WITH PASSWORD 'yangi_parol';"
sudo -u postgres psql < 3_database/orzudb.sql
```

Dump ichida `CREATE DATABASE orzudb` va barcha jadvallar bor — baza avtomatik yaratiladi.

### 2. Backend (Django)

```bash
sudo cp -r 2_backend_django/orzu /home/Api/orzu
cd /home/Api/orzu
python3 -m venv venv
./venv/bin/pip install -r requirements/production.txt

# .env faylni tahrirlang (pastdagi "Xavfsizlik" bo'limiga qarang)
nano .env

./venv/bin/python manage.py migrate
./venv/bin/python manage.py collectstatic --noinput
```

Media va static fayllarni joyiga qo'ying:

```bash
sudo mkdir -p /var/www/api.notka.uz
sudo cp -r 4_media_static/media  /var/www/api.notka.uz/
sudo cp -r 4_media_static/static /var/www/api.notka.uz/
sudo chown -R www-data:www-data /var/www/api.notka.uz
```

Gunicorn servisni yoqish:

```bash
sudo cp 6_server_config/systemd/orzu.* /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now orzu.socket orzu.service
```

### 3. Frontend (Next.js)

```bash
sudo cp -r 1_frontend_nextjs/notka-front /home/front/notka-front
cd /home/front/notka-front
yarn install          # node_modules arxivga kiritilmagan
yarn build
pm2 start ecosystem.config.js    # 3002-portda ishga tushadi
pm2 save
```

### 4. nginx + SSL

```bash
sudo cp -r 5_landing_page/* /var/www/notka.uz/
sudo cp 6_server_config/nginx/notka.uz     /etc/nginx/sites-available/
sudo cp 6_server_config/nginx/api.notka.uz /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/notka.uz     /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/api.notka.uz /etc/nginx/sites-enabled/
sudo mkdir -p /var/log/notka.uz /var/log/api.notka.uz
sudo nginx -t && sudo systemctl reload nginx

# SSL sertifikatlarni yangi serverda qaytadan oling:
sudo certbot --nginx -d notka.uz -d www.notka.uz -d api.notka.uz
```

> SSL sertifikatlarning **maxfiy kalitlari arxivga kiritilmagan** (xavfsizlik uchun).
> Yangi serverda certbot orqali bepul qayta olinadi. `6_server_config/letsencrypt/`
> ichida faqat renewal konfiglari — namuna sifatida.

---

## ⚠️ Xavfsizlik — birinchi navbatda bajaring

`2_backend_django/orzu/.env` faylida eski serverning haqiqiy maxfiy ma'lumotlari bor.
Saytni ishga tushirishdan oldin **hammasini almashtiring**:

- `DJANGO_SECRET_KEY` — yangi tasodifiy kalit yarating
- `DATABASE_URL` — bazaning yangi paroli
- `SENTRY_DSN` — o'z Sentry loyihangiz (yoki bo'sh qoldiring)
- `DJANGO_ALLOWED_HOSTS` — o'z domeningiz

Django admin paneli manzili: `https://api.notka.uz/api/admin/`
Admin foydalanuvchilari baza dumpida saqlangan — parollarni almashtirishni unutmang.

---

## Eslatma

Eski serverdagi `/var/www/api.notka.uz/media/` papkasida boshqa loyihalarga tegishli
uchta katta zip arxivi bor edi (`platform360.zip`, `frontend.zip`, `media.zip`) —
ular notka.uz saytiga aloqador emas, shu sababli bu backupga kiritilmadi.
Saytning barcha o'z media fayllari to'liq mavjud.
