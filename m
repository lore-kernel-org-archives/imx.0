Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC2313AD11
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 16:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736179623; cv=none; b=WfLrzVhAjiEntcZYSlOTocBckngzmuhkis3TEPO9X6Y5R5pcnE3RmDIalM2j3ONZ1LiGvXFVSmDFsGI6pAYkOzzOCJ4IHUc5plboG0QDxmHk6zIw4g5NBDf1jsqatno9BUn/vPeY1yxDaK97MtK1qIo8a2YgPTfLhBiY453HhsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736179623; c=relaxed/simple;
	bh=7XJyjwJekst9RLsz+ASk9YMPGOqrwKg8GSByujmuqoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YTnJy+oJQ0kuXEYX1iLHj2rJnMhQpXSS+CUOPs5/f48UoTj0wtTWzW7hUpkMlRPUkD9w0N4xBokvfMm86NK9Bz0DV9y71zEI7tg+LD1agdPMSg0SpWBitpeNheczRTnZZVfQ/vvIY4bM6PdEWqcwcWF7rkJfLs/jAicsXZ39UXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcx-0000C8-KC; Mon, 06 Jan 2025 17:06:51 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcw-007C9r-15;
	Mon, 06 Jan 2025 17:06:51 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcw-009dVc-38;
	Mon, 06 Jan 2025 17:06:50 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 06 Jan 2025 17:06:42 +0100
Subject: [PATCH v2 07/10] arm64: dts: imx8mp-skov: configure uart1 for
 RS485
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-skov-dt-updates-v2-7-4504d3f00ecb@pengutronix.de>
References: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
In-Reply-To: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 Frank Li <Frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

uart1 TX, RX and RTS signals go off the base board and to a RS485
transceiver. Describe this in the device tree.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
v1 -> v2:
  - no change
---
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index 7ae686d37ddaca7a323e2cb1ec7d807c2e3bd3f5..bce23d62cd277b89ec9ce5ed3651cfe787987158 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -404,6 +404,13 @@ &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
 	status = "okay";
+	/*
+	 * While there is no CTS line, the property "uart-has-rtscts" is still
+	 * the right thing to do to enable the UART to do RS485. In RS485-Mode
+	 * CTS isn't used anyhow and there is no dedicated property
+	 * "uart-has-rts-but-no-cts".
+	 */
+	uart-has-rtscts;
 };
 
 &uart2 {
@@ -618,6 +625,8 @@ pinctrl_uart1: uart1grp {
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX			0x140
 			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX			0x140
 			MX8MP_IOMUXC_UART3_RXD__UART1_DTE_RTS			0x140
+			/* CTS pin is not connected, but needed as workaround */
+			MX8MP_IOMUXC_UART3_TXD__UART1_DTE_CTS			0x140
 		>;
 	};
 

-- 
2.39.5

