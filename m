Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2D5376BD0;
	Tue,  7 Jul 2026 06:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407121; cv=none; b=lfPZYBtcLezqOV4mWIgzzGpfIg53a6yZjgrvwWxaO9qhktjxqGJV5I0/bZ6hnUyeP3JjD7VdQ90xoP2BqwDaS5Fp6Yo8gX3IofyzV8c/fJSCNWaow1Yn8ufjfVoAW/X5idLiPgzIY2DeDhaDVYoh6anOo13/6mL1q1ywmDqcFjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407121; c=relaxed/simple;
	bh=t8db3CHfqTJwfHR5RX/psznEXUcLz0eV/r7hirVcP0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TV1W4ujZyX0EQR4a2vSUK907JPHixbbNkC2xfqhwurbIZIY/oAdeDBzOwiHC6BV2BOpQTjGVNB8pxPLT8Vve07dsTi2rSJbxXsuosIs7+itdaNnO7jKcTsjaow9IIFPWqBMOYrbenGT+QuhXftmyZuMpKfJfIHqsh/VN3EB7nI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=BaF209y0; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="BaF209y0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=SbyFDGZGgSntC1kOTHUkHJqun5T+Nj+xyRw8geBpUt8=; b=BaF209y0DHyUJ3vKDDDDCFKE1O
	a3nOvks7gu+6bJFbSgoAdmPpUszSctKILiRrd2s2Gp0zjXT//eMx8lYtrtFMN5eFelNhUa7B4w6Hn
	bTZkfjIZw1eyOKscoPhxejGNNpLjnLcBMrw8AuSq1DO0z1bh+Xhr8e9cLSn5JiFMfNIuDpIM5t6UG
	Lnu1Z9/Fc6cAzBgpF8j/hGolanKZCr9bnFXbHiZtEJ14CoFA4xX/u9c94sM5eP/EDephuP2krTZ4e
	cuMNQZ5Qyh/KC0WPjnzG0S86RBZTKfIl4ZlovsqI986/irnCqTO3dMm9zNczy5wztCwPLd1jIgiUh
	VEoJPeEw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wgzes-000LgR-2t;
	Tue, 07 Jul 2026 08:51:55 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wgzes-0005WX-2J;
	Tue, 07 Jul 2026 08:51:54 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH v4 2/3] arm64: dts: imx93-tqma9352-mba93xxca: Add LVDS overlay
Date: Tue,  7 Jul 2026 08:51:48 +0200
Message-ID: <20260707065151.1079667-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707065151.1079667-1-alexander.stein@ew.tq-group.com>
References: <20260707065151.1079667-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28052/Mon Jul  6 08:24:35 2026)

Add the overlay for the Tianma TM070JVHG33 LVDS display.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  2 ++
 .../freescale/imx93-tqma9352-mba93xxca.dts    | 21 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index de796f2134145..bd3d35ffde975 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -641,9 +641,11 @@ imx93-tqma9352-mba91xxca-rgb-cdtech-dc44-dtbs := imx93-tqma9352-mba91xxca.dtb im
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb
 
+imx93-tqma9352-mba93xxca-lvds-tm070jvhg33-dtbs += imx93-tqma9352-mba93xxca.dtb imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtbo
 imx93-tqma9352-mba93xxla-lvds-tm070jvhg33-dtbs += imx93-tqma9352-mba93xxla.dtb imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtbo
 imx93-tqma9352-mba93xxla-mini-ezurio-wlan-dtbs += imx93-tqma9352-mba93xxla-mini.dtb imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtbo
 
+dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
index 9108181e6592b..39a8742de1da4 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
@@ -67,6 +67,23 @@ backlight_lvds: backlight {
 		status = "disabled";
 	};
 
+	display: display {
+		/*
+		 * Display is not fixed, so compatible has to be added from
+		 * DT overlay
+		 */
+		power-supply = <&reg_3v3>;
+		enable-gpios = <&expander2 1 GPIO_ACTIVE_HIGH>;
+		backlight = <&backlight_lvds>;
+		status = "disabled";
+
+		port {
+			panel_in_lvds0: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+
 	fan0: pwm-fan {
 		compatible = "pwm-fan";
 		pinctrl-names = "default";
@@ -571,6 +588,10 @@ &lpuart8 {
 	status = "okay";
 };
 
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_in_lvds0>;
+};
+
 &pcf85063 {
 	/* RTC_EVENT# from SoM is connected on mainboard */
 	pinctrl-names = "default";
-- 
2.54.0

