Received: from mx-relay20-hz2.antispameurope.com (mx-relay20-hz2.antispameurope.com [83.246.65.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3452C159E
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421045; cv=pass; b=FXMkejYR9BhjZB/vTgrjvxIbjyV6FzI2MKb6cF1HSqZOUlIoE2ZiarXBcQKGYQ3irwp7JedQl5c8VWAClwLsfyrlAgCB0eWW88FBI0MYfXKK1xaaXFYpd2ZoiUZqBoJDiNIaxYBglCYfYbHGEQbQoHSyVbmxdP7VsfKmCqsV/TQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421045; c=relaxed/simple;
	bh=poqmwgLFsfxHqlj+OtIVCEzTsNOxE1u80VeSc5ZXxQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQUSKx+8e9PKc8VgPD1wWn/iRp7hwgwgqQ4vEwAf9HjpS7gtVuuGj97RzW/TB8HzBl0HyppOfWVj0xztI2Ms9WbnGSdmVfSTc1P366OCjIA6AxXAcFQF7PqtBpz6pON0ZLvmTDyDwQBcl0RPTRhMgowPDrcPz5EepRqk3rPH4mA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=sol1v1l1; arc=pass smtp.client-ip=83.246.65.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="sol1v1l1"
ARC-Authentication-Results: i=1; mx-gate20-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=UiUApqg4zpJm71bJ2yvGeNBnzVM6fE7lB1v/XBjmBkI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421010;
 b=bcuEQ+vPbIMzUd+aoh6Zo8Ru8GqWJ4jrBV1w8d6oetTFH5r8Ys2t01exaE4EcTqDwaOQtAzA
 +xd+xLEvCw9EIK4cfmjO/OYzehpGmr0nd2yF7kgLYmlfx5ru2sZRN6n4qiwaCJ2hcShBDjn4+RG
 IJMWirj7/Liq1Gcl4BKP8krI4sUDHdtai1OFerDgfvDlXOONdUpyK3CiiOPPY2pOIolOTUjXXrH
 VmS1ZejSw5aI3/zUXiqQ7140DlgnHj7zECtrhO+8NbSBUQyI33P+NcOV5J8PsltAUsd7GlvHiot
 Zt6ndUJ/+V3DH0QEDvu3KBCKaqdZSsOuKKiVIFe74CNKw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421010;
 b=I4c2AUPWdG9AXATEoogh5foH+1I6EmPMBd0CBBlsxVpr3/jXiRhZD0UFu513aQZdO1LQC9xc
 uuEvC+vwDabIDIZziHXVLa6V4rVBm6xoURA6wNwn4C2f/qpH/CrX3zfg8hm1KHhmCzfyiXFou85
 Duwr4DSIh9gKw7U0A6atVX/KejRElHKa3jevJzORvIlSrLjLOmXqEJ+MwDyAHOQ0ILryx6EN0jl
 jp7N54uWeyCUs+v+uR39viWT0NnWmcn1YmnXafwMAmITTyItY77tiLtcgNLysOWGcB914Qo6OUG
 EaplgB3nKbYCxhCXRTfavmHXAPGsihlIysOpvoWokusuw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay20-hz2.antispameurope.com;
 Wed, 18 Feb 2026 14:23:30 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id DB5C8CC0CC6;
	Wed, 18 Feb 2026 14:23:13 +0100 (CET)
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
Subject: [PATCH 4/4] ARM: dts: imx6qdl-mba6: add boot phase properties
Date: Wed, 18 Feb 2026 14:22:25 +0100
Message-ID: <20260218132228.32056-5-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218132228.32056-1-Max.Merchel@ew.tq-group.com>
References: <20260218132228.32056-1-Max.Merchel@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay20-hz2.antispameurope.com with 4fGHJR1X1VzwTfF
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:cfeeac45ac8ac4b72b7eb30bc089e8fc
X-cloud-security:scantime:2.013
DKIM-Signature: a=rsa-sha256;
 bh=UiUApqg4zpJm71bJ2yvGeNBnzVM6fE7lB1v/XBjmBkI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421009; v=1;
 b=sol1v1l1l9FQYCefrbohzhmKkQaq2/8UcbYIlmBUL0oZpeDUZzKPfrBq17o4wX+dGdsZ6AR3
 rFd8c1zDVJj1XvmNjS7xvVBigtYjE5giBtkwEfVkFkR3RZA4tqiaE0BbDetygnuT8XiZcYwk6RA
 nk/UAPiDbKFGK8zJQDXg/n08r9W/0ZJwrngJhP4oBJEZXDPy7yVImDjnZmeaKaVYxs+mLy97Wbs
 WZuE9gwSOAY74kqr1EiriDOMTDAVgiezEwcDQYcAjl2ZQ5rssO8gA/tVolVX2TQm+PP2yg2PXvj
 Aj51InFG+P8eV/mPXuruEAssfDSCsqDEBep4KrezLQ6WQ==

Add boot phase properties to MBa6 device tree.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
index ee2c6bec92e8..74ccfe56828f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
@@ -206,6 +206,10 @@ ethphy: ethernet-phy@3 {
 	};
 };
 
+&gpio1 {
+	bootph-pre-ram;
+};
+
 &hdmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hdmi>;
@@ -214,6 +218,8 @@ &hdmi {
 };
 
 &i2c1 {
+	bootph-pre-ram;
+
 	tlv320aic32x4: audio-codec@18 {
 		compatible = "ti,tlv320aic32x4";
 		reg = <0x18>;
@@ -274,6 +280,7 @@ &ssi1 {
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -346,6 +353,7 @@ &usdhc2 {
 	no-sdio;
 	cd-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
 	wp-gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -354,6 +362,7 @@ &wdog1 {
 	pinctrl-0 = <&pinctrl_wdog1>;
 	/* does not work on unmodified starter kit */
 	/* fsl,ext-reset-output; */
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -544,6 +553,7 @@ pinctrl_uart2: uart2grp {
 			MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA 0x1b099
 			MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA 0x1b099
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_uart3: uart3grp {
@@ -587,6 +597,7 @@ MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x00017059
 			MX6QDL_PAD_GPIO_4__GPIO1_IO04  0x0001b099 /* usdhc2 CD */
 			MX6QDL_PAD_GPIO_2__GPIO1_IO02  0x0001b099 /* usdhc2 WP */
 		>;
+		bootph-all;
 	};
 
 	pinctrl_usbotg: usbotggrp {
@@ -602,5 +613,6 @@ pinctrl_wdog1: wdog1grp {
 			 /* Watchdog out */
 			MX6QDL_PAD_SD1_DAT2__WDOG1_B 0x0000b099
 		>;
+		bootph-pre-ram;
 	};
 };
-- 
2.43.0

