Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795380702;
	b=AMq7C3gZ9SntJr/1ieIi8JiFFovXyD58WXKIdD1DBuo4RGmrbpQZ423MrQyNAHKjHxLh
	 Od+XLQr7wYajC59UzipJbd+mRZOi3yedY5RS7XCXvXBoB6J+hRxeyo9NQoYkukGcY2kcK
	 /6srvvxVXouwSU8h2smArqhrCNGOI10BaV6UXd9Z7p9zFIU9OMUyCMMJMZz2ADS8AXFOA
	 D45sZ3HCgZU5WYigbdpUq2E1vNmB1hg+/xczGXtOl2/CYNyqluxbE/X3C90yjWyC3LMBQ
	 IVklho3WHVu9C0rsLaYf7oSYs8+Lott6t7sbnkMUOheiJg8CWaKG/YfW7TOymmmOEvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795380702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DKG2CDpDJjCN3w8GhTWY2Le/K5MhPR+ZkRtKO6JJCzc=;
	b=vG2ZieR+j8BetKKxjyQa2peeqcNRLWidjREQW0ZjzjoSlN3NOXBs6d6Wi/ft4axa6vlD
	 Cdhad/6OL7aD7gpW/xDLnl21AT/XoIb713o/fmaK8msFgLGQ0MyQRLP+p9O98bAoKbN8U
	 68WYKkxFoIPCKKLvO3Inb19dkcu3ASVU8TNSXJPryxFxB7uvUlRdDVWkeTuaFyng2vUBb
	 N4WUBJRzjvOyTBYoY6oV9tGsOkBnCKln44j09QYj8oOgPX7b7hn+c4RoiEHrzKDjCCb6t
	 BTUYtlnsVmrFwDeE6Vv+hRMcykL350KkGEH5JpumVXUfoomSeW/rnaNsigDEHp67R4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=iSxx0LWV;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915D7606A338
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 20:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 915D7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=iSxx0LWV
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so17945965e9.0
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 12:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795380700; x=1795985500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DKG2CDpDJjCN3w8GhTWY2Le/K5MhPR+ZkRtKO6JJCzc=;
        b=iSxx0LWVOTIUfXB5ZqVyGK4WBcKHGxAy/gzeaDf9x/zFb4eQYkfEwHARYvq9DZxwRa
         k+9PXdZrQLo/41vG2VXy6czRtLy3XXNvK4NNknoPqy5xfXc1Uczk+oe5cvrXTSYh4pe5
         lW5WHsCaRpmPDqH286sbVniOe0F6iHLxKBF7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795380700; x=1795985500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKG2CDpDJjCN3w8GhTWY2Le/K5MhPR+ZkRtKO6JJCzc=;
        b=OGagi/r2QwIhVGglE4bjnmFIMPnyIj7xuD4nhH6Qpl3uETEBFe3jd3+C5cRDr2fQr3
         MG3ZEWoYlVI4IUY1Plc5rDCVDfdlYy+byF6MV7and9VJiyEw+Iiy2xBAJpPuhevX+z6c
         T6GGRSekiwfraeSQytDe9+iG0Pel4EaaCt0Kg7eDicQ+ahmsAESAYhhx6pTXPjAdzEdT
         L4UhO+QKU8skwZDBKYOcj2wlH29vlPQxX31LtWW/g9iKgvrm79SLpdOg2jCGtYgbE+/i
         rLWIGYkynga9dCLHPKBTQ33cgpRgOG484HQ3XRziC8hYx0Uh1hbZLZoagRwOnHhqXWHy
         RPJA==
X-Forwarded-Encrypted: i=1; AL+hErFjWdP9Dzwza1yV9EYMSE+mh/jkbV88VyLVicxHOzm+mMrQEwtuq9+bvfW8nk+K9Y1RcW4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/ZkvllxB4DI5wnX+iqoqRnO7ofigjv9AVtIGn2Z4b8SggWrag8
	/Kaa7+sWegAQ+1NOQu8EXj2zr7kV1GcWmVSzQTcoFxiXTZUkd1x05L1+CltJRqocRf8=
