Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0440081ACA
	for <imx@lists.linux.dev>; Wed, 31 Dec 2025 03:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767151598; cv=none; b=WtdJMJ9tMtf+jrMpnl3pza03kQ6ptPaSRzfQz+u1xVpQQ7duwzbJrH3cbGnJYcrNXmLwjzqUS4VgvRb7lqdFNajyWEPNgaPPm4+kHfN4NeulZQnijUAuwqeEHI0CPAxCQbSHDDEkCPwh42cEODa92hlCLoZrN2F2nMl2ApxCKds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767151598; c=relaxed/simple;
	bh=PJKXSxPgbYTmAJS2PZh06PVU8Cqx4k5G2YhmqbfasVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oPrbHJyCLMcuR6gnlHIQwtCFL/2lzvLaQAtZpjTClEdQKEpVCrleSiSsnegaCfwVx4+opWfgwyJhWkqY3bLOImeKpgCB9DnfImow20nkwV/TAfnl/8hEFm4RqPEXRmik4aDkLxtsWkZS4Y9dygfbD4mv83Mmxawnv7WGKHfGLSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxRmoO5Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxRmoO5Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F718C116B1;
	Wed, 31 Dec 2025 03:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767151597;
	bh=PJKXSxPgbYTmAJS2PZh06PVU8Cqx4k5G2YhmqbfasVM=;
	h=Date:From:To:Cc:Subject:From;
	b=GxRmoO5YFkFG0vTnwf/PNaZD9Q4AwQYK6oGy//0+h/NOXj3H8WOdav3edia85AEnr
	 1ghKG2mR0rTtHmD/NnW4pTVoP/D77W4uRFUptxYw6ZMjr6mbMElJnEXoOJR4si7O4s
	 iSHdZ04ZjIzwB3jtx8Nd3rnQxqpIPabuHNnAeU4y4m3Bx5WXDBPBgOkXL1QQOsM+tb
	 umk5PToUW8aybQJoFR5cm7Myo785351ghDS4KE7PS3iPEJMYFfKqtuIRGhPmUJMjT9
	 VwgTSf5FKDsW5dIc3gOu+jraQc6/7kuSyCRdIbTNPfJ2EY3G+EIUwHrJzAnT0+eF/g
	 j/fnmZo0oAcHw==
Date: Wed, 31 Dec 2025 11:26:33 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.19
Message-ID: <aVSX6SK_LADf1ti4@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.19

for you to fetch changes up to 89e87d0dc87eb3654c9ae01afc4a18c1c6d1e523:

  arm64: dts: mba8mx: Fix Ethernet PHY IRQ support (2025-12-30 16:07:39 +0800)

----------------------------------------------------------------
i.MX fixes for 6.19:

- A mba8mx fix from Alexander Stein to correct Ethernet PHY IRQ trigger
  type
- An i.MX95 fix from Carlos Song to correct I3C2 pclk
- A couple of imx8qm-mek changes from Haibo Chen to fix light sensor
  interrupt type and usdhc2 regulator configuration
- An imx6q-ba16 change from Ian Ray to fix RTC interrupt level
- An imx8mp-dhcom-som change from Marek Vasut to fix sporadic Ethernet
  link bouncing caused by interruptions on the PHY reference clock
- A couple of imx8mp-tx8p changes from Maud Spierings to fix compatible
  and eqos nvmem-cells
- An ARM i.MX fix from Rob Herring to correct mc13xxx LED node names
- An imx8qm-ss-dma change from Sherry Sun to correct DMA channels for
  LPUART
- A couple of imx95-toradex-smarc changes from Vitor Soares to fix
  ethphy1 interrupt and SMARC_SDIO_WP label position

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: mba8mx: Fix Ethernet PHY IRQ support

Carlos Song (1):
      arm64: dts: imx95: correct I3C2 pclk to IMX95_CLK_BUSWAKEUP

Haibo Chen (2):
      arm64: dts: imx8qm-mek: correct the light sensor interrupt type to low level
      arm64: dts: add off-on-delay-us for usdhc2 regulator

Ian Ray (1):
      ARM: dts: imx6q-ba16: fix RTC interrupt level

Marek Vasut (1):
      arm64: dts: imx8mp: Fix LAN8740Ai PHY reference clock on DH electronics i.MX8M Plus DHCOM

Maud Spierings (3):
      dt-bindings: arm: fsl: moduline-display: fix compatible
      arm64: dts: freescale: moduline-display: fix compatible
      arm64: dts: freescale: tx8p-ml81: fix eqos nvmem-cells

Rob Herring (Arm) (1):
      ARM: dts: nxp: imx: Fix mc13xxx LED node names

Sherry Sun (1):
      arm64: dts: imx8qm-ss-dma: correct the dma channels of lpuart

Vitor Soares (2):
      arm64: dts: freescale: imx95-toradex-smarc: use edge trigger for ethphy1 interrupt
      arm64: dts: freescale: imx95-toradex-smarc: fix SMARC_SDIO_WP label position

 Documentation/devicetree/bindings/arm/fsl.yaml                   | 9 ++++++++-
 arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts           | 8 ++++----
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts                     | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts                | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts                 | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi                        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi              | 1 +
 .../boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi              | 5 +++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts                     | 3 ++-
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi                 | 8 ++++----
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi           | 4 +---
 arch/arm64/boot/dts/freescale/imx95.dtsi                         | 2 +-
 arch/arm64/boot/dts/freescale/mba8mx.dtsi                        | 2 +-
 14 files changed, 35 insertions(+), 23 deletions(-)
