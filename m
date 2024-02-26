Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A22136669
	for <imx@lists.linux.dev>; Mon, 26 Feb 2024 23:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708991151; cv=none; b=m/MiEGtfNahoR74+g3U5HoozBV8vNkcTRrYtj/5VwGpHixs/Dt03gMa47nnYHBn5ChQhb6v/kCu6St51cGL+2+GSfxaD1Rqzwf+TblvuEztNXkvNcUe8axp183kpiixD9nVmJ5sSKzvuU2VPfbY/nD/Y3LrjJSSTQuJOark4N7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708991151; c=relaxed/simple;
	bh=PPE9aCDp/+ayfS9rSy6PpNNiR+5t57T1PNn5XAsD9cM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TOUBn0WsiW8k947yIeM8jvlCyu3auGBAgJh/0Q2S2wZ1RY4E1JWmiz6nEdtDBvnLIUKl2/yJHBKpEyPlFpUI2TR4WYr/S/xqtY8NubXnWD8mGPA69xBwnjGTCFjMkM9vYV4otnsj2tgrnTEBAyA3+i0vbwycEOOUwosQtvCFWKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EB9xHnzt; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EB9xHnzt"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7bade847536so217049139f.0
        for <imx@lists.linux.dev>; Mon, 26 Feb 2024 15:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708991148; x=1709595948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+UTK+fYQopdu7vZsorElcS4oD1Blt+73sP9Ns4GZME=;
        b=EB9xHnztHpP8iwFzlDDLR/grCBvcby/hZPsBC0ajJvKarBfeP78z96hQlE7o7/fDGT
         qHv+aobzAg8pRVWYgxaDEWg1i7KcPJ+tkahQo+7oNZDU7o9wjAysjr1YzIr5uLDwZTQq
         6vXAAkK8NAXM1KLLpxTxhcLfMV4+uzI2BpEHx6Y2c5zbKXt96GuQ4Q88NfIXOEApPWj2
         ZB8q9GoRwuii9Cpodf5xg/usK85bbtB2ebEZKJz01vz/kAnTyWKfzCQ2sWXiEoMOIP/t
         VFCp7w7TDfvWCaB4AeNQ7c78waquV/ATX9/EqweeNJG/GPWJV7dSmGrP2dt+DVF/r4wo
         m4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708991148; x=1709595948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+UTK+fYQopdu7vZsorElcS4oD1Blt+73sP9Ns4GZME=;
        b=ORV34avDHV9T/aNtriRZRBWvKhpYyoOqfzXY97d0lToGPDm7/m7VjBcTZ63O3b4/rq
         fm/P+LNriUXwvyEvdKw9uuxg/dbWWj5fnF9FJttZPx09Z2cAP7YDzYvUCzgyIo2Vmwv7
         sSr3HXby8CWg+qMuZP1cUD0OpFvSJWwabvnRabO6uqevjccr6ASsJRZYBP4VEqa4cOCV
         UBhrWCrhS9gFynpummiZS/Dr30NWO9mIcNhGJs6j8a3BB++iDr08GgVAFr0FtRjGZY+4
         1ADCd50drMcJYdJZnR10r1lt39Bg2VaVN016sOkzdgTKBDleQevkGJyJpnlUfQRNFqMa
         wyFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBOFhN20get/xx4uOiv+weoFRYmdGdc1KhosdyMrc5nj3E1YE8upYsx2PAKHjAKtC1dE0ygDEb/1blKn6R0S9aO3XV
X-Gm-Message-State: AOJu0YxVxb2l0eSQJG6zkMgs6yccB688SoDtJv9hxWVJIwvQpYNuaqqh
	lA+KW4vTArgBXk08LFPjvUxtdtaKzRPEj5Q6JRvFJWUWnn1Indds
X-Google-Smtp-Source: AGHT+IH4PaNCs1oHhwDvHwYDXOUqRvUfkRTRMpFd8hzKTc/5GYjGQxmXNKxJUe7EDuGGjgMMUDElWw==
X-Received: by 2002:a6b:ec08:0:b0:7c7:968b:25b5 with SMTP id c8-20020a6bec08000000b007c7968b25b5mr9757511ioh.3.1708991147676;
        Mon, 26 Feb 2024 15:45:47 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:9c95:d061:819a:2ab2])
        by smtp.gmail.com with ESMTPSA id c25-20020a023319000000b004741cf1e95esm1545317jae.11.2024.02.26.15.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 15:45:47 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: aford@beaconembedded.com,
	Lucas Stach <l.stach@pengutronix.de>,
	Adam Ford <aford173@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V6 5/6] arm64: dts: imx8mp: add HDMI display pipeline
