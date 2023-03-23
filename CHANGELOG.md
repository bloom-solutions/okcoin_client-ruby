# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Changed
- Upgrade to v5 API
  - Removed `#get_orders`
  - Add `#get_orders_history` that returns orders up to 7 days old

## [1.0.0] - 2022-12-15
### Added
- Extract errors from response body

### Fixed
- No longer blow up when `GetOrdersResponse#orders` is called but body has errors

## [0.1.0] - 2020-09-12
### Added
- add `get_orders` endpoint
