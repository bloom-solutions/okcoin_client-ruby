# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- Extract errors from response body

### FIxed
- No longer blow up when `GetOrdersResponse#orders` is called but body has errors

## [0.1.0] - 2020-09-12
### Added
- add `get_orders` endpoint
