Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1AA1E3768
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 15:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736262206; cv=none; b=J+0n4Lve+TqF3KRvP8uS0KgKevXpAoedFUlHxGZZcOOE3vq5xY5bUvLZH6usy4REHwsz+mmbaIzT+ytgWhGuV4E+xqrKrRJiogz9SL3XqDNPDxsQkvGAMqPfaTPL1dhVcza5XvK47Zo8ndr6uXX0HzvNQUd7Ti0drJXQ1LXlPH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736262206; c=relaxed/simple;
	bh=mh3HuC6Pn5yE6iUC7ba8yFias/WI+tjo8Nal3edaquA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NBM6bWGL1VehPQIuTArAD5Z+JHspVmIYsIuJoQjPcblzofYYNW5a7ElTLpkgMNL96t7J1LapCxMyiG9G7yc12+ERthipk9ENA3ejY6MmMttGPx/tyal9u7hPOykSXI+RbJCWTMuyk/1daEw6mQFnarln25jcjAxsTYVB+pNzqY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=EeNwYOJV; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=gp73qdS1 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="EeNwYOJV";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gp73qdS1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736262203; x=1767798203;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HLrowf87IJ/iEUGNu6amLUT44qNCJHXHBhDTjn+bYFk=;
  b=EeNwYOJVokPk/yvEsrdvnI9lFA5dBuUiabArZhZpSJMe8jph0a56swt+
   aI8JaEAnlJubj2Qy3PW/CMeQP1UVkaIM8tabLbS3Ka9O97kR8UZmgLsLv
   ckaf4+X4BM1Q7tR/FwSkW50501jyNLq9EoGSYFvrYULs1onLfkH91F91F
   1XeApGh5om0AM3VWB0OFOqNJH3iL/p8Fr77PVGXgAFa5XTQeOCwFcKk+t
   8V/S/U1NMhgSQQOfx5YXs8QsVqRt9kvyTlvWAbIzOmVqsOkRcbA3XUCTH
   Woh6R5VC93WBSIaIhJQMQUgFtEYk31CcfqBy9xHMKflb2DuJRHNYEGgg3
   w==;
X-CSE-ConnectionGUID: L7Y1DMbKR7uKJg3v5fMTeA==
X-CSE-MsgGUID: xaJUp4jLTxmvxXNJ22QtHA==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40897904"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 16:03:20 +0100
X-CheckPoint: {677D4238-19-C6D8D88D-F91F9E6B}
X-MAIL-CPID: 007E3B14CC095F732CFAD06DFFD57F2F_2
X-Control-Analysis: str=0001.0A682F23.677D4238.008F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8FAC164C4D;
	Tue,  7 Jan 2025 16:03:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736262196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HLrowf87IJ/iEUGNu6amLUT44qNCJHXHBhDTjn+bYFk=;
	b=gp73qdS1ahkWqCUZi9RsJYRJikkGMQcM6DY3jXujrNs4fWIOej6/CDqWHy132AmWcQIS0J
	3AA9pZNY2tJTZpSXPbB7nfW2Fe7eW3kCc0hLW0bD7pI9q2+3PWIEH6n8ByqmUL71aCp7IT
	FxyGSEiOYqC/JCZo6hS/dlB6zmALiKKLLtG/d3iPo2zVYSt2JnCZ1u1k5FBxGgZG92hYpF
	mMWned9vd3d9u61Y1f0vW3yawnRlwN3vS9RFSoUiTwCan43xUq2+UQo8DevlLcQK4LFn3+
	7YtCn98XfGvkUj454v7alR3T6dkJ+m2zcXunXWZD4tef7K/1J4cqcB/JsB41Yw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: freescale: tqma8mpql: Fix vqmmc-supply
Date: Tue,  7 Jan 2025 16:03:09 +0100
Message-Id: <20250107150310.996683-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

eMMC is supplied by BUCK5 rail. Use the actual regulator instead of
a virtual fixed regulator.

Fixes: 418d1d840e421 ("arm64: dts: freescale: add initial device tree for TQMa8MPQL with i.MX8MP")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx8mp-tqma8mpql.dtsi     | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
index e26f996b028b8..2ca87d2f0b590 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later OR MIT
 /*
- * Copyright 2021-2022 TQ-Systems GmbH
- * Author: Alexander Stein <alexander.stein@tq-group.com>
+ * Copyright 2021-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
  */
 
 #include "imx8mp.dtsi"
@@ -23,15 +24,6 @@ reg_vcc3v3: regulator-vcc3v3 {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
-
-	/* e-MMC IO, needed for HS modes */
-	reg_vcc1v8: regulator-vcc1v8 {
-		compatible = "regulator-fixed";
-		regulator-name = "VCC1V8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-	};
 };
 
 &A53_0 {
@@ -217,7 +209,7 @@ &usdhc3 {
 	no-sd;
 	no-sdio;
 	vmmc-supply = <&reg_vcc3v3>;
-	vqmmc-supply = <&reg_vcc1v8>;
+	vqmmc-supply = <&buck5_reg>;
 	status = "okay";
 };
 
-- 
2.34.1

