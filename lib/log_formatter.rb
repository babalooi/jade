class LogFormatter < ActiveSupport::Logger::SimpleFormatter
  def call(severity, timestamp, progname, msg)
    "[#{severity}] #{msg}\n"
  end
end
