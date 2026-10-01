Received: from mail-wr2-f25.google.com (mail-wr2-f25.google.com [74.125.225.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5758416842
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 11:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855066; cv=none; b=LlHLRRPDfwSerwIjG0NrMaVxtcbCWuJQBmhJicPyRN2wkdgZtz9iHBNEouv3LDpdRg13ey5vJ+aWa4pw537dd2xV5lv5tOXfd7j7jPJR0aEQJBWElsNPFxX7t3lrdXMlnhwDWyyQELdlDwBrMgGUPkKAx+bCu7adyFDi4SKnvxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855066; c=relaxed/simple;
	bh=rN6PhppOBP+U+H2IVozaLpFZ8gj89uW2aTagm28cAZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jtr6zH5ZQhWB8JCXJBktDaioMYA3MIZFlq0fEaNqha23Nka5xKxxv61bp0wHx3t2nK9am/538eXAgtacxGmsCNwhkP7NCjBP9X7BPX3NjzqDDVjZ3KMq+fpADXEBNL6mIaThdk8al17rAPOntWsenh2yT1MNmCp171TC+qLmhfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ec7s/hvF; arc=none smtp.client-ip=74.125.225.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ec7s/hvF"
Received: by mail-wr2-f25.google.com with SMTP id ffacd0b85a97d-48b03eb33b2so573114f8f.0
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 04:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855057; x=1791459857; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ysAADyX7pTvl47KCk7d/xYWK0poDe65ojjsRPrIY4mw=;
        b=Ec7s/hvFnRxpKsowo7p5SYa/VcavXcFtxfKhhj1go3bvj6pYoJdDC9RPNTutbu43ti
         T2RmZ8dwewwKApAFJtF+S78umyu8YcAZlt8XkFqHT6cy3mdG3Kb/qaBxLfzlH0j3+eYb
         wY7vU88V3kfE/C9LoV7cG+GwHJp62U8Pdwm0h5oxRhXvgKr3ZFeHoa/hp3ICXtoOB5zn
         wtNsSor0PE9uspehiwkwNeO6AanUdHODZsHbhsNbODTTPW1vN2clAhGm5kkoaUpBKTQY
         ClIrrnbPYA92t+hPGB7RggsmTaaeE/CxTXddrdZPEIoTITCLofCcY9J68gT5Vt/NSP7e
         KBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855057; x=1791459857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysAADyX7pTvl47KCk7d/xYWK0poDe65ojjsRPrIY4mw=;
        b=Q9EA8Q1x2vmT2pR0ARTYad3IJS0PxZquEqk5wbXpfCIpZLLxJAfhnAuLWAcq47daOR
         lbSk9lNa7dmYcCiBnSc4zJ6gld415iMPFNgiTC5eHFpyLDdbU9Z+hl4UtUshuBwlX3aO
         xAa3potmMUlH4Zz4tDPdOi7vsAwvVipe+h/zT9JhbWAX3LZQHPF19atZSHQPhQ5Jdpq3
         Os5DcoKc9T2K2QjlSv7ZizHBOwmxs7sjcUOLjofXkkq5jgwqQf7fc+EuKMjYOTpjSz/O
         nkcJsopoPM6XTVtIpjX0dT5asSgykKBw0H5Fqpu94GxRpVOOHI138VAGV3heWIHUqGac
         Fnsg==
X-Forwarded-Encrypted: i=1; AKwUvBygkgOpEasGEDk/mgtzvXunbGINj88Qy+5aA1qUntXlSb+6XJimqjb9xQjsY9Zh+tHSAf4=@lists.linux.dev
X-Gm-Message-State: AFq9FYLvp0xJ/iX7yv63oap6l3X/VOhiqYz+E+qNs9TGwICAT83iz7bP
	/MYozSpCf/I8XAeCkyo67ufsfTjni/FhllzAsg3NroLot3nro9LpZvh1
X-Gm-Gg: AYBFou0CrcHee3r8KaB+NKupWkwGXf5/92rqCEFpGo5UAub878+JQz1d2mYnFltlMBQ
	kxdJgFn1v1ShIc/80q4GuOE3fAlDDMwup3C66YdGv0ayI/mvNIXbf4A6PwRS/OnHMYU4O64TRwp
	w0WCsYK0umd2LLu4xYBZJq3T9VpNEG5tvq1TTUWo8NjRxaQYZ4Ikt02941s+p3dDZwVzt7m/+8w
	NykUDTy72AxD3w5STLpCNqFJNJZKPqC2YSR3Da2hEq3SC35NJJuFL+AuUd3LRlyM8ekE5MMTg20
	p65isbB2BAhn4G0YDQpeRZv/+5McmpsvXUpCh/sMndU89FWLCR353PY4q0RjiBm012z90S6Wb3a
	dUWO7wAx0Fy/n+0RPAs0/AJZRemBVP39XLA/c/W3dS0YVmJCFhKpOpCbUmV7a6Rvkri1YkWnT0i
	xzfjJlYQ55Vx5tDAXmnWOiuz6YzwXxdXF6016wjwzIdv7D5k71COvy1vXjADC0wLoSQG4UIfFYr
	yqWHdfkT/yqCj7UFXaZyhgGeY/8WPpKcitrlFRARdnGKHXxIaL7DX7csv4SwyDAp66B/VnjdA==
X-Received: by 2002:a5d:5601:0:b0:488:5468:c23a with SMTP id ffacd0b85a97d-48b068c8ed3mr4376902f8f.17.1790855057014;
        Thu, 01 Oct 2026 04:44:17 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b1035eff8sm1243705f8f.7.2026.10.01.04.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:44:16 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 13:44:10 +0200
Subject: [PATCH v2 2/6] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 UART_4 overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-verdin-imx8mp-hmp-camera-ready-v2-2-7d1343ecd3ec@toradex.com>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 can be assigned to Cortex-M7 firmware. Add an overlay
that marks the UART as reserved so Linux does not claim the port.

The overlay is also combined with the Verdin iMX8M Plus Development
Board device tree to provide a ready-to-use DTB for the non-WiFi SoM
variant. UART_4 carries Bluetooth on WiFi SoMs.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  3 +++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 23e2684d6923..649be5b6aab4 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -736,6 +736,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
@@ -744,6 +745,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
@@ -761,6 +763,7 @@ imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dahlia.dt
 imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-nonwifi-dahlia.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-uart4-mcu.dtbo
 imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-wifi-dahlia.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..74d90b39faec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin iMX8M Plus UART_4 for Cortex-M7
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Verdin UART_4 */
+&uart4 {
+	status = "reserved";
+};

-- 
2.43.0

