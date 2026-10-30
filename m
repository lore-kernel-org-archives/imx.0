Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378162;
	b=tp2ybh3xfxAYh8MPE0UdMXBbuxc875/AeiFClIe3CSX37g5mljRPIF8Gio6UY6kU4Osw
	 cskoM4i2DQPFMjSFjTbecuVI3o9Z+h37vdqoGqDcmCgZagWCA1OcrwZm9RVJGCyJBcEOn
	 yqaENHTMqTHyQO1eW9XF+glVjPqOBFu53f1zOtOEMnDaZwq/utUk5R/Hv4uR4lKb9kNWm
	 8iW0wBkftcet8u1HUpbciysxHFC8mfBHKAR1U7psOMTEODHqw7BvAmfPt83C7UWiHDUR9
	 eOMQZb7NPpWqHjYqO7cZeh1T96KHs5SZrARU5gySpYGlRuPJk6PyoMPG0kjmjaugjpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gUs/X1k3020XOzDHuwUgAfsc42+/e4lW6AF2roewp0A=;
	b=eYOe/n+8Xy+US8c+WxJzbUSIqZRZ8j7mQdKwwd2Y95jyLMTrLVVNU5k+gKea0uR7U4Nm
	 W1JlOYiAWcq6ShKOHh0RVii7TgRMvhAtFY/krVKgiRLFGgpJtHwtlc6GeLIPM8SiojVWe
	 ZM51xHGLhlK7DGWyPezMRRBGncP6EEWe662V4M6LFI525RHtSFc7K84aWmzqBhncO+6U3
	 dog43i3HhGmVPq0sFe0hhC7hLupzaH+03QlJEAqzS1mnd04ODhHSlhWbBf27JYgWK6Xgc
	 IXdsniZvNXlUEAWjcPmXyQ453tI/byGpl0pFlaVSES2go7EHJzHsjUmbP/+jMs1yb2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b="pf99B/0H";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0705B606A321
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 16:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0705B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=pf99B/0H
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9755725e9.3
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 09:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378160; x=1793982960; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUs/X1k3020XOzDHuwUgAfsc42+/e4lW6AF2roewp0A=;
        b=pf99B/0HbphzyyGH4gnGleM6QdcUsjFk0ZW6hnY32gWgLexNan/qig+6MDLzsj3qt+
         LwtCWxKv0sywIVEekD+6PpKmdiWBudr3/i77zN4qT/zNCPFajx1n0YhJB50Anm+QjRUc
         1NA/gfJXxtujvGjCrJx0Pd37GXXq9IEUDWwr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378160; x=1793982960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUs/X1k3020XOzDHuwUgAfsc42+/e4lW6AF2roewp0A=;
        b=XK3QZ3yYT8G5RRsabQ1BaFKY51jhp6mfWrwSg83EiveVmxNPD8GxWx4rE5Y7a3GNVy
         pvXgP/oRCT8f8W1Z74CONLqydNwb53nhxupicgsJd73GPis10mCpYcm+hNNwopw9yJfk
         nM1ZdFiH5mLwtTEpFECbc14iPii2AMXvVnK4baZVxGJw9ct8fREV5TqS9j+gaAiDSgV/
         LD4zFvCYoh1JOk2Mc2Bb/iRiiWdm6mKdZUof6Oqvt6gx1TbX2Fq+Ug+CCd/mLJPs93yH
         zkOw0302xNJzv5phpcJPpvAp5RTdZ8xxQtXJTi7D7DXSjXDLhiag1nNdrjGiVC6mseSj
         4geA==
X-Forwarded-Encrypted: i=1; AKwUvBxwvP56uGly8bilxafmFEWL0pat+fo3YdUhIMTkDQNoK1y+1GlHgyq62btW+vOleGDboBk=@lists.linux.dev
X-Gm-Message-State: AFq9FYJDeQwmtyZrbBgEGmmYeXj2IeElnaUibklzH+D9BQR+m2XQfcKx
	vYpst3oqQ7ut+ZHSPdvWYkR5yMli/QTZITXYcNXd8T9SGt05dSZKz817g/QmFQz9mrE=
