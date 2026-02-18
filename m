Received: from mx-relay99-hz2.antispameurope.com (mx-relay99-hz2.antispameurope.com [94.100.136.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9A02D23A6
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.199
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421105; cv=pass; b=NemoO9WN5FnjtBhdxBf+Yy2ea+akzDkFyNEfJUS5d8cASycphJvLyxPZbgReBx/oyCR3ecf2++y2Azn8xzAqM1yoeIilKRFBf43lk1F38Cy8st5Umiy0qBXjq6kBwX/52D3g6S7GVua2Q3g3rEqLR9SwjHdRl/4ZR65PNbEFD6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421105; c=relaxed/simple;
	bh=+VRdDjYGjOAQQR44GAINSO0rtHT3czjpLLS9e/uiIMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NJTR2yS3UJ7YZOGrvhmz+KPf47EQPob0CwpTb77S49x4sJFXjYa0dQXMyMIZP5TEHKq97vi5TREpLQ52sv2a6hgIAEWXTbkA4b3pZFaFiLQYm8q+mwXPgWDM/lhselHm7yqPE5Zt43ueygMQFS3QptjcA3QciYJfOuF+eJYi6gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=AmrRFCjJ; arc=pass smtp.client-ip=94.100.136.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="AmrRFCjJ"
ARC-Authentication-Results: i=1; mx-gate99-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=MoTbc/oD0OyhhEGqv2giwAcUy2p9JS4wITvmke3ZLCc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421036;
 b=gsNpSQF44ZDpSjqrKINk15Iew9IOoCfiRjZtZ9FO886OETe9CK2bzR1bfx2K/0hhrSePE9NH
 xiYYeSQc5RNalkI0j4TP6AL1RXf5gsZTZ/Aqa/JeiF57Xhnlm29talNCKy1TwWKiOpxjq6U9bP1
 cgWkD66q4vD6Bl6aLAzs12pLP5r55JKYhbF5T3k9WMpMo2i0juh9m/WP4p/Ncd6Om6eLuS6b1vb
 DcYH0CPP4wR8chwMfFCii1UH1rK7EUA4zBnwmZVhFlHoNTobsUxQqK21ryXS8GHawJ7oD2x8F8P
 z7u1xUsMdQA24x3kDksLWsAaN9wXZMjdGhlEX1OAJspdg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421036;
 b=EG+V5cyoXMRE3Ts/BPGbdgQ/wQd9NcgJ8J13clUh6PNfnFZEgxEMBRNtTo/CJf/kqh4tTKGy
 2EjdJSpSlix/BVi6UDqjKV+u14391DBWF/cDKe8MwgKtkRmtjY+gGbckHbBUMWK3x/xSUTwsrb/
 VpHGb6PDyVyn5Zvf4+CtevUtOVrHwsAJCoWt1/yXvI9MQswpk0ICmGCVhT50qsOua7mcbVU1KLf
 vZ3iLwXZa09k6aQhrlBzkKUIwBK6jQzp66VwLlKuH2l9IrLS8yPQc08DoRM/LKdW+JUvrvVPLBi
 Nd9eICsQY8KEwzB3MC9Zu61X1mOCH4XMFz8zGLzDnk9/Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay99-hz2.antispameurope.com;
 Wed, 18 Feb 2026 14:23:56 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D5AFB220714;
	Wed, 18 Feb 2026 14:23:44 +0100 (CET)
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
Subject: [PATCH 3/4] ARM: dts: mba6ulx: add boot phase properties
Date: Wed, 18 Feb 2026 14:23:36 +0100
Message-ID: <20260218132339.32157-4-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay99-hz2.antispameurope.com with 4fGHJx4N4Fz28mW9
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:bfaa624291ef2e7c54e646dbcffdbd37
X-cloud-security:scantime:2.078
DKIM-Signature: a=rsa-sha256;
 bh=MoTbc/oD0OyhhEGqv2giwAcUy2p9JS4wITvmke3ZLCc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421036; v=1;
 b=AmrRFCjJUfzVIaFvebxLkuIHX0L08YneMG9vEyKRCr+iMq1oBL5/ZEiboWMR3ZYUumqzyqF3
 FbzVdEWUMJD2j9dQbrqxvFrrd8gdhFLawN9SqqSH3sA07bH6749Rtbc6x8+AjIy9QCdcxKLFTsV
 K5jfXPdNHDrKy8Etm9URjkTqDI+S+/OOCmZn5qAGtOC4JBPWCHsMyEu5uFS+o5CZbt+iSyNtqWY
 61/YujXNKmBorP+l8nMWY7SGLI0x7pESB/fYps0SwJp5N65vxSkm7oBsAq7SCvibvWDWRz/dqz/
 E+sqXo8dJ2Izl8VmaLjG/PcPb1ZkSF5NF+62Sv3IhRb7g==

Add boot phase properties to MBa6ULx device tree.

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

