Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996DC2BE641;
	Mon, 16 Feb 2026 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771247238; cv=none; b=TEYxk6AHEBuOx+kTJJqw6+dPqeyAIcmRtvVf9gj+5VT/vM9BRiy6eONQW4/JjByJ5rNPYOhu9oizaxBT/nT7R3aOdmhxmF/z6sK/tc41+TZ5jx1v+6Wip2aKx5NDqlJFJpMqOC0z5TotasILTi4TLMpjq1pq6tMTLB//X187Zkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771247238; c=relaxed/simple;
	bh=yVLlRPm6vATEXsxQUpcRC7wOFSzgIFI3POyiJ1X8Kfo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bjv1m8kn7/u1dqKblu+eHZ4xHKv26B7CYECNL+aKiowfkDgRwAg0m32CcTYJiGtXk8i0f8qUxOLe6HvuZwhXL+RaPQQD0eGw4uLz76D17E3cnfyIw5jD+qdESWvGmfezuwuULaW8eveiWUhBqPFyo7FXOMO49gxYEdWykpdtgt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhvEdXuI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhvEdXuI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AB3EC116C6;
	Mon, 16 Feb 2026 13:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771247238;
	bh=yVLlRPm6vATEXsxQUpcRC7wOFSzgIFI3POyiJ1X8Kfo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FhvEdXuI8Gol7NPUXYUOlttfJeirY5/RRoYti5ZS/o9vO21S20Zl2UylwpUumBMP1
	 b2WeiOK3LfW2gG2FCUj8ktNk5319AaiDc2KeeVGMOLZSXfsnMcDEMZ6tD+LVDf9osm
	 S5yQpAyl994GSQSE0Ux4WOk+CLN5Bn9XkP7IAq4Rtd53kdy3n0mcvmBp+MWhpfh3AY
	 eqyGwoe5vdt4whmzoLfFBo0Rq4SokBaRFdYX2tH21pQObrhzeepld2Y//5HzSWFJu9
	 HxPFsHeEwuKgbQaqxXAGPKY9Pi+r7nIrGWIRG8nVgTCFu4BFgufxvpgLNSe+vrpx6n
	 r8RPSofpzbDQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436DBE7BDAC;
	Mon, 16 Feb 2026 13:07:18 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v8 0/5] arm64: dts: freescale: add support for the
 GOcontroll Moduline IV/Mini
Date: Mon, 16 Feb 2026 14:07:07 +0100
Message-Id: <20260216-mini_iv-v8-0-8d528e7cb454@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Qy2rDMBAF0F8JWtdlZvTOqv9RSlH1SASJVeRgW
 oL/vXKgyBAvr5hzmdGdTbHmOLHj4c5qnPOUy9iCeTkwf3bjKQ45tMwISCKAHa55zJ95HhzIKD1
 5JOKsTX/XmPLPo+n9o+Vznm6l/j6KZ1xfnztmHGBI3BjrhSUh9dup+DLearlcXn25srVopg0m6
 pgaJnDJJOucR7GL+QZz6Jg3HJNUXgSbCO0uFh0j6o5Fw9I5xQ2nJNHtYvmPFSDxjuW6tv2KCQQ
 k4moXq44JZMdq/TDtQzDJGBT7N+sNxs3NumHHXTBRh5AgPOFlWf4A6PFuDxECAAA=
X-Change-ID: 20251009-mini_iv-a05e5c2c1223
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771247236; l=3121;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=yVLlRPm6vATEXsxQUpcRC7wOFSzgIFI3POyiJ1X8Kfo=;
 b=2VE5cTSrRYdlJJKo02/IphlM2mbd9f00/g2fyO4nXIsSOdieGumXvF6xHmlCw2R2NlL10TqwD
 NK62OQDNnFSBCg6vXCd0kC3cA/EVr+j4pyCtSCaqTWUu6S+uKXrPB+t
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

Add initial support for the Moduline IV and Moduline Mini embedded
controllers.

These systems are powered by the Ka-Ro Electronics tx8m-1610 COM, which
features an imx8mm SoC.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Changes in v8:
- Change the Ka-Ro TX8M compatible to line up with the previously added
  TX8P karo,imx8mm-tx8m-1610 -> karo,tx8m-1610
- Link to v7: https://lore.kernel.org/r/20260210-mini_iv-v7-0-a3ad8e7ddf0d@gocontroll.com

Changes in v7:
- Fix order in Makefile (Frank)
- Link to v6: https://lore.kernel.org/r/20260205-mini_iv-v6-0-f7cdd8f88144@gocontroll.com

Changes in v6:
- Update trailers
- Fix includes in the mini/iv dts patches (Frank)
- Rebased on latest next
- Link to v5: https://lore.kernel.org/r/20260123-mini_iv-v5-0-29bef040f236@gocontroll.com

Changes in v5:
- Fixup aliases (remove usb ones) (Shawn)
- Link to v4: https://lore.kernel.org/r/20251117-mini_iv-v4-0-5aa63832f51a@gocontroll.com

Changes in v4:
- Fix BUCK6 property order
- Change the BUCK6 min/max voltage to match the dram specs (Lothar)
- Make it clear that the two systems are based on a SoM in commit
  message of the dt-bindings (Conor)
- Drop merged PMIC fix (Matti, Mark)
- Link to v3: https://lore.kernel.org/r/20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com

Changes in v3:
- Add patch fixing the pmic driver
- Use the proper feedback properties for BUCK6
- Slightly rework the compatibles, acked by conor dropped
- Add missing CAN interface supplies, remove the leftover comment
- Add missing vled-supply
- Add missing ethernet phy interrupt (doesn't work)
- Fix the cs-gpios properties in all spi interfaces
- Fix the order of properties in all spi interfaces
- Remove unused labels for regulators of the PMIC
- Link to v2: https://lore.kernel.org/r/20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com

Changes in v2:
- Fix allignment issue in imx8mm-tx8m-1610.dtsi (fec1)
- Move phy-reset into fec (works better in barebox)
- Make the gpio-line-names groups of four on every line
- Link to v1: https://lore.kernel.org/r/20251009-mini_iv-v1-0-f3889c492457@gocontroll.com

---
Maud Spierings (5):
      dt-bindings: arm: fsl: Add GOcontroll Moduline IV/Mini
      arm64: dts: imx8mm: Add pinctrl config definitions
      arm64: dts: freescale: add Ka-Ro Electronics tx8m-1610 COM
      arm64: dts: freescale: Add the GOcontroll Moduline IV
      arm64: dts: freescale: Add the GOcontroll Moduline Mini

 Documentation/devicetree/bindings/arm/fsl.yaml     |   8 +
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h     |  33 +
 .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         | 799 +++++++++++++++++++++
 .../imx8mm-tx8m-1610-moduline-mini-111.dts         | 687 ++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi | 444 ++++++++++++
 6 files changed, 1973 insertions(+)
---
base-commit: 0f8a890c4524d6e4013ff225e70de2aed7e6d726
change-id: 20251009-mini_iv-a05e5c2c1223

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>


