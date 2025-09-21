# 💅 BeautyMaster AI

**Профессиональное мобильное приложение для частных мастеров beauty и wellness индустрии**

## 🎯 Описание проекта

BeautyMaster AI - это комплексное решение, объединяющее CRM, календарь, финансовый учет и аналитику в премиальном дизайне для мастеров красоты.

## ✨ Основные возможности

### 🏠 Главная страница
- Приветствие с именем мастера
- Статистика текущего дня (записи, доходы)
- Карточка следующего клиента
- Напоминания о днях рождения клиентов
- Быстрые действия
- Мини-календарь недели

### 👥 CRM система
- Управление базой клиентов
- Детальные карточки с историей
- Фото до/после
- Теги и заметки
- Поиск и фильтрация

### 📅 Календарь
- Три вида: день, неделя, месяц
- Тепловая карта по доходам
- Drag & Drop записей
- Статусы записей
- Шаблоны расписания

### 💼 Бизнес
- **Услуги**: управление категориями и ценами
- **Касса**: доходы, расходы, способы оплаты
- **Статистика**: графики, отчеты, аналитика

## 🛠 Технический стек

- **Framework**: Flutter (Dart)
- **Архитектура**: Clean Architecture + BLoC pattern
- **База данных**: SQLite + Drift (offline-first)
- **State Management**: flutter_bloc + equatable
- **Dependency Injection**: GetIt + Injectable
- **Дизайн**: Glassmorphism 3.0 + Liquid Design

## 📱 Поддерживаемые платформы

- ✅ Android
- ✅ iOS (планируется)

## 🚀 Установка и запуск

### Требования
- Flutter SDK >=3.1.0
- Dart SDK >=3.1.0
- Android Studio / VS Code

### Установка
```bash
git clone https://github.com/oilwhale/beauty_master.git
cd beauty_master
flutter pub get
flutter packages pub run build_runner build
```

### Запуск
```bash
flutter run
```

## 📦 Структура проекта

```
lib/
├── core/              # Основные компоненты
│   ├── constants/     # Константы приложения
│   ├── database/      # Настройка базы данных
│   ├── di/           # Dependency Injection
│   ├── theme/        # Темы и стили
│   └── utils/        # Утилиты
├── features/         # Функциональные модули
│   ├── dashboard/    # Главная страница
│   ├── clients/      # CRM клиентов
│   ├── calendar/     # Календарь и записи
│   ├── business/     # Бизнес функции
│   └── settings/     # Настройки
└── main.dart         # Точка входа
```

## 🎨 Дизайн-система

### Цветовая палитра
- **Primary**: #FF6B9D (розовый)
- **Secondary**: #C44FEB (фиолетовый)
- **Accent**: #FF5E7E (коралловый)

### Стиль
- Glassmorphism эффекты
- Liquid формы
- Микроанимации
- Градиенты

## 📅 Этапы разработки

- [x] Настройка проекта и архитектуры
- [x] Дизайн-система и тема
- [ ] База данных и модели
- [ ] Главная страница (Dashboard)
- [ ] CRM система
- [ ] Календарь и записи
- [ ] Бизнес функции
- [ ] Настройки профиля
- [ ] Тестирование
- [ ] Публикация

## 🤝 Участие в разработке

1. Fork проекта
2. Создайте feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit изменения (`git commit -m 'Add some AmazingFeature'`)
4. Push в branch (`git push origin feature/AmazingFeature`)
5. Откройте Pull Request

## 📄 Лицензия

Этот проект лицензирован под MIT License - см. файл [LICENSE](LICENSE) для деталей.

## 📧 Контакты

Ваше имя - [@your_twitter](https://twitter.com/your_twitter) - email@example.com

Ссылка на проект: [https://github.com/your_username/beauty_master](https://github.com/your_username/beauty_master)

## 🙏 Благодарности

- [Flutter](https://flutter.dev/) - за отличный фреймворк
- [Material Design](https://material.io/) - за дизайн систему
- [Glassmorphism](https://glassmorphism.com/) - за вдохновение в дизайне
