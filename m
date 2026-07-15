Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982CC371D14
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125394; cv=none; b=cQ+8Ki+QiCwOIiLfT4v6tvHzOSntv+JX+p+zz5rTLJomlRAIMU2v2hhEEMOBhM8a8N69bq1sDA2ZmrD+FjpGUAggvq/BYyKorFWL8mVAxaDRlwfNgJTz3DGYTgtx0lS0BJHjnZhl/azd5wTHCfCaAhjfvkkj8pl2++NBVEqY5K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125394; c=relaxed/simple;
	bh=IHC3taB/c1hjjbHV78+MpFaKPexGySK661G3gH5QQQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJodKhg4l2/iBCPelOxZORhHpOkwtyg/wopyaoXtgVKIO9fSz53mH3VPKwtBCO4YcoczvBeqbQRbtXeC/0yi2PjtFp4QPf0O6ItHodkds+9dBC/IZCGTqebTsho21YKf8Go3dpstGBFAdPhWDaPfeikrgjWqs5Q1w9SZjlN1qk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jCHh+5mS; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jCHh+5mS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 308BA1A1019;
	Wed, 15 Jul 2026 14:23:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 043626035C;
	Wed, 15 Jul 2026 14:23:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B13B11BD3C48;
	Wed, 15 Jul 2026 16:23:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784125389; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vqW9/RH3UDRT9Qj8/JqT5f9mnBCAvdontHcYO/WHgd0=;
	b=jCHh+5mSqWJGPEMJCW2ZdS+hBNKqYUUIvmvD/r5Z3kKVCIMpFuLVM7LglyXS3hYez0zC7Q
	lgzvKjHzRsoxs1M/J9LHI2G9OASSGx5lZRH5ch/3gt/URR5qdFew7QHX8zTR/q5gUCtA0y
	9OcCIG7xVLbiBzEyJabvO/aIrEpXIpFhlDSU+z2tEu1Z71DBTyWZWckBxBt6DlnFfvlgzV
	ozLJMv0Ex6uWKB374KCz01Laez/H+06iaNu4YYNW5ZpYRGy9sO7TYTNsqrIKTaDXPEkDqc
	3f+OkZLafYTvt/SdD/D9yfqWXLdcPbh/S8sJQIN7pBYSj9vorF620JhRi8qbMQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 15 Jul 2026 16:22:23 +0200
Subject: [PATCH v2 6/7] arm64: dts: nuvoton: npcm845-evb: Import optee node
 from u-boot device tree
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-mathieu-uboot-dts-import-v2-6-bc931417bd0e@bootlin.com>
References: <20260715-mathieu-uboot-dts-import-v2-0-bc931417bd0e@bootlin.com>
In-Reply-To: <20260715-mathieu-uboot-dts-import-v2-0-bc931417bd0e@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Wei Xu <xuwei5@hisilicon.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org, 
 Tom Rini <trini@konsulko.com>, Peter Robinson <pbrobinson@gmail.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125361; l=914;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=IHC3taB/c1hjjbHV78+MpFaKPexGySK661G3gH5QQQ8=;
 b=bgWqx8KohO0XJrnfz+GLlQpVE6GEn8Z93UF4IF2roK3EhSVFxBk37S1KardQDiqfU77GWz0DV
 L/kDBBfUD2jDqGn7tTv+Br97x5FKS88gkcUNYqdJaY2vbbKnW65ABzJ
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3

U-Boot is defining its own device tree for this platform. Among all
differences, a firmware node to enable communication with OP-TEE is
added. Importing this node here will reduce these differences.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 5edf5d13342d..6be771e581df 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -26,6 +26,13 @@ refclk: refclk-25mhz {
 		clock-frequency = <25000000>;
 		#clock-cells = <0>;
 	};
+
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
 };
 
 &serial0 {

-- 
2.47.3

