module WinesHelper
    def sort_strains(wine_strains)
        wine_strains.map { |ws| [ws.strain.name, ws.percentage]}
                    .map {|ws| "#{ws.first} (#{ws.second}%)"}
                    .sort
                    .join( ', ')  
    end
    

    def sort_enologist(wine_enologists)
        wine_enologists.map {|wo| "#{wo.enologist.name} (#{wo.score}%)"}.sort.join(', ')
    end
end
