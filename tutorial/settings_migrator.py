import os
from .settings import *

DATABASES["default"]["USER"] = 'migrator_user'  # noqa: F405
DATABASES["default"]["PASSWORD"] = os.environ["MIGRATOR_DB_PASS"]  # noqa: F405