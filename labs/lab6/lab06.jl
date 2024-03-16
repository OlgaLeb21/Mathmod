using Random

# Функция для вычисления выигрышей в зависимости от выбранных стратегий
function calculate_payoffs(strategy1::Bool, strategy2::Bool)
    if strategy1 && strategy2 # оба сдали друг друга
        return (-2, -2)
    elseif strategy1 && !strategy2 # первый сдал, второй промолчал
        return (0, -3)
    elseif !strategy1 && strategy2 # первый промолчал, второй сдал
        return (-3, 0)
    else # оба промолчали
        return (-1, -1)
    end
end

# Основная функция игры
function play_game()
    strategy1 = rand([true, false]) # выбор стратегии для игрока 1 (true - сдать, false - промолчать)
    strategy2 = rand([true, false]) # выбор стратегии для игрока 2 (true - сдать, false - промолчать)
    
    payoff1, payoff2 = calculate_payoffs(strategy1, strategy2)
    
    println("Игрок 1 выбрал: ", strategy1 ? "сдать" : "промолчать")
    println("Игрок 2 выбрал: ", strategy2 ? "сдать" : "промолчать")
    println("Выигрыш игрока 1: ", payoff1)
    println("Выигрыш игрока 2: ", payoff2)
end

# Запуск игры
play_game()
