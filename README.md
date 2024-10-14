# Практическая работа №6 по Программированию корпоративных систем

## Мрясова Анастасия Александровна ЭФБО-01-22

Эта практическая работа является продолжением предыдущей, с некоторым дополнением - необходимо было создать страницу Корзины и изменение Профиля.

Для создания дизайна приложения был использован инструмент Figma. Прототип:

![image](https://github.com/user-attachments/assets/2465fb34-edcb-4f0e-b07c-bd341b1a402c)
![image](https://github.com/user-attachments/assets/058b9972-13d0-4d64-ab87-3fb6b6b52b24)

### Изменения:
* Создана модель CartItem - элемент корзины, в которой указаны название, фото напитка, цена за 1 штуку, а также его опции - количество, температура и объем
* Добавлена функция изменения профиля при нажатии на иконку карандаша возле имени пользователя
* Добавлена страница Корзины, в ней можно посмотреть и отредактировать свой заказ - изменить количество напитков, при необходимости удалить некоторые позиции
* Добавлена функция добавления напитка в корзину. При нажатии на кнопку "В корзину" на странице напитка появляется нижнее всплывающее окно с опциями для напитка

### Особенности:
* При удалении напитка он удаляется так же и из корзины, если он там был
* После добавления напитка в корзину появляется уведомление SnackBar
* При добавлении одного и того же напитка в корзину двумя разными действиями, не появится 2 разные позиции - увеличится только количество первой
* Позиции из корзины можно удалить с помощью уменьшения количества товара до нуля или свайпа справа налево
* Карточка товара в корзине вынесена в отдельный компонент CartItemCard, так же как и кнопки уменьшения/увеличения количества - Incrementor

### Демонстрация работы:

https://github.com/user-attachments/assets/1f54a8fa-0452-4dee-9635-408a7a93e04e



