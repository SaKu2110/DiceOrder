require 'json'

module Order

    module_function

    def showGroups(data)
        12.times do |count|
            if count < 9
                print " #{count + 1}: #{data['groups'][count]}"
            else
                print "#{count + 1}: #{data['groups'][count]}"
            end
            print "\t#{count + 13}: #{data['groups'][count + 12]}\n"
        end
        print "\n"
    end
    # 被験者の実験パターン入力
    def setGroup(options)
        hash = ["first_group", "second_group"]
        msg = ["first", "second"]
        flag = true
        2.times do |n|
            while flag == true
                print "\rSet #{msg[n]} subject group: "
                options[:"#{hash[n]}"] = gets.chomp.to_i - 1
                flag = false if options[:"#{hash[n]}"] > -1 && options[:"#{hash[n]}"] < 24
            end
            flag = true
        end
    end

    # サイコロの出目を入力 合計8回
    def diceCount(options)
        hash = ["first_eyes", "second_eyes"]
        msg = ["first", "second"]
        flag = true
        print "\nEnter the dice eye 8 times. (1 - 6)\n"
        print "(Recommended: separated by `,`)\n"
        2.times do |n|
            dice = []
            eye = []
            while flag == true
                print "#{msg[n]}: "
                dice = gets.chomp.to_s.split(',')
                dice = dice.select {|num| num.to_i > 0 && num.to_i < 7} 
                flag = false if dice.length == 4
            end
            options[:"#{hash[n]}"] = dice
            flag = true
        end
    end
end