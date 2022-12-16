module WorksHelper
    def set_male(male)
      case male
        when 'women'
           0
        when 'man'
           1
      end
    end
end
