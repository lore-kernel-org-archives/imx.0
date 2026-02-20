Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF30023EAA3
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 14:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597925; cv=pass; b=Rwa8DPQR9yFlQCD3FYEMdddsoprVssb8mBMcdkyPrOQ1pet6d/AzuDrCxkGjlgSkK7s0KqHGP1sJpZoWB1qA9o9SWMAJDYTVVcT29Jl1wBsy0ITU6lbKxh2HV+CZVrLQi3giElQIEsgpCuigvl9EWhKDA8yqxGWcVjUptnQhKjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597925; c=relaxed/simple;
	bh=xSnPiXaOODwVqUzvJ8PB6fTshlB9fnXHV/nHdDGoG+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=brPI4doDsd7G2HAz+misHuuohcLFcCnFvhGY03FnnalnynkgT6SlxBkpbBdXEXia88jS/P5+WvKBkyV5dlMnQpNGoGvcq+Lc2rWwYR/kakd11HS9s+D+2R8c8MPzAkMdUVcF68N9ZmVrLk1XeZVJazU4Puesp54nvwyg01lepEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=HCGGqL7y; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="HCGGqL7y"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=FYz6GN2uF4bktyMBn1WEegYkUKLB98RX0JlCoopJ2zo=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597840;
 b=eE6ORSz92GGtQgliFi+MPbVZTuTuKHW6MRl8r5Hg+DcSV2OJ/oPF1xl7TSuyrrQsGjiELOMJ
 OraeGj8Xpd89LnP79TRTneGsFehKpDAIHu0Wy1bS89dTkW962eaTVdsIfe3OZFw94OzvN0wX1WJ
 HhT7AfVqchwZRVx72u/08hXa71tSSm/7Mmy91mifMtMkJKjXV2UbK1o5EZrTL72zrcnduPqLyUB
 TkCAxhvTQEtLkU7poYIorz+g8WRGQh72Afc3o14MtrqePWjoKW79FSsdQn+rOUMw/eEhc4GQH+6
 qpWEOJPFmLVRvYuYjz5Kmt5wKdIIejX2gVIXJAg7DcNaw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597840;
 b=mD6sdmCGtfwBvcnkbp+DcIMHQUQZ+FKB/H7j1umDj5ftynrHgIfM3oEifeN/y6Q+e5olDoG3
 /RanpopB7wAH70/16AHwCNbQTGlNe//FtEMpk3hZJRy6aoMPDdD0IS8JmQecQ7i7zh/Fu6I+Mio
 vNJcZUSJ9eQ8+31s0kZfDmGrlVcbrHoA4D/rXaw2erYbssBZT4SEM02bsjfE024DG8TWQqIr0Je
 ZHg+2PwJOq0lEUDiOmCgvCA+Rn4ZuW3gp9Egs6/9SgH+PMACRvkHW/plg5GA6lOZ9cAmiIx1sAp
 5wTXLm9tnZDbS9Dl4SRX/OtUnfsl5jqIlFX3BteSKJUuA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Fri, 20 Feb 2026 15:30:40 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 93006A40A81;
	Fri, 20 Feb 2026 15:30:28 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] ARM: dts: imx6qdl-tqma6: add missing labels
Date: Fri, 20 Feb 2026 15:30:02 +0100
Message-ID: <20260220143008.186851-2-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
References: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:max.merchel@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4fHXj124D7z2nHWY
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:484e01de3cf01adfbe0654439734e80c
X-cloud-security:scantime:2.102
DKIM-Signature: a=rsa-sha256;
 bh=FYz6GN2uF4bktyMBn1WEegYkUKLB98RX0JlCoopJ2zo=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597839; v=1;
 b=HCGGqL7yTlHVBtoyBSwW19DWTv4uJS670bhE5lUD12fDFzMIOqsz0XU3i8pb5IWahAONsCHs
 EyOF1RowXMy0S4BhLCtp9Zw0WLHo+6LkWNljFEfzuMu2gxJRah4WlCdnNhN3yznTeginS5I6+m9
 tF3Skfg5zvDhfhIlF+P2ic2lCqnTIyZ/DHpz6JqPzPsorQn61yODbgCq3cnYV9dIp0+bP7LDWJR
 k12puikWfF+qRmbL4WKGkfLxAOewS28g/0MiVbMEdvkvXAPJlWY24+GHMbXYTsDTznOmYr4Lv6w
 xwoQUVT5NCc3vuCsDp0LDX6P8NNfVEpNzWmT/mxALOB2Q==

Add the missing labels for the temperature sensor and the EEPROM.
In SoM variants A and B, the components are connected to different
I2C buses. These labels are needed to reference them in subsequent
device trees.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
index e8fd37dd8835..1251749a8dd0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
@@ -27,13 +27,13 @@ pmic: pmic@8 {
 		reg = <0x08>;
 	};
 
-	temperature-sensor@48 {
+	lm75_48: temperature-sensor@48 {
 		compatible = "national,lm75a";
 		reg = <0x48>;
 		vs-supply = <&sw4_reg>;
 	};
 
-	eeprom@50 {
+	m24c64_50: eeprom@50 {
 		compatible = "st,24c64", "atmel,24c64";
 		reg = <0x50>;
 		pagesize = <32>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
index 0e404c1f62f2..7f526f39e0f2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
@@ -20,13 +20,13 @@ pmic: pmic@8 {
 		reg = <0x08>;
 	};
 
-	temperature-sensor@48 {
+	lm75_48: temperature-sensor@48 {
 		compatible = "national,lm75a";
 		reg = <0x48>;
 		vs-supply = <&sw4_reg>;
 	};
 
-	eeprom@50 {
+	m24c64_50: eeprom@50 {
 		compatible = "st,24c64", "atmel,24c64";
 		reg = <0x50>;
 		pagesize = <32>;
-- 
2.43.0

