module ConsultationsHelper
    def set_way(way)
      case way
        when 'phone'
          [current_user.phone, nil]
        when 'mail'
          [nil, current_user.email]
        when 'any'
          [current_user.phone, current_user.email]
      end
    end
end
