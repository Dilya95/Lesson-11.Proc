# Домашнее задание 12: Управление процессами

## Задания
Вариант 1. Реализация аналога ps ax

Создайте скрипт, который получает информацию о процессах через файловую систему /proc.
Реализуйте вывод не менее следующих полей: PID, PPID, состояние процесса, имя или команда запуска.
Проверьте работу скрипта на запущенной системе.
Зафиксируйте пример результата работы.
🟡 Ожидаемый результат:
рабочий скрипт, выводящий список процессов по данным из /proc.


## Структура
mypst.sh - скрипт. <br>
README.md - описание ДЗ и ход выполнения.


## Выполнение
### Создаем скрипт и даем право на исполнение
```
root@otus-homework:~# nano myps.sh

root@otus-homework:~# chmod +x myps.sh
```
### Проверяем работу 
```
root@otus-homework:~# ./myps.sh | head -n 30
   PID   PPID  S COMMAND
========================================================================
     1      0  S /usr/lib/systemd/systemd --system --deserialize=24
    10      2  I [kworker/0:0H-events_highpri]
  1014      1  S /sbin/agetty -o -p -- \u --keep-baud 115200,57600,38400,9600 - vt220
  1019      1  S /sbin/agetty -o -p -- \u --noclear - linux
    12      2  I [kworker/R-mm_pe]
   127      2  S [hwrng]
    13      2  I [rcu_tasks_kthread]
  1342      2  I [kworker/R-tls-s]
    14      2  I [rcu_tasks_rude_kthread]
    15      2  I [rcu_tasks_trace_kthread]
    16      2  S [ksoftirqd/0]
    17      2  I [rcu_preempt]
   172      2  I [kworker/R-raid5]
    18      2  S [migration/0]
    19      2  S [idle_inject/0]
     2      0  S [kthreadd]
    20      2  S [cpuhp/0]
    21      2  S [kdevtmpfs]
   213      2  I [kworker/R-xfsal]
   214      2  I [kworker/R-xfs_m]
   215      2  I [kworker/R-xfs-b]
   216      2  I [kworker/R-xfs-c]
   217      2  I [kworker/R-xfs-r]
   218      2  I [kworker/R-xfs-b]
   219      2  I [kworker/R-xfs-i]
    22      2  I [kworker/R-inet_]
   220      2  I [kworker/R-xfs-l]
   221      2  I [kworker/R-xfs-c]

```
