Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CC22FD7A0
	for <imx@lists.linux.dev>; Tue,  2 Dec 2025 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764682930; cv=none; b=ezq6i3ccdVK58dpK0tNVAiPPcavqAX5KJEZ0JEIE5qV9vrRzPucmKdevIFAWG1GzdhlvhKXaopgP9NOdYtBTstKG4K9d8P1blpupUdvSRomxxLHi5iWD9caL8CC0Nsc90N8c0bIKSQnfMi/Ib2CN+Zo/Q9kdl6ABVzVvHEoz++M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764682930; c=relaxed/simple;
	bh=ka10s/m51A5sD5hXxZSkBvpUzXc7aNT8t9aCjRwuzIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BUe4uJYuMSYG+Md9s5g8ykwtpDnIzpHxTtUB/ceYGrgvvXrrLNfR3Z2ME9VscGQx3vuG9yX3HbbDXIkjbKh2Ij0Lj05CuQp/cN0uH8rk2SMfsINU3d1rDcM9cgHR7huCSe1JWK81Bm9lraeUJq6pPYEnxxJYau6K2TVQGHztGRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Zbh2TrvK; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tbGibNpJ; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Zbh2TrvK";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tbGibNpJ"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dLMQ64hWpz9tBD;
	Tue,  2 Dec 2025 14:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764682926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I0SIJKX9tZQSfmZscwDLxEmvBbRFMw4s1nyXcFylYtY=;
	b=Zbh2TrvKZ0UDXVv986Hs/XYg0Vo7XiszfkiBSyLU6Kmo2upVqHHc0e3WQcc+pJ1JaFJjdY
	yIUvjwaDite8wifZfdPvFSLUEfmNQhajWt+SD/qz9u9L7EQkShNS/PvBCQm30la+4zceaF
	f3nhyr/xe3ECYNyiG/2MkNy+TKz9djW3/uXddQomREVK8dR86LZHk5NDKDa2QDamJeQBXH
	wpSJ65XKKkPaTbftV+xHm8PcxLYToJWOA4VeQWzzRupZEfTswW01gDqftnGohgTumFVVCT
	TSevwZF0qJhVP4YAauLLOpAgqUVXT/8Z/O6pR/ipKqkRC7v+CdO+bzR4wjOn4w==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764682924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I0SIJKX9tZQSfmZscwDLxEmvBbRFMw4s1nyXcFylYtY=;
	b=tbGibNpJxAY4qNsUW32sYPHZrLzYTky+M5WIPTmYLRqN1uTSonMf522c/6GC8Ej6wmcqzO
	coebMplSN4Z4r1qOOz0d/9gzQhtRZ/LeyCs56Fl3aesQ4yghDsgota8EI421icAN2ENU3r
	S4PlcCczqtxRJL+nRQ/r31WmVhY0c/YGbQ2LoD0dRSESseYPc5DmTa6hqrLcY9UQXDZPNL
	mcV8WaOY+rVn2uo7QDEZsBHtH7cBXIxbTUgoxReELqg7viR/AAyUTXBz5B+4mrfA8OVeiV
	zfR8aclx0D097W+oA3RXzN3IdfOd2M4SHoIe0a3lYTDiuozmtApt56mHJGleZg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com
Subject: [PATCH] arm64: dts: imx8mp: Fix LAN8740Ai PHY reference clock on DH electronics i.MX8M Plus DHCOM
Date: Tue,  2 Dec 2025 14:41:51 +0100
Message-ID: <20251202134200.8397-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 19aa33e691b1c0446b7
X-MBO-RS-META: dkcxn7cuarhsocuktk5766e9tug3h93f

Add missing 'clocks' property to LAN8740Ai PHY node, to allow the PHY driver
to manage LAN8740Ai CLKIN reference clock supply. This fixes sporadic link
bouncing caused by interruptions on the PHY reference clock, by letting the
PHY driver manage the reference clock and assure there are no interruptions.

This follows the matching PHY driver recommendation described in commit
bedd8d78aba3 ("net: phy: smsc: LAN8710/20: add phy refclk in support")

Fixes: 8d6712695bc8 ("arm64: dts: imx8mp: Add support for DH electronics i.MX8M Plus DHCOM and PDK2")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
index 68c2e0156a5c8..f8303b7e2bd22 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
@@ -113,6 +113,7 @@ mdio {
 		ethphy0f: ethernet-phy@1 { /* SMSC LAN8740Ai */
 			compatible = "ethernet-phy-id0007.c110",
 				     "ethernet-phy-ieee802.3-c22";
+			clocks = <&clk IMX8MP_CLK_ENET_QOS>;
 			interrupt-parent = <&gpio3>;
 			interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
 			pinctrl-0 = <&pinctrl_ethphy0>;
-- 
2.51.0

