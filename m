Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CD41C5793
	for <imx@lists.linux.dev>; Tue, 27 Aug 2024 15:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724771467; cv=none; b=A2QIAAmtYBxgX0wfvQ4aI/aeDiXOidy3wOZRTJ5sWS/lklcjCIKGXHBWDuVthyuugOGXBRfDdRuPI+BccJ6IzddWOU1yfakUr6IFVkHQuiStgi/nLOJbJ77YqcaFXe/dF1cEgcU14ij3Hy71BIGjsqZ3lvU25cBzAC8Guxhkw+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724771467; c=relaxed/simple;
	bh=3xVLnGcTId0XQFiNIOwnPImEiBTXkSLlAj7t4/dT72U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jr6a3dTNoByYQ9bnz2Gy07iZszwQ8s8MXx+38J+WXWJSA5KKWLXFq70Uu8d3j1ILe5JaHH/+uwA0n9lu9loXumeW5YV02cOCfQfAMk6Oh57doqwjaOVcy4sllWzK0fzxsJJszx5XIQvGp5GSCYT2ZZlHxhPTp3hy4F+F4ZnTSGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=EoEv3bOv; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="EoEv3bOv"
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 309FD87F5C;
	Tue, 27 Aug 2024 17:11:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1724771462;
	bh=3WZUiJ+S1tJ3Av97erWGdxb+OR4BtI+I9p0lNeSdlV4=;
	h=From:To:Cc:Subject:Date:From;
	b=EoEv3bOvf3C940mtrhICVIynLhMsZGdDbDkSGOwlcZgMZ+J9rEDTLH8eW9BDNStTs
	 iX3bsPt/V7q+0mwGxwPct/FZ8/aKv9FVXGXynYxi29YcOWav9ZYtpeqjAU3/k/Gzrn
	 E6J4q1ChVa6L8zbYv0my9U5GwSUxku5TKpRCPFkYlktmj6H1j3XheZDXGi3m4tz9N5
	 inH55G9kXIiFUMLPTVRdx4UOD1kYs4E39GbUMMrKx7HuRuOc9xhflHegJrUSNyEbO/
	 SuzkZS31ZhiKaPYIMVGeQwbs/QYDxkL3xmGY7FQvXquFLBrkoyz7YWVGcWJ0Cp2Dy4
	 ShBN6I+2ojk4w==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v2] dts: nxp: mxs: Fix partitions definitions and remove saif (imx28-lwe.dtsi)
Date: Tue, 27 Aug 2024 17:10:42 +0200
Message-Id: <20240827151042.2254651-1-lukma@denx.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The SPI-NOR memory layout has evolved during time lifetime of the
device - for example special partitions to keep track of booted devices
for A/B booting scheme were added.

Additionally the saifX nodes are specific to other group of the imx287
based devices, so needs to be moved to different devices description.

Signed-off-by: Lukasz Majewski <lukma@denx.de>

---
Changes for v2:
- Add more descriptive commit message
- Replace e.g. partition@4 with partition@fe0000
- Use lower case letters for HEX offsets descriptions
---
 arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi | 38 +++++++++---------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi
index 69fcb0dde940..410dfe17f8ca 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi
@@ -55,23 +55,6 @@ &i2c0 {
 	status = "okay";
 };
 
-&saif0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&saif0_pins_a>;
-	#sound-dai-cells = <0>;
-	assigned-clocks = <&clks 53>;
-	assigned-clock-rates = <12000000>;
-	status = "okay";
-};
-
-&saif1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&saif1_pins_a>;
-	fsl,saif-master = <&saif0>;
-	#sound-dai-cells = <0>;
-	status = "okay";
-};
-
 &spi3_pins_a {
 	fsl,pinmux-ids = <
 		MX28_PAD_AUART2_RX__SSP3_D4
@@ -109,7 +92,7 @@ &ssp3 {
 
 	flash@0 {
 		compatible = "jedec,spi-nor";
-		spi-max-frequency = <40000000>;
+		spi-max-frequency = <20000000>;
 		reg = <0>;
 
 		partitions {
@@ -133,14 +116,21 @@ partition@90000 {
 				reg = <0x90000 0x10000>;
 			};
 
-			partition@100000 {
-				label = "kernel";
-				reg = <0x100000 0x400000>;
+			partition@a0000 {
+				label = "rescue";
+				reg = <0xa0000 0xf40000>;
+			};
+
+			partition@fe0000 {
+				/* 1st sector for SPL boot img source data */
+				label = "spl-boot-data1";
+				reg = <0xfe0000 0x10000>;
 			};
 
-			partition@500000 {
-				label = "swupdate";
-				reg = <0x500000 0x800000>;
+			partition@ff0000 {
+				/* 2nd sector for SPL boot img source data */
+				label = "spl-boot-data2";
+				reg = <0xff0000 0x10000>;
 			};
 		};
 	};
-- 
2.39.2

