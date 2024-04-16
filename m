Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1015C128398
	for <imx@lists.linux.dev>; Tue, 16 Apr 2024 14:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713277178; cv=none; b=E1t1/JKYyNqZsUUDrzN1LUgtNWcKkaonQM9Eng/945zXsSiIMvomHhCKfNptgt4ovlhYVmpBpj7tG+gUOYlG9cDjwxgD1YqomaQIhV0I0gpoJu1kLAzcugT17MitHedIpKJedoOpR/Emxb3DibtV4E2QYCYqNGTpgqJ6ZyOzAc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713277178; c=relaxed/simple;
	bh=pLi536+XGXRRJdf0dqz8gYWIPISxCUVHwrCOpZAp888=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R570vujV69Los7Dc6QqtOozA/G3Kp832CLbtPds69QV3mFd1+QGGWtnm1hyLlP0wNRet6F/Zg+m/eBD3mRTnz0RngmeJxoSrRSo1sxbQWNk8kiEnhGAGDmGQ6qRZyiY0xeah1bJKBasStw1DsWCA67agMCLyJVg5sFW431z5hCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=cpLl15mI; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="cpLl15mI"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C4D9B8839A;
	Tue, 16 Apr 2024 16:19:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1713277168;
	bh=ZWRZwImnRDA+97NqC2LDRm2JRPbpuHH3Q1ZGjhqAnOk=;
	h=From:To:Cc:Subject:Date:From;
	b=cpLl15mI0FHUlgLnSTC1Ddy74MPUIKGCp5p042ml9W3brv4T5c6CIXbqdHs74TYW+
	 OO9f7SdtQRLIzuDymkxn11JFXMsDxBxBCR7MPWLz38xELdSf1cvkF2+cfKW5mOGAwM
	 /9UeoUF9iVjMw2MZ5sYDgTG5J6YUYZTZAPwZ7ic4ydF+FoqEOnbh5pAmmq9svFJ7Iv
	 yIZ/kwLIr9ZvhT0waO8QkmUJpYZKLwruB7CtHe8waY2Se0mW3W7ZCVEl8n0s4/b+8r
	 u5K/iOyctG1BmY99qKJDfSlf9JhQUHFIGyE95mL/ZkO8ucIaAXRp9H+X6vTjqFoQPO
	 0vZh5SYYVEQOQ==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2] arm64: dts: imx8mp: Align both CSI2 pixel clock
Date: Tue, 16 Apr 2024 16:19:10 +0200
Message-ID: <20240416141914.9375-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Configure both CSI2 assigned-clock-rates the same way.
There does not seem to be any reason for keeping the
two CSI2 pixel clock set to different frequencies.

This also reduces first CSI2 clock from overdrive mode
frequency which is 500 MHz down below the regular mode
frequency of 400 MHz.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V2: Align both clock to 266 MHz and update commit message
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 1bb96e96639f2..7883f5c056f4e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1667,7 +1667,7 @@ mipi_csi_0: csi@32e40000 {
 						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
 							 <&clk IMX8MP_CLK_24M>;
-				assigned-clock-rates = <500000000>;
+				assigned-clock-rates = <266000000>;
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
 				status = "disabled";
 
-- 
2.43.0

