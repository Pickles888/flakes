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
