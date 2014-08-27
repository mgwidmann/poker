exclude = if Node.alive?, do: [], else: [distributed: true]

# Changes name of machine running the test suite to be standard
:net_kernel.stop()
:net_kernel.start([:"foo@127.0.0.1"])

ExUnit.start(exclude: exclude)
