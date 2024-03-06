Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CF9604CE
	for <imx@lists.linux.dev>; Wed,  6 Mar 2024 10:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709721558; cv=none; b=e7UE6Pcm+4h0g0y6Wy0dHC52zX4BvgrUXUv6454wdXJFOBV9hc3b7vnkw67q5dp9AXugVLDRfWgx9MDbg3rXI0W+bbyoTSAShE7bkD24T3p0xeaxY8qmjfC3TwZyvJFXty958ZNN6Zh++QlLbplGptDWYyXRBIioI/iO1AVSG2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709721558; c=relaxed/simple;
	bh=4MUt6hck423TY0l6udUqnD/992H0pcYWF5svV3RIgVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pzpeAsRa6x+2lc7SVc32PKcBAGSMtHDG62/MURm06/BTSNTdpI6XPJtggiPPmZMbR0zSPO0DtfIBUMVfLiev82M4SliwpJnQixxYHmGMMVXkU4eXy7J77LJH8npn2hKEJHHGTJFMZhUrpznApaPH5vMXi9TwKBkI9oyQLZ3FDuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhofz-0000m8-RA; Wed, 06 Mar 2024 11:39:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhoft-004jAe-EL; Wed, 06 Mar 2024 11:39:01 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhoft-000d3z-18;
	Wed, 06 Mar 2024 11:39:01 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH 0/3] clk: Convert to platform remove callback returning void
Date: Wed,  6 Mar 2024 11:38:54 +0100
Message-ID: <cover.1709721042.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=4MUt6hck423TY0l6udUqnD/992H0pcYWF5svV3RIgVc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl6Ee/UB5vLZLZqb6idMVZzQ2xweh/hor2HsxEl d2zjGiAG1eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZehHvwAKCRCPgPtYfRL+ TqnxB/45kO9Pa/MpG9lWp7EANUDjjbEb9oTTR1il5N1FrrpfWZuF2a3A+LNTei2Mih7NsO1db0A coHQmYWb9RXR3uRieKS1hZCfC4V+GEWKSspjgDySOeHTyQH9DI5q80GQAVrZKzkuWz5EKDoyPKv XiUouECTLa5ajqtEpECnup2S9BlHS+VWxz5jfA1KiCu+hZjgRvyG4ry0AFeAu4O6/D5hUBUZiE2 1ctJLugId8vb7qYt1jUWWOVqGT6BwqylrvhWM0ABV1ct1ykkjzQLgLofVSVzyqypuukS+7Erpsz utO1ffE6QrstHs+dFue++kly9L79/NKLOkj7pke6Cs3k7CZS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hello,

this series converts all platform drivers below drivers/clk that were
introduced after my last clk converstion[1] to struct
platform_driver::remove_new(). See commit 5c5a7680e67b ("platform:
Provide a remove callback that returns no value") for an extended
explanation and the eventual goal.

All conversations are trivial, because their .remove() callbacks
returned zero unconditionally.

There are no interdependencies between these patches, so they could be
picked up individually. But I'd hope that they get picked up all
together by the clk maintainers.

Best regards
Uwe

[1] https://lore.kernel.org/linux-clk/20230312161512.2715500-1-u.kleine-koenig@pengutronix.de/

Uwe Kleine-König (3):
  clk: imx: imx8-acm: Convert to platform remove callback returning void
  clk: starfive: jh7110-isp: Convert to platform remove callback returning void
  clk: starfive: jh7110-vout: Convert to platform remove callback returning void

 drivers/clk/imx/clk-imx8-acm.c                  | 6 ++----
 drivers/clk/starfive/clk-starfive-jh7110-isp.c  | 6 ++----
 drivers/clk/starfive/clk-starfive-jh7110-vout.c | 6 ++----
 3 files changed, 6 insertions(+), 12 deletions(-)

base-commit: 11afac187274a6177a7ac82997f8691c0f469e41
-- 
2.43.0

