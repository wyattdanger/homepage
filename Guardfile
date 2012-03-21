group :specs do
  guard :rspec, :all_on_start => false, :all_after_pass => false, :cli => '--fail-fast --format doc -c -r ./lib/* -r ./site.rb' do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})                { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^site\.rb$})                    { |m| "spec/site_spec.rb" }
  end
end
