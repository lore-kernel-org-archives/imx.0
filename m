Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66B83BA227
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728752; cv=none; b=bvAtyulr3BIMOgZGB5cYm/+Mt04e7zlPTisYAED+R5q5DIEFiQOq5Whdn5OaXfw6fOpSdQHMPHel57RR8WYumX5ymQqaoqOv2lJiSeCi9omgL2+qRgVKFJ4sboROfAJzHgA98OBzXO+gBSgYz5pM/SbQxb/xsNiOguaD3zxfT44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728752; c=relaxed/simple;
	bh=vsbrF4C8s+hrl0tfFE9NwVziDX4Y2AK4UKRvGJQwKEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W4QX8V2aD9Hnb/CS0NlmVPDAo+s+n81B+vVlCA7vTHaZVy7vk7cwyJjWdKwTS1pBE99PWQBuJh//+KNdGPs9C6SHFdeCIiu85tSBd1bjP/BAwINvXIXPmekfoWK4EKWVEaylNJiFsljjdfF3WDm7/Zfnrj1CcdT4Xu/U9TCGaW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=ajF8FaMn; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="ajF8FaMn"
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id BA2FE2035D;
	Thu,  9 Apr 2026 11:59:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1775728749;
	bh=3oeln9JFl3xMIZpXa990FnDvFwc3Ph1pCSyvABpPHh8=; h=From:To:Subject;
	b=ajF8FaMnzUqXRCsZ7aDfsCwGHWoT0NO4zdp3CT8on86/aAEe2KcEZ5GeiqhH0l1yV
	 iReHRUBmD4YDhgYUSiNiLLJi9zQBcKAZrYHB5c/jGEP+e+PVPExjZK1eDnhkR3ojh0
	 arzfid+SVOgW1ezZ9dwQA5lz005ne1hK6EggnsgWmI5k23ZysrvRAs4oqAAGuqHdP5
	 2oIUC+GCn8K8ad80qasZ7OohRiqWkOW088ou7wL3li4K/SS51z4k9o14Byj4NGrrFw
	 54E209QplebTwrSrZ0447x+9jEYlDplhaYtLBQSwCp+uWzInNiabrarLo3zkmvN9x8
	 qrXNvtsWhT+tg==
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
Subject: [PATCH v1 4/7] arm64: dts: freescale: imx8mp-verdin: Split UART_2 pinctrl group
Date: Thu,  9 Apr 2026 11:58:50 +0200
Message-ID: <20260409095855.61252-5-francesco@dolcini.it>
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
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index d31f8082394f..9fee2cf9ef54 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -846,7 +846,7 @@ &uart1 {
 /* Verdin UART_2 */
 &uart2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart2>;
+	pinctrl-0 = <&pinctrl_uart2>, <&pinctrl_uart2_cts>, <&pinctrl_uart2_rts>;
 	uart-has-rtscts;
 };
 
@@ -1277,10 +1277,18 @@ pinctrl_uart1: uart1grp {
 			<MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX		0x1c4>;	/* SODIMM 131 */
 	};
 
+	pinctrl_uart2_cts: uart2ctsgrp {
+		fsl,pins =
+			<MX8MP_IOMUXC_SD1_DATA4__UART2_DCE_RTS		0x1c4>;	/* SODIMM 143 */
+	};
+
+	pinctrl_uart2_rts: uart2rtsgrp {
+		fsl,pins =
+			<MX8MP_IOMUXC_SD1_DATA5__UART2_DCE_CTS		0x1c4>;	/* SODIMM 141 */
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins =
-			<MX8MP_IOMUXC_SD1_DATA4__UART2_DCE_RTS		0x1c4>,	/* SODIMM 143 */
-			<MX8MP_IOMUXC_SD1_DATA5__UART2_DCE_CTS		0x1c4>,	/* SODIMM 141 */
 			<MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX		0x1c4>,	/* SODIMM 137 */
 			<MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX		0x1c4>; /* SODIMM 139 */
 	};
-- 
2.47.3

