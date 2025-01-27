# frozen_string_literal: true

require 'ipfs-http-client/commands'

module Ipfs
  class Client
    DEFAULT_ENDPOINT = 'http://localhost:5001'.freeze
    API_VERSION = 'v0'.freeze

    attr_reader :endpoint

    def self.default
      new(DEFAULT_ENDPOINT)
    end

    def initialize(endpoint)
      @endpoint = endpoint
    end

    def base_url
      "#{endpoint}/api/#{API_VERSION}"
    end

    def ls(node)
      Commands::Ls.call self, node
    end

    def id(peer_id = nil)
      Commands::Id.call self, peer_id
    end

    def cat(node)
      Commands::Cat.call self, node
    end

    def cat_to_file(node, path)
      Commands::CatToFile.call self, node, path
    end

    def add(file)
      Commands::Add.call self, file
    end

    def add_dir(dir)
      Commands::AddDir.call self, dir
    end

    def log_level(subsystem, level)
      Commands::LogLevel.call self, subsystem, level
    end

    def pin_rm(node, recursive: true)
      Commands::PinRm.call self, node, recursive: recursive
    end

    def pin_add(node, recursive: true)
      Commands::PinAdd.call self, node, recursive: recursive
    end

    def repo_gc
      Commands::RepoGc.call self
    end

    def swarm_connect(address)
      Commands::SwarmConnect.call self, address
    end

    def swarm_peers
      Commands::SwarmPeers.call self
    end

    def dag_put(data)
      Commands::DagPut.call self, data
    end

    def dag_get(cid)
      Commands::DagGet.call self, cid
    end
  end
end
