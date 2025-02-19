Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEA31CBA18
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739953103; cv=none; b=dnfGS3UtC/uQULirqM3oFVcVLSOfMIdrtQLQTFDKV5YmA3PKPBAyNpxEHnOas4Aei2wD7ux5LLPtDDnc8qPhGmT9ecbO8H7S0RhhFKhz3zeMEfuOUYrDwAMpIVn6Qjo4ncBGrPm+o8dZkGS0Jbn07gEhg4eVbOmNP50v1b0WR4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739953103; c=relaxed/simple;
	bh=KrpE6C5ljF0RvohOtLMThS3AUjRsXjby65SvNueccpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hhf8Jbt1zylOWa3EwvCv1yUKwaSn5oCWpAlgG8apiWQ1/FKV18zlAlhRhdQdah5aaPFS/rQIjLwKYvTBTTTV5swqA+46pW3jRQ4JEtaAKE89EaJba+MkIa5V5Dn1gZ82VBT+xXBpXV/sCyMUBpN/uuzAG4J9AX/CDBmF4ewIeYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=HRjNUyc7; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=t2P7FyBW reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="HRjNUyc7";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="t2P7FyBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739953098; x=1771489098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yh3NFuBQ3pLHNfn96Off+kmLu1YllyLTVZzfV5VETuc=;
  b=HRjNUyc7qNzoBaSSmobD0ACPH5oHtw+Z6HvsCgq0sAdGnyGc5ZB6cWk6
   fKBA/6q73g92Gi7v9PF5yhOdm5AQ1JL8ehLCpOWp6Ma5iqiHpJdghzeuG
   LPakCD+L6IU/z1Y61bioWEGswZWDYiqJvWqDYW/tU9dEoofgCO3fLhByy
   GJLyaTsLaXqGDli50vD8AD4BhgskjDQyMB58wbzPBiFtEfzZNiiHJmnxj
   qMK2MJAoEKsPJI+3DwpPLLDav065YldCuCQJHnPOR8e15ojSdZ4bB+9HR
   ayD5EtggG5BOlVIII2mGvZ2CgUmYJjA/i9xW01MDzo+4pUrCHaLhA3d+V
   w==;
X-CSE-ConnectionGUID: EieqYNEgSb2m0j2Z/PF9EQ==
X-CSE-MsgGUID: tySEgp6QT1eJWTCGCsR6Jw==
X-IronPort-AV: E=Sophos;i="6.13,298,1732575600"; 
   d="scan'208";a="41945135"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Feb 2025 09:18:14 +0100
X-CheckPoint: {67B593C6-43-6E0A4539-DBC44C3A}
X-MAIL-CPID: 6C3344EEA9D18489FE742E4A461A3210_1
X-Control-Analysis: str=0001.0A002107.67B593C7.001D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA59E16D333;
	Wed, 19 Feb 2025 09:18:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739953090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yh3NFuBQ3pLHNfn96Off+kmLu1YllyLTVZzfV5VETuc=;
	b=t2P7FyBWvEnPmaMMjaRhFVFaM4LFn4hpy7TzSVMDLEvTeQmoPkFN2FF0/8Ytmi+BMdCrHh
	i6FkC5iPkpBndz+VXisZFumVG++4RPqD3XMR/60xOneYcswFjSVXvwMCI6PUWANyF53l9L
	SKI4cxgMogF9xvySl2nm72hsNyyfePMJqtQIAjRrTbMQIfDe5RaMMXltuNocQebVjeIp/K
	izRplZL9hTOGIBEO6Lz0rLt31BilpdA0mjG6SEWH1JxLRM++8idozOt7BxvlXsHu2I0Vhf
	UjiZS48lUE5RNzr1YpgYRwfRhxBPxK5Xo99J+414NJ8imdLzSbywP+GNh0qOUQ==
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
Subject: [PATCH 3/9] ARM: dts: imx6qdl-tqma6: use sw4_reg as 3.3V supply
Date: Wed, 19 Feb 2025 09:17:38 +0100
Message-ID: <20250219081748.1181507-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
References: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

This matches the real hardware and allows to remove
the virtual 3.3V regulator.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi  | 13 ++-----------
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi |  4 ++--
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
index 68986fb3b8df3..6eee1a4b0b19f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
@@ -7,16 +7,6 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
-/ {
-	reg_3p3v: regulator-3p3v {
-		compatible = "regulator-fixed";
-		regulator-name = "supply-3p3v";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-};
-
 &ecspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi1>;
@@ -29,6 +19,7 @@ m25p80: flash@0 {
 		spi-max-frequency = <50000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+		vcc-supply = <&sw4_reg>;
 		m25p,fast-read;
 	};
 };
@@ -183,7 +174,7 @@ reg_vgen6_3v3: vgen6 {
 &usdhc3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc3>;
-	vmmc-supply = <&reg_3p3v>;
+	vmmc-supply = <&sw4_reg>;
 	non-removable;
 	disable-wp;
 	no-sd;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
index 828996382f246..e8fd37dd88355 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
@@ -30,14 +30,14 @@ pmic: pmic@8 {
 	temperature-sensor@48 {
 		compatible = "national,lm75a";
 		reg = <0x48>;
-		vs-supply = <&reg_3p3v>;
+		vs-supply = <&sw4_reg>;
 	};
 
 	eeprom@50 {
 		compatible = "st,24c64", "atmel,24c64";
 		reg = <0x50>;
 		pagesize = <32>;
-		vcc-supply = <&reg_3p3v>;
+		vcc-supply = <&sw4_reg>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
index 1d0966b8d99e2..0e404c1f62f26 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
@@ -23,14 +23,14 @@ pmic: pmic@8 {
 	temperature-sensor@48 {
 		compatible = "national,lm75a";
 		reg = <0x48>;
-		vs-supply = <&reg_3p3v>;
+		vs-supply = <&sw4_reg>;
 	};
 
 	eeprom@50 {
 		compatible = "st,24c64", "atmel,24c64";
 		reg = <0x50>;
 		pagesize = <32>;
-		vcc-supply = <&reg_3p3v>;
+		vcc-supply = <&sw4_reg>;
 	};
 };
 
-- 
2.43.0

