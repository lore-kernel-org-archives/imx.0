Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417363168EF
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 14:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125390; cv=none; b=FSIQU/aK4llBm954QsBhVDwpecN5wWchojKchVmoD535SouT03O4pVrEWx4JYhRmV06hnGE9uiDulRqA6bnElMTXc8uXwxOnW9+zF5xifSGZsmF9kp9Hy1cXVUpyLtENQmKHDMShs7mMitRQ4Koq9UhWw948Hb/bwncU2DFHcKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125390; c=relaxed/simple;
	bh=bQvA7RaITKm0leFu4CsMz36juYaBIh9nm8WiAQHba6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hKiMqiE8IuxyUTjWImxY6QmWCtEpE0C2bRznpf39ZVl/li2ESTi1NdZC/ob396jOm8nHZ12VM68aWAhoTwUsGfO/9PPh7tIdORlcxVvgiKLhF93wmJbtLQ7bV9ffg+OBOGgYzPpCV7AVqT6yeV8OuS19NXGW1ZMdGBJe+y8GfN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bpyJVEVD; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bpyJVEVD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 69CF2C2B9DB;
	Wed, 15 Jul 2026 14:23:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 769566035C;
	Wed, 15 Jul 2026 14:23:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A18FE11BD3C2A;
	Wed, 15 Jul 2026 16:23:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784125386; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a9IuIIWMF3nn6MhJn3nVioRG/vLkyDShB0IZOzPkMNg=;
	b=bpyJVEVDRQcCuY7bgy4f1zEOx/PzX9swqY44GNzAO/Rxye/iPSn+R+3b3uiK3rKEaJ6NGP
	qqzBZn4hRodDBJYjRSRimupCI/zbro/5gVwCmaZQ2g/RAgARWEJSzVE9+x3iRS7sZ4XCQ8
	p0u2SFv+rk1zx0AK/4FoJnkfjJmWjeFnaDcmcXGj9fEY2Ku6Gsj5kXUEIqIq7wihHQl6fj
	CfzPV0qJUxvj85lAkoP6bKJYkwyricp2NjajB0I4KydKRxT5fFnYk5x9MS4y9Wbbmo0zFG
	Sc/mdVU3WiPS6tHV2Svbpm1V2p+867kBJiwsm7/Ae/QlZmhSn0lfPuU7GVnKIQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 15 Jul 2026 16:22:22 +0200
Subject: [PATCH v2 5/7] arm64: dts: hisilicon: hi3798cv200-poplar: Import
 optee node from u-boot device tree
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-mathieu-uboot-dts-import-v2-5-bc931417bd0e@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125361; l=911;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=bQvA7RaITKm0leFu4CsMz36juYaBIh9nm8WiAQHba6s=;
 b=Y2p/yYf552wB6F+3f88xBut8s30oCKUbtMj+A0QRzGsASLKbwSWWM+CqICzmC5KCUiWnWdGsv
 /IdpeHYxmBtBv4IFWFix7v9Twjws8P3Xd31cSw4WySJ9C9N/ahMDCWi
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

