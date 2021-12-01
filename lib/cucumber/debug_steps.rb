require 'coderay'
require 'htmlbeautifier'

unless defined?(Debugger) || defined?(Byebug) || defined?(binding.break)
  $stderr.puts("WARNING: cucumber-debug-steps requires a ruby debugger, please install debugger, byebug or debug")
end

module DebugStepsHelper
  def peek
    print CodeRay.scan(HtmlBeautifier.beautify(page.source), :html).term, "\n"
  end
end
World(DebugStepsHelper)

Then "peek" do
  peek
end

Then "debug" do
  debugger
  1
end
