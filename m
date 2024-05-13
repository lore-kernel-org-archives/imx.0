Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF7C12DDA5
	for <imx@lists.linux.dev>; Mon, 13 May 2024 02:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715565914; cv=none; b=PcB2q3nKt2R9QclxxKuFGrEDidTmxcZwWHwAfk1zr8+kbTOkEUdk+MlsqxR3iV0WxEEogZLq8sH2Zyut7o3zANvizeVwsAFfjzLGpJMrLrqeYDavS5uMB7+NOJBvBmWxtxvawEhax2DlDEoNrPd/nKzT2UiewbQAqsOAnKMjc7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715565914; c=relaxed/simple;
	bh=ZLr5UrARaHefDZc+uWzNJhmGH6xSykQ6ui4NwmEi9+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N1FlZbZ6ptrN7oCdKWXCs6VTnMURKxC+ZX1NGYoyADkNhOkcI3krU4Y28yWm2UgiqxPYDpF0nZVYZjW3XcsLUataRoeoDQ61cmMSu1w7R/UuCY0OWDxNbXrf/ZaDs+gAbpa4ykmbkMTiCVlQOaRKaWylXg2Tf84SQUjrSQzsYD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=k8azgD8e; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="k8azgD8e"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CEEC488116;
	Mon, 13 May 2024 04:05:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1715565909;
	bh=tTs3SgAZz3M4fFgZyEds7/0nwHr1qmH1+Ulr0vH+QKw=;
	h=From:To:Cc:Subject:Date:From;
	b=k8azgD8eSZoUc1SdSYM9g1y5dF6b+iRM6I+W6gBbz3eE6lNa3CwaCHmQI2si+tjib
	 AamXCwBphyApwW/3ghpyiPxc0juP6Slw9y5glS+1wl0MInTBspcV72E84hjhlORaNB
	 bEoiuCRyLVLzoRsOZnkAZCUceXHeBtC3TP5WT4yCpVNuvcwv96w95ngM9asyA2PNYz
	 +dPQb536hhcwpbPw93RVzZLlxXo86rE6gmfdOGGphrhWFlprPh68bo6bDks81K5Jv4
	 Xi9B50HT4Y8O52BNG2MozipE2CZkM6403i8od4Gd0ezFIivio6lWQlYiOSjChIe4JG
	 xfRX1cn/uSBag==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
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
Subject: [PATCH] arm64: dts: imx8mp: Fix TC9595 input clock on DH i.MX8M Plus DHCOM SoM
Date: Mon, 13 May 2024 04:04:39 +0200
Message-ID: <20240513020454.127584-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The IMX8MP_CLK_CLKOUT2 supplies the TC9595 bridge with 13 MHz reference
clock. The IMX8MP_CLK_CLKOUT2 is supplied from IMX8MP_AUDIO_PLL2_OUT.
The IMX8MP_CLK_CLKOUT2 operates only as a power-of-two divider, and the
current 156 MHz is not power-of-two divisible to achieve 13 MHz.

To achieve 13 MHz output from IMX8MP_CLK_CLKOUT2, set IMX8MP_AUDIO_PLL2_OUT
to 208 MHz, because 208 MHz / 16 = 13 MHz.

Fixes: 20d0b83e712b ("arm64: dts: imx8mp: Add TC9595 bridge on DH electronics i.MX8M Plus DHCOM")
Signed-off-by: Marek Vasut <marex@denx.de>
---
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
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
index 882186d96f58b..4d30f74622a18 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
@@ -254,7 +254,7 @@ tc_bridge: bridge@f {
 				  <&clk IMX8MP_CLK_CLKOUT2>,
 				  <&clk IMX8MP_AUDIO_PLL2_OUT>;
 		assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL2_OUT>;
-		assigned-clock-rates = <13000000>, <13000000>, <156000000>;
+		assigned-clock-rates = <13000000>, <13000000>, <208000000>;
 		reset-gpios = <&gpio4 1 GPIO_ACTIVE_HIGH>;
 		status = "okay";
 
-- 
2.43.0

