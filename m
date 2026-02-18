Received: from mx-relay18-hz2.antispameurope.com (mx-relay18-hz2.antispameurope.com [83.246.65.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9644D2D0C97
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.160
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421045; cv=pass; b=Zq8yYy8TAXbpvxjQiz6uIGkHzZeWSlKAbuaQy20lDOe9cM4I/q1R1Zgs6zYxZ/aWY8G0pvR6iYksNLlGnXc38HZHyudUSA5fm3SNgQwJix98jGsAVxDa3JcZ5irc1pp4Zg6rNZoD9YDNfzSk7p1uPahbEPy2cHqH4FBBwvGDJdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421045; c=relaxed/simple;
	bh=xSnPiXaOODwVqUzvJ8PB6fTshlB9fnXHV/nHdDGoG+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MGcqXOFZga4+ximFqz8qRSDgwwL1kQMUbHu3I06Lj1LCK58NPzcN6HJh16f2/GxFKyQLcMGyjA+sX/VkHMRrfEti4Ftgaj2OH0p4pr8gRzBjY7jZiL5TS+RblogRaxb4fbQuIp92Es21/JnqF9kZQH+tJV0GsB0/0V1+Xc6EjTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=cSX6mlkV; arc=pass smtp.client-ip=83.246.65.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="cSX6mlkV"
ARC-Authentication-Results: i=1; mx-gate18-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=FYz6GN2uF4bktyMBn1WEegYkUKLB98RX0JlCoopJ2zo=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421003;
 b=NI5KbLWiV1+Kks+IY2mcDFEzC9XIGxP0QIsZ7LKw2mCj2f5mod4fOqEruYsPZ5ZJZie73dwr
 FE04kTFRNDgDIwALlCwuYWvwM9PX3w5kEH7Z7kGcSdnutUybp0yhdxXcGf0Kq9ldN/aAwr86I1P
 ItevheXgvbIbah5PNuOR1Y3U0DHPybxOReSEu1E4UTPugw8x4AJwK+/cVwIQP06s7lLCISmrgw1
 t/NEWoHzn0yrZM7dn6q/s+/JGvR/rRw9pXtNGT7Aj/WnVCxdkAMq1O9W6b5WmY/4ATJi1Q0Nm3n
 p4Rd4Bl+rMXaSiHQPubGgYnrfnnzbRq7opKZiz6IcFEQw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421003;
 b=eiQKVLFr4acjCTPqZboPpm3NZyd1bAU7w+zoqqoSczt8drxZ8S32FHyI785WaueBkEd6k+ds
 TVzZm6cV6TCHUlIODE+lUgYI5/KPgXOr4Z1kmbzs4CxTaxF/8GO407z/BFHYFEkW7Y2CSXOklHR
 z3P6arKNgWd2V2tJ1g5/LIx3P/XU8xabBTiWU6hqKYXqJSqY8SEyR8V996Qw4PlwNxa/Ey0VSRz
 1FTEBGuxpP6+7yhgjnuLYhkqxnwlJGt1as2wbZuyCHsfNZCo+fryWe36PfZ+JEdTDC1f0ppxMyI
 XZAubRkRmoRyktfL10nYiSJtlefAFp6GomaQzITwxjHUw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay18-hz2.antispameurope.com;
 Wed, 18 Feb 2026 14:23:23 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C9921CC0956;
	Wed, 18 Feb 2026 14:23:11 +0100 (CET)
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
Subject: [PATCH 1/4] ARM: dts: imx6qdl-tqma6: add missing labels
Date: Wed, 18 Feb 2026 14:22:22 +0100
Message-ID: <20260218132228.32056-2-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218132228.32056-1-Max.Merchel@ew.tq-group.com>
References: <20260218132228.32056-1-Max.Merchel@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay18-hz2.antispameurope.com with 4fGHJJ4KsQz2lHGg
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:2005588d5e16dbcb100f8c3a37af506b
X-cloud-security:scantime:1.984
DKIM-Signature: a=rsa-sha256;
 bh=FYz6GN2uF4bktyMBn1WEegYkUKLB98RX0JlCoopJ2zo=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421002; v=1;
 b=cSX6mlkVKvi6kA/iLISXoOYqip7vFFpGiW1OKMCozkBP+6hMS11P3ysN+ruGEJ89/rGAehmt
 3/QKY+XwA+0YWrYMFpH67llCirFGA1/oaIpFSBhNy2avdCwGnlH445t1arUwBUt63dZBThN2bBB
 BatjF3i63E6KjkeCZx7FIL1Y1XXctjhA7D0sswt/KJtY/CTpt4auZjDpqfiT12fshAFi7WBN0HL
 w6D2nWrOrihrkvoIbw82k8+jwzHljR+SjIiRKdDbuP8lkvj9+WJ2Ve7qri3AED9mgpwrPCrdcGB
 crQwmcriAv00HPdvzqJbX8wP/DmRGNJxsPq43cAcMjlnw==

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

