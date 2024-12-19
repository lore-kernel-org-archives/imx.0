Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F75216E1A
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 07:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734593145; cv=none; b=QbkYWFTW0Vmu5zsAE7/UDEqwQyYMk2P2xpzSULSTFLDM6Vgk+TNhP3ikBGy/r/5DAylLPUyKlqwHg0Cg4uJvstB2/bu86VHh/0Uoh/fIs7oR4ItSxHDZgDtPnL1c5F04Nl6UBSJlUrw2djwNoA+U3PfuX41BEF5GU3058Gs4kDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734593145; c=relaxed/simple;
	bh=64Yf9rLnu9/J/wxGl1OP/jkO1/LFlql87gQlHovGbIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SQtvpt+++TdtSA/KTc94LM6GgJwPCQ7PyBmCwYF/wl+LpZZa6DE+ja9ejYRFWCfJOcHJPA21tHcfcmvjnSdSnSzNMK/pt6x8euH1B6bK2aXk6c+1t4o1xfg6Zg2w9zVCt0Uo998OU4Wumj6Lt+WXwBQcgdjEfcQ18vGmTuYJt+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAuc-00064O-1t; Thu, 19 Dec 2024 08:25:34 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAua-004AOG-2u;
	Thu, 19 Dec 2024 08:25:33 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAub-00GenW-1k;
	Thu, 19 Dec 2024 08:25:33 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Thu, 19 Dec 2024 08:25:31 +0100
Subject: [PATCH 07/10] arm64: dts: imx8mp-skov: configure uart1 for RS485
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-skov-dt-updates-v1-7-38bf80dc22df@pengutronix.de>
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
In-Reply-To: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.13-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

uart1 TX, RX and RTS signals go off the base board and to a RS485
transceiver. Describe this in the device tree.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index 7ae686d37dda..bce23d62cd27 100644
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

