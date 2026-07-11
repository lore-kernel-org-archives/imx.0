Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7710D39B96A
	for <imx@lists.linux.dev>; Sat, 11 Jul 2026 10:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783765145; cv=none; b=Zdqjgg1Kgu3Uqg5dz4g8XzSw4TAA9NX9LbgPjsxIf5EfCLFqzmnTyO0YgtfSL75uH5lBdldHl1ggNZpfzuzCQxV9f2mZWzGidbSZcQIMxCSXEeEbeoJTtvJEVyyno5KVqk8xCgH8vJ2WpJWGTTK/0PDGxpjvldoygW3c5nP9ELg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783765145; c=relaxed/simple;
	bh=ZwdDjcy0Qsgh7vMnudFHGZ1Kq3qz28u3fyIoUAPg3h0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aRkwshpCpzPbYbkTjCyA4FkFQcH7HgSZ2kfcdNj7smb4ujZG/iGmWYHSBw2OUZqDyY5YZxmkcLDdgcI8RzWu5acFUdPr6Zm7nJAVD8pJ22+b8e1de6itR7UVi5d1f3DyEIjMx/ug5CnWJqdev2/RygXUo0H3aoYOViqggwenNQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=U9wlEeCc; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="U9wlEeCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1783765137; x=1784024337;
	bh=uwZcD9oCcJmUYi50fgjUwSiBvuGKxzR2NWxkF73vgDs=;
	h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=U9wlEeCcjarsPOAFv1o7FvFOs3pX1ydKaSsOZ/HmOkpKKVAJbwOsVREvDdUa7wtiu
	 1gOby98rul/HORO72xYs+yjzA+zxzzvDoCMyy6WGzrWQM6wHaX+YQLFQhe1TA+Xaxs
	 qo4AUkSWsJP6SOgm+P0VZ12ISs8rLBPd4ucJvCXDyCMJLVSKwO+viJCF+w0nDGLxP6
	 LSFGr3/iLCf7QT+ev9GhiHsGVaJxSmXDqSInL/TuuwBDfzlzde9f9/oBk+DRV2lNUK
	 SIlpK1d0VvQmRUI6Ws7ntovMQJe91CmpJHfeEDjtfEIZklvAQGkJjj4qT8ED0lZjSc
	 U6vof3GXvkB1Q==
X-Pm-Submission-Id: 4gy4Rh2ndZz1DDLC
From: Esben Haabendal <esben@geanix.com>
Date: Sat, 11 Jul 2026 12:18:42 +0200
Subject: [PATCH v2] arm64: dts: imx8mq: Add DCSS node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-imx8mq-dcss-device-tree-node-v2-1-037026d45c21@geanix.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0K6dkzbgKAr72FYYGcKY0KrLRIM6
 d0teAGXL3n//VVECkxRXIpVBJo5sncZ9KEQZuhcT8CYWWipT7JWEnhcmvEFaGIEzANDMAUicB4
 JzmirBkk2FXUiJ56BLC97/tb+OL7vDzLT1tyMgePkw2f/n9Xm/Xk1K1BgTa1LtFjVJV176hwvR
 +NH0aaUvj5CT1TbAAAA
X-Change-ID: 20260710-imx8mq-dcss-device-tree-node-9df58de085ea
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783765135; l=2865;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=ZwdDjcy0Qsgh7vMnudFHGZ1Kq3qz28u3fyIoUAPg3h0=;
 b=9U+FP+B+sI5+Yy4IN4c6goXeFARPD6bIzJ8A5UAwiafpOJEx4yZQ38pPfGaP8b822Cc1/A2aH
 GYjRXapxi1ZDSx1ujuG1oytgbLoGxVKnTc2Rb/iZcxWN8NdivQ4iZ1Q
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

Add node for iMX8MQ Display Controller Subsystem.

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
This is basically a resend of a patch from 2020 [1], which seems to have
fallen through the cracks.

I did not notice that patch before sending my v1. As of v2, this patch is
identical to the old patch, so I have added the Reviewed-by tag from that.
If that is not proper, please remove it before merging it.

[1] https://lore.kernel.org/all/20201125103909.16548-1-laurentiu.palcu@oss.nxp.com/
---
Changes in v2:
- Moved dcss node under aips4 bus.
- Link to v1: https://patch.msgid.link/20260710-imx8mq-dcss-device-tree-node-v1-1-fc724dfd574e@geanix.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index e60872aeeb49..d75710cdb5b4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1598,6 +1598,29 @@ aips4: bus@32c00000 { /* AIPS4 */
 			#size-cells = <1>;
 			ranges = <0x32c00000 0x32c00000 0x400000>;
 
+			dcss: display-controller@32e00000 {
+				compatible = "nxp,imx8mq-dcss";
+				reg = <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
+				interrupts = <6>, <8>, <9>;
+				interrupt-names = "ctxld", "ctxld_kick", "vblank";
+				interrupt-parent = <&irqsteer>;
+				clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>,
+					 <&clk IMX8MQ_CLK_DISP_AXI_ROOT>,
+					 <&clk IMX8MQ_CLK_DISP_RTRM_ROOT>,
+					 <&clk IMX8MQ_VIDEO2_PLL_OUT>,
+					 <&clk IMX8MQ_CLK_DISP_DTRC>;
+				clock-names = "apb", "axi", "rtrm", "pix", "dtrc";
+				assigned-clocks = <&clk IMX8MQ_CLK_DISP_AXI>,
+						  <&clk IMX8MQ_CLK_DISP_RTRM>,
+						  <&clk IMX8MQ_VIDEO2_PLL1_REF_SEL>;
+				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>,
+							 <&clk IMX8MQ_SYS1_PLL_800M>,
+							 <&clk IMX8MQ_CLK_27M>;
+				assigned-clock-rates = <800000000>,
+						       <400000000>;
+				status = "disabled";
+			};
+
 			irqsteer: interrupt-controller@32e2d000 {
 				compatible = "fsl,imx8m-irqsteer", "fsl,imx-irqsteer";
 				reg = <0x32e2d000 0x1000>;

---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260710-imx8mq-dcss-device-tree-node-9df58de085ea

Best regards,
--  
Esben Haabendal <esben@geanix.com>

