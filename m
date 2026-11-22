Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362921;
	b=u7U3dpq8USB3L71DPXCDeVHMebKVgdcq71IrJ2Ah1zEDo7WC3z+OrZmJd4ebHidnOfWE
	 D2eEvTQbcDzvMJh3TLq1krx0HD0+79+uylSR/8LXFfw2J/sUQKrNVZW+GFr2k7QCCKmoj
	 3Clou8cP8pcwMaxcyJv8vxBdCIc4h31huxt6pF2b8NuCmhsIHTTgb6Nc0YRVugyjSv+yG
	 cmuRsrnfVXXF2/KWfpE+HhbBN3AX95q9+6kHke09HxpVeQaI76EiP5B9bMROk+NW2ukb/
	 KrQBqJlHtlxkosBuEnse44yk+8rWA8TQmMuN7+EBEm0Tq+EoBIP68T1BNRhvJtEB5rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=brpic2gxGr+UpSfI0BgDue8RQ+H82jnfKcpc5s/aMXc=;
	b=z1hXGuRHwuQ2uUdIWXA3ifh7Y5U2TbVy8di9jd9e2oYo2WVMshTnB9HYWulk88sR02/Z
	 /AyCaPvGw10PIYPPMCzdBCGA3nCH3+spFhz49fFmulEEBk0danim+aH04BHxFQNb7IClz
	 A1+qsLqOnjcfAsMmgDNCjR8wDr9NCAeGkFGaQDaxAh6nDHtNbRArjraqfZjtnCjGKiSWk
	 vJGdEYNtyUwcm+h/YT+U/+79vC7T8clLS70ZShTKB+WZgYsebGrbjOVeLTa0U0wQi8hY6
	 nxFYadC6+bohERDUif3jc4Bc02IJ8HBF+HMKTORctcKqtWjmLpbabdoKDGRF+d+QobA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ObN0vLW0;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D844D606A32A
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 15:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D844D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ObN0vLW0
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so9606455e9.3
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 07:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795362919; x=1795967719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=brpic2gxGr+UpSfI0BgDue8RQ+H82jnfKcpc5s/aMXc=;
        b=ObN0vLW0RPgrc43lfuLvfm8A7iKR0CgycucLQqfK3Ka3Yij08XAJ108bT85dQmO/y+
         V2ObTDq0Hpj5oe4zssvmA2wyNHurCoTNIlGyqX9LlpSJAZQkiOHS7voyKyrAwsZkzhk5
         VHjYxDop48QmYNDmfgExUVCTPIJHtDQBXIgRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362919; x=1795967719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brpic2gxGr+UpSfI0BgDue8RQ+H82jnfKcpc5s/aMXc=;
        b=2M2my+rHIZLH25yt8DnEBsvHLdvYmtjtrf7q9yznmydm19rQXML6o8qn1gMqXYJ8yg
         GK211lZziovB/7OlTdlkEB/gOn7cYTyytzx+Z3AWcHdNdRMAsK2Uor7VzNHIh2zkjaU2
         i4hMsID7UnANPDZ5KcAK6yBhGrT1rVlpqzCuEH2QJNaJMYwC/siJMVH4RdQxQ/pvmVpA
         I1zqGqyPVZJfU6MuXV1LSkHtM+lOhtA0uWqKGA91TH0PlQTlUt5BVceUPmMtGnckQasZ
         PL8qDSKmAc/iJjb6bQs2SBkPATMtAeWcL7GQNjp9N65ykVlPA7PCB46PvK6prcmVJ0CT
         RKaA==
X-Forwarded-Encrypted: i=1; AL+hErGFBwNtOKi73ZhRbJDwtkjB5Mxb+5kprjXuJNB3dF2vNfYcildVEfIUrFPOAeHe8miM8EY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/3L9OCSZeNoPXqPa7FvTaPJ/N8boI91IUa7IDHJyHh2XuGgz7A
	8sxfPxSrMvw58x1gIrOaA84SP3t67NL41Wk3vY9rwfO0x5f+kiCUoqHooQz/pD2k5QA=
X-Gm-Gg: AZFdTZep8sqclovIAEVuWKMuSBw8UeYdeTKHYWsjua1vhNFnuCc42FcLx2I9fYsXBXi
	9ABZ4UBTCkEZ0/YeYvBaDpDr0E4gzxrw1iOk524PoKFQFRc+FpnP1U48yn8Ac8UZdcw1NsYE7XQ
	je+NLYcNaVXDrFjWnXFjV3s7jgaFfZqduWKnOIN2r0jXk4/KXZTpQEbmGMX3QjvGIqBrXVkZg+6
	xVEPCGfA6g8oyYSv+nAje0EKX/7Cl6ck4WI6t9cORaX+kGMFGOPdZfaapXbdVAJJQTNZyUnkNIZ
	WZohDpjOyvrDccbfI34tqVgyXj/ccGPesgwyTcm29b0HJSB8HOzKAZJBT72giMTHXSPCN0whXur
	5JxDbrtopfIC+KKTjG8Xqs9vFtnyn/Necub9o433aPcC9fiOBq69zA1QBHCwM5LRJl407rqHYk+
	Y5uwbhoqHQG60sJ0EdrcUWCHSf/VDGx+HDGEkYhvlDWir34L63LUfLaW0bAC6STSTM8GJKuGplv
	Ob+LFWQlj9wKXO/cDj/lssj2hmGgExE/vZO1K+1Fkfxfm8NiGff4mimdXaFi61mgFdyZJLMne3G
	30kaGN1pp3xQzf8W5HKa/E1NRUA8oHImXhGrxZyrkGu/DiKCNlr9eytgAqIPfQ3f1CyzbKZLICB
	TsjdYOOkh0eLfiWq93bWpNQPeeZwakkm7BnH4nahSO75gLzHUxqJ/A49ZMTvU54o2kKGUQlCTlx
	3qm7FoZkscb0UpgH5vWj4p6lYaig==
X-Received: by 2002:a05:600c:820c:b0:4bb:6a2d:b426 with SMTP id 5b1f17b1804b1-4bb887c281dmr172330355e9.1.1795362919237;
        Sun, 22 Nov 2026 07:55:19 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm20046526f8f.55.2026.11.22.07.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:55:18 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
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
Subject: [PATCH v3 0/4] pmdomain: imx: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 16:55:07 +0100
Message-ID: <20261122155514.10289-1-dario.binacchi@amarulasolutions.com>
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

 drivers/pmdomain/imx/gpcv2.c          |  77 +++++++++++++-
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 144 +++++++++++++++++++++++++-
 2 files changed, 217 insertions(+), 4 deletions(-)

---
base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
branch: imx-pmdomain-boot-on-v3

-- 
2.43.0

