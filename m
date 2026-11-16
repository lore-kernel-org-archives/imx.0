Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831116;
	b=SPRs0igpYleR0dWe/VsKzeM9uZ4RDkTrswwxkxhCDAl266jlVrFOgFvLnprDZkj4O5p8
	 yiCuhjAc8jjpKTsupaqrTYa+r+19cwM5uOP+sCXKEW/j7ypjSwIpr3SmqoMjqtwr80OFy
	 zZMXGIeIACOGNTDrEUjK65N+alRWdqDKZDjUTdnVQG+O5U56/b8ouCqpoAKM9xnl/DauM
	 t99YcPukLDj53lU1laKOas2VN69SzKBcae5sFxq1fDvle3gcg6uMcuXuRhfUi5hjfO0xm
	 AV8hx6ogFXrA4Tnp+hkdEjYqhKLGdl5Tbp2PJsZ9ykOLPR3QnI3H3IZtoTW2RW+2BAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=pEbQYi4NjQVP0dtbEgl40Tg4qtmWWlkw/cjXJIhkZZg=;
	b=fsXfbpDyyekIJfdH03DDbn0vGgisQKBq+1TdZA7fp7KqkCwuP0v5N4cWmOv3JdYeDBXI
	 gxvGblsnKfFJyNqW7R+YgL/DMA8/X4rYnvrWQSW7BYvfhL08VyMA8xX8FkOaQSMogFSO6
	 Ut0TdhFRsOimxXv4dAmgj6L8WYWABPm8bRjXJMKz2heDxsaY4hqcvC/UtGalJ+cgS/5f3
	 aGSRI1IGpV9hxUQdLmMPzJluGGAXaDOwIdcVR53AEUd2ouYwivHZqg+7zGm9hySymxUpy
	 19+PBhjhIdmCQ9z1+vXUJkwc6EIW88T4BUlqaDtadom2QBHWchyXIm4jc0K4yv6ZrFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pvAV4zEu;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65048606A33E
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 12:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65048606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pvAV4zEu
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso20589065e9.3
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 04:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831115; x=1795435915; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEbQYi4NjQVP0dtbEgl40Tg4qtmWWlkw/cjXJIhkZZg=;
        b=pvAV4zEudbj4euJ9Sf5SYOaaDBr9V1QS4wT4xaJ8VhhizBME7gu9P2myKfReap8ql0
         o6+Ion88gdM0pEjp612mvCA1qNto+XfSLCvH9suay7akTGxys0Q8yjBwSXkdeh4lfCYc
         YZYINqYcBvyWV2/KNVBcvXnuu8tiHensS/cdewLP4ukHY/1RWFvgGnAEpJuXwrAt+qFo
         AlyxcCvWVeH9QM3sCNA/vPZdrchV6RAhQY6CVqRWIi9+sJ/WCjWsgf5lGZCPLoKNIf1o
         9L1Gt01zn5svGvp2FY/m2/2YKmB+IVHBs+R7+sFXcOHeeU1NU8Bd2NpC1lJ0JABO9WD9
         DbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831115; x=1795435915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEbQYi4NjQVP0dtbEgl40Tg4qtmWWlkw/cjXJIhkZZg=;
        b=gQ8Ks41LYNlgcfzbv7NMIMx9iSAgYgOuKwAjXJwCki2FwzPySUvWfbEmJDMsYqUtS9
         L2ugzRnjQmaRkNz7yt08JhAmoiJWLlsRWGwau75CxfgUFE0YhhvQLStsl7Ndt/2jKu92
         3pitCzLOeHt5WduTMX2kDNSgeVpsDERGcHikXlgtFzV9Jh8t68km51igDuu38lbdUVkN
         ikBoMNaT3LgsNklJXyHDxhmaNyHelw4jNWBwKgqWWZLWGJAPNki/FCtUG59YYmjyjX2G
         z7jUTquKKT+T/rrPaXSH1dn3/P8l5Ld7UWlOkaZVaPe3b/5NVgIAz+wnvbq+RRXcTc7T
         jfLg==
X-Forwarded-Encrypted: i=1; AL+hErEJEPXVLIxHkedOgJdPqIYOF5iQi6OM0FIJcXWBlBA6zWMU14+FUr3R4lv0tcVEo4BdqGE=@lists.linux.dev
X-Gm-Message-State: APuU4Z/dt+m/nBnF9pbCFRIq5GBVagPNEzgsCX0bIW4Kk06ViNinzpQ0
	tMawGd+klvojIUxW74rBH+AHCWtN9917WvofCa+Opr3uudWpqyOMHUYo
