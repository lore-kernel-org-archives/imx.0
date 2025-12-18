Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764AE326D69
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 11:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766058001; cv=none; b=VtWusDM+EO7yh33lshFjR4vQMI9tqXz9uwbXEnLiCKg/S7zI8uZc6FNN/uxgSMxS+ie/rRwWBDK7mlRsnzMZ1gMk9PgwoFn5ah+Fj8fKbNkWxJmPYV92gXXf6cNDehzPwRI2AL3PQXDkwY7e++aabzwpFdbwqa3elVf74URpVRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766058001; c=relaxed/simple;
	bh=fJ1fvQq/79fHL/YVzpN+0ygNx8dqRXfOpvgHvtDp4Nc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bJYQuaiyBDpvat1m0xDxZns791VCljIVEvzoYpbIm1VoWnP2h2OXHcHVwE//MySCMYJcs6X35HY9yWf08jhNbbLfeTZOJOUYRINleF2e4bsjMDFwNVPVeCsj1qUTqbKKjlAAk/lA2+pAZjMEXgguwmnYEPYsd7PKCq+6Fmfo788=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1vWCMB-0001vK-1v; Thu, 18 Dec 2025 12:39:43 +0100
From: Fabian Pflug <f.pflug@pengutronix.de>
Subject: [PATCH v4 0/2] Add devicetree for NXP i.MX93 FRDM board
Date: Thu, 18 Dec 2025 12:39:20 +0100
Message-Id: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOjnQ2kC/33PwQ6DIAyA4VcxnMcCBYzutPdYdmBQlINowBkX4
 7sPPSxLZnb8m/RrupCE0WMil2IhESeffB9yyFNBTKtDg9Tb3AQYKKZAUDc0NMwD9d1c54q2o8o
 YXjHNndU1yYtDROfnHb3dc7c+jX187Tcmvk3/chOnjCpZPsAKCZVS1wFD8xxjH/x8tkg2c4Jvp
 zx0IDuotGXoNBohDh3xcTgDOHREdphAI/OPxhj246zr+gYOCYz6SQEAAA==
X-Change-ID: 20250523-fpg-nxp-imx93-frdm-5cc180a1fda9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Fabian Pflug <f.pflug@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Haidong Zheng <haidong.zheng@nxp.com>, Danwei Luo <danwei.luo@nxp.com>, 
 Lei Xu <lei.xu@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::5c
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

I could not test all features of the board, therefore a lot of stuff is
omitted from the devicetree. but this is enough to have the board boot
via eMMC or SD-Card, debug via debug USB connector and have a network
connection.

The FRDM i.MX 93 development board is a low-cost and compact development
board featuring the i.MX93 applications processor.

It features:
- Dual Cortex-A55
- 2 GB LPDDR4X / LPDDR4
- 32 GB eMMC5.1
- MicroSD slot
- GbE RJ45 x 2
- USB2.0 1x Type C, 1x Type A

This file is based upon the one provided by nxp in their own kernel and
yocto meta layer for the device, but adapted for mainline.

Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
---
Changes in v4:
- remove it6263 block in i2c1, since it is not finished
- remove usdhc3 pwrsequence, since WLAN is not tested on my board
- remove eee-broken-1000t on phy2, since it is not broken
- update min/max-microvlt on buck converters
- Link to v3: https://lore.kernel.org/r/20251022-fpg-nxp-imx93-frdm-v3-0-03ec40a1ccc0@pengutronix.de

Changes in v3:
- Add Signed-off for original NXP contributors.
- Fixed whitespace errors (Thanks Francesco Valla)
- Added mu1 with status okay (Thanks Francesco Valla)
- Removed address cells from lpi2c3 (Thanks Frank Li)
- Configure pin for watchdog (Thanks Peng Fan)
- Updated regulator config
- Configure i2c0
- Link to v2: https://lore.kernel.org/r/20250526-fpg-nxp-imx93-frdm-v2-0-e5ad0efaec33@pengutronix.de

Changes in v2:
- 1/2: remove CAN node, as it has not been tested.
- 1/2: ran dt-format (Thanks Frank Li)
	But also reordered some nodes afterwards again to have
	regulator-min before regulator-max, have the pinmux at the end
	of the file, and have the regulator-name as the first node
	inside the regulators.
	Re-added comments, that were deleted.
- 1/2: changes subjet to ar64:dts (Thanks Fabio Estevan)
- 1/2: removed reg_vdd_12v (Tanks Fabio Estevan)
- 1/2: added aliases for rtc, emmc, serial (Thanks Fabio Estevan)
- reordered the series to have documentation before dts. (Thanks
  Krzystof Kozlowski)
- Link to v1: https://lore.kernel.org/r/20250523-fpg-nxp-imx93-frdm-v1-0-546b2d342855@pengutronix.de

---
Fabian Pflug (2):
      dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board
      arm64: dts: freescale: add support for NXP i.MX93 FRDM

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 620 +++++++++++++++++++++
 3 files changed, 622 insertions(+)
---
base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
change-id: 20250523-fpg-nxp-imx93-frdm-5cc180a1fda9

Best regards,
-- 
Fabian Pflug <f.pflug@pengutronix.de>

