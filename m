Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156E4175A8F;
	Fri, 13 Mar 2026 11:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773401670; cv=none; b=sAb8AegYFoLPPq0Pp75MNSrKNzWFGN2kxEC37vKgWeMgzr/te1eJU4RgkqSv6Kn6bCQyxyXAF6mQjZJD6zePZPsK6rTh3gUPXpnLd2zhWeFDemnzNLTmv/t9QtX2nQ9nE+U235kHN+cLV319AcSkJgqpTitY2xWa0PHpvAnN6/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773401670; c=relaxed/simple;
	bh=Xb0+jVvTkkKex5i6YWUVEyrERNpGBkF78TKavYWkrgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BXd9UZK2WydOntUqiS0TWvFajon0g0m8lJsVitH+FpbpLytAdRu8GqTbERrkhAY8liVbJigmCNrupnDolKT4v/RXyPEEO5k9tVcQw1M6CElv6+OJzCLDKXyrkye5AmVIjQKEDoz//Kyk0FEQf46B2bIh++jHFej0gQcLeImQAhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=W8USdi7i; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="W8USdi7i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XioEqWNEosb8k7bGrSm5mvCDxfc+xi3d2IsiCVXdzDU=; b=W8USdi7iDbvVS1EmAdllXnUFP3
	5Nk+RaGBN4S6NJZDyKOX2Spuw9mn2VNSdXDv1cq2E1ZaIZ/aie0zhIslJY06UFn+IeJD8L0dCU7QQ
	6x7KzXCV+CVgfiExmWfxdHAZ89LPamqecOb9I0AIPtoN1vk+4Hq+oJX3N9L4dMCauAfFMnDvt/PRH
	2+wnGj3eqN9nOXYetWZkTzqyRX9Zzbcsso220Bu3hN8/u8MahJhemKSU/YA66YZYrXmdUXDwPlGOG
	4E0BVkmYGA+qiKgjGiME49nzwMTeqi92E5QOClqKXIRMPRJQW2dSurrsmexPoTsm8nzgis/Lvv645
	pepoVq4w==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w10mh-00070O-0X;
	Fri, 13 Mar 2026 12:34:27 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w10mg-0004VU-20;
	Fri, 13 Mar 2026 12:34:26 +0100
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
Subject: [PATCH 2/3] arm64: dts: freescale: tqma8mqml-mba8mx: Add dual-channel LVDS overlay
Date: Fri, 13 Mar 2026 12:34:19 +0100
Message-ID: <20260313113422.1722787-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313113422.1722787-1-alexander.stein@ew.tq-group.com>
References: <20260313113422.1722787-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27939/Fri Mar 13 07:24:42 2026)

This adds an overlay for the supported LVDS display AUO G133HAN01.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  2 +
 ...mx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtso | 86 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8a85b5c39f3cc..f1b54f1b0a23a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -180,7 +180,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia.dtb
 
+imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
 imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-beacon-kit.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtso
new file mode 100644
index 0000000000000..ce12bc46553dc
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtso
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2019-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mq-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&backlight_lvds {
+	status = "okay";
+};
+
+&dsi_lvds_bridge {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@2 {
+			reg = <2>;
+
+			lvds_bridge_out0: endpoint {
+				remote-endpoint = <&panel_in_lvds0>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			lvds_bridge_out1: endpoint {
+				remote-endpoint = <&panel_in_lvds1>;
+			};
+		};
+	};
+};
+
+&expander0 {
+	dsi-mux-oe-hog {
+		gpio-hog;
+		gpios = <10 GPIO_ACTIVE_LOW>;
+		output-high;
+		line-name = "DSI_MUX_OE#";
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&mipi_dsi {
+	status = "okay";
+};
+
+&panel {
+	compatible = "auo,g133han01";
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dual-lvds-odd-pixels;
+
+			panel_in_lvds0: endpoint {
+				remote-endpoint = <&lvds_bridge_out0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dual-lvds-even-pixels;
+
+			panel_in_lvds1: endpoint {
+				remote-endpoint = <&lvds_bridge_out1>;
+			};
+		};
+	};
+};
-- 
2.43.0

