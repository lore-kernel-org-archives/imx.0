Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227046;
	b=uJ8ikJgex/2Ssbfsxz813hG4URJv8pbjM5UPnBpWU4JAoppDywtQu4EwD4HfC0FLFKNc
	 hANcmQ4tSadsBiM0OuloZnavMo3ToUXpEFrF7U/6ebUf4pObiBB6nnwIY7ixyk7GDLiCG
	 1IiudPMUVr9LI3QVc/DYity19yyoQqUXbdJGiaEW/P0HAfEn5EYtNM2fGCLxdEG+zMaxW
	 YfNBPpYRGWZdZLl4GblnCFZdDMWBpEyw92FsSw4nNuS0SmO7aiV0MADE+++2tspM5iKSI
	 Qy8ek0m8oZ13v8Q9SwmYZX2o4UpB2jWfaGknfdnjvYRUV42aCmS75VQO50sk0bil1AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qYbJCi5+nwNEi61CS2emr9alE1zi1Zmi+juvvOHmGRo=;
	b=Z+15fKVaruTJcmwN1YfhCP4Xsktap781k9ymp220sfgJn1e8vQXx3ENUN8N1dc+hmooe
	 MvGpD6Xrm2pL4zbhFmxmHgbj5VxZU7ovSn9NkAo3Kq6OfKZmE9TlugbYLQRr0e8uwy1/W
	 pRErjXfB51dmUIQ/RjY4+g09l5d58+5f0lF73K9kV47OlX5n0B0ciBK0zLq0gNKNQ7dFI
	 +n13ztNlWFzG4XDFbbjfl5gyuws3eSuQWK+f5MxdzKPfNz+FS7BywNkF7bmszNpFfsGON
	 5lbzIEO/36hGcr4AqT5DLwwZ9Jn579jiKbOCX+54mMFVTNpEKcM8eZsYE7mLNY+t2VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=a4cgF+O6;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F636083602
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 12:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10F636083602
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=a4cgF+O6
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so8699275e9.3
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 04:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227043; x=1794831843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYbJCi5+nwNEi61CS2emr9alE1zi1Zmi+juvvOHmGRo=;
        b=a4cgF+O6PSoWVToSK4m1wEiPZ4GEunO0IK+ofiwbzYuxhTac2jnnrDUAuYUI2oLDA0
         UgCqKFTtSdUhFe2aNFQ7JgMPs9ngGDDBNorKTwYlt2jfB+uufLcHyZAL+22+hRuyBo5m
         XiljRbtb23lVigqjk1JGaMQDShSJtUe+FEVbDluJ8AwthU26S9/JCGaQ+XGpcDoLCggr
         BqBvT8Pc+L1Zs+InwXBkSRY5jR7s/GVKti0jLMM8O7YX9qbyZYivPjHTPv3wbnnUFp4Y
         EmsMz73ghAq+OS41mH9klC9I+axyF06CuhRRY50cQLWLaYhgJVh71rm4izKq/5SCpMy6
         DWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227043; x=1794831843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYbJCi5+nwNEi61CS2emr9alE1zi1Zmi+juvvOHmGRo=;
        b=IKhg6Ar1nLZqv32UzRXFVSftQ/tD56L93nxe//nUvTASolMcQ9MmaKc5/YtDVkP7++
         9qvvKQXZPhFQHHlzud/j/U4LS9oplohGHxPtAo3JfQgkY69ejwIBuyvsFGb4YbdM7PCq
         aKdGjfLRWmMGNwAeMVrOX50OTDpok0uG//ScA6nQcgLOO1YAT8KjB1WVbt+EMkdreyq+
         wW7g8nNjKi5Xgy9acyIxAiTViyaxqoegoQNvkixOnR/rlK5sFNZ6TH+wzTA60XZpXG0k
         NDNallO69+3CLUIePq2XEOE2MuWWBmcj5UKQocONqUxTJWPnTVRGzEsriGfrntIuHdi6
         Y0iQ==
