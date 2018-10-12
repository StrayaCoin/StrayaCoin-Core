StrayaCoin Core version *1.2.1.0* is now available from:

  <https://github.com/StrayaCoin/StrayaCoin-Core/releases>

This is a minor bug fix for 1.2.0.0

Please report bugs using the issue tracker at GitHub:

  <https://github.com/StrayaCoin/StrayaCoin-Core/issues>

To receive security and update notifications, please subscribe to:

  <https://bitcoincore.org/en/list/announcements/join/>

How to Upgrade
==============

If you are running an older version, shut it down. Wait until it has completely
shut down (which might take a few minutes for older versions), then expand the zip file to the same location where Strayacoin was previously extracted to. 

Compatibility
==============

Bitcoin Core is extensively tested on multiple operating systems using
the Linux kernel, macOS 10.8+, and Windows Vista and later. Windows XP is not supported.

Bitcoin Core should also work on most other Unix-like systems but is not
frequently tested on them.

Notable changes in 1.2.1.0
==========================

Denial-of-Service vulnerability
-------------------------------
A denial-of-service vulnerability exploitable by miners has been discovered in Bitcoin and 
Litecoin Core versions 0.14.0 up to 0.16.2. Since StrayaCoin Core is based on this heritage, it is recommended to upgrade to version 1.2.1.0 as soon as possible.
### Consensus
- #14249 `696b936` Fix crash bug with duplicate inputs within a transaction (TheBlueMatt, sdaftuar)

1.2.0.0 Change log
====================

- Implement Dark Gravity Wave Difficult Adjustment
- Fix Max Coin Supply

Also the manpages were updated, as this was forgotten for 0.15.0.

Credits
=======

Thanks to everyone who directly contributed to this release:

- DaveTheKeyMaker