X-Gm-Gg: AZFdTZcM8Zz4LiPJ2TIbzqYRBUH3D29G0pykF/rHJRzryXozgmzs+CjTX2Hsx61yd63
	surAywWDbsg/f2cW8kqWxKCDAKEPt0JjLZkvUh9C1JtF40e0T20zUrdFJ/vtazAosCNLYA6aFRC
	sNdoLDOVraNYSEX4rwfFrk8h/HAIDDYdLZibxXGcPLdquR/JOKIHtNY6NNFKDvxyVAq/BQ9Iodd
	4lAGuCi6Pfn1FPeOsMr/eARNXZ67qwShxuxDN3IqWStimD+ySh5By9H3ReJ/XWQgxhDb7YYozgf
	+Zsff6zhomRt69mWal3Y8Vkj79Gl1rkWQ7qD7sfgxpDIYNS6mkIfU19xsYXCA3e0QN5Vi6UsD1n
	6qBMzujz3xeDLEK1ZCGKxvrQ4nYAkOMZVByqy3Gu27btrDvZZAa8QOcAlHHIsjGQxHvYxi3pjq9
	KBH6Ti8VHqC5nKBu7abMmK6/5fyEPOVHd1EnWgRMQtONWQefagWQCR1IruH5uokKHAKOzTLyI47
	LuD0I95ALtpD5JQfbFjSWOK0dLXo5nBMmQPPmP4LV/kKdjclDv0hyO/P6fUSmuQv26v2wl4z2tt
	LWUn89Kh13fIB4Vuqo9CBu4ff40B5Puz/PLcjnqEG8Rw3XMuidZ+dmXjJ8fXny19lKg09gAvd/j
	XpZUZGZ0SpBEKtNcALzSt5xivHwfYPhlAFGOBcu7uHU5Lp6qv92RuBKWVqzj/fSeaoZWVjKTUIM
	lI4JogFq3lJQfSKEV7nr9xwcVOaA==
X-Received: by 2002:a05:600c:34d0:b0:4bb:6a5a:7839 with SMTP id 5b1f17b1804b1-4bb889428eamr194057365e9.34.1795380699930;
        Sun, 22 Nov 2026 12:51:39 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm397355305e9.13.2026.11.22.12.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:51:39 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 0/4] pmdomain: imx: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 21:51:09 +0100
Message-ID: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX8M power domain drivers register all their domains as off.
A domain left on by the bootloader, e.g. to show a splash screen, is
then powered up again by its first consumer, which on the i.MX8MN
turns the display off and hangs the system.

This series reads the state of the domains from the hardware, so that
the ones left on are kept on until their consumers have probed.

The first patch fixes an error path of the blk-ctrl probe. The clocks
held by the last patch are released at sync_state, so they stay on
until all the consumers of the blk-ctrl have probed.

Tested on i.MX8MN (BSH SMM S2 PRO).

Changes in v4:
- Register the power notifier before powering up the bus domain

Changes in v3:
- Add Reported-by and Closes tags
- Drop the runtime PM reference synchronously in the probe error path
- Keep the bus domain on while the state of the domains is read
- Remove the domains before releasing their boot-on references

Changes in v2:
- New patch
- Release the resources of the domains left on when the driver is
  removed
- Take the references once the probe can no longer be deferred
- Clear the boot-on state when the domain is powered off
- Release the references when the driver is removed
- Rebase on the changes of the previous patch

Dario Binacchi (4):
  pmdomain: imx8m-blk-ctrl: Remove the power notifier on probe failure
  pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
  pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader
  pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state

 drivers/pmdomain/imx/gpcv2.c          |  77 ++++++++++++-
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 156 ++++++++++++++++++++++++--
 2 files changed, 223 insertions(+), 10 deletions(-)

---
base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
branch: imx-pmdomain-boot-on-v4

-- 
2.43.0

