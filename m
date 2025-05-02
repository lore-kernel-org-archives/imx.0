Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB3E25A659
	for <imx@lists.linux.dev>; Fri,  2 May 2025 15:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198432; cv=none; b=YEGrvexU0YdYAsgq/O7ibVZ0rFVuEY2BpdRuWi9scuJp83jij4CkHMQBoRixcl27/cmlPg++z+3sX2R030LgZW7Ox3UjPMwigIxGuGOn4SurlWKpykMt4JC5tjjHi4T2hsrQy6dboSD+tQdsTuTIS1IelvJQChGHMeK2Z1pcYpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198432; c=relaxed/simple;
	bh=atJG60kAXi/Am38RCOYS79y/7Gt7+4/Ysm4ZYNtBfa0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VIYsj8Ark1hA3BhzYIMbaLKNy9rVWEmOhL9Yo1RpzOCkdka4zYrpywVc8/Fe2F3mr2sxXe8O4ntRLjYN9EK4VGlA5rRD5GXsck4fLGBnN7XIicdFQIi5MXN4WxfvpL5hVlxOafcjBYchLyFYUTQ+hWR5QeaBJAcFu4riuYpYNH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uAryY-0004HG-1O; Fri, 02 May 2025 17:06:54 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paulk@sys-base.io,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	sebastian.fricke@collabora.com,
	ming.qian@nxp.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 06/11] arm64: dts: imx8mp: add VC8000E encoder node
Date: Fri,  2 May 2025 17:05:09 +0200
Message-Id: <20250502150513.4169098-7-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250502150513.4169098-1-m.felsch@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Add support for the Versilicon VC8000E multi-codec stateless encoder.
The IP integrated on the i.MX8MP supports H.264 and H.265 encoding.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index cf9b6c487bd5..97b09b647ec7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2267,6 +2267,17 @@ vpu_g2: video-codec@38310000 {
 			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G2>;
 		};
 
+		vpu_vc8000e: video-codec@38320000 {
+			compatible = "nxp,imx8mp-vpu-vc8000e";
+			reg = <0x38320000 0x10000>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
+			assigned-clocks = <&clk IMX8MP_CLK_VPU_VC8000E>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
+			assigned-clock-rates = <400000000>;
+			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_VC8000E>;
+		};
+
 		vpumix_blk_ctrl: blk-ctrl@38330000 {
 			compatible = "fsl,imx8mp-vpu-blk-ctrl", "syscon";
 			reg = <0x38330000 0x100>;
-- 
2.39.5

