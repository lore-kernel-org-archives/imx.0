Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D12F31A549;
	Fri,  6 Mar 2026 20:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772829071; cv=none; b=bpUR6Mi8PGDrVCGo/4kHWSTz/RN1aOIG9hIEqS0F5gnUCqV9B6fPaL2u4UB1HXhTcFKMjAjXNcM5NxnujEhrBk7pninWfkltfSn7QVALWXPtSxuaklQ+acfcgvn4OyE9Bs8qmMJ5s55uloSQ/eKHfHqnd2rsoielE5kQxyB7C2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772829071; c=relaxed/simple;
	bh=y2TR/OG2MXL4lsCroTuzZzLl5gqQRV2w9LTb8iHNGjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E58euj6gEoTRfmgZX3hyDvAry4SE/XXVkOOmQimipqttyUKY6X03g8Y8OBetT9VEU4ydlFbMdN0l2KzMNvw3BBMKPE6cVXPMTVv2RUI1eKwGRTj7GlFuE2yqIM4QOTqzh0Ecb6SiTjNvyEpYnJacLeOxUXUOdZuMDR4ieEaX1Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UU6csl4r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UU6csl4r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E90BC4CEF7;
	Fri,  6 Mar 2026 20:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772829071;
	bh=y2TR/OG2MXL4lsCroTuzZzLl5gqQRV2w9LTb8iHNGjs=;
	h=From:To:Cc:Subject:Date:From;
	b=UU6csl4rGDcFlBKVQx/fd5t1jVHLKN6o9q+otWVe8SR878m5xNK/aRgmNUga25+vl
	 Zd3S+91AzqzQeAQyoJKWN8PMMxUUUr7Et2K7AUYLUjdGhvi/SuqKTA9xzPncWfvvJU
	 +hX5dE920ltyIf9Z314krYaWVrdFXAKKeEVUTCNmKnLsQM4KREhmyjjZNwwZZ+P5Up
	 /slCRAMl85nkspIs0+2PX7so+4KaFGS0rP83LZ/XoH8+JprjIhSNKGkS5ackrx56lr
	 1Xc1n70Ul8QCFl3sYl1BPqDnjqPg+oTPprSTQAqHv7UnMyS3xlD0bhQ+Xec0vw1kZg
	 nhXlmC8GSitwg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Forrest Shi <xuelin.shi@nxp.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: freescale: imx93: Add Ethos-U65 NPU and SRAM nodes
Date: Fri,  6 Mar 2026 14:31:02 -0600
Message-ID: <20260306203103.3119790-1-robh@kernel.org>
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
v2:
 - Increase the APB freq to 133MHz
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 7b27012dfcb5..95cc60158349 100644
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
+			assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>, <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
+			assigned-clock-rates = <800000000>, <133000000>;
+		};
+	};
 };
 
 &aips1 {
-- 
2.51.0