X-Forwarded-Encrypted: i=1; AL+hErHpt1u2XbxAJ7m02wmGaDCfhtno1nlu4t2FkZZuc3St37ub9+rrDO2ZUuhYnJY5ipHRSQU=@lists.linux.dev
X-Gm-Message-State: APuU4Z8zVvEr+sD+D3kRR7mgmjBEyDaiVCUnd7XjXrTjr+ZkayoHuM4u
	T5UL/qvoxlc8S3sxMzXV+AtyK56CV99hA/HGuyMs3OQSWuw0vPw8FqQoRgD61TRM7HM=
X-Gm-Gg: AYBFou2lxRU3VbdyAzRmV950e94r2MY0iFmjlNbyJYlDHYhasYLsK43BfeWCy3cplaJ
	N0sKJUmNPKtZheJdT0nCsPBu1J2Ea71knVk6nU3qY4hZ4NbEEe3/f0yGYebhrRyyFW7tpROAs+/
	0WMkpP/wAIQHUBPS57ZvFR7aSVnLZy8UCjv0e/PC2v6dgcGufj2O4ciyFZuVyH/270BxQI2qF8+
	vCSTNyO2PclCMwCsN+KgCZglJhKECfU1YdCrdE/+6LyIvyorVMMNqeYGQOpPJSxC+iP+drEfAFU
	8eZBgkld82hjBjOZ1hFs7XQTXQ5GfCubu9by8HSkZWzWOUpPrPRiHsZOT7yByGe3bfoKJ/DP+kN
	GInN9keLbQOqJIcL9oqjRMcTcQy39vxlusF6Q9gbe6W9oJZooUf+QDlnGF4iKRvO//6HWa1Q66e
	AmtJM5YYsJC3FdEkACZIweTUpRAl4DExorjBkK6nECrS+1fkMN+hvREsyySjujrtG0fzy6Yk1d3
	Fdk73Qp82yx9hbu+ZZcmgzkbatWpSSMPZ+AKOy9eusJq4KusCmxlec/cS/NTY7Qyb7Y/jucYPq0
	XnHEdO/yZAUMPE0wKNMKUnlaYUJpOlWvrIwPWEjknlqkOGgyvOceItQ4hYhEAP3MLIHvrboogZ0
	vYPdgs6Dz6A==
X-Received: by 2002:a05:600c:8b70:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4b963c73ab1mr72661995e9.12.1794227043509;
        Mon, 09 Nov 2026 04:24:03 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:24:02 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH 3/5] arm64: dts: freescale: imx93: Add MIPI DSI controller node
Date: Mon,  9 Nov 2026 13:22:48 +0100
Message-ID: <20261109122250.720757-4-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
References: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
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

Add dsi node to the i.MX93 for support with mipi dsi panels

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index e926b6360a9d..1123e372eb79 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -58,6 +58,39 @@ npu@4a900000 {
 						 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
 			assigned-clock-rates = <800000000>, <133000000>;
 		};
+
+		dsi: dsi@4ae10000 {
+			compatible = "fsl,imx93-mipi-dsi";
+			reg = <0x4ae10000 0x10000>;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX93_CLK_MIPI_DSI_GATE>,
+				 <&clk IMX93_CLK_MEDIA_DISP_PIX>,
+				 <&clk IMX93_CLK_MIPI_PHY_CFG>,
+				 <&clk IMX93_CLK_24M>;
+			clock-names = "pclk", "pix", "phy_cfg", "phy_ref";
+			fsl,media-blk-ctrl = <&media_blk_ctrl>;
+			power-domains = <&media_blk_ctrl 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					dsi_to_lcdif: endpoint {
+						remote-endpoint = <&lcdif_to_dsi>;
+					};
+				};
+
+				dsi_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
 	};
 
 	sram: sram@20480000 {
@@ -183,6 +216,7 @@ lcdif_to_ldb: endpoint@1 {
 
 		lcdif_to_dsi: endpoint@2 {
 			reg = <2>;
+			remote-endpoint = <&dsi_to_lcdif>;
 		};
 	};
 };
-- 
2.47.3

