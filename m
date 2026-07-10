Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC54542DA29
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783697536; cv=none; b=B0Q9pMUJv76N/LS6t2r+78i0x+fcndk2zDywm80oBpHRnatMneUckoYuoblh3dEgDTIBO6ujlvt04HaSaXd9g5v2Na726s7Eu9uvEx2dJ1KgQCHXIafzMXvOQoZx3f2FrsAfDBZMSRiHHWprvENCy9A3Xq8YSN6KjOSN9FyHad4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783697536; c=relaxed/simple;
	bh=bQvA7RaITKm0leFu4CsMz36juYaBIh9nm8WiAQHba6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=COkZMPcHzVUO3PsOhL8CJGEBDA+L/TMXicP9BfWxe0c2XqzM2Sh49jkG+JIAkVA1Rb+Z0HA5CTMx9zXTwphTfp9uc1OBzajvCndis+lSBS6XL+msyrqMpWgUXTGKJ5lFU3YCiaOtw2+lU7YoDnSszcDMTRVe2gAeAq6ftUQGF8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZqfRHd86; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZqfRHd86"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 01D5C4E40D46;
	Fri, 10 Jul 2026 15:32:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2B3C60349;
	Fri, 10 Jul 2026 15:32:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2ED1D11BD1C3A;
	Fri, 10 Jul 2026 17:32:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783697529; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a9IuIIWMF3nn6MhJn3nVioRG/vLkyDShB0IZOzPkMNg=;
	b=ZqfRHd86BxzR2ZmpA+iEZqyUSwZ4jKH7irfqT/PLD/Z3wNaT14yrk/8uGu+fqQy4TnV+/w
	CQxcEwnpJUx0dz/adEgEMoHKYi0htAmh5WfQtMIN8EBfQ2SZs4/oMEbhGLR8TS6zp4lFe1
	KC1629eorzgZwZyxBZmqbWDKIaZ4J8990+RMjECCsCzwnCMaQYtiznf+2vIzvgVIMUxujM
	ejZfj6Pw9mp9pDQZ1A3GwfKXGYpuBUGVnZMtQgHSjDnGrZMw1pGJTXJceaGeaouTSrSG8+
	wjS2edXdd9rSyZx7RJ1LDIUrt5iUOd1MHNIMTAsaL3mnb70hbcz78a/RImkflw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 10 Jul 2026 17:31:36 +0200
Subject: [PATCH 3/5] arm64: dts: hisilicon: hi3798cv200-poplar: Import
 optee node from u-boot device tree
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-mathieu-uboot-dts-import-v1-3-ffe0210e50c9@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783697511; l=911;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=bQvA7RaITKm0leFu4CsMz36juYaBIh9nm8WiAQHba6s=;
 b=Oqct+rYQmFQ9UaEQYPTA/h45y/vpgN4kx9+02R3tfwH61DyYi/90YdCukwryl/7UV/W/o4He2
 c5uJcIP/MmfDIvDbxx3YziqtaedaIjLApZQNcodt2GfUJaXvWPDqjyL
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3

U-Boot is defining its own device tree for this platform. Among all
differences, a firmware node to enable communication with OP-TEE is
added. Importing this node here will reduce these differences.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
index 579d55daa7d0..f20fbfc1c954 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
@@ -70,6 +70,13 @@ reg_pcie: regulator-pcie {
 		gpio = <&gpio6 7 0>;
 		enable-active-high;
 	};
+
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
 };
 
 &ehci {

-- 
2.47.3

