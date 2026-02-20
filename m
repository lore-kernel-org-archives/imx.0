Received: from mx-relay93-hz2.antispameurope.com (mx-relay93-hz2.antispameurope.com [94.100.136.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE622641CA
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597925; cv=pass; b=aJZQDzMKhZO6NqLEYa7jXff5931Yq467rxgyNK+HCwdWx2VwwjHcX5iVZWCAjKP6axwP3xMUXxBKuu5LDsC0QKT7qdUglzL8Dz7em7sQJA6UlagYxKb5Y0QQedvysj4f/GlNT3cA0yVGOvv15UyFjOiazSqt15WqqEgfR39e2SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597925; c=relaxed/simple;
	bh=P3l/dVJ57TWhUMY71vCumGX3/oMJ1ARLqrmPuHllZ7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bMmW2AXxQvvtefjhtkT33XdLgjlFXYkS5cjtfq9WmQ5oTUkL6Zz5/dV94V0HCosG/p5Pugt4IogfID9ayccNUHNftHl9XfEmGAcrb734pyq7EA3g98JPAuvXxJkuxCYmrUkwx3t8ipCUjmL2LMJ05106Xy7tyZQPZtDtv5tlrtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=V7mOm8EQ; arc=pass smtp.client-ip=94.100.136.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="V7mOm8EQ"
ARC-Authentication-Results: i=1; mx-gate93-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=PLt6KIS3heA6+KbSYDWlFsnZTNJOkMMZOLH/WTZ53uI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597884;
 b=FiF8DAVWshLL3CV3ExfSV58sCNbZWdMPwb5cUYXnwBppovq9TutRCeeqaXZyL2p0D4DF9/9l
 7vHZt/EEesieT19b8tAa8vb5PzVxFdOFQ/8qnxVLLDC4m9NF3/ZHmFpP1/J615rhVhhyjSw0Eh2
 epnr2YMdNYfPHtwLWu7JVShRzcJ9fpRPb7orAHs+iF5klPwqcPiiUDctEjdw19bgjoK8b53jfbW
 iO0WXe5cJcQPoAOs2BthlEHrfZ3fq6R3neHKvjxIwjelJJEi9zGUxbUiddTHtYZy1/LvtxHniRY
 IzQQGaeZdZHsLMy9/ijHzdTmlEVxz+8KwrpKSGTWfc9vA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597884;
 b=AJCmFv5UOVuKY9xDETL1kY6O/7l8fEqw0C4fjk1N8/Z0O6PSfwAkaOdyOCup+oRZF9ITn0Jv
 75UlXZctGDtj/hM9d2JS7uFpcm57KiCXootOMiA/Dkg6DHk0KEfx0jcT3gTQ9HXMX/QL2hAKWjQ
 1UnQ1DAtTcMEOAQqCmHCvN1Z0amMSfGhILRyjwyv62AteyxL403KyxepxBzW1HtnV4OOV7pBOqa
 Cq/RWCdhfx9wK0qVu1xzhKajqa75vgwClC/tuOp45cvER1zQI/uJ7xujr7N1OlhH85vuGC9zFAa
 TaXYKADNBhznsNLusQTr/IgVcq2Dn0rjQMcA8mmJNt3sQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay93-hz2.antispameurope.com;
 Fri, 20 Feb 2026 15:31:24 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 4CCF8220B97;
	Fri, 20 Feb 2026 15:31:12 +0100 (CET)
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
Subject: [PATCH v2 4/4] ARM: dts: tqma6ul[l]: correct spelling of TQ-Systems
Date: Fri, 20 Feb 2026 15:31:05 +0100
Message-ID: <20260220143107.186956-5-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220143107.186956-1-Max.Merchel@ew.tq-group.com>
References: <20260220143107.186956-1-Max.Merchel@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay93-hz2.antispameurope.com with 4fHXjs02nKz4QPVS
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:7527063d6539b56d99d50d98f41cb596
X-cloud-security:scantime:2.103
DKIM-Signature: a=rsa-sha256;
 bh=PLt6KIS3heA6+KbSYDWlFsnZTNJOkMMZOLH/WTZ53uI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597883; v=1;
 b=V7mOm8EQxfOXTcvYlmTwIb/yvV1HHCMmw3eqF5P1OEorCiteAQRZzFczdmonVJt5kcNXfLxH
 106FFq9LU0v2P7xVVeE73FVrQMUmEN9u7g3nC9lbhXQr97YtiVKcWIkPjXxbuuUw4HMxuAl2ENH
 niVZmCeRMsjxWDjPlTKC5uI02aLCL6RbDsWJV1P+kP6h1rHDtMEUX0p/saBMYAarnQfT4ncwLG/
 CBeis4OC/hiM2PMqv3thu5Q1K/P8MBWfCRJr5b1t9GUI5mkbvRBSBvRho2wETfiswAg2H5GOftQ
 kgCAFbvcw7J3hgFNgEXpoWxUQwZ5X65MwnJgIivTvcTBA==

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

