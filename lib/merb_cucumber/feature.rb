$main = self

module Merb
  module Test
  
    module DataMapperWorld
      
      def self.included(base)
        
        $main.Before do
          # Getting all the adapters configured in DataMapper
          @__transactions__ = DataMapper::Repository.adapters.values.map do |adapter|
            transaction = DataMapper::Transaction.new(adapater)
            transaction.begin
            transaction
          end
        end
        
        $main.After do
          @__transactions__.each { |transaction| transaction.rollback }
        end
        
      end
      
    end
  
    module ActiveRecordWorld
      
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
  
    class World
      include Merb::Test::ControllerHelper
      include Merb::Test::RouteHelper
      include Merb::Test::ViewHelper
    
      if defined?(Merb.orm == :datamapper)
        include DataMapperWorld
      elsif defined?(Merb.orm == :activerecord)
        include ActiveRecordWorld
      end
      
    end
    
  end
end

World do
  Merb::Test::World.new
end
