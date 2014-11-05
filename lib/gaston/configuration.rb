# encoding: utf-8
class Gaston
  class Configuration

    class << self

      attr_reader :files, :env

      # Define a configure block.
      #
      # @example
      #   Gaston.configure do |config|
      #     config.env = :test
      #     config.files = Dir[Rails.root.join("config/libraries/**/*.rb"]
      #   end
      #
      # @param [ Proc ] block The block getting called.
      #
      # @since 0.0.1
      #
      def configure(&block)
        default_values!
        yield self
      end

      def files=(files)
        @files.concat files
        Gaston.instance.instance_variable_set '@store', nil
        Gaston.instance.instance_variable_set '@hash_from_files', nil
        @files
      end

      def reset_files
        @files = []
      end

      def env=(env)
        if env
          @env = env
        end
        @env
      end

      private

      # Set default values
      #
      # @since 0.0.1
      #
      def default_values!
        @files ||= []
        @env = :development
      end

    end # self
  end # Configuration
end #Gaston
