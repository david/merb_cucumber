$main = self # This must be included in the env.rb file!

module Merb
  module Test
    module Helpers
      module DataMapper
        
        def self.included(base)

          $main.Before do
            # Getting all the adapters configured in DataMapper
            puts "\x1B[44mStarting a transaction for each repository\x1B[0m"
            @__transactions__ = ::DataMapper::Repository.adapters.values.map do |adapter|
              transaction = ::DataMapper::Transaction.new(adapter)
              transaction.begin
              transaction
            end
          end

          $main.After do
            puts "\x1B[41mDoing a Rollback of the transactions\x1B[0m"
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
