Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5568215F7D;
	Thu, 19 Feb 2026 14:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771512136; cv=none; b=gDFUHVEXHD+E/ppRxti+nXd23yNhKhFzcEBUZCIQszbcyh1T9FA1sBhvychv7XMBQr8KS0SOKXmdPZJRl97fpOOUjKMNbJoTwpDWxMdVyc9rkg9KJUY1XzALO9APMKqwPSPRIH14dBGUJsMEUDM3D5LewljqPBL2QkiLymgsN1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771512136; c=relaxed/simple;
	bh=STRB27EWeB6oVhlikxDHPndmSosAoqfOYJy01qlfm2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xp3v7LuCQeHXlcj2WK62qYKvXg6w5SLJyaNvK7J5qp2cyyEUeb6wD2DhFMGFNl+WSK0yqxaLLG/iXEAMICF+GsN5LG+PIwg+qOLlrNZoBUTalGVfaZh3qxsQk7KPlOxcvxmuILl1VX+56ivnRyMUFBvMy4qlae0T9FKkvJ2HEhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxDSXsVM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxDSXsVM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E74C4CEF7;
	Thu, 19 Feb 2026 14:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771512135;
	bh=STRB27EWeB6oVhlikxDHPndmSosAoqfOYJy01qlfm2U=;
	h=From:To:Cc:Subject:Date:From;
	b=DxDSXsVMd+s2WLtv8IYneiiF2BtKRFWB2oDz+DuL8oEF8N1r1bTA/aAbEA2DDir2x
	 jTLd453//zArrhL4VhZ2lQxS5erOa59crkaQjvS+1+IdMFMUDG698YPxdI9OPqk4gs
	 3eagilyHMYOmp4o9cwDkxkEL1qfxCz7Bx6dmUlNqHzf7C12KH1XejRsVtmGsDbOoo/
	 EZ9q7wxDiGji/Sz5jeDErve7JxhqBKOzEc4KLfREkvT2JFoiSG7SJF4OY3qCYHsieE
	 ubYnJGqZe7IrOQr5usDA5TMLyfBx71NXFkz7kUWfYQ1CHj1GL1qnntoyklhM/5ArvV
	 jEysEgu0lEAdA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Forrest Shi <xuelin.shi@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: freescale: imx93: Add Ethos-U65 NPU and SRAM nodes
Date: Thu, 19 Feb 2026 08:41:59 -0600
Message-ID: <20260219144200.2633404-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i.MX93 contains an Arm Ethos-U65 NPU. The NPU uses the internal SRAM for
temporary buffers. The SRAM is larger than 96KB, but that is all that is
available to non-secure world.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
NXP folks, any comments on NPU freq? IIRC, the clock controller supports
setting the freq to 1GHz. Is that supported?
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 7b27012dfcb5..d826d4b5a06b 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -43,6 +43,29 @@ map0 {
 			};
 		};
 	};
+
+	sram: sram@20480000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x20480000 0x0 0x18000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x20480000 0x18000>;
+	};
+
+	soc@0 {
+		npu@4a900000 {
+			compatible = "fsl,imx93-npu", "arm,ethos-u65";
+			reg = <0x4a900000 0x1000>;
+			interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&mlmix>;
+			clocks = <&clk IMX93_CLK_ML>, <&clk IMX93_CLK_ML_APB>;
+			clock-names = "core", "apb";
+			sram = <&sram>;
+			assigned-clocks = <&clk IMX93_CLK_ML>, <&clk IMX93_CLK_ML_APB>;
+			assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>, <&clk IMX93_CLK_24M>;
+			assigned-clock-rates = <800000000>, <24000000>;
+		};
+	};
 };
 
 &aips1 {
-- 
2.51.0

