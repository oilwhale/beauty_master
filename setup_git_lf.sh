#!/bin/bash

echo "Настройка Git для использования LF окончаний строк..."

echo ""
echo "1. Настройка глобальных параметров Git..."
git config --global core.autocrlf input
git config --global core.eol lf

echo ""
echo "2. Настройка локальных параметров для проекта..."
git config core.autocrlf input
git config core.eol lf

echo ""
echo "3. Проверка текущих настроек..."
echo "Global core.autocrlf: $(git config --global core.autocrlf)"
echo "Global core.eol: $(git config --global core.eol)"
echo "Local core.autocrlf: $(git config core.autocrlf)"
echo "Local core.eol: $(git config core.eol)"

echo ""
echo "4. Нормализация существующих файлов..."
git add --renormalize .

echo ""
echo "✅ Настройка завершена!"
echo "Все файлы теперь будут использовать LF окончания строк."
