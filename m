Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135E838A718;
	Tue, 10 Mar 2026 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773144037; cv=none; b=HUUJ/5vZZ1T4WpDLW6S7iAb0461t+tIUJRvibuzy/ly+UQLeUYtClRig5yd12sONrHSFL+34POC8Tw7V/2f6JCDRNOZvMqZTZIAfncebgyUH0uPFGQ9zyuqXO6EPZ5PZQjmreoiF700a620Q5C9+PB+0rEb3MZehZeCEw7cfD/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773144037; c=relaxed/simple;
	bh=LLXsN12rVH2kn3UcZuHRyAxal89yT/9ArO+KprByNUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=et5003NLhM9RwvrLhfpg/a/jlPnX4BTieUnXjgrqXiLaQ050pbZXmaScIQDRc01ZxdWwqz4M73bdyLZXJxqu53PZOCpdt+5GTZMpe6cEPY4eCncTXoTe2t0pxJnzqw3Em4LJKVXeBQIOh5N2xJii/6KxIQtH54nTktu8iY4x0yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=HxJYz9fx; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="HxJYz9fx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=X00DINjny10pJkrIip7rxsFClLG334fLS7NCE08ywPw=; b=HxJYz9fxTtmGgfC1kgdlHSNe8B
	UCW4Yoh1UEG/O/x2O9H6sg2+J+aAE+Q9X59THJXWcoWvcU+MM6GEDXGP4B56yMRlvEADsmTmkXU9a
	WYMOfiensrn2SPnacmDWOYAwEQhnmmJWQwiB1aBQfbBXke76yLMQTKsNSLEDvGHn3+lOkSYw1Qitp
	arUsArHOihat4DwJm+klZ4No8ZNmrsL9i4w+oayR9/4s18EXRUohUMPV8uGmTSBdjg2eBD8oKd1J6
	/50U0HoNej8XwdpNdNY142UXINFdPBxsnxyRyP75PKHzOrMM/Nb397c74lhUK/d5dthzJaWzJcUDs
	7PrWT1zw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1vzvlD-000ONW-0a;
	Tue, 10 Mar 2026 13:00:27 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1vzvlC-000CgW-27;
	Tue, 10 Mar 2026 13:00:26 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: imx8mm: Explicitly set DSI_PHY_REF clock as a child of CLK_24M
Date: Tue, 10 Mar 2026 13:00:10 +0100
Message-ID: <20260310120014.3178231-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27936/Tue Mar 10 07:24:39 2026)

Since commits a0deedcc0cf0 ("arm64: dts: imx8mm: Slow default video_pll1
clock rate") and 5fe6ec93f10b0 ("clk: imx8mm: Let IMX8MM_CLK_LCDIF_PIXEL
set parent rate") VIDEO_PLL1 is dynamically programmed by CLK_LCDIF_PIXEL.
On imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso this results in a
VIDEO_PLL1 frequency of 68.2 MHz and DSI_PHY_REF of 17.05MHz (1/4).
Instead use the 24 MHz clock as parent for DSI PHY reference clock.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index f2e1854f38a0a..eb23ca27e8597 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1149,8 +1149,10 @@ mipi_dsi: dsi@32e10000 {
 				clocks = <&clk IMX8MM_CLK_DSI_CORE>,
 					 <&clk IMX8MM_CLK_DSI_PHY_REF>;
 				clock-names = "bus_clk", "sclk_mipi";
-				assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>;
-				assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>;
+				assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
+						  <&clk IMX8MM_CLK_DSI_PHY_REF>;
+				assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
+							 <&clk IMX8MM_CLK_24M>;
 				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_DSI>;
 				status = "disabled";
-- 
2.43.0

