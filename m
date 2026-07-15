Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D63A3168EF
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125389; cv=none; b=XJCx22LPb64hSNX8u9dNHJNaSw7kMoMrsaQKQAwjhEkXs6XjM0gu65ndFqQH4lzYodTm1uuNKNhxnAxp35OneHnGE0Oo9CaIgqfDFcD5QgRQXubWKSqMlH9AYohvgs76gOozafipYOoRtGFREUgBNc/nvbD4Mki4uol7AYYsiLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125389; c=relaxed/simple;
	bh=HOom1bxrDO/GHwXqY0qD5lhaVaSjF0F+dciyfNclTPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FI4qjcAVUJ5l4yIW3j2Mlr7KVKWE3NFEBbT5qSa3cwP/IMJfeZfkTY2Y6xfwAQnaiDlD4ckFy9l9SgdhqfTNqjUZqAeKwl9X64jPoqNaUXT7fNQrwhEvFK+WkxCpCjfToFxlKoXdnTL1vA/jwmEviwCBOOJFJEKFWrcAI5TVD4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LBtXZzTq; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LBtXZzTq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F1A944E40DCF;
	Wed, 15 Jul 2026 14:23:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFC056035C;
	Wed, 15 Jul 2026 14:23:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6556911BD3BF5;
	Wed, 15 Jul 2026 16:23:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784125383; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yoILlpMIdQMG0h6z5e/h8NeegbfAs8+0w/UxB1yV3ZQ=;
	b=LBtXZzTqPsjY8076vvHsITNenZZhN3Ct1xGoOb4tKz94haxgx+p1EqHsM3Wht2WS6eCzeO
	W68OJBOcMBnh+iBIbTsSUCmw6agoaLFewyzwW5PVCSIC5zWuRoGD4LTMMJM3IimEB1j+bm
	SK4L8s7IFcfUZGtlK9sVg/sfMuSawx1Ww/tkUr3EX8oHFJwfmwfUUG91rtWRRITcs3vVXK
	zwgga9nsGKSxEb5HDLo6fHIfWvwS5ThqeiZR6nKM0Jh3I0ir74wObv20Uu+ypYe0b0WJ/6
	svnIx1LBPcYhyXLPnU6h+9dBcBPJeAUwedifWPCAAeNfQrgtxq7IAmNfdF7tMg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 15 Jul 2026 16:22:21 +0200
Subject: [PATCH v2 4/7] arm: dts: st: stm32mp157c-ed1: Add bootph-pre-ram
 tag on optee reserved memory
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-mathieu-uboot-dts-import-v2-4-bc931417bd0e@bootlin.com>
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
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125361; l=997;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=HOom1bxrDO/GHwXqY0qD5lhaVaSjF0F+dciyfNclTPE=;
 b=mAiPNP5DfX7wuIjQ0yqQikVNtsTgizsMceV5ShTy0brhE9vMlpuKroXPZBEr+g5pkuR/8K/S/
 SgNqYCMvu6FC8ySLhZY2pTwuzzquK0XVLdITpKUPiycOJreSa+OMdqB
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3

Add bootph-pre-ram property to bind optee reserved-memory during the SPL
phase.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com?part=2
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index 7da726035086..827480e9bf7d 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -34,6 +34,7 @@ reserved-memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
+		bootph-pre-ram;
 
 		mcuram2: mcuram2@10000000 {
 			compatible = "shared-dma-pool";
@@ -74,6 +75,7 @@ retram: retram@38000000 {
 		optee@fe000000 {
 			reg = <0xfe000000 0x02000000>;
 			no-map;
+			bootph-pre-ram;
 		};
 	};
 

-- 
2.47.3