X-Gm-Gg: AYBFou1Llwl2p9HEJrXIPtPo/Xj3MT02WklT6DigdMsCddlXM0VrBtWq1ADUPusnq9R
	1dx80CenmryaTrjPH2K87hUCb7uHRO+L3TbgpMg6y217kAXKMKpJd/L9mF+l9WNeJGKc4oRHD5G
	vrBgTLV9Hy+uANJY304ULUjaF463IJ6vmapGCQ+IbZOXCtLpbsu2LxCnzqmksh1Op51/jsr+gco
	sT5ONQGj1Fa4HIq/9SgxeU6lvwXpgVo9PF3QRJk2OVZNDPrK2EGJQNmR12pZUPA2KV09b/V1Bzb
	/F0ewbfpTq14BGMwn9WZXQfNpKfSXVRgziGe30lOaRLFeJNmSqp8p8zNMLtAtWJxtGR4fGtVtgZ
	ujKO2jF7C9yp+4wHeTXuZ+o6Eom1d97ZF0bZQYlqcNqPEYEhTVzfc999c1+1a7dc3T1CRQcZrh2
	nK/rLgim/4CW/sU8VM70oaIcYIcS62WRFmng05uCfIawvJnSARuTXvgOG5Vhcvm160FQDrezN81
	mrjWzFQ1NQZTdpKmfvV1olZ7KT7TFbDa9BW2YGqG26i8x9F1pni1z0C6wn504y9SX9DD3/1EhG8
	5si55kL/g6fwrFbO140DeZJ9SmYyeq4WxXBSDzZc2kdSd4pyPkqS0guIT184Cc5grwd0pvj7zkv
	9/xMYKhgT+u6hauStbgv8o5eNuYt8O/ojIK/uVeaq7ZiCaR0EDtE=
X-Received: by 2002:a05:600d:41c9:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb60bd5507mr142579815e9.10.1794831114708;
        Mon, 16 Nov 2026 04:11:54 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm61442005e9.5.2026.11.16.04.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:11:53 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 16 Nov 2026 13:11:49 +0100
Subject: [PATCH 2/2] arm64: dts: imx8mq-mnt-reform2: Drive the internal
 panel from DCSS
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
Message-Id: <20261116-reform2-internal-panel-v1-2-765cf8d5ff4f@igalia.com>
References: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
In-Reply-To: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

The panel is driven by LCDIF through the NWL MIPI-DSI host and a
SN65DSI86 eDP bridge. LCDIF underflows at 1920x1080. The picture shows
horizontal streaks and the underflow flag in LCDIF_CTRL1 is set several
times per second, even when idle.

DCSS does not have this problem. Connect it to the MIPI-DSI host and
leave LCDIF disabled.

Use IMX8MQ_CLK_DC_PIXEL as pixel clock, with the video PLL at four
times the panel pixel clock. The DCSS binding only allows three
assigned-clocks, so the PLL setup is in the MIPI-DSI node.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      | 52 ++++++++++++++++++++--
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
index 3ae3824be027..31c7428f0386 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
@@ -171,17 +171,61 @@ edp_bridge_out: endpoint {
 	};
 };
 
-&lcdif {
-	assigned-clocks = <&clk IMX8MQ_CLK_LCDIF_PIXEL>;
-	assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>;
-	/delete-property/assigned-clock-rates;
+&dcss {
+	clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>,
+		 <&clk IMX8MQ_CLK_DISP_AXI_ROOT>,
+		 <&clk IMX8MQ_CLK_DISP_RTRM_ROOT>,
+		 <&clk IMX8MQ_CLK_DC_PIXEL>,
+		 <&clk IMX8MQ_CLK_DISP_DTRC>;
+	assigned-clocks = <&clk IMX8MQ_CLK_DISP_AXI>,
+			  <&clk IMX8MQ_CLK_DISP_RTRM>,
+			  <&clk IMX8MQ_VIDEO_PLL1_REF_SEL>;
+	assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>,
+				 <&clk IMX8MQ_SYS1_PLL_800M>,
+				 <&clk IMX8MQ_CLK_25M>;
 	status = "okay";
+
+	port {
+		dcss_dsi_out: endpoint {
+			remote-endpoint = <&mipi_dsi_dcss_in>;
+		};
+	};
+};
+
+&lcdif {
+	/delete-node/ port;
 };
 
 &mipi_dsi {
+	/*
+	 * DCSS takes the pixel clock from the video PLL. The PLL runs at four
+	 * times the 138.78 MHz panel pixel clock.
+	 */
+	assigned-clocks = <&clk IMX8MQ_CLK_DSI_AHB>,
+			  <&clk IMX8MQ_CLK_DSI_CORE>,
+			  <&clk IMX8MQ_CLK_DSI_IPG_DIV>,
+			  <&clk IMX8MQ_VIDEO_PLL1_BYPASS>,
+			  <&clk IMX8MQ_CLK_DC_PIXEL>,
+			  <&clk IMX8MQ_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_80M>,
+				 <&clk IMX8MQ_SYS1_PLL_266M>,
+				 <0>,
+				 <&clk IMX8MQ_VIDEO_PLL1>,
+				 <&clk IMX8MQ_VIDEO_PLL1_OUT>;
+	assigned-clock-rates = <80000000>, <266000000>, <20000000>, <0>, <0>,
+			       <555120000>;
 	status = "okay";
 
 	ports {
+		port@0 {
+			/delete-node/ endpoint@0;
+
+			mipi_dsi_dcss_in: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&dcss_dsi_out>;
+			};
+		};
+
 		port@1 {
 			reg = <1>;
 

-- 
2.56.0

