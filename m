Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850659;
	b=UTPFO3Gb1tfqz9x7DuhMBEAoJKPvtGKLyqSuoA/YvnzdW0DlSx1n+GO3jGFL83QDYSzB
	 ij7IUgUU5luvoL/JuOLS08DcaXYOHmD13+sPOCeedUkEHneiJe8zl0J60OXErITkyINIV
	 9c8GwZJ/7QxL6f/pjwZ8hsxVm1rngluZYxCAQC0qeHLrLk6VKPPqgNtUxgjkBi8bYB3vB
	 h9EDwG2PTeFxuQSkpq+DduVpcZxOa/DzPK1XxraIGVZ+nyOZ3sVi9UEYpjBGSBzpegzBZ
	 mfobrwBQA1I2VvIWlE9++myknj8ffvdUM/N4bIyxmwC04gXqpewdYciRJm72Zl3bx2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850659;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=zLTWZrd18DJhGTlm69yEnTbXZkELX/N8G/HpYWhaGRc=;
	b=k8LeMwTpajQoxpy4Kd6tHUrHxLIIzuGSDXTAnopz7rfW3Bfit4J6ZNLH60/A7cShb5ai
	 Ftc1Y4lfOOtOGLfwkmQ0s/uV6B1iwl0xdeoRJrhQ6ZFNhKAHIOSXTNogcJ3m2Dfk7kskj
	 fsG97CfH3x4747nDG8o2dvesH7kVIVL77QMDp059uuSe3mbfq0NiTPxwEbA5jzef0v5yh
	 oJYN1FP2zvxfizAPl/vh2lBs4kSVA9ozyZq1OO3XXL7WpEN2b5LClDp4O0ygnq1/KzOjw
	 dXYvRAmzMXNm7x9kbjL50vTxzk+uHVNvI0s7eD09xivKsdekSwxPZ1Y9GIQxSDjVN+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=um8MT+Uc;
	arc=none smtp.remote-ip=95.215.58.31
Received: from mta1.migadu.com (out-31.mta1.migadu.com [95.215.58.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2D3606A321
	for <imx@lists.linux.dev>; Sat, 28 Nov 2026 07:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F2D3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=um8MT+Uc
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=iSzPfXWqmMeqX2+D3Yjz/92IHrz+RDwSdQT4DO8MXEY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850656; v=1; x=1796455456;
 b=um8MT+Uc0rqTnNJthh03I8rupr7isiBkBMmgyGcm9VIzGZjhpkcyFT7NqcM2d2zFqsoV/1LN
 RulY3MvJ+0suRRRggtMb5bTCCwiTsUSrQBZFkpuhHyF9YCkeV6qFtoGDFYbYfs7tLeqqcaE25td
 Y7fWSU9tJQLMRpIR9TXnd8nU=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id ecb3752467dbd51b;
	Sat, 28 Nov 2026 07:24:16 +0000
X-Mizu-Trace-ID: ecb3752467dbd51b
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:47 +0800
Subject: [PATCH 2/9] arm64: dts: imx8mp-skov: Correct PMIC interrupt type
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-pca945-int-v1-2-f3fe2beb2b51@nxp.com>
References: <20261128-pca945-int-v1-0-f3fe2beb2b51@nxp.com>
In-Reply-To: <20261128-pca945-int-v1-0-f3fe2beb2b51@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Maud Spierings <maudspierings@gocontroll.com>, Joy Zou <joy.zou@nxp.com>, 
 Joseph Guo <qijian.guo@nxp.com>, Francesco Valla <francesco@valla.it>, 
 Steven Yang <steven.yang@nxp.com>, Lei Xu <lei.xu@nxp.com>, 
 Fabian Pflug <f.pflug@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

The IRQ_B pin of the PCA9450 PMIC is an active-low open-drain output.
It is pulled low when an unmasked interrupt status bit changes and is
released high only after the processor reads the INT1 register, so the
interrupt must be described as level-low instead of edge-triggered.

This matches the IRQF_TRIGGER_LOW flag requested by the pca9450 driver
since commit 5d0efaf47ee9 ("regulator: pca9450: Correct interrupt type").

Fixes: 6d382d51d979 ("arm64: dts: freescale: Add SKOV IMX8MP CPU revB board")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index 27ecdc06e679..bae304a712b1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -253,7 +253,7 @@ pmic@25 {
 		reg = <0x25>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pmic>;
-		interrupts-extended = <&gpio1 3 IRQ_TYPE_EDGE_RISING>;
+		interrupts-extended = <&gpio1 3 IRQ_TYPE_LEVEL_LOW>;
 		inl1-supply = <&reg_5v_p>;
 		inb13-supply = <&reg_5v_p>;
 		inb26-supply = <&reg_5v_p>;

-- 
2.56.0

