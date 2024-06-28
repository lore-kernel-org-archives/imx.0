Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B61014F9C9
	for <imx@lists.linux.dev>; Fri, 28 Jun 2024 09:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719565679; cv=none; b=pIVwY+RlnX0Ch0uw/DQ1UDk8U/7F4ZpU8AJ/3ozySXgkuIH3igGLHSu9NLmq4AuhK5ysdbvsvXyriHvCeVzGwmUHrgm3z4dsn1XfypZaox/802BupHrKfdtS4IiwP+FXghVjbP1j/OKK5yemR1z55TAvE6f/Ajb+9FfxzwDWuTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719565679; c=relaxed/simple;
	bh=5fQWibtpOshGtirNX2M3Lzqc/lxOsvsf7eoeRN+pJxo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qQc1rhITNTHxMvsT2nv/iKmv174p6EuX9MBPiHE/THfDM3L5Eb+vlYIBI3X6N9A41r5aCzHzLd9lcQomtXzbaWUOM9F3j7a0ml5MhlVUg3xB1mQgWOg6jjvvNMzlbcfsmJAFHFIS85YOHOyb2PsB5nxx6nK/RJDW7tdduBgBU+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpAVFgs4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpAVFgs4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-421f4d1c057so2954015e9.3
        for <imx@lists.linux.dev>; Fri, 28 Jun 2024 02:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719565676; x=1720170476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cew9yHu3J9evLv4jKck/18U0eJGnpQ5whgz3tg5sGmw=;
        b=ZpAVFgs4WFUpFvUg5iRyTMgs2wjO+1avgOxdxy2mqL9I5T5cwg5TJAg6iVfNyE2UYG
         BDvs9iqT5Xw8mYLO5Alk69Wc+6nmmu6hFwYCxIPecEdEIxiYm/Z7x0PIM9zdtP9v2sO0
         CJi1fKrx3YxxpoZMQlA959+KE6vCnGGfv8h0sYy2t0yf/4FkRgvb4JmGYwO4k8+v7gCh
         74ywApDOv8iIc/sJDKeBHoCpIzlYfEKlsfO9IEc+fO+uprQUvCZQkPWo/rjn9vhUPNq6
         o040kE5hE/058T20q/ajUiJGOMsZFcp1pBuSVGNwPoUplQO1V8xYurRpx1BTQj255XWl
         0LiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719565676; x=1720170476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cew9yHu3J9evLv4jKck/18U0eJGnpQ5whgz3tg5sGmw=;
        b=c5k8GJiAC+Zg8tSI8ZFYy+YVUndzRvQTx0rX88oF03u590psVw/FG8F+jpYtqS+XtS
         XQL3HWzqWNcVAqtUIQ6mKVUegeePVkuXJqUK3Hf3E2u3p7Dmb39AOvsAPweDvAF+bwOc
         RBsjCStxrFdgXmQndr8hctztaUO8ZYZmceJAH0YVkuGkv+0VSe92kTZDH5JfzY8z+rOd
         SK0rseW5WEQ66mm48zv9yH6bm0oaCNC7qU3o7tmZQSdP83bQsaAi8aSoSROFSzIfRiTX
         2DNRvidv2hXNj3Kui8HmM71CeJNffKiFUJ2UdCgteyaX1Q+CxlIG51FZySbuatp+LoHW
         /78A==
X-Forwarded-Encrypted: i=1; AJvYcCVIzP2gkPmFPgK743XsSeJ/88wyDKBUIVWtpK1BRw86wFO66A+sFOdJsh0Jpg+M5PC12W9cjMfWJ7tjqwJ07YIuhA7Y
X-Gm-Message-State: AOJu0YytYr7fQizkt65eaJiKxFqeQ2Uog4NMFpthSeR9HiGnP46N1eMU
	umMTDDtXB89WlzMXRvZ3QCw190/kUwInXrA8JFsOf6zoH18lxMSP
