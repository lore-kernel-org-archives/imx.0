Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B269778F4A
	for <imx@lists.linux.dev>; Tue,  4 Feb 2025 18:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738693669; cv=none; b=TCyFHF5fsckBTur/9HHvQtgYJO7r+SONMb8vmSZ7cWE9q7mhBDjNzHgZVcPciEFwqk7Ohw9zn+Ja0yjyn+rqTxd/WM35f0xTnjzD+tHO4uqQKheTdGev7fq+onSdpbgj+jkeCdwYMZofMmLXAWmCyuqHZ6DT0O2rD9Xf6VnWDMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738693669; c=relaxed/simple;
	bh=pPIp+z2bPeEdOqjOS3BHIjyuTfgWa0eb8p6WRSsgM3g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hI5+b4vsgoTalA3e9GteVLQ8/oEdVlLb74iH2iiv3/1OPppXtNEmExaqV9RsLM1iOICqJn9ajbLS49mHa6XyzDqS4IPyzvLcHQ0qEqYuQ/lyDeuqWM+WIhTEZHuctHH9aQIcaUH7UclDd/f6EUUYJwyVVn90Mg5GJ0tEFBL8b9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tfNe6-0005cn-7j; Tue, 04 Feb 2025 19:27:38 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tfNe5-003Vb6-1p;
	Tue, 04 Feb 2025 19:27:37 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patchwork-lst@pengutronix.de
Subject: [PATCH] arm64: dts: imx8mp: configure GPU and NPU clocks to overdrive rate
Date: Tue,  4 Feb 2025 19:27:37 +0100
Message-Id: <20250204182737.3361431-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

A lot of other clocks on the i.MX8MP, including the DRAM set up by the
bootloader are already running at overdrive clock rates. While this is a
deviation from the configuration of other i.MX8M* family SoCs, overdrive
is the default for most i.MX8MP boards and only some special purpose
boards will choose to run the SoC at nominal drive rates. Up the GPU and
NPU clock rates to their overdrive level to be consistent with other
clocks set up in the dtsi.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..aeaa6a5c2f56 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -816,12 +816,12 @@ pgc_mlmix: power-domain@4 {
 						assigned-clocks = <&clk IMX8MP_CLK_ML_CORE>,
 								  <&clk IMX8MP_CLK_ML_AXI>,
 								  <&clk IMX8MP_CLK_ML_AHB>;
-						assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
+						assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
 									 <&clk IMX8MP_SYS_PLL1_800M>,
 									 <&clk IMX8MP_SYS_PLL1_800M>;
-						assigned-clock-rates = <800000000>,
+						assigned-clock-rates = <1000000000>,
 								       <800000000>,
-								       <300000000>;
+								       <400000000>;
 					};
 
 					pgc_audio: power-domain@5 {
@@ -2232,9 +2232,9 @@ gpu3d: gpu@38000000 {
 			clock-names = "core", "shader", "bus", "reg";
 			assigned-clocks = <&clk IMX8MP_CLK_GPU3D_CORE>,
 					  <&clk IMX8MP_CLK_GPU3D_SHADER_CORE>;
-			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
-						 <&clk IMX8MP_SYS_PLL1_800M>;
-			assigned-clock-rates = <800000000>, <800000000>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
+						 <&clk IMX8MP_SYS_PLL2_1000M>;
+			assigned-clock-rates = <1000000000>, <1000000000>;
 			power-domains = <&pgc_gpu3d>;
 		};
 
@@ -2247,8 +2247,8 @@ gpu2d: gpu@38008000 {
 				 <&clk IMX8MP_CLK_GPU_AHB>;
 			clock-names = "core", "bus", "reg";
 			assigned-clocks = <&clk IMX8MP_CLK_GPU2D_CORE>;
-			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
-			assigned-clock-rates = <800000000>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
+			assigned-clock-rates = <1000000000>;
 			power-domains = <&pgc_gpu2d>;
 		};
 

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.39.5

