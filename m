Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478A22FDC3D
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892422; cv=pass; b=ag2NMra5OdHWm708odHO8mXVEI5UPfxioMWJJ51IVKUG/Z3yuLF3eKuGmRQ242XIVdg1sgu0GctWQeAoDUUyHiEYGTp8SAv+gRvkGVvJdRpC0B4srUsnX2z/zKbK+/e6lfV6Bj3f1vhtwgWG7Pouk2+XzxdvXfsVjoqYry/ReAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892422; c=relaxed/simple;
	bh=49VSRrVcBPSy1/Oih3t0eek8eEzBy93wgD6v1sGdvTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I75P1TrV7/fP1KSVY3wDHcTYSOCR7+JBpo4jfxzQ3GQlMGS8mMvP62Du3GiBgcfM7FE9NTADNr3nY3TNDcbC4IrpD/nxpKUKWfQoZ00dY02j5s84k18W/S28yya09XfWLMHMQ5L3AGkWoAijHmkydtzOdCwfglr7K9KJKMS86mI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KiTqjG1b; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KiTqjG1b"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Zho2kDWL8J6XWsKmcJQhJUsDkOCGRd6yWhy2/tVl1AA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765892403;
 b=Yz5uGTM5+vhRFLPo6szDeAWpqYaxz1xyQRKHwmlTA0XKf2jbyYDrprDQppYOjKtZ6DR8HztE
 wnPiIhUf9y9e1mezFtsNiFw4S56CcYLSNnp9c807dPVAr0901MtNG3AcbvLmVgo66gE9Cl3ZBUR
 VJPhxP3Lb7ufDwtSb/qe+MV0L0A+/bQ11etJ9sJgAIRXuRaPszJRLaZaqOWIA1bQkhkYOguXCXh
 1lnxvrL/28TLzCVwMJ9r/IrW1VXQDaN4+G6AOG/BY24SB5tClkT0qyi0xZXXrqVAVUQnYXQY/iS
 6tK2WM02O7ryOWI0MhYWYQv72XY7mdXBae4B1Z0neaNPg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765892403;
 b=Mx/6/y3578Q+6gv1Dv8uUhGQYKWI5uXr3IgHP/fVkB8xF1/q4pilU3FEb9ccn6YBFqKu0JMS
 8XdTK+7yRfV3P4Z+yfqklHg2tx0hN3mc12cFUOskeZ0XkbeZLpnUwi9jrICZy3wSjp4wUVCKYTa
 s8wPvYgY5UwamUyXUd1YBYgJ37uOyaq2FsTLfeajIPz9pyb4SIXJCGmnWOLo6eZw2FwktL6XAkd
 TFVXL+4bRymYePz4EhpA6plmHS0Ypcx+/xf0vBR17SzyqKsWugWSlBdofIGLm0xYi/QdbicJP/J
 s4qTkgag8LdmQyNJKGXNNYqvzDkjkQYYII1QMssX4EW7w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 16 Dec 2025 14:40:03 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C47625A1600;
	Tue, 16 Dec 2025 14:39:43 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/3] arm64: dts: imx8mn-tqma8mqnl: remove virtual 3.3V regulator
Date: Tue, 16 Dec 2025 14:39:23 +0100
Message-ID: <20251216133927.913039-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dVyj56Nzmz3yc8W
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:b6a3cc6271770ced19cc5cbfdde1669a
X-cloud-security:scantime:1.858
DKIM-Signature: a=rsa-sha256;
 bh=Zho2kDWL8J6XWsKmcJQhJUsDkOCGRd6yWhy2/tVl1AA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765892403; v=1;
 b=KiTqjG1bU2ZMkDs+VAIfpGoZc9z+/fh9eYtedtCYICPX9jIAoMqKWXsVaQKKTCrsBo8Ms1LD
 G1cwqx29IzHk0cWtRt8QDVoaAC35h5wW4CUxm12B9Nl+kL5Tg0Y3gx1FHB0MEx1QoMIRL9ZR5TH
 54SX99TiuN1dlZT06Dx7pLsd/3Xq7DIq2gb/omo7kVmYNwUon6WZzn4rK+hND7jb74i7hCrg6yk
 36anF5C6KsohP4TauoEcns9Kap2gCBQn+g1229/nqmG4ptS/IzTGjZaOBlet+Jo9no9Ka/RoXLO
 5+NsYbLt9DRLLACuMowFXJIvq5gmC7k2eTBXnDWi+VR1g==

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

BUCK4 rail supplies the 3.3V rail. Use the actual regulator
instead of a virtual fixed regulator.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
index 1d23814e11cd3..34d6415348f8c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
@@ -23,13 +23,6 @@ reg_vcc1v8: regulator-vcc1v8 {
 		regulator-max-microvolt = <1800000>;
 	};
 
-	reg_vcc3v3: regulator-vcc3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "TQMA8MXNL_VCC3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -217,14 +210,14 @@ eeprom1: eeprom@53 {
 		read-only;
 		reg = <0x53>;
 		pagesize = <16>;
-		vcc-supply = <&reg_vcc3v3>;
+		vcc-supply = <&buck4_reg>;
 	};
 
 	eeprom0: eeprom@57 {
 		compatible = "atmel,24c64";
 		reg = <0x57>;
 		pagesize = <32>;
-		vcc-supply = <&reg_vcc3v3>;
+		vcc-supply = <&buck4_reg>;
 	};
 };
 
@@ -242,7 +235,7 @@ &usdhc3 {
 	non-removable;
 	no-sd;
 	no-sdio;
-	vmmc-supply = <&reg_vcc3v3>;
+	vmmc-supply = <&buck4_reg>;
 	vqmmc-supply = <&reg_vcc1v8>;
 	status = "okay";
 };
-- 
2.43.0

