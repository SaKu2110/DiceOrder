module Order

    module_function

    def showPattern(options, data)
        print "1回目\n"
        count = 0
        data['card'][options[:first_group]].each do |s|
            data['dice'][options[:first_eyes][count].to_i - 1].each do |e|
                print "#{s}:#{e}\t"
            end
            count += 1
            print "\n"
        end

        print "2回目\n"
        count = 0
        data['card'][options[:second_group]].each do |s|
            data['dice'][options[:second_eyes][count].to_i - 1].each do |e|
                print "#{s}:#{e}\t"
            end
            count += 1
            print "\n"
        end
    end
end