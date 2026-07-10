Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C160142E8E9
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783697538; cv=none; b=uGocqUtDT9oiSAar1Zl/epLU7pbamIqsWa9gmcnuDjxxeOR3wLOD5yhURaNPWF81HOzVfe4p3uuKXpaxl0Tegf+nI1Q6e4TYWftAZjpDUaGy2wB3C/XHKUekppMksCHyM7ricpI7ph935zRthv8SGy+JQi/Vz/6pNKCriNMOqtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783697538; c=relaxed/simple;
	bh=IHC3taB/c1hjjbHV78+MpFaKPexGySK661G3gH5QQQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZIAu/VeXB+DBnp/HF2yOYLjVrCEDB/9w44iI+HqPFM+g5GSI/bAqJWJnA8mRt1jqcGrU49IFhKhZMa3+XikRV7hOZNYWsOJelyntA6p4tbeSxRrdmSliIdJ/7O9kuTGKhj6B9fyOjZb6tpmURIwfFnsSYgt8S7BzJDu3AOTM5bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KQ7TB6i6; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KQ7TB6i6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C52B8C2C64D;
	Fri, 10 Jul 2026 15:32:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 360AF60342;
	Fri, 10 Jul 2026 15:32:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 757B411BD1C39;
	Fri, 10 Jul 2026 17:32:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783697532; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vqW9/RH3UDRT9Qj8/JqT5f9mnBCAvdontHcYO/WHgd0=;
	b=KQ7TB6i6xoEyqyf8PatcXCiYct4jjrpYwKZjqvtUmp49z3BDY+YgsogTLYjCYQD2nzV6Cp
	jzA62MZcQtwyMXcq/JgDW8xvjmDJZr+Jyvp/4BAVR57gJcE8rUNKQ20QTSwl9rcdT9qqZj
	18NbSmGo0CO70zoqJ1lsz/SOKSLbOiMi2JDKV16qWSDkT9yifaDrOegRslu0oFesFMGGE9
	dfnjNcr8/aofwu4uJPk/M81a6HX1UNnVuaQO9YPJGM0BaQQPLfmt8Zkh6MSLenljl6Vwbh
	litX4zOu6p9ZsZwJtZnu5JrapXohtrwPCGWNU7pjGoeQmgF/GMS9mMVaEe6l1g==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 10 Jul 2026 17:31:37 +0200
Subject: [PATCH 4/5] arm64: dts: nuvoton: npcm845-evb: Import optee node
 from u-boot device tree
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-mathieu-uboot-dts-import-v1-4-ffe0210e50c9@bootlin.com>
References: <20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com>
In-Reply-To: <20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783697511; l=914;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=IHC3taB/c1hjjbHV78+MpFaKPexGySK661G3gH5QQQ8=;
 b=YskH4XXITgrh4BDy7rh0C6CaVOqf90OiQ1uWiaAX0EZCYFl1sya1haf7eiT+PGVrxz6VH/5dW
 a7FkqvpzAQNBiehXRDDXPhkjxZYE5L5SFgYVNqmshnsrG0QXePXT5YN
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

