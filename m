Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584702;
	b=5L1kYqROP7NmF+vRhcktqdQ7/H1y1Q21hYAh0/YAozFKtb1YuzjwiCiRK36uTTBz5eeI
	 hHug8SJpV9GmxCEgJcaolC/9uHvr5QJ+CjqhEdagCJ3M8wYioeRJM8qL+GyjRJ0ntrA+F
	 msSeXzqc0iNllm/umSgO+lyYE+5XcoS4sTuHhsTtg8s4rBSsiULAqNCCie5tBdNCbgKNa
	 DLcs4AHTxSHzT3czMpClh1wPJBoC/s2LLddsEo4AaLr+qfD6IhVszB+HuxvS+Y3iEv2Gm
	 CzF5Ge+IeDMLQYmLbLINDiW7BC9+NDaMGJqCMVvXgecgxV6gqCvH/6/IrQV/zwsTgzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qHtE73vhqIdWc0I+UqTverKQ3sxYALK0cFNNVPTEYDU=;
	b=z/5c+i/0TJYiPNE2I7o+Rh35ja9WTXgvz6ZutoSKRVfbiwB3xsxRD54aOVuEBjj8kd4j
	 QeCB1v8Q7AWZGuPHRy6YDgDxBNlMEvaJRzvLXaaycNVIPBQ2iGafElXYaocxQZA3RwR/y
	 fkanqBuCCQY0k/3RxA8EX7zlNTv+SXhMAlfHmiZjRRrQbuXAeQqQiLzMSvpnV7T0tS9O3
	 xZksOfeBJSNTwtV3tPkzhMkdZY57Pin/kZz8uj/avOyekEAE7QNBAUH4wsxDPT4GQps1x
	 9yVLUZpJXTpdf5vrYpBc6P4kU6kz2N7Iy/uLvIfMaHLSB0Sx2Mk41nWTr6PaNwxpNqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FuVERyjd;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F2D606A88F
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 15:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47F2D606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FuVERyjd
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b33de9d2b1so8525557b3.3
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 07:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584700; x=1795189500; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHtE73vhqIdWc0I+UqTverKQ3sxYALK0cFNNVPTEYDU=;
        b=FuVERyjdmwCwMIrJHmyudVLO1gDwOBvLUV9dqLcHpyGEckheJiw0ifzymKZnO6Oxx+
         LnQKIpzPNptL2GpMCDrmuFTpJQ6yPbUjgS6PnAA+HiDzCU5CJScV1aAb6wIFJaScdb20
         dWOlUz8EN1dpUayXXUbeF4Lj8tsCkw8fNwOC9ntt7/MCwzrlCMSNOsr95F6+TpaZo6ly
         mLy5bSolHI8sApAOq/0htwjTPsvywyqdIL7rqDKl9Zkfn+bJkrHT7ptrBhEvzjC17ZvK
         cCpjInq8pLY7gnjLABV8cQ2MXt8x3sK/QNKf248VLAJ0hEQsiteYUt+mJUF2lBZSPgEC
         6lKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584700; x=1795189500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHtE73vhqIdWc0I+UqTverKQ3sxYALK0cFNNVPTEYDU=;
        b=hYhgjjrML5yRoNUvm1Cn91Nf27w792reowWAv3YB6+oMrnaXxudSpa7zRrALbj4qk5
         TI2ANNADifR8L6znB2ekuLicYBjYYvKHlOBd0zVGRaX7VwKv+Oo2pUqV5WwRKKtXDTcg
         mbKmF+8WQeF9fK06pZE008PAsOd3jDG8Fk5hOmEdot0kC+i4nABnhVAh1ZZJAPj2EfnM
         rPkn15H4W4JmKBPgtopCKujxp2empvvsvFeEvWAL67w8/RISbKguA9W1S60Wcwu8Tn8e
         sEhFQaX13T0CgdgpC33l6sLIi7/KHkWpzD5czPCqbCBHusdKawwSqLo23wf3gQio9JXi
         qqjA==
