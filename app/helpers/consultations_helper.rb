module ConsultationsHelper
    def set_ways(way)
      case way
        when 'phone'
          0
        when 'mail'
          1
        when 'any'
          2
      end
    end

    def set_info
      [current_user.phone, current_user.email]
    end
end
