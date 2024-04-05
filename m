Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD1A17278B
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 20:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712348577; cv=none; b=ITHrpKPnBQFU8XBDiWpClq6zZXYFuhRI4A6U1vCzte1GF8JdAL29nPLZqNUa7390nhW5jz53gybSuyzCTLw9jJmyuhYw/wxSfjQ+hdAdLYhF6GEpr3wirrMJ4JMwojBAzkCigx0GjuA+98yuz6zI8LscRCb2D1aCp+Irv25vudU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712348577; c=relaxed/simple;
	bh=McaYIRb/EJ860lq+xc5qCEfV7ezc9mbT3y5s9EtLhBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jsEOs7ct2fYxokudGkuAHFst8NBkGCqiEV6VW7zHElk5qkB8kthGoDxciG6A9CeDPwiRnNdjKriSt9+WDoOyb9YlNS+a6xmGjSZrzFqkb7WryKXdYSzDRBvRKW6jx0pPkXg9G0EJr+DoGF6zghqOl+py4LBqQhkwuUIKlYfof4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=ONQn9iPQ; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="ONQn9iPQ"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 40CF6883C7;
	Fri,  5 Apr 2024 22:22:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1712348573;
	bh=jJa+9AtaXtwCXlKZ2GyFX/5yFcB672RfIfKX+K1+UY8=;
	h=From:To:Cc:Subject:Date:From;
	b=ONQn9iPQrlRChgvmyfL+gfItHqYwn59nYSFgCoTNjIeLD6IHkYRanvJHrNABRgCbb
	 mOAiTqTczqYhVCb4kGZmTYl4THLU4nqA4mkoVF0QZbwm980KPr33HIiDlzgGREDdLv
	 cpMSUktnciYtCxOxQ5357DAbnaTVL+t7ZCUvc3yWaVU/3LoPV5Ew7bmCGq6kjE319j
	 s0MTuJ9F0vxgxsoqHLz5aDACUzxnBw18rJp2JEHn25ll39qxuzD8iDmnci7A6zSH9p
	 qGqlt1VNPuE/OAWWurXuSQfOua7ok0YJFfpWieOdugPqB4ROOGAhr/ayaf3oetFy3M
	 eIWiwQWnuXH7w==
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
Subject: [PATCH] arm64: dts: imx8mp: Align both CSI2 pixel clock
Date: Fri,  5 Apr 2024 22:22:26 +0200
Message-ID: <20240405202243.46278-1-marex@denx.de>
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
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 1bb96e96639f2..2e9ce0c3a9815 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1703,7 +1703,7 @@ mipi_csi_1: csi@32e50000 {
 						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
 							 <&clk IMX8MP_CLK_24M>;
-				assigned-clock-rates = <266000000>;
+				assigned-clock-rates = <500000000>;
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
 				status = "disabled";
 
-- 
2.43.0

