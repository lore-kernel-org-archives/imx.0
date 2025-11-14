Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEADD31AF0E;
	Fri, 14 Nov 2025 14:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763129512; cv=none; b=QS4DQY0mYykz7YCfQps/2u5D4xgekPJlysaZqwjxocbRfshNRGDOSSDQAZHx7jWOoY8/xix0RKDddCe3wvzXOZze0C4ErP6o1IinY4c7ns7ibdBOyulpjSc5IpvjJF46l+bQyrMUSwg3i/Gr/9jLMrjOau360VJjbmAR23DxSwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763129512; c=relaxed/simple;
	bh=fqAalezj7DXsLl2tdBUW30sL68H+wctQBaRnLrnT83c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fclZUqDcKBOydj5ZSaDffiNzM/ldYrVYIsmmCsLyQZnh7oyCVrtizDhaA9QGOapF/LHsWum76RtwwCKk168O03YTG3kQ4M5sXwKHq0/sLm9f//ZkWErD3oxWu1Yl7Wgx4rWHfxtuTt/WIhNgVWF1txG0rF+fH+qS62UFfL9nBjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4zuvFX2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4zuvFX2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F506C2BCAF;
	Fri, 14 Nov 2025 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763129511;
	bh=fqAalezj7DXsLl2tdBUW30sL68H+wctQBaRnLrnT83c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=N4zuvFX2jPINsximv4LQ1hMLjChRMQ0H8MdxIMyQuzEQE8HgJS83fX0UvBYWkikXS
	 97r1vpuWgbHDuPYDtOet4EYKVZJh5bSrwaKr5w3WeC43br0oE4ENVsyFFoPB5QXAko
	 FemppkWmMiMmDb8KjaKPXSC40SbwFYAh8GaVY8aj2Xoh4x9q/Sa/hZ+lMxL1M2DphA
	 dW/0leZzcs2vZcPXQ2+PfY8Pk1fw8GN0kK8ub0RXNl2C/PWDGa1G5KGPwODSln+kWB
	 PAOgb70leAs4/KYWrz7/yf49yXo7yqVOceBIcNFe2aGexbYHH5udwgSBUBP1iBy6qE
	 YFnquv8/M/2uQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20736CE7B12;
	Fri, 14 Nov 2025 14:11:51 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 14 Nov 2025 15:11:51 +0100
Subject: [PATCH 3/3] arm64: dts: freescale: tx8p-ml81: fix eqos nvmem-cells
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-disp_fix-v1-3-49cbe826afc2@gocontroll.com>
References: <20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com>
In-Reply-To: <20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763129510; l=1812;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=AP85dujUDPLr0xfJMQvOUhdr0wRHQGnqWqUmnerLMaM=;
 b=uZDz+8SuWZ99IoSCwkdW8s1bBJhE5najT2t/1qht6sMDSBxp4Gfgt+5O5SF6WfAjfcMoCJvBt
 o/e3r7ghfbxBzZSWzN47ZvA/We6g0DBnp6uuBnGsVWEzXr5XrHZCeip
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
2.51.2


