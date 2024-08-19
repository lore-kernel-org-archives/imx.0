Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECB316C683
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724069046; cv=none; b=H2cIcKTfMlg1yUK2gPzVOO+SCStpwR56Pkli5dotuW25fVNNVxwIh1bNhuwOnkUFl6GTjCsVT1W045yIKfUc/3ZZzH+JHNMhgWM4zIpWppVuz9iU6e/Zns5ptCPEyosRWCEaubgvDINlj51j5d4rbA7u/6TeyaKFQ8p/OsLq9+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724069046; c=relaxed/simple;
	bh=j6O2ByPbaf35qFDrOk22VMMEv+wLq3/s5YIjXOZ3tQk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dq1EgJGrd/8HM8k4afRL/uBja54XHeuz/Ier0sY/v2xy0+5XMgT0sj9MHlCMtLuGRwDzh40/y5m8IEdhNZWX+IEaDO/CzaOk8P1lZmXdgfphRBZpyfWDyCI2ltmzHn1FrDHSFqxuOea+LZHpMQX4ldIhExMOS3OGFhoXkpmf9Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=MY15ZzSD; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=MzSRbm9H reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="MY15ZzSD";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="MzSRbm9H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1724069044; x=1755605044;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vcIeEJw2IJFgEXXeVISkCRGjw8ENOVJquRlKsMR9nW8=;
  b=MY15ZzSDD3+WB6ATKAhn2oij+ACcbRI/JC2v3XkSDOdipeZfR4hna9lH
   iGc5WvC1TnAgF8AdgXoiehJEIcZoPjbaEYx8zLtaC7zRjLqzBdSQISAko
   PU/ie1pXhYIpnCt82rUfCVKXdlyQ7tx35aFRCtGXte4dQJ9RnXVF7CIQL
   /uv6OPfVv2yakS0C8O+PQnEpHtnTrTWqh4zOuAAuO4d5lSzSf076OpEFq
   tiQI73xwWrAb1seCrnCwA3qtd6N2HDoBWHlEFAfhp+QR4/QV5KdREFbhx
   j9HQ3zvACzjvmXQirhdt6fUbH7Df2YC8CavC79hggFlMQ4YFncZvlTcpt
   g==;
X-CSE-ConnectionGUID: 3/7k777iQaSR8rJ/kkVSLQ==
X-CSE-MsgGUID: YU9guS3xQseI8OQlPpsnVw==
X-IronPort-AV: E=Sophos;i="6.10,159,1719871200"; 
   d="scan'208";a="38467117"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Aug 2024 14:04:04 +0200
X-CheckPoint: {66C334B4-7-2C7A84BB-EFCBC4CF}
X-MAIL-CPID: 1FC0F6563B79EC2DC12EAF63A1BBDB56_2
X-Control-Analysis: str=0001.0A782F29.66C334B4.007A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D873166C3C;
	Mon, 19 Aug 2024 14:03:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1724069039; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=vcIeEJw2IJFgEXXeVISkCRGjw8ENOVJquRlKsMR9nW8=;
	b=MzSRbm9HKWbU3iwWeAH3iYMS5HbvVdZpN12fhW8XL8/lfrsVWSjmjU9evq9zI3VHU13bnv
	vUFMhalNoYBREtZWIkHZfhPqujGr1tG9vtRtPYWnCNdf1GL+Vily6mwasWD4npI7uD2u8x
	gtAO2BbB+1tLPUpJGmPym2BfxFE2GFNVjTvAejvLhtuJVOTeKOgVv9/MAFkMoeesvlDt3O
	oHcvC9Pp9C7YX8BnYbvZGh/lkSWGMgBaahatrXUA58pE+I9uSu8HsKqh9Jsk2dT6+cSFEf
	vs1CuEcZRftyT5yNHAAFgU0juOEUu85UXwoHq2LuBM+WQvH13WexSh3fyIohVw==
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
Subject: [PATCH v2 05/14] arm64: dts: freescale: imx93-tqma9352-mba93xxla: add irq for temp sensor
Date: Mon, 19 Aug 2024 14:03:19 +0200
Message-Id: <20240819120328.229622-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240819120328.229622-1-alexander.stein@ew.tq-group.com>
References: <20240819120328.229622-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

This adds muxing and configuration of the irq output of the temp
sensor on TQMa93xx that is connected to a GPIO line on MBa93xxLA

While at it, add comment for RTC_EVENT for pcf85063 since the IRQ line
of both devices on SoM are routed to CPU GPIO on MBa93xxLA.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts  | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
index f8b489e54bc96..9e4fd1eabcfb8 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
@@ -454,13 +454,21 @@ &lpuart8 {
 };
 
 &pcf85063 {
-	/* RTC_EVENT# is connected on MBa93xxLA */
+	/* RTC_EVENT# from SoM is connected on mainboard */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcf85063>;
 	interrupt-parent = <&gpio1>;
 	interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
 };
 
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
@@ -652,6 +660,13 @@ MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x1400
 		>;
 	};
 
+	pinctrl_temp_sensor_som: tempsensorsomgrp {
+		fsl,pins = <
+			/* HYS | FSEL_0 | no DSE */
+			MX93_PAD_SAI1_TXFS__GPIO1_IO11			0x1000
+		>;
+	};
+
 	pinctrl_tpm5: tpm5grp {
 		fsl,pins = <
 			MX93_PAD_GPIO_IO06__TPM5_CH0			0x57e
-- 
2.34.1

