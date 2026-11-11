Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423877;
	b=BjbU6xihEu+YHiDAV0A+wrVBKGJXOH2AnPHDvTdiC3DKQRTJLTFD7vSQW0ZPnD5jEGH+
	 2WsX0+fQxMmE8MIsnzlrXNS9YKfo4y3UmaWObme6SIeRouM0n7CRGj6Q1wCIo7Z+FEM9/
	 2hpbiHvi33vg2FhO20OHlWGkLaRtmsqOYedAuYrA4pLY3v7en+jl5qGPgbKcKKxYfv5Jz
	 SDgYx2tu6gHNQEePS6RHVY6etHXBWhXn0OCWOzX9p21OKSLD8SKsoo5NOCRenkeV1W/0+
	 qGYNNfidJ86+hyqvyORqtLfszXn9VpCKhpqFK+oDdGT0RyZmYUoiJ8ohr0zmKh7Clyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lnltaZLRhP4fBsVvq0mCqASYDVlLQyGo5RH8flPD4Rg=;
	b=mwHK9VdwCTy/PuZQH/exFwoVA5a41Co/uASzusKKJoBL1N0Wcqi9mzFK1WPQZaAYQj1I
	 QsMlZ4r1/vCPAQShamxCeHRj06C5hxGGqv5w2rI2WhGBPUEdlD+opcbuflaxtn80mEyGd
	 IfcfGp2Tn/IgYKz1YOlx4HNGznmLgD5YwJeMHA+a45Ol5ZA7eNXouCErzKRg92NuOu2ls
	 w2hQpcDMa4qfmHjX24NOH3INx0dGhzZNxH/+0mHXvjEgLQTiziUlpOUtNflFFiT4knyns
	 WQPGJ0UQPUU/nXcoanlqNXn0yooEsgRlvXKHfpIRLqG1mtHl0d1jhQaMPungWmjfTgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3AXk8dF;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BC4606A326
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 19:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BC4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3AXk8dF
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so1381863a12.1
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 11:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423877; x=1795028677; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnltaZLRhP4fBsVvq0mCqASYDVlLQyGo5RH8flPD4Rg=;
        b=m3AXk8dF9icb9tATAoYfQ7B5k15ScoduaxTIutnZuVdgFkIZf4pguwonNOWLPK6QtI
         JYRmNJ32yB7QeamCIrFW/7EY+bd1LOFK63cHvuNzpp20/hNMYmIfqvZ+xZk6GB9FeXAh
         Btj7bnXSObmUA1kYdhPAkaFsT4IinmkAIWQUSIo4CvkA8g1EYi6Bf9QSeAXjEuiVl1b0
         T13uD6hy202wMEotQUeLgjh9ysldyZQuQZM/SZnYRfZAWWaHR8VE5r7GXh5OW3RBe8Ad
         NC75k0pHSJdFMP1Ah1D+5wSFpf1ebDTGo3YJwK8jQovX+S0AUlo5AE+SEanKULpYZVk2
         ka6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423877; x=1795028677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnltaZLRhP4fBsVvq0mCqASYDVlLQyGo5RH8flPD4Rg=;
        b=VMsYkxFTO7+HyQrFfBfPNZNxW9XmxlEppV56jvGnflQkJ2amInO+B/PO26oEDgcTiR
         ew5TXZ86KiP6mvoaF0tEbOiT5FE0KrYvuuDyIrKwUoE3JS5PhSyXhBAsRDV5+33oxGs1
         0U6x9ay2aOg8T0TpmlN4XlNu+iCUnjP62VXZnA5AqLBOKS9/QcXeEaVDUsSDZx9fqkmF
         FU5XPUprYAsAl9C5qZE695vfIKWMHV6fiW99JsGr5V1FwsyAhgz2sU80KZX4fWX9jLmf
         nbtKrcpzSYOYxKNr/pi7geYm5L8SdMBo5SrA0C4lCEyrIRZ9OIYvrimt0ChTyNXGzGPR
         A8Bg==
X-Forwarded-Encrypted: i=1; AL+hErHwhamFaxKcn7Tgzu8Av65Gn1TILYNnqiwbRoKEUsLo7GwuhDENLwAvKSblYJzLAZ5lLTE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8d6mfpC6ZO0Wld8eyzm0ULJ5B+Qpy/xeEUQD8JX87d+YoXqItB
	rtvifDMydTPbXlxLYzQJ8oQthMg3G7+esngX1TNuS27WvjKjqVf+zMA2
