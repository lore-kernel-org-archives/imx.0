Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A6D28C85A
	for <imx@lists.linux.dev>; Mon, 21 Jul 2025 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753092518; cv=none; b=egxUfd6/x9EvSmEfpXbFHtdaQ3kYUkHP/+pAkSQo9Kb6h6Zh8RSb/3cUBUsEZTI5OBRwDknoi3JecBlU+No0ZaDtPtSarunLmoSIJvMNvoKpNR/Rkf8OhwelfYpoS5Cd/gpvhrvWD4zGbcCXMNxYInNg+p+f4atcLZZBDOU9r1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753092518; c=relaxed/simple;
	bh=NjzxlCy4iLe+iFTThgtcXMxtWo5BqnZQWysZbGrFBQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlScwWnwAymukohYecQLQ4pJXcBc4I5fT4lftJJS6UKRNYCFIav/qf4XtP1rQycTeltP5bXYAeSzCJavPMkgo9lQi+le7//vTa9T2QCyzYnSa4j0CT0xXowQLgPSYJzp67JhK5kZata7scKvgyICYqOhRJ411xH2/Ob8ubbg95w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=J5exG3Do; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="J5exG3Do"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB6B2C75FE;
	Mon, 21 Jul 2025 12:08:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1753092514; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=K+2J52d5biqNZJ5H4QTYCracuhxxNgVwtad88cT/8Y0=;
	b=J5exG3DowrjEaesjdpPL432Wui8mNTFGjJ83xvPLjOYz9HYA1ZptCI/SB0EMx5Lu9cfQvT
	Tf0oIc4rW3ibY/h8XZXV+6ZjPTN35fbA1lMfsc/82kXzog70oAFNyKqepjbzTIk+ZAOTQ9
	zcCYlLhoKGM+iJHWxfyAQLbyTjOhUzSWSN5BRpy+DuaSzjhGTTDx/lRoZpv+KKqJuWUvMQ
	OZ5J1d8LM9wDFBIc8DU5C9OsAZyGJxLc7MfDAoJE2sJfc0OfqdL09lW9FUEQiQG6uqvoAm
	keSJzs6P7b/FPvC+X/5bOB13fcSQ6CIhndHbvw+Vz83GYFqMeOL8BcRWfCYh3Q==
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
Subject: [PATCH v2 03/12] arm64: dts: imx8mm-kontron: Use GPIO for RS485 transceiver control
Date: Mon, 21 Jul 2025 12:05:37 +0200
Message-ID: <20250721100701.115548-4-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721100701.115548-1-frieder@fris.de>
References: <20250721100701.115548-1-frieder@fris.de>
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
index d16490d876874..e756fe5db56b6 100644
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
+	 * workarounds for this, but they introduce unnecessary complexity and are
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

