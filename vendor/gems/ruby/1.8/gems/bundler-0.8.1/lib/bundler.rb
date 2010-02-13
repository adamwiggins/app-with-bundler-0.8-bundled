require 'pathname'
require 'logger'
require 'set'
require 'erb'
# Required elements of rubygems
require "rubygems/remote_fetcher"
require "rubygems/installer"

require "bundler/gem_bundle"
require "bundler/source"
require "bundler/finder"
require "bundler/gem_ext"
require "bundler/resolver"
require "bundler/environment"
require "bundler/dsl"
require "bundler/cli"
require "bundler/bundle"
require "bundler/dependency"
require "bundler/remote_specification"

module Bundler
  VERSION = "0.8.1"

  class << self
    attr_writer :logger, :mode

    def logger
      @logger ||= begin
        logger = Logger.new(STDOUT, Logger::INFO)
        logger.formatter = proc {|_,_,_,msg| "#{msg}\n" }
        logger
      end
    end

    def local?
      @mode == :local
    end

    def writable?
      @mode != :readonly
    end

    def remote?
      @mode == :readwrite
    end
  end

  self.mode = :readonly
end