X-Google-Smtp-Source: AGHT+IFQmp20IWKSZUXJyuTq3KzuQCJ5ILSvfoBtaCo0ZNshBsYzvl/EkkAk09uYIl3jP5aG0vhWMQ==
X-Received: by 2002:a05:600c:4f8f:b0:425:6f96:8bce with SMTP id 5b1f17b1804b1-4256f968deemr4401445e9.21.1719565675854;
        Fri, 28 Jun 2024 02:07:55 -0700 (PDT)
Received: from vitor-nb.. ([2001:8a0:e622:f700:9efe:cd99:5e7d:a75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b09a94csm25226885e9.33.2024.06.28.02.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:07:55 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com
Subject: [PATCH v3] arm64: dts: imx8mm-verdin: add TPM device
Date: Fri, 28 Jun 2024 10:07:51 +0100
Message-Id: <20240628090751.797818-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add TPM device found on Verdin iMX8M Mini PID4 0090 variant.

While adding the node, rename `pinctrl_pmic_tpm_ena` to
`pinctrl_tpm_spi_cs`.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
v2->v3
  - Match node name with label `pinctrl_tpm_spi_cs`.

v1->v2
  - rename `pinctrl_pmic_tpm_ena` to `pinctrl_tpm_spi_cs`.

 .../boot/dts/freescale/imx8mm-verdin.dtsi      | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 98544741ce17..085498fa471c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -228,15 +228,16 @@ &ecspi2 {
 	pinctrl-0 = <&pinctrl_ecspi2>;
 };
 
-/* Verdin CAN_1 (On-module) */
+/* On-module SPI */
 &ecspi3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
-	cs-gpios = <&gpio5 25 GPIO_ACTIVE_LOW>;
+	cs-gpios = <&gpio5 25 GPIO_ACTIVE_LOW>, <&gpio4 19 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_ecspi3>;
+	pinctrl-0 = <&pinctrl_ecspi3>, <&pinctrl_tpm_spi_cs>;
 	status = "okay";
 
+	/* Verdin CAN_1 */
 	can1: can@0 {
 		compatible = "microchip,mcp251xfd";
 		clocks = <&clk40m>;
@@ -246,6 +247,12 @@ can1: can@0 {
 		reg = <0>;
 		spi-max-frequency = <8500000>;
 	};
+
+	verdin_som_tpm: tpm@1 {
+		compatible = "atmel,attpm20p", "tcg,tpm_tis-spi";
+		reg = <0x1>;
+		spi-max-frequency = <36000000>;
+	};
 };
 
 /* Verdin ETH_1 (On-module PHY) */
@@ -808,8 +815,7 @@ &iomuxc {
 	pinctrl-0 = <&pinctrl_gpio1>, <&pinctrl_gpio2>,
 		    <&pinctrl_gpio3>, <&pinctrl_gpio4>,
 		    <&pinctrl_gpio7>, <&pinctrl_gpio8>,
-		    <&pinctrl_gpio_hog1>, <&pinctrl_gpio_hog2>, <&pinctrl_gpio_hog3>,
-		    <&pinctrl_pmic_tpm_ena>;
+		    <&pinctrl_gpio_hog1>, <&pinctrl_gpio_hog2>, <&pinctrl_gpio_hog3>;
 
 	pinctrl_can1_int: can1intgrp {
 		fsl,pins =
@@ -1111,7 +1117,7 @@ pinctrl_sai5: sai5grp {
 	};
 
 	/* control signal for optional ATTPM20P or SE050 */
-	pinctrl_pmic_tpm_ena: pmictpmenagrp {
+	pinctrl_tpm_spi_cs: tpmspicsgrp {
 		fsl,pins =
 			<MX8MM_IOMUXC_SAI1_TXD7_GPIO4_IO19		0x106>;	/* PMIC_TPM_ENA */
 	};
-- 
2.34.1

