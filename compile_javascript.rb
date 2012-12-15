require 'fileutils'

base_bp = "#{File.expand_path(File.dirname(__FILE__))}/../"
externs_dir = base_bp + "test/externs/"

# compile base command
cc_path = ENV['CC_PATH']
javascript_compiler_cmd = "java -jar #{cc_path}"

# do trial compilation with stringent closure compiler options
cmd ="cd #{base_bp} &&"
cmd << javascript_compiler_cmd
cmd << " --compilation_level=ADVANCED_OPTIMIZATIONS "
cmd << " --warning_level=VERBOSE "
cmd << " --jscomp_off=globalThis "
cmd << " --jscomp_error=checkTypes "
cmd << " --externs #{externs_dir}jquery-1.7-externs.js "
cmd << " --externs #{externs_dir}underscore-1.3.3.js "
cmd << " --externs #{externs_dir}backbone.js "
cmd << " --js fsm_view.js"
`#{cmd}`
compile_okay = $?.exitstatus == 0
if (!compile_okay)
  puts "** advanced compilation failed **"
end

exit(compile_okay)
