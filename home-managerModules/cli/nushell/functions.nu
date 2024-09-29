# Shutdown the system
def shut [
  --time (-t): int	# set time until shutdown
] {
    if $time == null {
      shutdown 0
    } else {
      shutdown $time
    }
}

# Simple map function to wrap `each`
def map [
    closure: closure,	# Closure to run on each element of the list
    list: list,		# The list to map on
    --par (-p)		# Enable parallelism (unordered)
] {
    $list | if $par {
	par-each $closure 
    } else {
	each $closure
    }
}

def disown [...command: string] {
    sh -c '"$@" </dev/null >/dev/null 2>/dev/null & disown' $command.0 ...$command
}

# Get a list from a range
def ranlist [
    range: range	# Range to get a list from
] {
    $range | each {||}
}
