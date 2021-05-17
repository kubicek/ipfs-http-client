# frozen_string_literal: true

module Ipfs
  module Commands
    class DagGet < Ipfs::Commands::Base
      def self.call(client, cid)
        response = request(client, "/dag/get", {params: {arg: cid}})
        parse(response.body)
      end
    end
  end
end
