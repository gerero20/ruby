require_relative 'test_jit'

return unless defined?(TestJIT)
return if ENV.key?('APPVEYOR')
return if ENV.key?('RUBYCI_NICKNAME')
return if ENV['RUBY_DEBUG']&.include?('ci') # ci.rvm.jp
return if /mswin/ =~ RUBY_PLATFORM

class TestJITDebug < TestJIT
  def setup
    # let `#eval_with_jit` use --jit-debug
    @jit_debug = true
  end
end
