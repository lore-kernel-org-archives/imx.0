Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E40119ABDE
	for <imx@lists.linux.dev>; Sun,  5 Oct 2025 21:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759701132; cv=none; b=uigBtkwbGDWNhO0M97WNonlmXzXzDheCzxl/Yyv8u5Kw5qsIkWXxiP0Uc2sRKEOL4Jbk8yZFlW8Rb89YRuPXLC5HfLZFYu//0T7fSYLdoqGdXug0jf2U/AAbATyBTio9+u/FDUlfKoJ17L9KlaWpidM1n281acb75X51o22yr2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759701132; c=relaxed/simple;
	bh=08W6Kwy3jW8/F90wDEtMrHnRQUE0hr5hEhuG7b0c9aU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E/RDcA7k3ypceTMdFJ1X/wwbMbq0xtjg51PC6ReehWCgz4/KGvdReEWAIwreJBbziOJ457cHxWAtzzQEsyFT6RcSkPvrQcDybAMSPsqcaYse9En/8bjvK9wnF1okyBx/ho47jhVHpCdaNf5DytujjX8WxBWdm9ScMdqASzeef6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xTjpe0gj; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xTjpe0gj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 53DAC1A1109;
	Sun,  5 Oct 2025 21:52:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1806E6065F;
	Sun,  5 Oct 2025 21:52:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D71EF102F1CFA;
	Sun,  5 Oct 2025 23:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759701125; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=CSMS0CXfRVEbW7/IAycMvjhwOpwfcl8AilW2Tzo8ENw=;
	b=xTjpe0gj2TcjVRSgjDHkX32NBe/s8UUmjSZqoM89yCanjaSMZp4DG3xMU2WmZhUtnwSR8f
	o142dWAQbz5ERd4KUleFMQB86xSjzPwxx5YXGt29yIL/86YRGhs5JNSUBaW5Bz+coIXj+F
	FP21CgZY1iBR+dwCPcE49cU6EPNKjaqBk3rV4L2grasbi5YtK/l8zbfTNxa+JyVBom4QoM
	8871x2WB77IXzl6XPdSjR2ooe4haD1C2zMk8+qHF54Khd9gOl3UEc+V9e6vv6wtvc4HzW3
	ydOPF6z1jxJ8bo8C2VBwn+/+8iag71I/XflX/mrkTc4sf+HqK10HEFyo6ooqKA==
From: alexandre.belloni@bootlin.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: imx6q-evi: fix rtc compatible
Date: Sun,  5 Oct 2025 23:51:45 +0200
Message-ID: <20251005215146.3804629-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The correct compatible is nxp,pcf2123

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-evi.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-evi.dts b/arch/arm/boot/dts/nxp/imx/imx6q-evi.dts
index 78d941fef5df..5da9631cb3ec 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-evi.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-evi.dts
@@ -134,7 +134,7 @@ eeprom: m95m02@1 {
 	};
 
 	pb_rtc: rtc@3 {
-		compatible = "nxp,rtc-pcf2123";
+		compatible = "nxp,pcf2123";
 		spi-max-frequency = <2450000>;
 		spi-cs-high;
 		reg = <3>;
-- 
2.51.0

