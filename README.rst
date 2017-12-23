dia-convert
===========
A module to support converting Dia_ diagrams as part of a CMake_ project.


Installing
----------
This module is designed to be installed using CMake.  You'll want to do
something like the following:

1. :code:`cmake /path/to/dia-convert`
2. :code:`make install`

After the install completes, you should be able to use the module in any CMake
project.

.. code:: CMake

  include(DiaConvert)


.. _Dia: https://wiki.gnome.org/Apps/Dia/
.. _CMake: https://www.cmake.org
