require 'cucumber/rake/task'

module Merb
  module Cucumber
    
    class Task

      attr_accessor :libs
      attr_accessor :step_list
      attr_accessor :step_glob
      attr_accessor :feature_list
      attr_accessor :feature_glob
      attr_accessor :cucumber_opts
      attr_accessor :rcov
      attr_accessor :rcov_opts
      attr_accessor :directory
      
      def self.default_binary
        Merb.root / 'bin' / 'cucumber'
      end
      
      def self.default_library
        ::Cucumber::Rake::Task::LIB
      end
      
      def initialize
         @cucumber_opts = "--format pretty"
         @libs          = []
         @directory     = "features"
         @feature_glob  = "features/**/*.feature" if feature_glob.nil? && feature_list.nil?
         @step_glob     = "features/**/*.rb"      if step_glob.nil?    && step_list.nil?

         yield(self) if block_given?
         
         define_features_task
         define_feature_task
      end
      
      protected
      
      def define_features_task
        namespace :cucumber do
          desc("Run all the features")
          task "features:all" do
            lib_args     = ["%s" % ([self.class.default_library] | libs).join(File::PATH_SEPARATOR)]
            cucumber_bin = ["%s" % (self.class.default_binary)]
            cuc_opts     = [cucumber_opts]
            
            step_files.each do |step|
              cuc_opts << "--require"
              cuc_opts << step
            end
            
            if rcov
              args = (['-I'] + lib_args + ['-S', 'rcov'] + rcov_opts + cucumber_bin + ['--'] + cuc_opts + feature_file).flatten
            else
              args = (['-I'] + lib_args + cucumber_bin + cuc_opts + feature_file).flatten
            end
            ruby(args.join(" ")) # ruby(*args) is broken on Windows
          end
        end
      end
      
      def define_feature_task
        namespace :cucumber do
          desc("Run the given feature.  cucumber:feature[feature_name]")
          task(:feature, :feature_name) do |t, args|
            lib_args    = ["%s" % ([self.class.default_library] | libs).join(File::PATH_SEPARATOR)]
            cucumber_bin = ["%s" % (self.class.default_binary)]
            cuc_opts     = [cucumber_opts]
            
            step_files.each do |step|
              cuc_opts << "--require"
              cuc_opts << step
            end
            
            if rcov
              args = (['-I'] + lib_args + ['-S', 'rcov'] + rcov_opts + cucumber_bin + ['--'] + cuc_opts + feature_file).flatten
            else
              args = (['-I'] + lib_args + cucumber_bin + cuc_opts + feature_file(args.feature_name)).flatten
            end
            
            ruby(args.join(" ")) # ruby(*args) is broken on Windows
          end
        end
      end
    
      def feature_file(feature = nil)
        if feature
          FileList[File.join("#{directory}", "**", "#{feature}.feature")]
        else
          result = []
          result |= Array(feature_list) if feature_list
          result |= FileList[feature_glob] if feature_glob
        end
      end
      
      def step_files
        result = []
        result |= Array(step_list) if step_list
        result |= FileList[step_glob] if step_glob
      end
      
    end
    
  end
end
    