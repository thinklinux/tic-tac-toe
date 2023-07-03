require 'optparse'

@options = {}
OptionParser.new do |opts|
  opts.on('-rFILE', '--replay=FILE', 'Replays a game from a replay file') do |r|
    @options[:replay] = r
  end
end.parse!
