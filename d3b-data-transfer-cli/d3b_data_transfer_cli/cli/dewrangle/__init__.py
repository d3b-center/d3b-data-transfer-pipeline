"""
Dewrangle CLI commands

Functions for interacting the Dewrangle's GraphQL and REST APIs
"""
import logging

import click

from d3b_data_transfer_cli.config.log import init_logger

logger = logging.getLogger(__name__)


@click.command()
@click.argument("global_id")
def get_study(global_id: str) -> dict:
    """
    Fetch study object from Dewrangle using the study's global ID to look it up

    \b
    Arguments:
        \b
        - global_id: the global ID of the study in Dewrangle (e.g. sd-12345678)
    """
    init_logger()
    logger.info(f"Fetch dewrangle study {global_id}!")
