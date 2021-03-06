require 'fileutils'

base = "#{File.expand_path(File.dirname(__FILE__))}/../../"
externs_dir = base

# compile base command
cc_path = ENV['CC_PATH']
javascript_compiler_cmd = "java -jar #{cc_path}"

# do trial compilation with stringent closure compiler options
cmd ="cd #{base} &&"
cmd << javascript_compiler_cmd
cmd << " --compilation_level=ADVANCED_OPTIMIZATIONS "
cmd << " --jscomp_off=globalThis "
cmd << " --jscomp_error=checkTypes "
cmd << " --externs test/qunit-externs.js"
cmd << " --externs test/json.js"
cmd << " --externs underscore-1.4.3.js "
cmd << " --js test/1.4.3/chaining.js"
cmd << " --js test/1.4.3/arrays.js"
cmd << " --js test/1.4.3/collections.js"
cmd << " --js test/1.4.3/functions.js"
cmd << " --js test/1.4.3/objects.js"
cmd << " --js test/1.4.3/utility.js"
`#{cmd}`
compile_okay = $?.exitstatus == 0
if (!compile_okay)
  puts "** advanced compilation failed **"
end

exit(compile_okay)
