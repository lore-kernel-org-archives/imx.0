Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247672;
	b=BpRxJOLk800RHpM20w5VXkxSh7b/73ywU36CHs6Utowpeofm5boPJGVXZJi6kOlsyvGY
	 JOEYeAWavwJfwfxf3mZgyExhFnd1xEb0kpMl/mmyyFG1xTXPebitsLD20+Vg1fLwiHsvr
	 IwcJgoeso8wQRW4wIF3ojsJbGnwGdUNd7HBX2IRCHZvUyU196aD34nCZFcb+qIX+9ngva
	 4jy9eoBqLcfFVXZwvo48MkCj7yV/BGd76YztfT1JUWWVarsDVk+0u4BX1/qKJsDc/uVBn
	 B95WCw08U1sfRZNdlZedr305/89ggzmuvP2DfuWJKFIVdxyMoa3FH++kQCtUa9g7ihg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247672;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=oZD/E2ws0gxQw7hvaJXLUZeaQXjcNhPide10/UOfvlI=;
	b=1Lj1e0Wa2bnDyAnzJbqoAaPX9V8kcH8MfxtLnbFVxSSfUIA1g4f9w8/Z4kiz4Z5g9dz0
	 YN6PnT1Uw7OANVyQDwTuwrW9TgvT7/cN+5jmmxIRNiZWxaxo9JHNeb6SZ/1h3JQczcakk
	 3/yP7b+mqrH6LlpU0EKtiiH0gQdGe4WmpP4Ymhm++7UE7aualihlPAVuwiOG4Na4Z5Xp+
	 /BW3o8qeOIkQIAMaszKp/CWsvaePIY/ZnEtzNHXiNATaMUx4rDuWQBbyITgTudBhN0Ts7
	 dbDGZG/i7SbzCx1bW2VbM6+EIvPjZsQmxTo4ZitLZHCbuhqgK6uzohWA5c8UddMwYaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=ieOAYH0K;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C7B606A33E
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 18:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C7B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=ieOAYH0K
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 236531F92C;
	Mon,  9 Nov 2026 19:07:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794247668;
	bh=oZD/E2ws0gxQw7hvaJXLUZeaQXjcNhPide10/UOfvlI=; h=From:To:Subject;
	b=ieOAYH0KbEEXTsOEJuNOcy5xV6OAt9Q/H6DIYsjr1ULHhw7VmWBzzp4Ujgpeb6G+6
	 SvANWcy5z7Fkz+DxXMXqi6x96rAzr2uH6DqTe/MxtrJmzV+C1QmE1Ymgpqk877gecJ
	 dmHg0vL9grVz3DLnUWpiSIiKmmf6l0g5T24jtP6OKpkVbCQx+Z1qI1Gb2Pv58SCqcw
	 XXosCJeX4v7mfMx0o9J9oPPSgvBh5l12vJtrEyQY2e09NP5ypk/GqRljtQEl5ioEk7
	 ebhK11GGQ8mCSfFDtEVjR5UxbRpywvgExadUsMQQm9n/0DMDaFgio1sEvDog4LsZYf
	 W2vdQ5lfllJhQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: imx8mm-verdin: Fix I2C pinctrl group comments
Date: Mon,  9 Nov 2026 19:07:41 +0100
Message-ID: <20261109180742.537977-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The comments above the pinctrl_i2c2 and pinctrl_i2c3 groups are
swapped: SODIMM 55/53 is Verdin I2C_2_DSI (i2c2) and SODIMM 95/93 is
Verdin I2C_4_CSI (i2c3), as the controller nodes already state.

Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for verdin imx8m mini")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 1ac9d000d415..88539253ed45 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -1031,7 +1031,7 @@ pinctrl_i2c1_gpio: i2c1gpiogrp {
 			<MX8MM_IOMUXC_I2C1_SDA_GPIO5_IO15		0x146>;	/* PMIC_I2C_SDA */
 	};
 
-	/* Verdin I2C_4_CSI */
+	/* Verdin I2C_2_DSI */
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins =
 			<MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL			0x40000146>,	/* SODIMM 55 */
@@ -1044,7 +1044,7 @@ pinctrl_i2c2_gpio: i2c2gpiogrp {
 			<MX8MM_IOMUXC_I2C2_SDA_GPIO5_IO17		0x146>;	/* SODIMM 53 */
 	};
 
-	/* Verdin I2C_2_DSI */
+	/* Verdin I2C_4_CSI */
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins =
 			<MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL			0x40000146>,	/* SODIMM 95 */
-- 
2.47.3

