#!/bin/bash
# myps.sh — упрощённый аналог команды ps ax
# Использует только /proc для получения информации о процессах

printf "%6s %6s %2s %-s\n" "PID" "PPID" "S" "COMMAND"
echo "========================================================================"

for proc in /proc/[0-9]*; do
    [ -d "$proc" ] || continue
    
    pid=$(basename "$proc")
    
    # Читаем данные из /proc/<pid>/stat
    if [ -r "$proc/stat" ]; then
        stat=$(cat "$proc/stat" 2>/dev/null)
        
        # Парсим поля stat (поля разделены пробелами)
        # Поле 1 = PID, 2 = comm (в скобках), 3 = state, 4 = PPID
        ppid=$(echo "$stat" | awk '{print $4}')
        state=$(echo "$stat" | awk '{print $3}')
        
        # Имя команды (comm)
        comm=$(echo "$stat" | awk '{print $2}' | tr -d '()')
    else
        continue
    fi
    
    # Пытаемся получить полную командную строку (cmdline)
    if [ -r "$proc/cmdline" ]; then
        cmdline=$(tr '\0' ' ' < "$proc/cmdline" 2>/dev/null | sed 's/ $//')
    else
        cmdline=""
    fi
    
    # Если cmdline пустой — используем comm в квадратных скобках
    if [ -z "$cmdline" ]; then
        command="[$comm]"
    else
        # Обрезаем слишком длинные команды для удобства чтения
        command="${cmdline:0:120}"
    fi
    
    printf "%6s %6s %2s %s\n" "$pid" "$ppid" "$state" "$command"
done