X-Gm-Message-State: APuU4Z9JlYflf4+rZmRQIkFyTDC5rM4DXnGcA298Gs6xkE8ejgkZrJYZ
	Fqgf9xvNK0Ut5VXJNUl0ymfmoIM4n0dmGAK4MCYG6gHn/IGHokBL7xxb
X-Gm-Gg: AYBFou1C3U2VTKX94qCyda0qpkx0/lUHV6gtBGwZL9uEkzMSB7qdg+ZheCUbXLMXj5b
	QPaaqINXcUjNEeNni8I3S6MJGL5FtOnLaV7QhoKrsEZnIP8gk8ZMWPSVCEdpqsWUme4n7ccaxI1
	EVe/t5p2Dfx75ls9WXQ1tVuv7A6gCpoFMEltp/HSGivgmj4tHzGlCQLbcBGDOH95PWYdzoktiD1
	vv4HDDpcWqnPWq9md645iUM14xUL/FKkn6WryYf9fq+Dbh2/pelQcRZk8gYHizSdh/JNh9tnWt6
	fYlcgkWiAUkr/OuYab/XPIrN+WoHKpNR8Ae/WOeNwXyNtfQw57FCebV4rM3epUcltEILrIQVqxQ
	16fAO5k+NQEZItTXHsNPZMpv99YCP4bTwrSGF9NKZgOfME1XIX0iCHlkaKoJl+xlqPtp7jkKjDU
	u5IDiZY9oIkCrUFD+3WdkVEp/JpoW6Cqb6qE5DBHGNqlVAM7JO1Kn1DGB+uToxoLS3oUlv9nBdQ
	wUIgDd+3ufnSitRzT9HHmaLd2Uj6o/wqMnfGJm6SAy8HF+FD/eLCOfh0zkjzqKFKk3twyNnV+2t
	fRnZhgpjWrCQvVGubYTyKFX6sWLK1VIR
X-Received: by 2002:a05:690c:386:b0:8b0:b1dd:c09a with SMTP id 00721157ae682-8b4aa29f563mr16924097b3.64.1794584699912;
        Fri, 13 Nov 2026 07:44:59 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:59 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:09 -0300
Subject: [PATCH v2 3/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS
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
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-3-59c45f0a0d8e@toradex.com>
References: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
In-Reply-To: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=5024;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=wd7JjVXjadga4ELg+VIdxEXEfAr2w33RKXLjgv7ivC4=;
 b=CqHxEnZYhjZDB9Wuj005NZAt0tE3LkmC2TXKbUNRJIFlIkB0k7ZbxzCsVtfUjv+USdQuubvQx
 EuoP9sp1y3HC6AUu/J0/9s1LVOIm2+2g/qB5IzVpXd8aw3Y5a/Qi/D6
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay enabling the Toradex Capacitive Touch Display
10.1" LVDS on the Verdin Development Board with Verdin iMX8M Plus
Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
on the Mezzanine LVDS interface (J10). The panel is a LogicTechno
LT170410-2WHC 10.1" WXGA IPS LCD and the touch input is provided by an
Atmel MaxTouch capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  5 ++
 ...zzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 71 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4cd72926b80e0..915507fe936de 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -731,6 +731,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
@@ -742,6 +743,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
@@ -754,6 +756,9 @@ imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-td
 imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso
new file mode 100644
index 0000000000000..ce426288081c8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" LVDS on the Verdin iMX8M Plus
+ * Mezzanine LVDS interface (J10), used with the Verdin Development Board.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
+ * https://www.toradex.com/accessories/verdin-imx8m-plus-mezzanine
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_mezzanine>;
+		power-supply = <&reg_3p3v>;
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&atmel_mxt_ts_mezzanine {
+	status = "okay";
+};
+
+&backlight_mezzanine {
+	status = "okay";
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	/*
+	 * This display uses 71.1 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 71.1MHz, or 497.7 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <497700000>;
+
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
+				remote-endpoint = <&panel_lvds_native_in>;
+			};
+		};
+	};
+};

-- 
2.43.0

