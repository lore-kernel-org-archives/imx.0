Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB2A35AC09
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125397; cv=none; b=kITKrN6+qH35hS92bJrA+QtXt/jSRlENrt/+yf/NoP9fV8J8PbgVMMX2bw/8/IiL5YpMHYuomWON80kHQ6zGDFFQgwjZYaMh0pz2oN7LgvfNqayIsUz48Td3CrWRJd9tRjKJjxD5LF6TSZjrV/zukj1q58mZcE0tAvuiEXBcchc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125397; c=relaxed/simple;
	bh=+pXpwbDFKXObiXFKtLc8N/VwCyU4CpbIpalQxRbGp0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kZTKt7HNi71kNgSLzliQzaZdVjcpM24WGhIR/UtmqgvIBGFHQzdFjwwhAGk+T/2MOgJc0LW/UgoO6qpvwOWjHMiQZVKXr40oIBFeVl9VaMbqZYCoubvCVNNN54vJJO2cRlgFoGCFM0I3bYglCUVtUY7lJRTLTW6mOyzuH7F2Fls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=veErst9B; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="veErst9B"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 29A49C2B9DB;
	Wed, 15 Jul 2026 14:23:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 361936035C;
	Wed, 15 Jul 2026 14:23:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D5C111BD3C42;
	Wed, 15 Jul 2026 16:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784125391; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IL51/pID62YlF9u7PwGo05/ugBph7LsRcUIyFPiTV3Y=;
	b=veErst9B4b3J/mqHoJcplPPXQFEMeFAJLVVzbyfMUFfwzUtgN0unKKwWwQbwctJvHu8Pr1
	TdMcllObh4tiIFiMV5hy6Ofxz4loafFjY28Le4VqEtsUTw6mgA83lIDH4I1qLg9zIbOKbU
	DG96JuuP29S1WA2JFVr1YxohblAXcIPuyRxK3r7MP4os8BAN3YwT63HwKmE4mA/Zn1siS/
	V42CF+4dv6ww9tLFWzmq6nO3XVoJMTlxLEl1qfCart30qQ4CeWwTThBPbOjXCYqUigOWu6
	jTsEWgV8D5OATUfMLro4NMWQPhPbdPUPT6P2U/Ym51j3EM6Y5JUuAqwAOvN/jA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 15 Jul 2026 16:22:24 +0200
Subject: [PATCH v2 7/7] arm64: dts: freescale: imx93-frdm: Add OP-TEE
 device tree node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-mathieu-uboot-dts-import-v2-7-bc931417bd0e@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125361; l=820;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=+pXpwbDFKXObiXFKtLc8N/VwCyU4CpbIpalQxRbGp0U=;
 b=lN2ZaiqEbAX/cIN0f3L0Arvnqur1xdhLKFEORJrLS7m5rMoK8eUkYlNss2SDzJZXtdUaNm9eC
 +vb4GEG30dIADPfINOUyWvwrI7PzM7/yQauEI0+LIp74yd7D7fo3u8f
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3

Add missing firmware/optee node, so the kernel can communicate with the
OP-TEE firmware.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index bd14ba28690c..8aba7ed4c535 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -121,6 +121,13 @@ vdevbuffer: vdevbuffer@a4020000 {
 		};
 	};
 
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
 	sound-mqs {
 		compatible = "fsl,imx-audio-mqs";
 		model = "mqs-audio";

-- 
2.47.3

