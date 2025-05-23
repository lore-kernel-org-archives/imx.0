Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B0C29994B
	for <imx@lists.linux.dev>; Fri, 23 May 2025 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024264; cv=none; b=lIbzvm//TexTBbIVHEKJZxT8VFZtBbcdMFm7WEUDlQerUEoN54t42cajA8lO5a9CneLeSQKu+x+4z/a8cbeobEJZSiMeZzIzqnb1v/zFlX8VLOCjvhbbEcYfcrff5FcbM4qCWTKlD6tsKwBh6l2o3A0vNht0HiHcW3QXmJU3vCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024264; c=relaxed/simple;
	bh=cmCMBWHTnNBgoUmIuYy5Z7k8QnZhvVGmqUyM3waEkyc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=esXZejoLmokbW9S8fULizuAQWI4G+0YnaP6wfSMSrts3eW6lhifPeP/IuElV6uQtgqwKlyF0dPrg697FG95CJ5RatJacbJguXVJtjfDbjSeJmcURkpUcav0QI2yE3R2O0EE6FWj7x91/axxV4hC55dkilGaIkVY4jUHLAa6JQfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1uIWxU-0003Td-Kt; Fri, 23 May 2025 20:17:28 +0200
From: Fabian Pflug <f.pflug@pengutronix.de>
Subject: [PATCH 0/2] Add devicetree for NXP i.MX93 FRDM board
Date: Fri, 23 May 2025 20:16:47 +0200
Message-Id: <20250523-fpg-nxp-imx93-frdm-v1-0-546b2d342855@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI+7MGgC/x3MQQqAIBBA0avErBtQQ6iuEi1ER5uFJgohhHdPW
 r7F/y9UKkwV9umFQg9XvtOAnCewl0mBkN0wKKG00GpBnwOmlpFj24aKi6itlasw0juzwQhzIc/
 tnx5n7x918YiKZAAAAA==
X-Change-ID: 20250523-fpg-nxp-imx93-frdm-5cc180a1fda9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Fabian Pflug <f.pflug@pengutronix.de>
X-Mailer: b4 0.14.2
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
Fabian Pflug (2):
      ARM: dts: freescale: add support for NXP i.MX93 FRDM
      dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 630 +++++++++++++++++++++
 3 files changed, 632 insertions(+)
---
base-commit: 94305e83eccb3120c921cd3a015cd74731140bac
change-id: 20250523-fpg-nxp-imx93-frdm-5cc180a1fda9

Best regards,
-- 
Fabian Pflug <f.pflug@pengutronix.de>

