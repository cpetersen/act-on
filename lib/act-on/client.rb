require "rest-client"
require "json"

module ActOn
  class Client    
    def initialize(options={})
    end

    def authenticate_url
      [ActOn.url, "token"].join("/")
    end

    def authenticate
      params = {
        grant_type: "password",
        username: ActOn.username,
        password: ActOn.password,
        client_id: ActOn.client_id,
        client_secret: ActOn.client_secret
      }
      response = post(authenticate_url, params)
      raise response unless response["error"].nil?
      ActOn.access_token = response["access_token"]
    end

    def lists_url
      [ActOn.url, "api", "1", "list"].join("/")
    end

    def lists
      get(lists_url)
    end

    def create_contact_url(list_id)
      [ActOn.url, "api", "1", "list", list_id, "record"].join("/")
    end

    def create_contact(list_id, contact)
      headers = { 
        "Authorization" => "Bearer #{ActOn.access_token}",
        :content_type => "application/json"
      }
      post(create_contact_url(list_id), contact.to_json, headers)
    end

    def get(url, params={})
      JSON.parse(
        RestClient.get("#{url}?#{params.collect { |k,v| "#{k}=#{v.to_s.gsub(" ","+")}"}.join("&")}", { "Authorization" => "Bearer #{ActOn.access_token}" })
      )
    end

    def post(url, params, headers={})
      JSON.parse(
        RestClient.post(url, params, headers)
      )
    end
  end
end