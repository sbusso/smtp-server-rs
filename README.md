# Stalwart SMTP Server

[![Test](https://github.com/stalwartlabs/smtp-server/actions/workflows/test.yml/badge.svg)](https://github.com/stalwartlabs/smtp-server/actions/workflows/test.yml)
[![Build](https://github.com/stalwartlabs/smtp-server/actions/workflows/build.yml/badge.svg)](https://github.com/stalwartlabs/smtp-server/actions/workflows/build.yml)
[![License: AGPL v3](https://img.shields.io/badge/License-AGPL_v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0)
[![](https://img.shields.io/discord/923615863037390889?label=Chat)](https://discord.gg/jtgtCNj66U)
[![](https://img.shields.io/twitter/follow/stalwartlabs?style=flat)](https://twitter.com/stalwartlabs)

**Stalwart SMTP** is a modern SMTP server developed in Rust with a focus on security, speed, and extensive configurability. 
It features built-in DMARC, DKIM, SPF and ARC support for message and sender authentication, strong transport security through DANE, MTA-STS, SMTP TLS reporting and offers great flexibility and customization thanks to its configurable rules and native support for Sieve scripts.

Key features:

- Sender and Message Authentication:
  - Domain-based Message Authentication, Reporting, and Conformance (**DMARC**) verification and failure/aggregate reporting.
  - DomainKeys Identified Mail (**DKIM**) verification, signing and failure reporting.
  - Sender Policy Framework (**SPF**) policy evaluation and failure reporting.
  - Authenticated Received Chain (**ARC**) verification and sealing.
  - Reverse IP (**iprev**) validation.
- Strong Transport Security:
  - DNS-Based Authentication of Named Entities (**DANE**) Transport Layer Security.
  - SMTP MTA Strict Transport Security (**MTA-STS**).
  - SMTP TLS Reporting (**TLSRPT**) delivery and analysis.
- Inbound Filtering and Throttling:
  - Sieve scripting language with support for all [registered extensions](https://www.iana.org/assignments/sieve-extensions/sieve-extensions.xhtml).
  - Filtering, modification and removal of MIME parts or headers.
  - DNS block lists (**DNSBL**).
  - Greylisting.
  - Inbound concurrency and rate limiting.
  - Integration with external content filtering systems such as SpamAssassin and ClamAV.
- Flexible Queues:
  - Unlimited virtual queues.
  - Delayed delivery with `FUTURERELEASE` and `DELIVERBY` extensions support.
  - Priority delivery with `MT-PRIORITY` extension support.
  - Quotas.
  - Outbound throttling.
  - Custom routing rules.
- Logging and Reporting:
  - Detailed logging of SMTP transactions and events, including delivery attempts, errors, and policy violations.
  - Integration with **OpenTelemetry** to enable monitoring, tracing, and performance analysis of SMTP server operations.
  - Automatic analysis of incoming DMARC/TLS aggregate reports, DMARC/DKIM/SPF authentication failure reports as well as abuse reports.
- And more:
  - SASL authentication.
  - PostgreSQL, MySQL, MSSQL and SQLite support.
  - Granular configuration rules.
  - REST API for management.
  - Memory safe (thanks to Rust).

## Get Started

Install Stalwart SMTP on your server by following the instructions for your platform:

- [Linux / MacOS](https://stalw.art/smtp/get-started/linux/)
- [Windows](https://stalw.art/smtp/get-started/windows/)
- [Docker](https://stalw.art/smtp/get-started/docker/)

You may also [compile Stalwart SMTP from the source](https://stalw.art/smtp/development/compile/).

## Support

If you are having problems running Stalwart SMTP, you found a bug or just have a question,
do not hesitate to reach us on [Github Discussions](https://github.com/stalwartlabs/smtp-server/discussions),
[Reddit](https://www.reddit.com/r/stalwartlabs) or [Discord](https://discord.gg/jtgtCNj66U).
Additionally you may become a sponsor to obtain priority support from Stalwart Labs Ltd.

## Documentation

Table of Contents

- Get Started
  - [Linux / MacOS](https://stalw.art/smtp/get-started/linux/)
  - [Windows](https://stalw.art/smtp/get-started/windows/)
  - [Docker](https://stalw.art/smtp/get-started/docker/)
- Configuration
  - Overview
  - General
  - Listeners
  - Rules
  - Scripting
  - Certificates
  - Remote
  - Databases
  - Lists
  - Resolver
  - Logging
- Inbound
  - Overview
  - Connect
  - Extensions
  - Ehlo
  - Authentication
  - Mail-From
  - Data
- Outbound
  - Overview
  - Schedule
  - Queue strategy
  - Throttling
  - Quotas
- Authentication
  - Overview
  - Signatures
  - DKIM
  - SPF
  - ARC
  - DMARC
  - IpRev
  - DNSBL
- Management
  - Overview
  - Configuration
  - Queue
  - Reports
- Development
  - [Compiling](https://stalw.art/smtp/development/compile/)
  - [Tests](https://stalw.art/smtp/development/test/)
  - [RFCs conformed](https://stalw.art/smtp/development/rfc/)

## Roadmap

The following major features and enhancements are planned for Stalwart SMTP:

- Embedded Antispam and Antivirus
- WASM filters
- Distributed mode
- Web-based administration

## Testing & Fuzzing

To run the test suite execute:

```bash
cargo test
```

To run the fuzz tests please refer to the Stalwart libraries that handle parsing for the SMTP server: [smtp-proto](https://github.com/stalwartlabs/smtp-proto),
[mail-parser](https://github.com/stalwartlabs/mail-parser),
[mail-auth](https://github.com/stalwartlabs/mail-auth) and [sieve-rs](https://github.com/stalwartlabs/sieve). 

## License

Licensed under the terms of the [GNU Affero General Public License](https://www.gnu.org/licenses/agpl-3.0.en.html) as published by
the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
See [LICENSE](LICENSE) for more details.

You can be released from the requirements of the AGPLv3 license by purchasing
a commercial license. Please contact licensing@stalw.art for more details.
  
## Copyright

Copyright (C) 2020-2023, Stalwart Labs Ltd.
