"""
All configuration values for the CLI
"""

import os

from dotenv import find_dotenv, load_dotenv

# File paths and directories
ROOT_DIR = os.path.dirname(os.path.dirname(os.path.dirname((__file__))))
ROOT_DATA_DIR = os.path.join(ROOT_DIR, "data")
LOG_DIR = os.path.join(ROOT_DATA_DIR, "logs")

DOTENV_PATH = find_dotenv()
if DOTENV_PATH:
    load_dotenv(DOTENV_PATH)

# Dewrangle
DEWRANGLE_DEV_PAT = os.environ.get("DEWRANGLE_DEV_PAT")
DEWRANGLE_BASE_URL = os.environ.get("DEWRANGLE_BASE_URL")
DEWRANGLE_MAX_PAGE_SIZE = 10


class SECRETS:
    """
    Used in logger initialization to obfuscate sensitive env variables
    """

    DEWRANGLE_DEV_PAT = "DEWRANGLE_DEV_PAT"


config = {
    "logging": {
        "default_log_filename": "d3b_data_transfer_pipeline",
        "default_log_level": "info",
        "default_log_dir": LOG_DIR,
    },
    "dewrangle": {
        "base_url": DEWRANGLE_BASE_URL,
        "pagination": {"max_page_size": DEWRANGLE_MAX_PAGE_SIZE},
        "endpoints": {
            "graphql": "/api/graphql",
        },
    },
}
