#!/bin/bash
check_s=0
re='^[0-9]+$'
echo "Автор: Калжан Касымхан"
echo ""
echo "Название программы: Поиск файлов"
echo ""
echo "Программа ищет файл по двум параметрам:"
echo "1) По названию файла"
echo "2) По размеру файла"
echo "Все это она выполняеть с помощью команды find,которая служит для поиска файлов"
echo ""
echo "Хотите попробовать?"
echo "Для запуска введите 0"
echo "Для отмены введите 1"
read -n 1 check

# для проверки пустого значенияt
if [ "$check" ]
then
    echo ""
else
    echo ""
    check_s=1
fi

if [ "$check_s" -eq 1 ]
then
    check=2
fi

if ! [[ $check =~ $re ]]
then
    check=2
fi
 
# Проверка до момента правильного ввода
while [ $check -ne 1 ] && [ $check -ne 0 ];
do 
    echo "Вы вели неверно повтори еще раз"
    read -n 1  check
    if [ $check ]
    then
        echo ""
        check_s=0
    else
        echo ""
        check_s=1
    fi

    if [ "$check_s" -eq 1 ]
    then
        check=2
    fi
    
    if ! [[ $check =~ $re ]]
    then
        check=2
    fi

done

# Основной цикл работы
while [ $check -eq 0 ]
do
echo "Выберите действия которые вы хотите сделать"
echo "1) Для поиск файла по имени нажмите 1"
echo "2) Для поиск файла по размеру нажмите 2"
read -n 1  type_find
echo ""
if ! [[ $type_find =~ $re ]]
then
    echo "Повторите еще раз"
    continue
fi

if [[ "$type_find" = "1" ]]
then
    echo "Выберите каталог в котором будете искать"
    read path
    echo "Введите название файла который ищете:"
    criteria="-iname"
    p="*"
    t=""
elif [[ "$type_find" = "2" ]]
then
    echo "Выберите каталог в котором будете искать"
    read path
    echo "Введите минимальный размер файла в  формате 1G,0.5c,5k и тд. Где:"
    echo "c — Байт"
    echo "k — Кбайт"
    echo "M — Мбайт"
    echo "G — Гбайт"
    criteria="-size"
    p="+"
    t=""
else
    echo "Выберите правильно"
    continue
fi



read file
echo ""
echo "Результат команда find:"
result="find $path $criteria \"$p$file$t\""
result=$(eval $result) 
if [ "$result" ] && [ $? -eq 0 ] 
then
    echo "$result"
else
    echo "Не нашел файлы((("
fi 
echo ""
echo ""
echo "Хотите найти еще файл?"
echo "Для выхода введите любой символ"
echo "ДЛя продолжения нажмит enter"
read status_dialog
if [ "$status_dialog" ]
then
    check=1
else 
    echo ""
fi
done
echo "Рад был помочь"
