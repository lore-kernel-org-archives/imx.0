Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC61A16EBE8
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 07:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723533457; cv=none; b=qj2rzzU8plcrh1GB+P08/49zizQs2JLoWPENkBHmI+l9x4G/8M0TaMGBcmmROTwedSZbxraC2qqs0YPGqDVOeQTlT11x5oCVz17aode+6wYD5pBSiqM1BAu8v2KkOqChX0/GP9lAvERkcLXhajbCGY6G0XOnOSWmmQBwEzMQ/vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723533457; c=relaxed/simple;
	bh=ZraxPArap9GLpYfwLPkCJmj2gMW7lzjFULVss3JTH68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pnIY1PvgNjzt/M+jW/U3LxvSsLSJSDaa2gkmTZCcmApSO3MEYQ2zBrgknQkyqz0x4AeZeYKFJIMDYFTFlnbvb4BsDOyKnKs3RwP09WhKXQALMz6BCr60GJG1Fmt3YMqvJMpKNhB5FBj9fchRZR51lTYiCjJnl9XfhuD7IKGdry4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=LnQYaJhi; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=aKa88nRM reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="LnQYaJhi";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="aKa88nRM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723533455; x=1755069455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YTRm3tVHYHU+9pJvPaCs6sbjJOQF2yiq5L1Tc4aMFCY=;
  b=LnQYaJhi+zPCnCniQY7P/Syl/vK7NTRb5Jp17YfYUe7obOTPixRFStHv
   kQ3eKwgnGjCE8AcXOdCOqU4wK144UB9aQPOPbp+e/wzoM29EPCXXJD/1G
   OZLU7OLS6bg3BSdWMaINAPmjJ/H9zx43n7W8VO2ULbX8yLUdvjoaN8Dct
   +DIXMbuFQPs+YYWWmkZIwe5nW3R2FumfoBcv0rOoh805rb8KdvIxWHXWT
   bUx5/UGqt4aLr8rglNOpCc5KNBMmPIYM1XXxQn+aOsPqN8SuAdMwNLwBb
   k+ZPDH414oJWezuejOau/yEbN3aUFCzmClWi5jGDM2Y2Xcii2cFzwaVXt
   Q==;
X-CSE-ConnectionGUID: KzuAFpFRSKOHy/06YbEXfw==
X-CSE-MsgGUID: Vte54dr6RZq7cm0h6CT5vA==
X-IronPort-AV: E=Sophos;i="6.09,285,1716242400"; 
   d="scan'208";a="38375844"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 Aug 2024 09:17:35 +0200
X-CheckPoint: {66BB088F-9-78509F09-E532FC2E}
X-MAIL-CPID: AC9FD6645B3214AA325A521A5EFBD529_1
X-Control-Analysis: str=0001.0A782F20.66BB088F.0080,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D18A16423A;
	Tue, 13 Aug 2024 09:17:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723533451; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YTRm3tVHYHU+9pJvPaCs6sbjJOQF2yiq5L1Tc4aMFCY=;
	b=aKa88nRM3AAVFY3mWsR+MX7BaXNi2IK8AmpUoO/O34MYicfaVToIuyS1xHkWPGOGcFxQOt
	XsQZLNWStP04GsrXN8BN0xgnSLDuuxaKHOhRvAbPJC32S6tDfcy9zd3lQPgQD3erRhQIY9
	qEmhxEaW/83ESb18ZW22t51wKvRPO5pHtJkkn5xU0ECX5lllJd/ga81tE/lt1fqZHKLyGi
	Ks14sEhHo+5ulZOvrvX5TIjTL9ancikWuwLtFz5LOezUTroXznYr39D/7QPaR3kGy3E2Z7
	qCOplH7oTj5r8Be0u2fVhKV7OIByGzZfVOeo3qCfqfI7Es7LjmxOpwXmc1gdag==
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] ARM: dts: tqma6ull: change copyright entry to current TQ Copyright style
Date: Tue, 13 Aug 2024 09:16:32 +0200
Message-Id: <20240813071637.72528-7-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20240813071637.72528-1-Max.Merchel@ew.tq-group.com>
References: <20240813071637.72528-1-Max.Merchel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Replace developer-specific, personal email addresses by mailing list addresses
while retaining the author.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2-mba6ulx.dts  | 5 +++--
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi         | 5 +++--
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts | 5 +++--
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi        | 5 +++--
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2-mba6ulx.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2-mba6ulx.dts
index e593b7036fc7..d844c8d39e71 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2-mba6ulx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2-mba6ulx.dts
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright 2018-2022 TQ-Systems GmbH
- * Author: Markus Niebel <Markus.Niebel@tq-group.com>
+ * Copyright (c) 2018-2022 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Markus Niebel
  */
 
 /dts-v1/;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi
index 8541cb3f3b3e..56890d849a0a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright 2018-2022 TQ-Systems GmbH
- * Author: Markus Niebel <Markus.Niebel@tq-group.com>
+ * Copyright (c) 2018-2022 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Markus Niebel
  */
 
 #include "imx6ull.dtsi"
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts
index 33437aae9822..6696262aaae1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright 2018-2022 TQ-Systems GmbH
- * Author: Markus Niebel <Markus.Niebel@tq-group.com>
+ * Copyright (c) 2018-2022 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Markus Niebel
  */
 
 /dts-v1/;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi
index be593d47e3b1..b81a0c204567 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright 2018-2022 TQ-Systems GmbH
- * Author: Markus Niebel <Markus.Niebel@tq-group.com>
+ * Copyright (c) 2018-2022 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Markus Niebel
  */
 
 #include "imx6ull.dtsi"
-- 
2.33.0

