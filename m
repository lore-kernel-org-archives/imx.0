Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384792;
	b=cDFasm+dPrfnPHwrlRXzeFclgvdue4QLwOJ3yDRf6UZrlrEPOxrIFQ8WTeBZpBpKkK0D
	 ot/KI5zxOee8vGbbQ0Lc+Oo9M0gypi/04bg412Dng81wKosdHahvgPYOROy0FTUpywtWy
	 zVF1Y/Sw3PpNqxFm36R2vsvBS3WHEvQELLfHduhjGdKdKzwTAgY6WbmWcHwn7/JMKfATj
	 NXVoD5GRgNQex+Xf5FzYGgDPEZ2tR5PcGiiTa6RPDGT3Tr7RpgJLJA5qw4sTpM21yp0VL
	 vuzRaKV8eruyUpgHd8EtpYmk9SUz4HoSmwg3pRDvyoIKmWrzVNJ3c3X/U1dCBNCwrSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
	b=VzdagvtsgF1PnXIiz/UY+bpVzQEo8euTi9VpOqLnBePkC/zAHifq6QMldig6phcFxSQj
	 pdiloyaN47VC97RCat9ObeWHbSTLO/G3SOcNH0u5uvpvCmZvXFY98drjaQ3poTK04/NnJ
	 wz2FQaO0pDjvpJbFJaHX1aS7gBCvnyjTDO73CDSp1uK0QshwILjNswQ5+Mf/7Jk0mNiQa
	 qvUesRs9u73YZFSdE+AHoqdGEx8QdylCaJMIWCFX+AJeUr+/ySc5w5J9WYmVCRl61DeSu
	 1VgJmu2uN9YJ4Sdfa+O2yT/cbML/hFjnZ8zdB470wmVrFaxe4G8xVdM/hT0LqS2XZJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=peVtVV9t;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C35C60A261A
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 08:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C35C60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=peVtVV9t
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so30923665e9.0
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 00:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384791; x=1794989591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
        b=peVtVV9tceszplCOGCrbcklbevDFBuowd+AoaU/wl+SynG7nktx0Y+jDWq7eHjF+/2
         jy8piT2H3qPiEMRW0Lxgon7u3tvosa7DbqzzgFj5nA9Oeaj/thnrgGiHuzdRL8C/r3HO
         YY95dPK8c3yrw9LxAxhNPrvcEcMzGmuM4S5ZK4SvlY1ef5q9u48YIC0+hGot2DShInY1
         /NWAJ/Ap6COYj0dYWyHv2f48RyKA245AdpFlogh5Wbv3oqgrMsTWzJfmTndtFvnMbstb
         JTGogt1MaNpR0LhTwnhNRyRHl6f418e9/8Cj+wACD4JI/XvB8DN7EfmJcJs1ldVY6Kcw
         N8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384791; x=1794989591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
        b=Nxb1P4uBpTapTv1LrEFZvduuKXzMqLeY6kYV6FPvMitZ1CjcZxtDqb6DRz6HM/kM/8
         rJrX0jWEEIjXqOqJL1g42znl3+fC4M2GHgBx78AuQS+jgsMT9ne1u+16Tq/6kh0EprKP
         NWZTxfVpTqiMy40gnLWVEcO6eOrYRNtiKAhyEhWiawcrurK3McAfRUWWgpJK8Yc+DMBn
         X9vyyrGcm2o/n+hjSwjj3YjiLWEjxldBPjXm6zo1kjnN7KGVUCfKZ+sdCs5A5Zf3iDje
         OmbJNEtyqXsIQYGae3yNY8/2GaZOLbzCL5qK5mbUvFheci/2QJimPYDAjG5cwPW1GLJ5
         BBNg==
X-Forwarded-Encrypted: i=1; AL+hErEB87BymHu5dgsCrVP0MA3fGlC4N2+iT34gPpO2P1i38znma6VFcB1RDI4k/8WUgJTm9vI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8hwM6+soB2pgwzphDByaLFCsJyb+0A82Od8YYZBNsRrk3GcQwE
	Y0vqnSaFpDqbFD/CXSEf2ttBZ8ETCyxogkf85VodNDKmIHYfJ7yCFMIhNSIMPpzigrk=
X-Gm-Gg: AYBFou1o/snGd83LdWLAXalvlhinyHkcATrLY0yVPBM1rwzA9BslgvQRZ7/MpS9GgIp
	KVWJThPXzmLOmKcuWvA2Oox4GYHbqrvGiVZp1OEpa3q8gLWPCOskm/YRVr/q9BMC9yFnU1nSd0x
	Bu9IOIXZmFy+tCqU2hMJozy5WwExz/Z/EMZzrluuSihrlZrronbW7p7Pf6V8iKy5cFipc1LKP0p
	mlTM+uSWhMgfWup7cbxmyLv4rRQiXZPcYoJTylRTuWtnacAgtCwzYoqXBl/V9LlHZk/TCIGbwZA
	JNRHUTHGVJ9MMFPDKbHGU17frKVgKeGXt0uL06zpU2WGTV+JhWCuimE+J59xFHrwMXJprPBl9qK
	8sHGuBEjAFpSwBDUqH2E64odujNd7/Abd22xc8spajXCsZpNY16bBvSYPKjhefTkkUMYQqwZjwJ
	PsJTqDnweOoqGwBlkoCPhpw9fuND+acdWW8unbs2d3YfXBjrTBMsUwk1Nr4uy7P1Ae/SDDFg//+
	RJxgjlBsTBhrnhgvlIUlEF1JvenaoSaJVpqNHmakWIfCw+TDtZLD1d4NC3RW7gsbXUkv0f8ZwyL
	igCxGLGo6fixYCPlTf8CkLG1hZbXrD/xwSfRq0PVMfDau56LIxb8UN7qEVPkczd20EXCqVRvxgy
	r6yfK024aikU=
X-Received: by 2002:a05:600c:4704:b0:4b3:8529:eb27 with SMTP id 5b1f17b1804b1-4ba09389f82mr26248335e9.27.1794384790692;
        Wed, 11 Nov 2026 00:13:10 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:10 -0800 (PST)
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
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx93: Add MIPI DSI controller node
Date: Wed, 11 Nov 2026 09:11:48 +0100
Message-ID: <20261111081150.950272-4-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
References: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
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

Add dsi node to the i.MX93 for support with mipi dsi panels.

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

