Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C99F1586C3
	for <imx@lists.linux.dev>; Tue, 27 Feb 2024 22:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071513; cv=none; b=EDJh09xOr9jSFztVX377EG5m8Q+fCuddGrXIjoaJNLEfv5Yn3IZBONd+G+jkvBpKh+MicFbeNmCBTeqaqPIr/EcggLtkI9bYkvWNZbH9hsz3Y+WAwGAq3XQXM8RNAzAOSKIIT2ADlh0jXXsLXALz1I0z06cGd1M4hhlLA1+VlEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071513; c=relaxed/simple;
	bh=LtJ2OGKs7LLLP+uB2gm8Tln6tjfNuxNbCBBC32JvuuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7HRt++wgoeSqwwjStvpf30V2zItQDXcRQu0nrMlLTYQrmCFE/ATwhYdoXio3BQMS9swVGUwIJibzVlr9qhm9UJy2Wz8I8G6Mru03Vn/yy/wlZPJAyHNXnt2VHL2cQ106UvFuLmrlCr8XQg+4RORvOnMVDJte6+u12TKITg7uAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBG0wzmf; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBG0wzmf"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-787c97deabdso205006185a.3
        for <imx@lists.linux.dev>; Tue, 27 Feb 2024 14:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071510; x=1709676310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJzAJwTasiu7hDw+tfGL3rBgM8LrL2gpliyFRMRT1lo=;
        b=SBG0wzmf3fJAhuBItgAtPvh8yXZjIzwQZx5aMYtbLoAs4EvylnHFZS9/L67F44Y6Zz
         DFeUVdlBbAkpO0sUK04czqgdma9+oVUc1sa9DUSreIIsqpkCGAVn/cacZHsuccOwQcEk
         I3Mb50WF6wutISkt5QqjLTj55Cbu0LtxwwUH4KMBDkHdZztiATWoQBnnTbXghHFOozJR
         9iTdb13f/IDMa4yYkbuBtNP6Kyt9Kk8Qr92zyP1QQDE1v2udBFO3x1bVwU5j73xmR4xZ
         8WfRJN0gEbnO1eL+nsgEmNKi2dKN0+WZw8iFOXxySp++za59qkYKmHg6HE6Np3lCYvnI
         zx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071510; x=1709676310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJzAJwTasiu7hDw+tfGL3rBgM8LrL2gpliyFRMRT1lo=;
        b=Uxp39NKxorNTm4OyIBAnPbJPRopA6DyMOFIMFwBI9BzKYwBUNL3JKg+LQ6R5CaSLOg
         nGyNtdHfX7NPhtW0aM1elzWgZ2GWIXWiP6ZvmwQVhAdUI66ZNXhJl6V3CK04yVQPOjK5
         QcsyJL1CDi4krAimCp6tj6CgnDQw0BC//yRYdAkrw00YnWwYU8d6UQIYk4dtnMLwkdks
         Ds2LkVOkmbeBtIjuCySgk3fdkRVHshotesUd84R8kmi7CZNIAZaOf0pNXwRVLbFefn39
         Y79SY6Rwn+Oq3fizohCuDbVpE2P4cfR5n4ll/sqPhbwaMl1oyzM/7MfCRD/nYLWfBALj
         in6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxMF98sFBiDnjZAnJ4TrZXB4mjuidnZoqiDr1sXwrwZryVD/kGICvFP7jSPh3Nv14I+49+L9KHO+9HRhVoH+IoRF2v
X-Gm-Message-State: AOJu0YxY4oeDPhfLdQ3P9/BT+ZyVeWFVn3GYTwinnRU0DLHevHQ0NQUP
	UjxQ0gbqAwuzVTJg/HZZGr6moiNGjNShGnC8q4koqulJnIWachXl
X-Google-Smtp-Source: AGHT+IGThGbZu2ZzIC/n4MZYA5OnZJb7hsEPXN8KiMr5hmglfpCIMmZO1Irlp/eAHem49FGv4ww+5A==
X-Received: by 2002:a0c:e2c1:0:b0:68f:3126:a395 with SMTP id t1-20020a0ce2c1000000b0068f3126a395mr3046408qvl.31.1709071510382;
        Tue, 27 Feb 2024 14:05:10 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:9ee3:b2ab:6ca:180d])
        by smtp.gmail.com with ESMTPSA id c12-20020a0ce14c000000b0068fc55bcf6asm4569556qvl.119.2024.02.27.14.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:05:10 -0800 (PST)
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
Subject: [PATCH V7 5/6] arm64: dts: imx8mp: add HDMI display pipeline
Date: Tue, 27 Feb 2024 16:04:39 -0600
Message-ID: <20240227220444.77566-6-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227220444.77566-1-aford173@gmail.com>
References: <20240227220444.77566-1-aford173@gmail.com>
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
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
V7:  Make PVI node disabled by default to avoid EPROBE_DEFER

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
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 96 +++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 18bfa7d9aa7f..e3510fef6030 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1940,6 +1940,102 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
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
+				status = "disabled";
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

