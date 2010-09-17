#language: ru
Функционал: 75 Отладка. Перезапуск игры
  Мне, как автору, необходимо иметь возможность "прогнать" игру до её начала,
  а потом перезапустить при необходимости.

  Предыстория:
    Допустим сейчас "2010-01-01 15:00"
    И пользователем Author создана игра "Аватар"
    И игра "Аватар" черновик
    И в игре "Аватар" следующие задания:
      | Название | Код  |
      | Старт    | 1234 |
      | Финиш    | 1234 |
    И начало игры "Аватар" назначено на "2010-02-01 15:00"
    И я логинюсь как Author

  Сценарий: Автор видит ссылку на тест до начала игры.
    Допустим я захожу в профиль игры "Аватар"
    То должен увидеть "Начать тестирование"

  @dev
  Сценарий: Автор не видит ссылку на тест после того, как игра началась.
    Допустим игра "Аватар" уже начата
    Если я захожу в профиль игры "Аватар"
    То не должен видеть следующее:
      | "Начать тестирование" |

  Сценарий: Автор не видит ссылку, если игра не чернововая.
    Допустим игра "Аватар" не отмечена как черновик
    Если я захожу в профиль игры "Аватар"
    То не должен увидеть "Начать тестирование"

  Сценарий: Удачный запуск теста на черновую игру.
    Допустим я захожу в профиль игры "Аватар"
    То должен увидеть "Начать тестирование"
    Если я иду по ссылке "Начать тестирование"
    То должен увидеть "Аватар"
    И должен увидеть "Старт"
    И должен увидеть "Вернуться к редактированию игры "

  Сценарий: Автор останаливает тестирование.
    Допустим я захожу в профиль игры "Аватар"
    И иду по ссылке "Начать тестирование"
    И должен быть увидеть "Аватар"
    И должен увидеть "Старт"
    Если иду по ссылке "Вернуться к редактированию игры"
    То должен быть перенаправлен в /edit/

  Сценарий: Автор не проходит уровень 1.
    Допустим я захожу в профиль игры "Аватар"
    То должен увидеть "Начать тестирование"
    И иду по ссылке "Начать тестирование"
    И должен быть увидеть "Аватар"
    И должен увидеть "Старт"
    И я захожу в задание "Старт"
    Если я ввожу "овпл" в поле "Код"
    И нажимаю "Отправить!"
    То должен увидеть "Код неверный, вы ввели "овпл"
    И не должен видеть "Финиш"

  Сценарий: Автор проходит уровень 1.
    Допустим я захожу в профиль игры "Аватар"
    То должен увидеть "Начать тестирование"
    И иду по ссылке "Начать тестирование"
    И должен увидеть "Аватар"
    И должен увидеть "Старт"
    И я захожу в задание "Старт"
    Если я ввожу "1234" в поле "Код"
    И нажимаю "Отправить!"
    То должен увидеть "Код '1234' -- верный."
    И должен увидеть "Финиш"

  Сценарий: Автор не проходит уровень 2.
    Допустим Author на уровне "Финиш"
    Если я ввожу "овпл" в поле "Код"
    И нажимаю "Отправить!"
    То должен увидеть "Код неверный, вы ввели "овпл"

  Сценарий: Удачный прогон теста.
    Допустим Author на уровне "Финиш"
    Если я ввожу "1234" в поле "Код"
    И нажимаю "Отправить!"
    То должен увидеть "Поздравляем, вы закончили игру"
    А список победителей должен быть следующим:
      | Место | Команда  | Время финиша |
      | 1     | ОПРПО1.0 | 11:59:17     |
