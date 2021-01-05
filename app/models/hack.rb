#  class Hack < ActiveRecord::Base
#     @champ_index = 
#  end

#  @champs.collect do |champ|
#        champ.attributes.except("ChampionId", "Name", "Title").collect do |k,v|  
#          @values = v.to_s    
#        end  
#      end  

# @champ = []
#      @champs.collect do |champ|
#            @champ << champ.attributes.except("ChampionId", "Name", "Title")  
#          end  

# binding.pry
# @champs=[]
# @values = []
# Champion.all.collect do |champ|
#     @champs << champ.attributes.except("Name", "id", "ChampionId", "Title").to_a
# @champs.each do |champ|  
#  champ.each do |k,v|
#       @values << v
#  end
# end  
# end  


# @champs=[]
# @values = []
# Champion.all.collect do |champ|
# @champs = Array.new(champ.id, champ.attributes.except("Name", "id", "ChampionId", "Title").values)