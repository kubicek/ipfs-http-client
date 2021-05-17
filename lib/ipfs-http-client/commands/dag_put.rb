# frozen_string_literal: true

module Ipfs
  module Commands
    class DagPut < Ipfs::Commands::Base
      def self.call(client, data)
        io = StringIO.new data.to_json
        response = request(client, "/dag/put", {form: {file: HTTP::FormData::File.new(io)}})
        parse(response.body)
      end
    end
  end
end
