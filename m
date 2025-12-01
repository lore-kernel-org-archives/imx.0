Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FD52F5335;
	Mon,  1 Dec 2025 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764590219; cv=none; b=ZY8cTlIPNcoa0A4Njo7+5/hi5YftEMbcd75iWVW62pUfCXIifvDBC7F5qTPRuihkWDm4PV27To/yp9eoDqcOwqs42fFZOr/D+CMHHqcLWNXxuGhTHIp6+vyRGm7p5sh6w8gCszEBRbWjtD0bGbWfEiHklph71mKRjz4IG5+EiX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764590219; c=relaxed/simple;
	bh=jMHzmSZqrvP4Wb+5Bsghxz7obfu2WOi8R1ehFEDgjF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AAtX4rXRS6wHorohHI9ONk+upN9Hq0vEEY/ltbZXuJvPgEbZD+DtG/MLrYKO0oND+2WeQNXexXiRTwMrWjDH0HCZKmCt+ViVvHZBRWEjZdFRXVITzvDHCYJ6Tz/QizyTT/AKflWmVTE5qtTmkX2iq/NlbHKHyVj4evnME+WLBj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGDqfi8e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGDqfi8e"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 671C5C19423;
	Mon,  1 Dec 2025 11:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764590219;
	bh=jMHzmSZqrvP4Wb+5Bsghxz7obfu2WOi8R1ehFEDgjF8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HGDqfi8eeO2FEN19gzr6Cbju8GHOS+VB7P7KnCeA6W5KH1638Ap/+H3wHid2rE+1D
	 BEbJzNtpjyLlbH/opooDa4GTvORSJU4QHw5AtOoc2Xr+Mm+yUL7AhxppKpxtOWFSdB
	 4xZlt3/qniNNUwJVqTBVkV2h34du1RKVD80cDCBVHmjgEqKtgVc6X+w6fiiksSCxV8
	 HHskN8sFy54I4Pvtc9PSTMmhEbmLPBWkhoGpG3mnVhLj6LPH/xee7t2wHD8ru5CLvY
	 DInyKdU8mO15ebb/2AdPuQ3lu/1nyTTUYTnHw+JogHESchAZuAEgXyS8nsvd4Qh99b
	 uiCJhhKPEEN2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2BFD116FF;
	Mon,  1 Dec 2025 11:56:59 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 01 Dec 2025 12:56:52 +0100
Subject: [PATCH v2 3/3] arm64: dts: freescale: tx8p-ml81: fix eqos
 nvmem-cells
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-disp_fix-v2-3-9b03026311b6@gocontroll.com>
References: <20251201-disp_fix-v2-0-9b03026311b6@gocontroll.com>
In-Reply-To: <20251201-disp_fix-v2-0-9b03026311b6@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764590218; l=1812;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=UarncIoORvGu/J2XyFu3oe6mX1a3LvZl4JDeYZkFnbQ=;
 b=gYKT+KLzWn3ITTap+LEFHxcxFrpOkXKJ8kY/KJYUf/jCvfQaELRPEDwdtupElv4zeUZvbg20I
 rzAGTOlmmbgBk02fE/9w1MNX79W2vPLkBWEZ7qlLhJTB6WklRhwFQ/J
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

On this SoM eqos is the primary ethernet interface, Ka-Ro fuses the
address for it in eth_mac1, eth_mac2 seems to be left unfused. In their
downstream u-boot they fetch it from eth_mac1 [1][2], by setting alias
of eqos to ethernet0, the driver then fetches the mac address based on
the alias number.

Set eqos to read from eth_mac1 instead of eth_mac2. Also set fec to
point at eth_mac2 as it may be fused later even though it is disabled
by default.

With this changed barebox is now capable of loading the correct address.

Link: https://github.com/karo-electronics/karo-tx-uboot/blob/380543278410bbf04264d80a3bfbe340b8e62439/drivers/net/dwc_eth_qos.c#L1167 [1]
Link: https://github.com/karo-electronics/karo-tx-uboot/blob/380543278410bbf04264d80a3bfbe340b8e62439/arch/arm/dts/imx8mp-karo.dtsi#L12 [2]

Fixes: bac63d7c5f46 ("arm64: dts: freescale: add Ka-Ro Electronics tx8p-ml81 COM")
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
index fe8ba16eb40e..761ee046eb72 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
@@ -47,6 +47,7 @@ &eqos {
 				 <&clk IMX8MP_SYS_PLL2_100M>,
 				 <&clk IMX8MP_SYS_PLL2_50M>;
 	assigned-clock-rates = <266000000>, <100000000>, <50000000>;
+	nvmem-cells = <&eth_mac1>;
 	phy-handle = <&ethphy0>;
 	phy-mode = "rmii";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -75,6 +76,10 @@ ethphy0: ethernet-phy@0 {
 	};
 };
 
+&fec {
+	nvmem-cells = <&eth_mac2>;
+};
+
 &gpio1 {
 	gpio-line-names = "SODIMM_152",
 			  "SODIMM_42",

-- 
2.52.0


