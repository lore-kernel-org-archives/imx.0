Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797283F4DE0
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783676072; cv=none; b=klWx/rEdv3crL2aeeOG2OxLZWYFZceWcqhwHh2VXESca9Ap22vzfk3qHfNuu/e1+T/hkFIcv46cHzJk1l/ADI5vMTgZJA5S6pg1/nfkpGpukXiccP7IixTwAuXueWSX4wMCnU3nROP1jYImz2v7BEBqUJV7ia24H6Qw8j3EqUMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783676072; c=relaxed/simple;
	bh=+SSbmdxaiq0J0wa30iE1zuvjGBNzgjfpAoxryIKdcl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=deAcNIWPE2fKbbcMd+K9o6nQBKqFXu0RkajqvJGn5qyXSbYc7rQ04ORqEWGfxJUPkUfcoSmqPBgfblu+kixVEFp1XxTFcyHh+tYCD4/6m+py+g6J9Oq1iCyHSRnx8aEOf8TwV64uTlei2Uyhi/8IDy8CALJK/eLwoZYicM+lOnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=oPpHa34e; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="oPpHa34e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1783676056; x=1783935256;
	bh=qTqD8XHnXnpCzH66fJSE8CBGzOPJsWGe02GIOrSsx/M=;
	h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=oPpHa34elIXrWQ2qBDuDchAmHHoC1fHSmb+YsLWiTSpntZaJmK8rMpO2Gxm/DkqaH
	 13Pv03dCDl50Li3QBPZRBiifPuS61U/wPKrN0O8aROtls5LcBk29+Kfiu4yzbU8yn7
	 YHsy44XQwBWmNfaIX/P+N+ZtzrTp7RXMqoW7T1euCoXZn2nFzxpuTLDEWO95TST+bA
	 pHTit8ZtmC87FdVFvVd2hyuxRTzaEOrsjQx9qCb4kSzEnwALyyXAtRRkyUqqGKBm/g
	 GRGj/KuDzsCNSxOKlOYfFdUzlIivmozJpDxXqcX4Ym97TEFOoLQ/g+4IuZuUyHEtn1
	 if/dBUj7ZamjA==
X-Pm-Submission-Id: 4gxRVb0VhTz2ScPc
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 10 Jul 2026 11:34:00 +0200
Subject: [PATCH] arm64: dts: imx8mq: Add dcss node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-imx8mq-dcss-device-tree-node-v1-1-fc724dfd574e@geanix.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJIUGqVzEusPMDQ0LRDhgSw
 t2tuvwW7+1kSAqja7FTwltN55hRngoKQxt7sEo2Va46u6Z0rNPmpxdLMGPJQQAvCeA4C/giXe0
 FztdoKS+eCZ1uv/3t/retjxFh+T7pOD7KPpaCgAAAAA==
X-Change-ID: 20260710-imx8mq-dcss-device-tree-node-9df58de085ea
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783676054; l=1806;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=+SSbmdxaiq0J0wa30iE1zuvjGBNzgjfpAoxryIKdcl4=;
 b=sc+S0NvCxqN9/XLrbs6f0pnZylchIoPD8w2pilECc4TqUMxOnhXBshV4gDioLcjbdkM1qzzXj
 +rIxB3EqvPFAF8bFBRR0O7WMBjzIAswH0IkrMQS5UpuG/5AugIdslMX
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

Add DCSS node for i.MX8MQ based on the example in the bindings
documentation.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index e60872aeeb49..fb99bd3ad7c9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1611,6 +1611,27 @@ irqsteer: interrupt-controller@32e2d000 {
 			};
 		};
 
+		dcss: display-controller@32e00000 {
+			compatible = "nxp,imx8mq-dcss";
+			reg = <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
+			interrupts = <6>, <8>, <9>;
+			interrupt-names = "ctxld", "ctxld_kick", "vblank";
+			interrupt-parent = <&irqsteer>;
+			clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>, <&clk IMX8MQ_CLK_DISP_AXI_ROOT>,
+			         <&clk IMX8MQ_CLK_DISP_RTRM_ROOT>, <&clk IMX8MQ_VIDEO2_PLL_OUT>,
+			         <&clk IMX8MQ_CLK_DISP_DTRC>;
+			clock-names = "apb", "axi", "rtrm", "pix", "dtrc";
+			assigned-clocks = <&clk IMX8MQ_CLK_DISP_AXI>,
+			                  <&clk IMX8MQ_CLK_DISP_RTRM>,
+			                  <&clk IMX8MQ_VIDEO2_PLL1_REF_SEL>;
+			assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>,
+			                         <&clk IMX8MQ_SYS1_PLL_800M>,
+			                         <&clk IMX8MQ_CLK_27M>;
+			assigned-clock-rates = <800000000>,
+			                       <400000000>;
+			status = "disabled";
+		};
+
 		gpu: gpu@38000000 {
 			compatible = "vivante,gc";
 			reg = <0x38000000 0x40000>;

---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260710-imx8mq-dcss-device-tree-node-9df58de085ea

Best regards,
--  
Esben Haabendal <esben@geanix.com>

