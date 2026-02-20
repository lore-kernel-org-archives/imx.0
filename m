Received: from mx-relay48-hz3.antispameurope.com (mx-relay48-hz3.antispameurope.com [94.100.134.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEF5259C80
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 14:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597899; cv=pass; b=LOE1+dk1cu0YFPb4oO7xm9gg2g3mCy6KcsEuJCRwHsk6BKLFBscOq7zHFHWPmFy26lpuXtjp1kG0PLiIMZq4iGDj1ZOCtl+U/5gPiJ+IGGk+pxAfwOWIJOv7zv36Gz9PIVWxiC+NY1xmfRHRMcKD1aA+hSPsoRRIvE+UwyrvJfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597899; c=relaxed/simple;
	bh=XZuxOTf/kiVaWWPgSbCLGs4MElww/Lm9TiUtT+MT+ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7skN3yJY3m9DFUlhyu/IFfcKZ3ruwuCTeIZmYI9ENJGrItJwCL0Zz+egzOghzh+3cz0xJvBSeUUQrleGo5/DSyOQnIPha1UOCh0OXtaXxkBhHpGGaVMBSea/4UKpZ8gya6sB+dF+vq7tuwrJjjC7BbdoBQxlpD2bIRyKjOajW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=AoSvi2II; arc=pass smtp.client-ip=94.100.134.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="AoSvi2II"
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=99ZE7SYGvViA3Bdc/s5b6uYab0kctnMzOeoylTWBVgU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597883;
 b=gMTiO1wCb8+umN3hD7clkWw5MLuVWdJ5va4IGL1I7SUqmYzo55MszeMn87EKawsPnmhoWeEO
 TXOOzAAMAvABkDwcVF4QTwTfie2xk5RCc7BPC6dXPjUfhsW2mBhC3YZmWCErUWl9eoIlaxiEr9P
 Xxj2C/oWht7MXKVQCEhi3HDr2bCYdf+fhnp/O4C/cjluN403daKfwdIAITgS0/qCggfjoQkKEuX
 JdTL1iSMUUWP496B3AX0hrHMrkNDvT0ukNarCv86GDEfLC6dDDzfW0OyCCGGCk2BpJGgjxDAhwg
 BwBPZvcbjlyrIlhjOi2ySFV49jpb48AoM8M7r+2Ib1OAQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597883;
 b=WDiJarWgdX0oJ/NSty1JFTVLpzd+o1DCoYqzMtg9RzQzpyowPgH2DmtFgoMq1vfrCnwHcjUI
 7mC3F2Mg+TD869Gxw5T6tre5l39ZKPtpYw/iVtViEkCuV6p4V764BmcA/kFm3zh5y0Syd6XY6dZ
 ukvQUOkB2sIU1ZSgjuShE+ooRp4Y3itwh2QKdzXRShpiUZSxvve1WcD+ZwT4zfRTX5NyIsFouEQ
 ELS+zwIAeAHa6FfOKfshcB6HDQR3lR392cmIHFzpjmodUzNkpXraPbNZKUpijA3wJxnWejm9hwC
 1GemwQIJPtd5VuwcuKbnrVLJXbDGkDrP1ch+8sO5/+ubw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Fri, 20 Feb 2026 15:31:22 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AFE04220DAE;
	Fri, 20 Feb 2026 15:31:11 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] ARM: dts: mba6ulx: add boot phase properties
Date: Fri, 20 Feb 2026 15:31:04 +0100
Message-ID: <20260220143107.186956-4-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220143107.186956-1-Max.Merchel@ew.tq-group.com>
References: <20260220143107.186956-1-Max.Merchel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:max.merchel@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4fHXjr2Yjjz1kNt3v
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:783503c191e8dbba864f0297b7a7db60
X-cloud-security:scantime:1.857
DKIM-Signature: a=rsa-sha256;
 bh=99ZE7SYGvViA3Bdc/s5b6uYab0kctnMzOeoylTWBVgU=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597882; v=1;
 b=AoSvi2IIe5ljOs7sYs3ENy0gw4OS8mQzT0FMzZwmTC6IZBS5N4p8649Kg6PQVju7hexSH5ji
 Eve+NBYEa/2W47287j66vqG0GHSs2tETaJ3AsRX01dyOzII72WOK5S6DFyWL5IraPFdTFlwsa8U
 KCYjdXLFm8CSP9QUwfMCy8XhgWg99Lk7m6eBAmiUCMxXRPfSErOYJVDkqd23YiGfpooJ15Pm2fT
 tjPijCUHQwemYVKuGl9gAn4+megESAqtK/M0UeQ4h+E8ArlGF27+QtWreIZO0H/tCcu++FyYAVb
 QUViXhnl5dNPuB+VmVi4i+dVRppY9wAGKnhJv3w0fGdZA==

dtschema/schemas/bootph.yaml describe various node usage during
boot phases with DT.

MBa6ULx need regulator, SD-Card, UART and watchdog access during
boot process.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
index 65fde4f52587..1fda60d62ffe 100644
--- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
@@ -95,6 +95,7 @@ reg_mba6ul_3v3: regulator-mba6ul-3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		bootph-pre-ram;
 	};
 
 	reg_mba6ul_5v0: regulator-mba6ul-5v0 {
@@ -336,6 +337,7 @@ &sai1 {
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -392,6 +394,7 @@ &usdhc1 {
 	no-1-8-v;
 	no-mmc;
 	no-sdio;
+	bootph-all;
 	status = "okay";
 };
 
@@ -399,6 +402,7 @@ &wdog1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog1>;
 	fsl,ext-reset-output;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -494,6 +498,7 @@ pinctrl_uart1: uart1grp {
 			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_uart3: uart3grp {
@@ -542,6 +547,7 @@ MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x0001b099
 			/* CD */
 			MX6UL_PAD_UART1_RTS_B__GPIO1_IO19	0x0001b099
 		>;
+		bootph-all;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhz-grp {
-- 
2.43.0