X-Gm-Gg: AYBFou0A2GcTJ3poHUTh64UQzw1Rx4QZOJ54oYkB9HJ7Bx2SOvo+yA3XjgG2gbeuDtH
	Bkm2xCaL2tbmjjW1MTIr/LXatsSemQ/or4R5xrZrdYQ1ab2LaPLFyAq/55pYCgEZE9TCrJoETgE
	fb5MT0vRFpUwRT7wxQMSp0RR6J3xNWl/pj7gefG38zpin6KxLKrEpmC6gwgaMaSf+yjb0EbXPDu
	anqHbV9CPGSGucV79RrpjmwnOFCuXhsQCnp2Eudq3oTZt9z/jB9GJFoV23UtTV1F+TpDPkMjDDx
	IHzqnFRsrzo2bFxqqmZx6MIaGEzuTNbUpZ88/Gt+fvlPtKMrjkEqHmkK3W7BVYgunD/fbzzHehR
	OCyKHYF3ZVipQdBYGo4hALyW2Mv+w3amEum45CtKQYYVVitp3h3TSQvC5u6vlK3uFffPrBlauby
	YGla1FqM9YG+3cGZ8kAC0KacIlH8BXa6qfvRfSw8iHW3TjPcntHVFk6uiuHo+OLhog/HmqX6Cos
	wzID5toMg9XnjX7pJnBPzHoeCWpxqrP7/Fz8U/DUrVKhWXDP6xfcS91kJT53kMBKgmXpXASXkkC
	gMvuNHF1gHCuW6zs26bGUvSQCoKA3MmXeofFXfkBNQZUNRCGx2OzED5dI7whUNeVfQd7YY4q1u8
	EKoeFdA5dIjdtgSitPwP3NtEiEtZpLxuY3mlaNH0v0F/Oh2k9EAx1xIkBhJ0iNEg/f77XUkYovk
	u3rWYVhLrhR56ftUk/XfXsPzUspg==
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr64953775e9.29.1793378160492;
        Fri, 30 Oct 2026 09:36:00 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:36:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/5] arm64: dts: freescale: add Engicam C.TOUCH 2.0 LVDS display overlay
Date: Fri, 30 Oct 2026 17:35:44 +0100
Message-ID: <20261030163547.2682583-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an overlay for the C.TOUCH 2.0 carrier board fitted with the
AM-1280800W8TZQW-T00H 10.1" 1280x800 LVDS panel (C.TOUCH 2.0 10.1"
Open Frame). Its touchscreen is connected over USB, so there is no
touchscreen node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm64/boot/dts/freescale/Makefile        |  7 +++
 ...ctouch2-overlay-am-1280800w8tzqw-t00h.dtso | 53 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index bf324cdec879..a3dce3310fac 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -656,6 +656,13 @@ DTC_FLAGS_imx8mp-hummingboard-ripple := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-fe-ctouch2.dtb
+
+imx8mp-icore-mx8mp-fe-ctouch2-overlay-am-1280800w8tzqw-t00h-dtbs := \
+	imx8mp-icore-mx8mp-fe-ctouch2.dtb \
+	imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtbo \
+	imx8mp-icore-mx8mp-fe-ctouch2-overlay-am-1280800w8tzqw-t00h.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-bl-osm-s.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso
new file mode 100644
index 000000000000..d5a5eb96101d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ *
+ * Ampire AM-1280800W8TZQW-T00H 10.1" 1280x800 LVDS panel. Its touchscreen
+ * controller is connected over USB.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+&{/} {
+	panel-lvds {
+		compatible = "ampire,am-1280800w8tzqw-t00h";
+		backlight = <&backlight>;
+		power-supply = <&reg_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
+	assigned-clock-rates = <0>, <1013600000>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
-- 
2.43.0

