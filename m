Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C335415CD55
	for <imx@lists.linux.dev>; Wed, 24 Jul 2024 12:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721825973; cv=none; b=qRhyIJg8dqWoaajJPSOLQ57DXZ2f2NtT9tFia3R+3rDjkqDAz57Z3eYXzxCe4qGQNV5kU4wvvbFmultJExSsfli0QjaYZRFSeNbPQRHMh9Yi500yDWr9bbrnGG4XvwUtFuh/ZYzM2ORIGvPiaaHoA1laIVxXCeFlf2vLQ1iWeLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721825973; c=relaxed/simple;
	bh=k4PATdqEEjOgTojtMGmaVlltZcUXwlXMB03bcCEgb44=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vGjbY+SViQ63YBNqs2OOgNiD5qNQe0hUlBL7Ep4q4Qjbc8LdgEbDwDGzwKt8HHDwMmiyE2p+c0CFoig9a+QfCBXdI1XG+hmNdRhwqeo4z4aZBZseYtySVr5VEk8g+IFRjEkslcX6cAVg4mAU6S04ROQQdVRK/NHzstCzZb3bRU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=PgKoJXau; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=TEPrS64s reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="PgKoJXau";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="TEPrS64s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1721825972; x=1753361972;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LrioAY2XP+9s/AYYX2diLS+Cw7MeaKrQ+ycpTBxI4jc=;
  b=PgKoJXau9w9plu78fk6U7ztZhWQS8UjZ2TMv0N1dvhWry7U8PcBNZ3VE
   xaGIxlxGTAfVTc451ENIvCM1j2AnQmkgZVDu5ye+KJ40STkwLzXGEu2zY
   G4xe5N1clHl0XgoXRP99hxK6B1n2vxzQc5cP3DlN1zOaIsSUXmbzzKEPt
   kjfB1SYWb51nnT2RBEbYsaFvOm9sI8jqAjKiyl2CrgSJxM1Px7YGwOh6q
   +h0qRMBRbmaMi9Qisp/vFHpv0aIxmGTlCJJ4KdYdstWmx8Tav79LKB702
   WpbANBKZ4q4PkpcoTEDK2w/ethGF4dtjiU6lwMeCaNDBiZk+VgzqseFlH
   g==;
X-CSE-ConnectionGUID: ZIWDJNYhTU6exqjfc8cuZg==
X-CSE-MsgGUID: 5h5JiYk9S4KqQ6cotafIvQ==
X-IronPort-AV: E=Sophos;i="6.09,232,1716242400"; 
   d="scan'208";a="38058833"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Jul 2024 14:59:30 +0200
X-CheckPoint: {66A0FAB2-C-E6D9A9-F72EA055}
X-MAIL-CPID: F5379B085898A047144BEA0ED1F636BE_4
X-Control-Analysis: str=0001.0A782F26.66A0FAB2.00D7,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E82016373A;
	Wed, 24 Jul 2024 14:59:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1721825970; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=LrioAY2XP+9s/AYYX2diLS+Cw7MeaKrQ+ycpTBxI4jc=;
	b=TEPrS64sGJMd0Oc80VCbekg9miqIt13qS/EFf2Jvc+HUWn3318t8mx2oJo2Sq+k6u2OgYl
	wYx/6MFpdRzHmk1b8+MIcGzP8txeujfmrNFfrjpGA9PjO3pKYPPDR5JKJGhXav5w2dsHtV
	7Nf453ubtg+cGn/cj9VdOj7reZNDGbU+pnsWNuD04ZZghigATUWk0oxbCxfzXmLuFLrKkG
	pkyrCJQWfeZM9i4O3xWllnB5zw/xDntDHzIdVKcd1VlnXpkUUky4WyhfaQfY6I4fAFrVGR
	efvzunTHchVLsTz0Dgz/ZPsr3AuSGnlYcgOJNWAfWbszJIzC/y3AEvOSgkmP5w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/14] arm64: dts: freescale: imx93-tqma9352-mba93xxca: add RTC / temp sensor IRQ
Date: Wed, 24 Jul 2024 14:58:58 +0200
Message-Id: <20240724125901.1391698-12-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240724125901.1391698-1-alexander.stein@ew.tq-group.com>
References: <20240724125901.1391698-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

The IRQ lines from devices on SoM are connected to CPU GPIO on
this mainboard.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
index 99a0b6b9e304..2d979ab085ee 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
@@ -500,6 +500,22 @@ &lpuart8 {
 	status = "okay";
 };
 
+&pcf85063 {
+	/* RTC_EVENT# from SoM is connected on mainboard */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcf85063>;
+	interrupt-parent = <&gpio1>;
+	interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+};
+
+&se97_som {
+	/* TEMP_EVENT# from SoM is connected on mainboard */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_temp_sensor_som>;
+	interrupt-parent = <&gpio1>;
+	interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+};
+
 &tpm5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_tpm5>;
-- 
2.34.1

