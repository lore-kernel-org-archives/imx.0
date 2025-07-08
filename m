Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8F71EBA19
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751979167; cv=none; b=ZFhbwz2r8vumzfIVSnZmKcc4nWGlaMPvUU4sz2llg7cwsSL+Zl0WEZ5WcWV3d5B3IlkrxZFLI+t78ziYFm6yfGuulX0jJfx3AbzsBF9U50jRfZqZAK4GBlcG6BjwSO+QqjzDsBV8yuCvpXfD/La73JMIIQcv4Z/iz6mjU1Tm4qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751979167; c=relaxed/simple;
	bh=6y+Q7KZFsFLM5YEqkhjl5z1wHIu1iVSAO1omoXTtY+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L10L59U5vMfAx8OOwTUjbVNvqNpFfNZ27Faqh3LCLAtl76KPO6kjUsJzgoGlfn9WRe2DIjt5jIW0IHkeXR3wAULhfJKPCatYcP+JKBqXgZP/q2yEM2EwRbJYt8sHRijDP8wKEdIWec/dJ4MwDLo1tf+csojtKKtul41aW4DkRyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=tXfE8Rx8; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="tXfE8Rx8"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D203EC74C3;
	Tue,  8 Jul 2025 14:52:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1751979163; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Jn2Xlp+2akFaaeJ83XxhNPE3FBCl8lq/XPhKJygyha8=;
	b=tXfE8Rx8lljzbmemNB0GyBrPStbNTi6vd+V8QymbyjqJdZaIIrbJxFXHmc4KRbVsVdN+Kr
	uo7F4HM2JJbkHZioS8r269JyWt02r59NUT6P+BqUh4tBAxqZBaKso6h0ySEq/zWozmAvWn
	sfxB+pD+dbsiFf8obYLW85ZUVTQDXFsengQt6+7RQwVGffwFozTUYX4qgBzYJxupwbt3dS
	a/AeeRQMcfkTpaaQBbtBrn/F+VLb8U1acd6YLVa1WDjrCYrjHvFoM5DUAFMe7vowFs9wxQ
	gdDjIBQvuWdy+EBMq3czNZkKbaS3RkZ0YsAPx/FX53ZzU915TgAg3igO1mwAxw==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 1/2] ARM: dts: imx6ul-kontron-sl-common: Add SPI NOR partitions
Date: Tue,  8 Jul 2025 14:52:16 +0200
Message-ID: <20250708125219.63813-1-frieder@fris.de>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Eberhard Stoll <eberhard.stoll@kontron.de>

Describe the partitions for the bootloader and the environment
on the SPI NOR.

Signed-off-by: Stoll, Eberhard <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../dts/nxp/imx/imx6ul-kontron-sl-common.dtsi | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
index dcf88f6103466..ab149c40a9cc1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
@@ -28,6 +28,27 @@ flash@0 {
 		compatible = "mxicy,mx25v8035f", "jedec,spi-nor";
 		spi-max-frequency = <50000000>;
 		reg = <0>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0 0xf0000>;
+			};
+
+			partition@f0000 {
+				label = "env";
+				reg = <0xf0000 0x8000>;
+			};
+
+			partition@f8000 {
+				label = "env_redundant";
+				reg = <0xf8000 0x8000>;
+			};
+		};
 	};
 };
 
-- 
2.50.0

