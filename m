Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE201F4FD0
	for <imx@lists.linux.dev>; Fri,  8 Nov 2024 13:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731073802; cv=none; b=cQxmvNJ+brLjtJHxuetgT8iiyR21BS57aWm7UISWMOhQGgEnpljavD83F1UfSNyM7M+IhBJpn9xwOCmJA1BdsMtzoiqRECIWhFVf+2WEvP/gLnYXL8xQbr2+hC8LH63Ynl5igzmzkI4rtNTv5OkwvUG02fnWi3yIUS8fDyk9bnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731073802; c=relaxed/simple;
	bh=x6Lebkct6PYdCRRxEPVCpoWj3aBlWbdgC9ayheQ5p9o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LTrEfiVtRytT74YexqXCZ7A7tCo70kIt90t1eN6+676WWDEGdwvdrjJjCdr1FC+1inqoMU6juXrARYgesMb/ZJ1PLo+m9o9MOkWYCK5iSvzti/mkah7j49zcAWAXicESVsJdD6O/nqDhPXADwDrxsZUrG51fRks4w44ToTx8nQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=D+316kII; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=DFrqDmQR reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="D+316kII";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="DFrqDmQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1731073800; x=1762609800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DJurGxsK8uCi65WSK796cGo8UlfRslV8FdH49GA6Q/Y=;
  b=D+316kIIQO5bebydlC2qzzXSjiFtDi0LSJ8W+N9xkZY427glEpyNhVRQ
   vUyYvlwjH/X3JHLpF58a4waDDWM8K+gZ4pHFNl055ghlL3C382vf7hHb9
   TvUlg2n9+dbwZICeUxFMKHQRTkjB0At2mJzNiebg19SSEAWOpy4CcLWJ7
   N0rAjvykRToHbe2YWI3Y/k0riyr2TK0O4G3DDVwesXnpq35ZaInM0SvTg
   +IjSAUmcuNHuwYLtqCMMUX4FgayiisBlOV2n6fStl2in5JFuqI+MxHoQn
   3077DqIO2cfH+rk1jKYFUSoAWucr3Lc+E+54IOGdqvdbhV87i6llYvDut
   Q==;
X-CSE-ConnectionGUID: MK9ldqucRs6qslH3v8YZAw==
X-CSE-MsgGUID: YxUeWQK/SfiKbRP+f/bXKA==
X-IronPort-AV: E=Sophos;i="6.12,138,1728943200"; 
   d="scan'208";a="39936929"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Nov 2024 14:49:58 +0100
X-CheckPoint: {672E1705-29-5736D786-D50827BE}
X-MAIL-CPID: BE6FE53A4DD63A425696AA2378CC106C_2
X-Control-Analysis: str=0001.0A682F21.672E1706.0043,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE9141657DC;
	Fri,  8 Nov 2024 14:49:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1731073793; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=DJurGxsK8uCi65WSK796cGo8UlfRslV8FdH49GA6Q/Y=;
	b=DFrqDmQR1s9DGboqTLnWbsjOjrV5mzyI6ajNpYpxI5M7ndjyKuXWMUExY/leu8ehDpkLDy
	O8U48O14DDjaQsGbV/Osc52kEPHPiDQ6PhaEPv8LOvEEZ2mXBORNbhpNA0PwpPhAZXV9v7
	4OkJ74iNoqeylexFqemlDeSkKOodKLXBCYhBKUM1U+gst1u01PObY9RzxRte7lcbJtfAhN
	/HJ6PVUAmlYCIxgWSORYOdGNQAz7U3Ivp2Bufo030IA2oYWAb7u6chB7tJEB2PfNVVcLEq
	buWrpO6yPBxHD12X57f77zpLhWELrmiv7xOI6Pe6qYTWB6WgzsfSeppzKI3L4g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Jo=C3=A3o=20Rodrigues?= <jrodrigues@ubimet.com>,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] ARM: dts: imx7-mba7: Add 3.3V and 5.0V regulators
Date: Fri,  8 Nov 2024 14:49:22 +0100
Message-Id: <20241108134926.1324626-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
References: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

These voltages are provided unconditionally from external power supply and
are input voltages to various dedicated, switchable, power rails.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
index cc3760fa7d981..a23d7b0a195f1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -141,6 +141,7 @@ reg_mpcie_1v5: regulator-mpcie-1v5 {
 		gpio = <&pca9555 12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
+		vin-supply = <&reg_mba_5v>;
 	};
 
 	reg_mpcie_3v3: regulator-mpcie-3v3 {
@@ -151,6 +152,7 @@ reg_mpcie_3v3: regulator-mpcie-3v3 {
 		gpio = <&pca9555 10 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
+		vin-supply = <&reg_mba_3v3>;
 	};
 
 	reg_mba_12v0: regulator-mba-12v0 {
@@ -162,6 +164,20 @@ reg_mba_12v0: regulator-mba-12v0 {
 		enable-active-high;
 	};
 
+	reg_mba_5v: regulator-mba-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_mba_3v3: regulator-mba-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	reg_vref_1v8: regulator-vref-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC1V8_REF";
@@ -177,6 +193,7 @@ reg_audio_3v3: regulator-audio-3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		vin-supply = <&reg_mba_3v3>;
 	};
 
 	reg_vcc_3v3: regulator-vcc-3v3 {
-- 
2.34.1

