# 🧙‍♂️ Harry Potter Character App

Flutter ile geliştirilen bu mobil uygulama, Harry Potter evreninden karakterleri listeleyen ve detaylarını görüntülemenizi sağlayan bir uygulamadır. API üzerinden alınan veriler şık bir tasarımla sunulmaktadır.

---

## 📱 Özellikler

- API'den Harry Potter karakterlerini çekme (https://hp-api.onrender.com/api/characters)
- Karakter kartları halinde listeleme
- Detay sayfasında yer alan karakter bilgileri:
  - İsim
  - Resim
  - Aktör ismi
  - House
  - Tür, cinsiyet, soy
  - Saç ve göz rengi
  - Yaşayıp yaşamadığı bilgisi

---

## 🛠️ Kullanılan Teknolojiler

- Flutter
- Riverpod (state management)
- Freezed

---

## 🔧 Kurulum

Projeyi cihazınızda çalıştırmak için aşağıdaki adımları izleyebilirsiniz:

```bash
git clone https://github.com/MertKocak/harrypotter.git
cd harrypotter
flutter pub get
flutter run
