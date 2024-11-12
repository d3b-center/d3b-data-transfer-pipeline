"""
Entrypoint for the CLI

All commands are initialized here
"""

import click
from d3b_data_transfer_cli.cli.dewrangle import *


@click.group()
def dewrangle():
    """
    Group of lower level CLI commands relating to working directly with the
    Dewrangle API
    """


@click.group()
@click.version_option()
def main():
    """
    A CLI tool for runninng functions necessary for data transfers in D3b.

    This method does not need to be implemented. cli is the root group that all
    subcommands will implicitly be part of.
    """
    pass


# Dewrangle API commands
dewrangle.add_command(get_study)


# Add command groups to the root CLI
main.add_command(dewrangle)
