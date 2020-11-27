#!env python
import sys
import os
from urllib.request import pathname2url
print(f"file://{pathname2url(os.path.abspath(sys.argv[1]))}")
