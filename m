Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538EB185606
	for <imx@lists.linux.dev>; Sun,  1 Sep 2024 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725206272; cv=none; b=s2/+rneyp27t3UlVM0K1+LifRmIsTsekVnT7AhqjkmVyfsiwnzHkOMCUEXZBQS02Fqlxe1NLIlQ/SvkQuv0jarLkOuku+2DeFcCHpNiecFZGaQEq11NWijUqxL512P4GIx+D4sctZ4r83DTGWZn2kgFY/255cQaIua316FPLN7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725206272; c=relaxed/simple;
	bh=QLLObpx9q6kpLYEXJ08t5/p7FpX4J4Hy9SQzSqNiqPM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sIEJcPTcnmWCyjjmFmCHOEdJ0piPg8qUssG1AIgu9O+ytVouy3xdfOdIAjQkIuxS+eOGZsitMQmLKSaI9+wNps91EXnk4kwhl1C0cw9uDjEqQIwW5TMh71DNGHaUf5S2BVOueLrS8MHuNMRyCAmrg0ypOZwwvuW6HonjzLWjaX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=i9VwIEJC; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="i9VwIEJC"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B64D81FB1F;
	Sun,  1 Sep 2024 17:57:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1725206260;
	bh=5Myt184EA2rjc3VnEo4tydZ1Ip2r77/PxY4ntdfv7fs=; h=From:To:Subject;
	b=i9VwIEJCaihy9eILIXS2CZ9jhEJE1PTkaunyB7lD4Nw1VXtgHoxDdNCfBhxyMnE7s
	 jeMegmC70/OMPG6RIZI3Ets7t6P/zRR26P8uAQQA5b055oYeOAyla2hX7SOF/2Qz3q
	 YUeU3pD11xVDwbjK3d272/h8Xt0/+MvMWjfdmL1dn2xeNnJSYLxBSMcYsE2BjfGJg3
	 N3FmEmW5whnjOfemHqmaqj2nOpoHgrlYhEwJhY1jVzv4E4FVg9OtCQk5yXAqFPMyRK
	 SGIvJaxFkf3s7Wtk/PjAxJygsOrRjoPHWy5IGeO0CufKQSMhEPWLb0GrroWXT3T0Pj
	 HKnBwEh9RCrmg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 07/10] arm64: dts: colibri-imx8x: Add vpu support
Date: Sun,  1 Sep 2024 17:57:18 +0200
Message-Id: <20240901155721.7912-8-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240901155721.7912-1-francesco@dolcini.it>
References: <20240901155721.7912-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

Enable VPU on Colibri-iMX8X.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: no changes
---
 .../boot/dts/freescale/imx8x-colibri.dtsi     | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index f929c5f07e64..cc1a0a26fcec 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -424,6 +424,15 @@ &lsio_pwm2 {
 	pinctrl-names = "default";
 };
 
+/* VPU Mailboxes */
+&mu_m0 {
+	status="okay";
+};
+
+&mu1_m0 {
+	status="okay";
+};
+
 /* TODO MIPI CSI */
 
 /* TODO MIPI DSI with DSI-to-HDMI bridge lt8912 */
@@ -511,7 +520,24 @@ &usdhc2 {
 	no-1-8-v;
 };
 
-/* TODO VPU Encoder/Decoder */
+&vpu {
+	compatible = "nxp,imx8qxp-vpu";
+	status = "okay";
+};
+
+/* VPU Decoder */
+&vpu_core0 {
+	reg = <0x2d040000 0x10000>;
+	memory-region = <&decoder_boot>, <&decoder_rpc>;
+	status = "okay";
+};
+
+/* VPU Encoder */
+&vpu_core1 {
+	reg = <0x2d050000 0x10000>;
+	memory-region = <&encoder_boot>, <&encoder_rpc>;
+	status = "okay";
+};
 
 &iomuxc {
 	/* On-module touch pen-down interrupt */
-- 
2.39.2

