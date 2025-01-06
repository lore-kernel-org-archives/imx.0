Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0859E145A03
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 16:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736179629; cv=none; b=MwXiJn3LwxAOyvVvvo0MMfdoTtIxNR5hpG2BKOMqGuy8iHLcg42MCx+HqOIediLj3gBTaT+bAFoGPzmIIwHNR/TLarr/uZQFwAch0cSdCQ09wZFP7XcfCo8CcF2TmFVq6DWQtPZWI8WAfM9rDAVwWQt2xfM74K5PRwVj1zz3cWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736179629; c=relaxed/simple;
	bh=JgElm34N/sOv5K2+5R3NLC6BTokNVeI0oM1Tqw+fuSU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BtWxqSSTTc7q5/zPclH/dp+CwAq6HsWjhf7UWIgwT9+xu6N9jftfYjjEwFH4G6mjgR8BXT5pM1Nuoe2HxiqnFboYZqTHdrv4fmNR1P2sDfXedYOrHmZD35brvktZRwcsFoFQTDaoRL+42DPdkZTve9danaje976f5q8WApwp8zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcy-0000C7-Gl; Mon, 06 Jan 2025 17:06:52 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcw-007C9l-0z;
	Mon, 06 Jan 2025 17:06:51 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcw-009dVc-31;
	Mon, 06 Jan 2025 17:06:50 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v2 00/10] arm64: dts: imx8mp-skov: flesh out device trees
Date: Mon, 06 Jan 2025 17:06:35 +0100
Message-Id: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIv/e2cC/2WNQQqDMBBFryKz7hQTSxu76j2KC3VGHQqJJDFYx
 Ls3Fbrq8j34728Q2AsHuBcbeE4SxNkM+lRAP7V2ZBTKDLrUF6WVwfByCSniMlMbOSB3prtV/bW
 uSEFezZ4HWY/is8k8SYjOv4+DpL7216r/WklhiZXpBlNSrzUNj5ntuETvrKxnYmj2ff8AGDVim
 LMAAAA=
X-Change-ID: 20241218-skov-dt-updates-eb8b73c693d1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 Frank Li <Frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

When the Skov device trees were added a year ago, there were no
upstream bindings yet for many parts of the display pipeline.

This has changed now, so this series fleshes the display pipeline parts
out and adds some more fixes/enhancements that have accrued in the
meantime.

---
Changes in v2:
- Add Rob's Acked-by
- Reword some commit messages. See individual patches for details
- Link to v1: https://lore.kernel.org/r/20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de

---
Ahmad Fatoum (5):
      arm64: dts: imx8mp-skov: correct PMIC board limits
      arm64: dts: imx8mp-skov: operate CPU at 850 mV by default
      arm64: dts: imx8mp-skov: use I2C5 for DDC
      dt-bindings: display/lvds-codec: add ti,sn65lvds822
      arm64: dts: imx8mp-skov: configure uart1 for RS485

Oleksij Rempel (5):
      arm64: dts: imx8mp-skov: describe HDMI display pipeline
      arm64: dts: imx8mp-skov: describe LVDS display pipeline
      arm64: dts: imx8mp-skov: describe mains fail detection
      arm64: dts: imx8mp-skov: fix phy-mode
      arm64: dts: imx8mp-skov: increase I2C clock frequency for RTC

 .../bindings/display/bridge/lvds-codec.yaml        |  1 +
 .../arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 63 ++++++++++++++++------
 .../boot/dts/freescale/imx8mp-skov-revb-hdmi.dts   | 45 +++++++++++++++-
 .../boot/dts/freescale/imx8mp-skov-revb-lt6.dts    | 60 +++++++++++++++++++++
 4 files changed, 152 insertions(+), 17 deletions(-)
---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241218-skov-dt-updates-eb8b73c693d1

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>

