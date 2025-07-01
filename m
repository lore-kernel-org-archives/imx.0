Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8613524503F
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 06:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351141; cv=none; b=hE307f1UdBjxWu/9Fb5TSvXXOBTC3NT+oE8Nvpapqb64tnDehGDfzW/9/CCkBp9/yfRgOAo6TLWVxL1379ZVfNhoUsRz18GQS+0DqFp4Ydu+T0a8mYqGmixmV8osNKOtQyhYGOF+ZmtmTjocpkob37tYvhZ3FKfiZWUQkAFMSZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351141; c=relaxed/simple;
	bh=rqZSa/la3CnAHBjvC72QRWPND4rYIHwWP5YgFWh81+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0xVb75ryvIvjOQ1N9C/AsQk7QKVJO3Ei7Hwg2NQQGTlcoaq8d/+ngSrlEi8XtO2XsizMt+UIlFgxaIirOSjZ/KZ0vac0t4JgBlGZFM59/sZUo89XrTVWabHFsPnhKP8FnA0jEIzVw086cPvPj3GnHydT3gq4bPgwobX1z9J6Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=VYqOh8ev; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=SYgu8FkE reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="VYqOh8ev";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="SYgu8FkE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351138; x=1782887138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gq5R+w5XrB6J6Y4bhU8dYOmERqkhQgDDpoSeyTTrFX8=;
  b=VYqOh8evcbUcU7SOhldNMi5EgguIRTF6KZk6aakOj/FOJscnE3lW6bAg
   il0qw11Dp93uywrC/oix9PEZQHM7h6Cj1LiBKp10eX5xnn4ke/abknwEb
   5KggqsxQsppcVHv/BwtTqDRFol7bR+el43YJXsEQAB4d2i6s8RxlXYIVH
   giVQVRecr2zfJ2yLWCCcHj7/4TDpvc8rTmEQQDKp5cTzPJC213aBU0RCq
   72uH6Vgak2nVHY9GFu7vsei/z9SpuXrnln6PKErXnFbuBaV+GAPyZXsSE
   tsgp2nCvxUMIDnsY8jLImLdM0huSX2uYA5fjYlYPnY19qm2G04tabx0VD
   A==;
X-CSE-ConnectionGUID: 5FLJjaQlStiVJLpgCH0mAA==
X-CSE-MsgGUID: fljwx/5ESuqKjj5SqyJQTw==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943382"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:37 +0200
X-CheckPoint: {68637F61-2C-ABFC28F4-D6731B76}
X-MAIL-CPID: 73E9D8067A412AC0F8CE377BA54C8275_5
X-Control-Analysis: str=0001.0A006377.68637F6E.005A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4CBE716A583;
	Tue,  1 Jul 2025 08:25:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gq5R+w5XrB6J6Y4bhU8dYOmERqkhQgDDpoSeyTTrFX8=;
	b=SYgu8FkEGPzAHexTMvzd/lmiBcoWTheFuCMMS7chHsWUr9YYPzSpNTCBicYe2hTYoIYQRI
	QU4MOoT7xCvyO3NTAfmYfQO7yU4bhl2vRNIrRCGU1p71YNM24uK7eDjGw4nsKSnuC/qzBK
	2bKrI0py84RvPSqTuIpXny9VdFdkeyzFj3iIv4oXMmmDyTeaMSFEXcH1AU4H0qdz3eSegG
	CnwoPgk2LXTT7cHKa8ceNy9HUNh3gmSzIBHNRPVtaC5wZs00X1dHfDz1O2/2QLl9dbuJ+Y
	RWOpejlDkHbgoZA7HBnHh93k9iCNy4hWVedLpknpn3O+HhShFuiAI+L6/CKUmA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 5/8] arm64: dts: tqmls1043a: Enable SFP interface
Date: Tue,  1 Jul 2025 08:24:53 +0200
Message-ID: <20250701062500.515735-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
References: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

There is an SFP interface usable on TQMLS1043A. Enable all the
corresponding nodes. U-Boot will configure the connection if the RCW
is configured accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts
index 03748a7f657b3..e04483fdb9089 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts
@@ -41,9 +41,21 @@ &esdhc {
 	wp-gpios = <&gpio3 3 GPIO_ACTIVE_HIGH>;
 };
 
+&sfp1 {
+	status = "okay";
+};
+
+&sfp1_i2c {
+	status = "okay";
+};
+
 &usb2 {
 	status = "okay";
 };
 
 #include "fsl-ls1043-post.dtsi"
 #include "tqmls104xa-mbls10xxa-fman.dtsi"
+
+&enet6 {
+	status = "okay";
+};
-- 
2.43.0

