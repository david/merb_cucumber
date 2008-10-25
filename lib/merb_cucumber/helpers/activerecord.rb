$main = self # This must be included in the env.rb file!

module Merb
  module Test
    module Helpers
      module ActiveRecord

        def self.included(base)

            # Let's set a transaction on the ActiveRecord connection when starting a new scenario
            $main.Before do
              if ActiveRecord::Base.connection.respond_to?(:increment_open_transactions)
                ActiveRecord::Base.connection.increment_open_transactions
              else
                ActiveRecord::Base.send :increment_open_transactions
              end
              ActiveRecord::Base.connection.begin_db_transaction
            end

            # Going with a rollback after every step in the scenario is executed
            $main.After do
              ActiveRecord::Base.connection.rollback_db_transaction
              if ActiveRecord::Base.connection.respond_to?(:decrement_open_transactions)
                ActiveRecord::Base.connection.decrement_open_transactions
              else
                ActiveRecord::Base.send :decrement_open_transactions
              end
            end

        end

      end
    end
    
    module World
      module Base
        include Helpers::ActiveRecord
      end
    end
  end
end
