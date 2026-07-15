Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E149B341660
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125378; cv=none; b=h0ji3isfiERp1zd3Yl1OJUc4hAfUzG+AiAi21Q+LupdRd99bwGPpLT93o8fMUi55hQ/nve5cORx5T8Alr+YvTKc9lyJY8OUfrC7OTOILWi5+VTvtLWu3gpLMQek5NzksKtqTmF0U/1kxd1bzEOtG8lU+buuDDedimTV0sVYrfd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125378; c=relaxed/simple;
	bh=5cjITBf1lX11tV96k9LlFBTJvsIywNAVIH+Qi4KvIOQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s0ehgcsMFk8OSt70QXA2NPqfRNYxqfWQsFZq3L2PwfHGsYuedprjKxKW+Upls2RCEHyjZWBTAHp8POFOSx/Llr4izjw3o21hbKillmDQMewUXuSMd1OwZycR6yhscawJm5RJs0QZeWf6uOl1j9PdqZ9hKO3wNEYZoCfErjh9Usk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vi7sLQpZ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vi7sLQpZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 40E911A1019;
	Wed, 15 Jul 2026 14:22:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 123226035C;
	Wed, 15 Jul 2026 14:22:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D19811BD3AD3;
	Wed, 15 Jul 2026 16:22:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784125371; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RwP0ZAU4rBRQaNpLFK3/bZIxH1qsqU+jxMuUyxinPB0=;
	b=vi7sLQpZuudQiX1SS3mKEYirXjnBJHqT4qtaNazFTYSoCRaimT8hMIhu/CGlrDb30TFse9
	+0BQNIB5pxOLwfpf7EjmYlG7kXvN98+fWzpbZY/2ILThs+3x0dMdMvWGjzBs8bIs09Wxvu
	KDY3nzURxcmCi6usVeHyw0v/Ni61b50q7u28mJEEaEI8p7/ydZsiWK5SiHBDU3bXxWK0sM
	QTRNQObFO7U8ASBphMf8XxSr/n1Wjh8zurI67ZEMria4FZOogCN2VKsxkdKJYNuXn7OSUy
	48C5J6sutChw4zBEkS0dZ0H5qPOgE4q4egNSdX/3Y900eLlJUhQ6ZMhegmeq1A==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v2 0/7] Import optee node from u-boot device trees
Date: Wed, 15 Jul 2026 16:22:17 +0200
Message-Id: <20260715-mathieu-uboot-dts-import-v2-0-bc931417bd0e@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJmXV2oC/42NQQqDMBBFryKz7pRJQMWueo/iQuOkDlQjSQwW8
 e6NnqDL9/n//R0Ce+EAj2IHz0mCuDmDvhVgxm5+M8qQGTTpimpFOHVxFF5x7Z2LOMSAMi3OR6w
 aW6reUFMPNeT54tnKdqlfbeZRQnT+ez0ldaZ/SJNCQmuZtCIuyTTPs/GR+W7cBO1xHD8xm1Azw
 gAAAA==
X-Change-ID: 20260710-mathieu-uboot-dts-import-69f51bc097d7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Wei Xu <xuwei5@hisilicon.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org, 
 Tom Rini <trini@konsulko.com>, Peter Robinson <pbrobinson@gmail.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125361; l=3745;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=5cjITBf1lX11tV96k9LlFBTJvsIywNAVIH+Qi4KvIOQ=;
 b=x1XMbnxl5+7T+kpMxjng4W0jVssHHk/XXgC+3FCBDIp9aBO4U6Y7Ng6zXBHEs8ysV+qiN3+XC
 nGl30mK/YPaA10RTdL3bsGkE22oTyMW70FRiNPlN85GEJUhVk5+ncKy
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3

In a recent discussion on the U-Boot mailing list [1], it was found out
that several platforms were adding the OP-TEE device tree-node thanks to
some U-Boot specific dtsi. This was deemed as a bad solution, as this
should instead be added in the DTS files hosted in Linux sources,
particularly for platforms already using the "upstream" (Linux) device
tree.

Most i.MX8 and i.MX9 platforms are already using OF_UPSTREAM
configuration in U-Boot. Some are not, but are fairly new, so we can
expect them to use the Linux device tree once their support is a bit
more stable. So they will benefit from these changes once upstream
device trees are refreshed in U-Boot.

STM32MP157 platforms are using OF_UPSTREAM, with similar consequences.

The two other platforms are using an U-Boot specific device tree, yet
adding these nodes on the kernel side will help to reduce the
differences.

The zynqmp platform was ignored, as a similar change was previously
reverted [2]. I also ignored a few platforms without direct match
between U-Boot and Linux dts files.

Also add the OP-TEE node on the imx93 FRDM platform device tree: while
this is not part of U-Boot code today, it is the change that triggered
the U-Boot discussion.

[1]: https://lore.kernel.org/all/20260706145906.GW749385@bill-the-cat/
[2]: https://lore.kernel.org/all/20251125-revert-zynqmp-optee-v1-1-d2ce4c0fcaf6@vaisala.com/

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Changes in v2:
- Splitting i.MX8 SoC changes in a separate commit.
- Adding bootph-pre-ram on stm32mp157c-ed1 reserved memory.
- Rebased on v7.2-rc3.
- Link to v1: https://lore.kernel.org/r/20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com

---
Mathieu Dubois-Briand (7):
      arm64: dts: freescale: Import optee node from u-boot i.MX91 and i.MX93 device trees
      arm64: dts: freescale: Import optee node from u-boot i.MX8 device trees
      arm: dts: st: Import optee node from u-boot device trees
      arm: dts: st: stm32mp157c-ed1: Add bootph-pre-ram tag on optee reserved memory
      arm64: dts: hisilicon: hi3798cv200-poplar: Import optee node from u-boot device tree
      arm64: dts: nuvoton: npcm845-evb: Import optee node from u-boot device tree
      arm64: dts: freescale: imx93-frdm: Add OP-TEE device tree node

 arch/arm/boot/dts/st/stm32mp157a-dk1.dts                | 17 +++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts                | 14 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi               |  7 +++++++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi               |  7 +++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi               |  7 +++++++
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts       |  7 +++++++
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts      |  7 +++++++
 arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts  |  7 +++++++
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts       |  7 +++++++
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts      |  7 +++++++
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts         |  7 +++++++
 .../arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts |  7 +++++++
 arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts  |  7 +++++++
 .../arm64/boot/dts/freescale/imx93-var-som-symphony.dts |  7 +++++++
 arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts    |  7 +++++++
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts     |  7 +++++++
 16 files changed, 129 insertions(+)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260710-mathieu-uboot-dts-import-69f51bc097d7

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

