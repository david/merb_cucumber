$main = self # This must be included in the env.rb file!

module Merb
  module Test
    module Helpers
      module DataMapper
        
        def self.included(base)

          $main.Before do
            # Getting all the adapters configured in DataMapper
            @__transactions__ = ::DataMapper::Repository.adapters.values.map do |adapter|
              transaction = ::DataMapper::Transaction.new(adapter)
              transaction.begin
              transaction
            end
          end

          $main.After do
            @__transactions__.each { |transaction| transaction.rollback }
          end

        end
        
      end
    end
    
    module World
      module Base
        include Helpers::DataMapper
      end
    end
  end
end
