require 'pry'
module FeatureFlags
  def self.search
    files = []
    features_files = {}
    all_files_in_search_dir.each do |file_path|
      fetch_features.each do |feature|
        line_num = 0
        features_files[feature.to_sym] ||= []
        open(file_path) do |f| 
          # (files << f)
          f.each_line do |line|
            line_num += 1
            features_files[feature.to_sym].push("#{file_path}:#{line_num}") if (flag_used?(feature,line))
          end
        end        
      end
    end
    features_files
  end

  def self.flag_used? feature, line
    line.scan(feature_regex(feature)).count == 2
  end

  def self.feature_regex(feature)
    /FeatureFlags|:#{feature}[^a-zA-Z0-9]/
  end

  def self.all_files_in_search_dir
    Dir::glob "#{search_dir}/**/*.*"
  end

  def self.search_dir
    Rails.root
  end

  def self.fetch_features
    Feature.pluck(:name)
  end
end