This directory contains ports of 3rd-party applications to Genode as implemented by wrightsl

The 'ports' repository follows the line of the 'libports' repository.
For instructions about downloading and building 3rd-party applications,
please refer to 'libports/README'.


Dependencies from other repositories
------------------------------------

Application provided by the 'ports' repository typically expect a rich
runtime environment, including shared libraries provided by the 'libports'
repository. Hence, 'ports' depends on 'libports'.