X-Gm-Gg: AYBFou3pCDXGAAnI44/49QYzvih4GC1zwOzIP/a6sAbuef7q/N3rf2xu6XPceQ+lHnU
	4N6KrH9GiDGembi5Dyi0Q450DwOrKyFrU7JU21KVJa1VX5mqy6KByBdsDzAnNElrcdIZSiTFTFe
	xWz48gLzs/3yTq22cRHZxhHkseK3K9ClgxCdXcULaQF4gwSJ6IGk922fR7tpa8SbygAQwuh8tea
	b8Xge/KlKh3rjeSO0v2XgI5i4ORECRSlY0kD3uzLT9RCIu3l71oqdEnY83Na29ucXUVhl3C1V6d
	myB11BOYKS2CYEC2hJaLbtKUIsVYn6Ut0SWwZeTLYldr9UkwJwc1dIMWW7UnC6EsN8rJjRTe9Mu
	i/43Y1J30t7Fnh7Ws5cUyjq463Vy0W/W4ZRhdPdhpoSRJ7uttyMZoJRJU/7pQPBX74x+rnLAaUv
	Nq5bCmy6UCJDSdulBOVrSx4zh/0sUilzfh9iywVCY+KcdlVyzo3Zmcym/Ey0rMIg960EEKejJws
	zv6+55X6xS55xy5DEWv5cTbAn9dD9cmpyxmSc/62c/SW2uPgdLKijcSh+Bn2ajRKpFpVlYeMgdL
	0OlfD0I4t6LvZicFNvdRbv3Cgg/iDC/VBg==
X-Received: by 2002:a17:90b:1f90:b0:3a7:e11c:4e6e with SMTP id 98e67ed59e1d1-3b182f5a142mr3250774a91.59.1794423876623;
        Wed, 11 Nov 2026 11:04:36 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:36 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:03:59 -0300
Subject: [PATCH v2 3/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive
 Touch Display 10.1" LVDS
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-3-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=4455;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=oe0gNHFEkUnU4DGWTju+MJg1QgwQQbBq6PPLVxbI5NU=;
 b=lhQ2QCeAMTxHxA6IWvu2h/Y6r9QtaPWxJFG8efc2jLx/HSL0wnuHil7uHqrWS5Po1Lq2DorDn
 CGVUtSIkP2MBnzpcQOF+hJQg3ZiifuRvsFb33h7G4Vrw2sWkihPB98K
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via the Apalis iMX6 LDB.

The panel is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the
touch input is provided by an Atmel MaxTouch capacitive touch
controller.

Remove the panel-lvds node from the Apalis iMX6 dtsi, as it is an
external component that does not exist at the SoM level.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++
 ...-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 53 ++++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      | 13 ------
 3 files changed, 59 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index cc0f5f100892f..3b69669b27129 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -164,6 +164,10 @@ imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx-hdmi.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -320,6 +324,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -330,6 +335,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso
new file mode 100644
index 0000000000000..a84114e1d3fba
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Apalis iMX6 LDB
+ * on carrier boards with a Toradex standard LVDS display connector.
+ *
+ * https://docs.toradex.com/105952-10-1-inch-lvds-capacitive-touch-display-1280x800-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	panel-lvds {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
+		power-supply = <&reg_3v3_sw>;
+
+		port {
+			lvds_panel_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+};
+
+&atmel_mxt_ts {
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	lvds-channel@0 {
+		reg = <0>;
+
+		status = "okay";
+	};
+};
+
+&lvds0_out {
+	remote-endpoint = <&lvds_panel_in>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index af038ac472261..8f5a9ab1f20fa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -95,18 +95,6 @@ lcd_panel_in: endpoint {
 		};
 	};
 
-	panel_lvds: panel-lvds {
-		compatible = "panel-lvds";
-		backlight = <&backlight>;
-		status = "disabled";
-
-		port {
-			lvds_panel_in: endpoint {
-				remote-endpoint = <&lvds0_out>;
-			};
-		};
-	};
-
 	poweroff {
 		compatible = "regulator-poweroff";
 		cpu-supply = <&vgen2_reg>;
@@ -735,7 +723,6 @@ port@4 {
 			reg = <4>;
 
 			lvds0_out: endpoint {
-				remote-endpoint = <&lvds_panel_in>;
 			};
 		};
 	};

-- 
2.43.0

