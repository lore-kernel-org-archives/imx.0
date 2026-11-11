Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403906;
	b=kcKn02ri4+Y96UcGNv78Fvu8TbzHxz1aWT+CLTEa+pRDem4Z8qSQHwPnNropF46Ohh+H
	 fUCxRSpYjuehVPGw7sqyBNhMm+fkjZUaL8AiWV8rssnTeKwdVDXPlFpANrTTH5X/ASwG+
	 7ZEpl2g3ta2PQwpGfVTNF7nE87aub8EZ7JywbzCtBTbKVY0ZkiarB4rCVO/JTfuzexk+5
	 6zr5zDr/BZAFpKycdhVDjHXtKsZUYD15WuCr5elFkKEfvwGVqAt8XRLvLHbm95uOAGRjS
	 SA6PbpxreCY9tzhsWIQbQv6BbBeQeJfZPaiPGbHwXvoOOrm3dJkxEC+ESMiOLY/oZYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
	b=a1OTCNf83cojPgtWc5mahGFYDDkxndST5bzjH9Gw5grfSjelZ+8ZefxGtki4TEumNAD5
	 O1hq7YSOXh/QaXcMHRwnwRTWgq3i0QCrnD3Q6jdOxtrS0waVJkO5/w+jhtG8HN9HZC+kb
	 2EF6nyaV/scDxUEkrI1gtUE8WH7zZR7FerPplPBmg9jxl95NWh9PAkm5Rlt/tzgApPO/H
	 TqVO+zXLMgiCITf+uGx24+XOFkickKPvUDKfFJQkYg/9xsoU2OfaTyT/Ab+qBdYZUXwC4
	 CxPdNHkgAY5p6Cy4WMVZdwl2L9h41r7gyB5ULduQLNmVbSAMcTlfSYLpBC8UwnnriJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CcU5qsbE;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD465606A89C
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 13:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD465606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CcU5qsbE
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so28633565e9.0
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 05:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794403904; x=1795008704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
        b=CcU5qsbE/ngz84Hr9d88R3Ybo+6VDHpCdhmTnU39BH+PuY2Yq0WYKsbaVEpboN3SkF
         C6NV7XxkW1GTb0AmJ3Cv40Nl3QezEARCqsq6O5RIus0+R5O95BhOw3y7OjKOc0vYK26N
         CiOG+YQybR4Ub1aJaydKEW1ZeKsyV7np8o3uR7Z4AWPbt3s3zEryrAJOPI8Yv5slhjXl
         MTbdyKjqapZZi/mmxSbETVd9bIU5fe1BF29jbuZmmCfZAhpKoEy+CgH2vS7xCgu8tfG5
         k/unkVUp3HnMZgPEGLb0FFBKNhLCCflVQV7ioR7q4X92lB8jPzfD4FrG33taf6fltQrS
         Aplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403904; x=1795008704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
        b=FdfD+JSZdXFTeD53kdH3Ux1uQu/yGL7I8d5JNoF76LXBZiPVXyyegRCFH92WfzXUIa
         ShNUdZGfAXfmVm8FZFVSozzcSQQpk2yPmcVi4TJS1EELJUda7O6olueSd8eM+5GeUgHB
         6rfBcDUfMZS47S90W9ApfKUOYLgPNcomQlJjDL2ReAfmhEM61B1G8rvaC9KGbT943BSJ
         gojaOxlHeQgQkq4fBxbKOjnMe0eT88zTjw+mGoVWV/AcfQJj6yRKYFSnR7ygs/ihaJg6
         5nXT5FPjrMvSFoUC4G6RYvQMG4I+xbt7gDLRtbjNXXaPzAFyuPg/qmAsA5WLPv7hHGZK
         mx5A==
X-Forwarded-Encrypted: i=1; AL+hErFTewgRDkoqUswu1aTjNbquUob7qKL8m29UIRtGurNBdTuEwIzwd5yDT22Y4OSFOLAUkf0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/OtTo66j6pIUvnFDbggbJdQxCxWTm57YXp+1oLgVmbz/YLGSMi
	Iyvo41ga1e79LwQJNU9ns7q3r2gwjy6luXzvu/W5QCtrOiALbwNVINTd9+kibdlsB/w=
X-Gm-Gg: AYBFou3L4W3llay1QEG1AMUqRnzXMT/ZA2+wDpGGQuLohNhjwmmcv/guzYgdOAhvhyJ
	i9z0zhPLDZ/1xITRpALUjFSqTXclwPgBCzGhThd2qYO1ym6/MxhyUcclEx2IJ7sk1WUsCGVrtZm
	TTb0di4ouicCscKhcA5g9n4V74lr1qknBH3bHC9+B+88ovhdnqsaSWx9wPxdkmZiDFB2AZ1xf91
	Zt+oxaqsNuT1mTgRzvN/nuGbzEW6KYCERtKQPOVSMNnFnZpyIgpR+8JB/04aUUEBtqQnoe9GC7p
	QJKx96XHTi/Mo7u/2ItvsShEd58ezsU6sQDNN07yYgSr3IvzYz/l6j/ZKbYHy0Nb3FJ5MQ3rPNA
	7vVeGRbK2IB/rIsPRTV6CilwQrrxa0hEgnkblBiIEI5nSYhiaE67Xmmi9nQFejgdtmeaNSVFx1n
	Wj92yZtq2vyvIat0kQhqLR179/q8vRN9Va30A4crcpGIjIgBF/Gtne1PKb8LWZwnI9FyUsScrFe
	xsncO0VC/J3w4MTwpRYa+S3zzZU4lTPg7Ou6pzu1VwX99/glD8jYRclDcaPZpwx961pplRI/kpX
	sYgGnZ60A0M5yLYP1vHQnI/EtuyvFmVrxbAtj/TmLVL2xXEGYGFV7HidxokYWNtYKRe65WvjNbJ
	TUcWS8nrR538=
X-Received: by 2002:a7b:c342:0:b0:4a2:f58:9a82 with SMTP id 5b1f17b1804b1-4ba08e16f94mr38360965e9.13.1794403904169;
        Wed, 11 Nov 2026 05:31:44 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11089358f8f.37.2026.11.11.05.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:31:43 -0800 (PST)
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v3 3/5] arm64: dts: freescale: imx93: Add MIPI DSI controller node
Date: Wed, 11 Nov 2026 14:31:17 +0100
Message-ID: <20261111133119.1063210-4-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
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