Date: Mon, 26 Feb 2024 17:45:16 -0600
Message-ID: <20240226234532.80114-6-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226234532.80114-1-aford173@gmail.com>
References: <20240226234532.80114-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lucas Stach <l.stach@pengutronix.de>

This adds the DT nodes for all the peripherals that make up the
HDMI display pipeline.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Marek Vasut <marex@denx.de>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
V6:  Make LCDIF3 disabled by default

V5:  No change

V3:  Re-ordered the HDMI parts to properly come after irqstree_hdmi
     inside AIPS4.  Change size of LCDIF3 and PVI to match TRM sizes
     of 4KB.

V2:  I took this from Lucas' original submission with the following:
     Removed extra clock from HDMI-TX since it is now part of the
     power domain
     Added interrupt-parent to PVI
     Changed the name of the HDMI tranmitter to fsl,imx8mp-hdmi-tx
     Added ports to HDMI-tx
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 95 +++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 18bfa7d9aa7f..637b0265b0f1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1940,6 +1940,101 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
 				clock-names = "ipg";
 				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_IRQSTEER>;
 			};
+
+			hdmi_pvi: display-bridge@32fc4000 {
+				compatible = "fsl,imx8mp-hdmi-pvi";
+				reg = <0x32fc4000 0x1000>;
+				interrupt-parent = <&irqsteer_hdmi>;
+				interrupts = <12>;
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						pvi_from_lcdif3: endpoint {
+							remote-endpoint = <&lcdif3_to_pvi>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						pvi_to_hdmi_tx: endpoint {
+							remote-endpoint = <&hdmi_tx_from_pvi>;
+						};
+					};
+				};
+			};
+
+			lcdif3: display-controller@32fc6000 {
+				compatible = "fsl,imx8mp-lcdif";
+				reg = <0x32fc6000 0x1000>;
+				interrupt-parent = <&irqsteer_hdmi>;
+				interrupts = <8>;
+				clocks = <&hdmi_tx_phy>,
+					 <&clk IMX8MP_CLK_HDMI_APB>,
+					 <&clk IMX8MP_CLK_HDMI_ROOT>;
+				clock-names = "pix", "axi", "disp_axi";
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_LCDIF>;
+				status = "disabled";
+
+				port {
+					lcdif3_to_pvi: endpoint {
+						remote-endpoint = <&pvi_from_lcdif3>;
+					};
+				};
+			};
+
+			hdmi_tx: hdmi@32fd8000 {
+				compatible = "fsl,imx8mp-hdmi-tx";
+				reg = <0x32fd8000 0x7eff>;
+				interrupt-parent = <&irqsteer_hdmi>;
+				interrupts = <0>;
+				clocks = <&clk IMX8MP_CLK_HDMI_APB>,
+					 <&clk IMX8MP_CLK_HDMI_REF_266M>,
+					 <&clk IMX8MP_CLK_32K>,
+					 <&hdmi_tx_phy>;
+				clock-names = "iahb", "isfr", "cec", "pix";
+				assigned-clocks = <&clk IMX8MP_CLK_HDMI_REF_266M>;
+				assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_266M>;
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_HDMI_TX>;
+				reg-io-width = <1>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						hdmi_tx_from_pvi: endpoint {
+							remote-endpoint = <&pvi_to_hdmi_tx>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						/* Point endpoint to the HDMI connector */
+					};
+				};
+			};
+
+			hdmi_tx_phy: phy@32fdff00 {
+				compatible = "fsl,imx8mp-hdmi-phy";
+				reg = <0x32fdff00 0x100>;
+				clocks = <&clk IMX8MP_CLK_HDMI_APB>,
+					 <&clk IMX8MP_CLK_HDMI_24M>;
+				clock-names = "apb", "ref";
+				assigned-clocks = <&clk IMX8MP_CLK_HDMI_24M>;
+				assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_HDMI_TX_PHY>;
+				#clock-cells = <0>;
+				#phy-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		pcie: pcie@33800000 {
-- 
2.43.0

