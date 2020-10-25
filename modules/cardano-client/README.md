# cardano-client

## Overview

This modules factor out some boilerplate when it comes to dealing with the Ouroboros mini-protocols used by Cardano nodes. The module does nothing in itself, as most the logic still needs to be captured in actual clients (chain-sync, transaction submission or state query), but it moves boilerplate away so that actual application can focus on writing just write matters for the application
logic.

## Usage

See [ogmios-server](../../ogmios-server)

<hr/>

<p align="center">
  <a href="../../CONTRIBUTING.md">:gift: Contributing</a>
  |
  <a href="../../CHANGELOG.md">:floppy_disk: Changelog</a>
</p>

<p align="center">
  <a href="https://github.com/KtorZ/cardano-ogmios/blob/master/modules/cardano-client/LICENSE">
    <img src="https://img.shields.io/github/license/KtorZ/cardano-ogmios.svg?style=for-the-badge"/>
  </a>
</p>