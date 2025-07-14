Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BE3253B67
	for <imx@lists.linux.dev>; Mon, 14 Jul 2025 14:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752502821; cv=none; b=mXjae9clcwNI/tGdHMErWGiFrbVyIuBdCIpYE26KhMQIDCjsZI1XyvV3qGnZGEJtdxnqmjxkjQjAdkjvkCd1+rLDx762+djU73/gqCWEpFGQx4qqNFk1WwiGOsxG5I2+Z6i3VraEN8K4rzu274WKWDnmvRr6QPfyM/zC68p8o0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752502821; c=relaxed/simple;
	bh=iaIHr95EYCPG/4EC9W9/SZEHZNA0jG4H21UubzlF/Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sTRY8o9EeNHob9MPZbUcoXjhDswDyEvVb1VeRxJfzYgyYQPJP1hCAHY0CBXLP862C7Y//pTYmPutj4ObWS4VbPPSg2SAP2VMlWEv0siyxMk6hZ/wDSfzyeMb8lead8txkH7LkmAVgm+E/7/LouR0GiVQHrN41XNmsXIVQbD8tec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=Yaye8xXM; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="Yaye8xXM"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D32BC753F;
	Mon, 14 Jul 2025 16:20:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1752502816; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=I1cjRw+NOmrxpgqFiLQFeXIHtpswYIGfiHFGY6ljemw=;
	b=Yaye8xXMLAM+wbU1ONJzXaYlZHoIMWO/biWbvIge79i3eQXrVGlAdnjupaETFIykCNrwkF
	GVprrUGV0Qzc2CRQLR1cbyWGaL+l8GL3ugbCFJupMljvmRApXq/Id1raM8h2gbjWROMf+j
	4qBxRBWDjekNlx8BJzm2qSPlpj19bhDq7bLw6bE9WjnwkGgi9qugCbklT4OeE5UZ342m3R
	xZCKou4L1RBiGdT46qKcAhs+qjqf16vXd6y5E2I4MmF3GgI04zQAtlcjGjYbPzlROEl8ed
	vnaKhXsd7rh80s5kI4wlIXzEGhLHDPuouW0Xqk/nRgfYSwSoXHea4dikEZ1AHQ==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 03/12] arm64: dts: imx8mm-kontron: Use GPIO for RS485 transceiver control
Date: Mon, 14 Jul 2025 16:17:29 +0200
Message-ID: <20250714141852.116455-4-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714141852.116455-1-frieder@fris.de>
References: <20250714141852.116455-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Eberhard Stoll <eberhard.stoll@kontron.de>

For this IP the correct control of the CTS signal for transceiver direction
switching is difficult and - maybe also buggy - in the driver. Especially
the bootup requires special handling for most hardware implementations.

Therefore we simply use a GPIO now, which is fully under software control
and which is not problematic on bootup.

Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
index d16490d876874..d96c07757e1d2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
@@ -268,8 +268,16 @@ &uart1 {
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
+	/*
+	 * During bootup the CTS needs to stay LOW, which is only possible if this
+	 * pin is controlled by a GPIO. The UART IP always sets CTS to HIGH if not
+	 * running. So using 'uart-has-rtscts' is not a good choice here! There are
+	 * workarounds for this, but they introduce unneccessary complexity and are
+	 * therefore avoided here. For more information about this see:
+	 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=79d0224f6bf296d04cd843cfc49921b19c97bb09
+	 */
+	rts-gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
 	linux,rs485-enabled-at-boot-time;
-	uart-has-rtscts;
 	status = "okay";
 };
 
@@ -439,7 +447,7 @@ pinctrl_uart2: uart2grp {
 			MX8MM_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x0
 			MX8MM_IOMUXC_SAI3_TXC_UART2_DCE_TX		0x0
 			MX8MM_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B		0x0
-			MX8MM_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B		0x0
+			MX8MM_IOMUXC_SAI3_RXC_GPIO4_IO29		0x19
 		>;
 	};
 
-- 
2.50.1

