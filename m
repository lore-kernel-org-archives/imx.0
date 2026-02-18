Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FC32BF001
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421053; cv=pass; b=aOmh4ncsfMqZpscBcDquaZFdZljAaWQxD31AXzlx6fP1SQtIRVX8rtCzZ2kgXVuO2a69+rNhEeaI12YAhCC1tYXU4lWSJlb2911fmvkOqB5/Gt3+i1HelnomDcXpobDjYXiCPI7A5uK+ZooR4Nv5Q61klHZQOCZHXlNY5mBKU+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421053; c=relaxed/simple;
	bh=P3l/dVJ57TWhUMY71vCumGX3/oMJ1ARLqrmPuHllZ7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=td2P9g41QoHAnSo+SEL3aUZzyOG8prQVn0+GJA/zu8DPqVFo2Vc+br288/b4XVtueXFQaPITiZ09UVFBV4ZtdIilZ2yrP3t3TVxbljM3tSjYlIm5aoTbeVqXrn6ZYFZAlgf2ii3U5UiqudnHbjy4DI5d9M0isYpfIHi5S7k53ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=iw7PuJBe; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="iw7PuJBe"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=PLt6KIS3heA6+KbSYDWlFsnZTNJOkMMZOLH/WTZ53uI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421037;
 b=nGz/WhYyv+iVGaufpyGYxuFpI/pNuMdHHe1VSeC3y8DG4ygIowsuHRNBsEHEJ6PabtwFoSka
 QZnRK9P3g4kya4PkQjWzqG9X+DBxFo8lqoNzG2n3Zby2hvEGklPaMW1QIG7o9pJX8vtMkXSBMsQ
 IaznZhYc0spv2mq9SHn01N3b+GgEyGGMnKg+S/xufhCYOBY7zHcEeIk6Lj9JDex8oiVzHCMrXv0
 KoftVHqmAmPmEprC/mpvCSBhOyKJKm6kD6p8ZvMgAV3M681R9bOPL9LhjOnjcotsD6uTpBupe1+
 n+UP0/yOc8azYCkr+jFxPR3yvvMvENLJRmx+eNbfbw+9w==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421037;
 b=M8hfHss41pxy5kCPfXYbOGpnxUsvhyM8iHhz3DSqjHa2nNCDmOfm8GJyd5+R+77bPRAtOh7B
 u70Z1YsXizAWQhb52Dky491SuL+AuUtfqapSiTmHsyffAh+9AQnB61KIxvP7fc36l3+kBgo3q4a
 MQu73gqBnEISvb0d5yY8nvz6jAMIObEDHoBxNro3bHzZ1fXMwJ0PKt8rbXHJ0V6hNKMYq4BDUBu
 SoGaC8L3NUKG4ne4vJjxqeSkVNX2n3oX4KKhHP1vamGWmob8fF/m0IyIszrVR5NBR+dsd0lF9Gd
 lwv89KMNBsC4MhxpLK1jCwa1PDVkqWRZUOasf0Ejx083g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Wed, 18 Feb 2026 14:23:56 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 841F9220B97;
	Wed, 18 Feb 2026 14:23:45 +0100 (CET)
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
Subject: [PATCH 4/4] ARM: dts: tqma6ul[l]: correct spelling of TQ-Systems
Date: Wed, 18 Feb 2026 14:23:37 +0100
Message-ID: <20260218132339.32157-5-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fGHJy1tZKz3ycBd
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:ccb46d170f3ce977e46404c63492de13
X-cloud-security:scantime:1.867
DKIM-Signature: a=rsa-sha256;
 bh=PLt6KIS3heA6+KbSYDWlFsnZTNJOkMMZOLH/WTZ53uI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421036; v=1;
 b=iw7PuJBe+oxMMiTQuT0rOcYuYjrOAp1E1RXVqGcSQSZiyGSM8sGSFsI8b2SrK8Cl3bV5F9VB
 /bHgEWKLVFPOgYjlnJ5X1quHrV+xqWSypsDjCajSp8t1bl5d/ptdkANGJiRbME5xIheC1je3DPx
 Ka78wSI86a0yWA8zqlF0rH6yEt3yAa0A7hdsavOJ0LNPMAHjcFhBVkrIt7Z6Cw165yx1H2lSada
 t3/GBDS0eJcXQJ3mLEjnty+uTr9+nkVUIawgF+zpi1vahu9TtrbeaY4YzDHx+0qxUeC+M1Yykp9
 RlTBYDulT7sF27Az6Vuk0wx74f0717AW0j18EP76aTVaw==

TQ-Systems is written with a hyphen. Correct the spelling.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts   | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts
index 9d9b6b744a1c..9d637c0a12ec 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright 2018-2022 TQ Systems GmbH
+ * Copyright 2018-2022 TQ-Systems GmbH
  * Author: Markus Niebel <Markus.Niebel@tq-group.com>
  */
 
@@ -10,6 +10,6 @@
 #include "mba6ulx.dtsi"
 
 / {
-	model = "TQ Systems TQMa6UL2L SoM on MBa6ULx board";
+	model = "TQ-Systems TQMa6UL2L SoM on MBa6ULx board";
 	compatible = "tq,imx6ul-tqma6ul2l-mba6ulx", "tq,imx6ul-tqma6ul2l", "fsl,imx6ul";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts
index 33437aae9822..5676904820a9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts
@@ -10,6 +10,6 @@
 #include "mba6ulx.dtsi"
 
 / {
-	model = "TQ Systems TQMa6ULL2L SoM on MBa6ULx board";
+	model = "TQ-Systems TQMa6ULL2L SoM on MBa6ULx board";
 	compatible = "tq,imx6ull-tqma6ull2l-mba6ulx", "tq,imx6ull-tqma6ull2l", "fsl,imx6ull";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi
index 6dd1b359e086..ac18caf5a76c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi
@@ -9,7 +9,7 @@
 #include "imx6ul-tqma6ulxl-common.dtsi"
 
 / {
-	model = "TQ Systems TQMa6ULL2L SoM";
+	model = "TQ-Systems TQMa6ULL2L SoM";
 	compatible = "tq,imx6ull-tqma6ull2l", "fsl,imx6ull";
 };
 
-- 
2.43.0

