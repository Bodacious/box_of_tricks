guard :minitest do
  # with Minitest::Spec
  watch(%r|^spec/(.*)_spec\.rb|)
  watch(%r|^app/(.*)\.rb|)            { |m| "spec/#{m[1]}_spec.rb" }
  
  watch(%r|^lib/(.*)\.rb|)            { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r|^spec/spec_helper\.rb|)    { "rake test" }
end
