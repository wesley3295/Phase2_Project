require './config/environment'

class Api < ActiveRecord::Base

    def self.base_url
     "https://api.sportsdata.io/v3"
    end
    
    def self.load_data
    data_of_champions
    end

    def self.data_of_champions
        response = RestClient.get(base_url + '/lol/stats/json/Champions?key=aacc8ac9a58640728208a410e55e38d0')
        data = JSON.parse(response.body)
        # data.collect do |d|
        #    key_data = d.transform_keys(&:to_sym)
           Champion.create(data)
        # end
    end
end
