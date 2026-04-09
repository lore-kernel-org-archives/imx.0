Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11CB3A16A0
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728750; cv=none; b=kwHN43QezWtHZrh4qYPeJpGXtk2img7f9UWYSjx+NDhEQFK8t+ziEvcDfsX5xF8x9NOB3cmE/6t83B8bTVvzfYICrrGNM9km8E4u77uDV8Ci8wGcUAAhr+iI4CNT6NxePoqKX79wVwUA5E454hX9DbMsl115pw+eR7rGxjQ6tUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728750; c=relaxed/simple;
	bh=WnYeKe0+0HjIxBjz5+9jUqiJnqKAgj+SVvLX0k6GYRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KqluOHQVSThi5LkufpfnW/OiIlIpQPIISky4vMHz1QFvq5RA/m6YNZic5Og2PMJsQjQXn7J5yJbg4ux0asx9xmY2qVm1G6Wpxw2PtQkAMOYycING5IqW+pkNseS9C3SWMaGIFvd6EBzHhtygYuDrAIfZYM5qlxv5BDQd5tChH1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=b8g3NX1N; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="b8g3NX1N"
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 6771220379;
	Thu,  9 Apr 2026 11:59:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1775728747;
	bh=rilisu3ZqruoV1nzBO4jO5k4MVTLVZBUuqa+slZBBfA=; h=From:To:Subject;
	b=b8g3NX1NdIjgOoXZ6fdu3FWRYHasMPjj4kAp0KYM1J8VKJEZsX6ko8EfHKKWHnUX7
	 MnIc2bu/xa6VmHq6xA0Zf8+a+iGbvqv5U/t8XKQFHJB6iKyeOUf5h7K1VRE/6elveH
	 8FBfY4IMwJyJTq7aSAjjG8mQ11riCrUG76Xkpgi/7pU0gnF2li40EySXzA87kdDHA3
	 7fESurPu/nv56qw6Z3WVKS65twNmBlCTR1y+X7tO02IP6h6EFD5r0GbHLWkGbek0Gt
	 p/3yqSw/3XSjuGWszM9o/qJfx32+i/KjShVHdoSOLSG7F5SirGbUaxlCyYE7k+APbW
	 UOtxrm8/tdVhw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 2/7] arm64: dts: freescale: imx8mm-verdin: Split UART_2 pinctrl group
Date: Thu,  9 Apr 2026 11:58:48 +0200
Message-ID: <20260409095855.61252-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409095855.61252-1-francesco@dolcini.it>
References: <20260409095855.61252-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Some carrier board reuse the UART_2 control signals as GPIO, split
the pinctrl RTS/CTS in separated nodes to maximize flexibility.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 1594ce9182a5..5fc177f589cb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -735,7 +735,7 @@ &uart2 {
 /* Verdin UART_2 */
 &uart3 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart3>;
+	pinctrl-0 = <&pinctrl_uart3>, <&pinctrl_uart3_cts>, <&pinctrl_uart3_rts>;
 	uart-has-rtscts;
 };
 
@@ -1144,12 +1144,20 @@ pinctrl_uart2: uart2grp {
 			<MX8MM_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x146>;	/* SODIMM 129 */
 	};
 
+	pinctrl_uart3_cts: uart3ctsgrp {
+		fsl,pins =
+			<MX8MM_IOMUXC_ECSPI1_SS0_UART3_DCE_RTS_B	0x146>;	/* SODIMM 143 */
+	};
+
+	pinctrl_uart3_rts: uart3rtsgrp {
+		fsl,pins =
+			<MX8MM_IOMUXC_ECSPI1_MISO_UART3_DCE_CTS_B	0x146>;	/* SODIMM 141 */
+	};
+
 	pinctrl_uart3: uart3grp {
 		fsl,pins =
-			<MX8MM_IOMUXC_ECSPI1_MISO_UART3_DCE_CTS_B	0x146>,	/* SODIMM 141 */
 			<MX8MM_IOMUXC_ECSPI1_MOSI_UART3_DCE_TX		0x146>,	/* SODIMM 139 */
-			<MX8MM_IOMUXC_ECSPI1_SCLK_UART3_DCE_RX		0x146>,	/* SODIMM 137 */
-			<MX8MM_IOMUXC_ECSPI1_SS0_UART3_DCE_RTS_B	0x146>;	/* SODIMM 143 */
+			<MX8MM_IOMUXC_ECSPI1_SCLK_UART3_DCE_RX		0x146>;	/* SODIMM 137 */
 	};
 
 	pinctrl_uart4: uart4grp {
-- 
2.47.3

