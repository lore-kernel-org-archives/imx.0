Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A3CA41
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 18:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729535591; cv=none; b=hYW5eDP+2ddhnQANEuZBNQ3RXMmwm45W0LhVGzWwS2ZE6UF/VtLI+tDJYdoCgfCX+AGjuIkh9NyhlKnqIM2rMpfB/szzGDevfypox9osWlkf7c1U8IeUAmTjmRir58tKakIU+ExTn4egnRXCC50DksdjtKxm296QuJW0wAUJA3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729535591; c=relaxed/simple;
	bh=ldSljFUgHC/jZW2/jP+tfUP4P0nz/U6+N/kF4+C9HDE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kmMcdfCO64tkQljCU1V5DQ7vvQ4tSU91dRN91JvL0b0mZ57jbyOF30zd9E+EosGcX3g0K20n8IGMJ62bA3uKd57Bf2tbR1oUpNbhwPRDe0Bbl9FVTgLTJJ910zovHeoZZ+lKmOp9bBqyPYDjBEaWIgESUptYCyR0+QyrA3m0/NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=LJyr2sVU; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="LJyr2sVU"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1t2xDG-00A4eg-14
	for imx@lists.linux.dev;
	Mon, 21 Oct 2024 20:33:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=4wBoy8F3haHHx4ybdfyg9fd5kQDxZzexbzd2kAVWh4Y=; b=LJyr2sVUKJl3a1FOO8ZqgWResy
	BMSRGjJvPXehgiiivujYXStvVC5XAUjQWbkmUZNQ5nieHkD+L892C93l6sy4BIR5DqAeiLVgUrt2A
	Wum2xzEzsKZZAgSh3SWkRz0GbmlBPusNteuYgZY1V5Z1F37l/+AofWLP/0zv3Bmiffzn7S8fn8yBH
	lLgVxMpIAu8maM4qQ9bBMybImLq5CXUHYsZHQbtJEFPLyWJLuqFrRLq3590lZ/hqcyRfiB68JWvOD
	nYR+eKSZkhUEcXSczYZ9Ixbu9vuhLstL/QeIHYigCMCmSTMCRt6dw+TqGcWaswmmMl5NLRUQGJvoz
	zV95rorQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] ARM: dts: imx6sll: fix anatop thermal dtbs_check warnings
Date: Mon, 21 Oct 2024 20:32:44 +0200
Message-Id: <20241021183244.303329-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix anatop thermal related dtbs_check warnings about node name
and missing thermal-cells property.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index ddeb5b37fb78b..85fe2a4ab97a0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -525,7 +525,7 @@ reg_3p0: regulator-3p0@20c8120 {
 					anatop-enable-bit = <0>;
 				};
 
-				tempmon: temperature-sensor {
+				tempmon: tempmon {
 					compatible = "fsl,imx6sll-tempmon", "fsl,imx6sx-tempmon";
 					interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 					interrupt-parent = <&gpc>;
@@ -533,6 +533,7 @@ tempmon: temperature-sensor {
 					nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
 					nvmem-cell-names = "calib", "temp_grade";
 					clocks = <&clks IMX6SLL_CLK_PLL3_USB_OTG>;
+					#thermal-sensor-cells = <0>;
 				};
 			};
 
-- 
2.39.5

