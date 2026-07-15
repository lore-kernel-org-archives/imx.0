Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8F6367288
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 14:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125384; cv=none; b=fSOqsylxnGabHj4Vcf3EbVkpvqgzvXh3HOvv+qBkVxwpCwpYlWMlpHaDWOKvt34o5Px2T0HiF0Tlf8G+6V7rwSbk3/eHTowMOS3riDgF/7dZsYknoAfN2YVJkTZL+zPTsvJpZUFp/3G0+Jp1k77zCbIyGUH+WvyAZbozHhA1jzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125384; c=relaxed/simple;
	bh=BiSi1t1NUOIhyg6vwnL1alqPw0iJySL8ICnheLp+aN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OebIyx5D9RlIcktHE9Jmz5XNf5Nz1RzZu9YB8a4wayYeQcxoaMjaKuXjXTMOuMGZO3+Ho602yiK1VkqxyxUOU7K1Pw0xP1ldlt/5HBTxcXqC51yBAkEyCHonEnGweQ+AgyZils4NGZ6LZpcsK3SeW3lKrDRD8wB8GuWVoI6mELQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CoAUdMDy; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CoAUdMDy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DEC361A101F;
	Wed, 15 Jul 2026 14:23:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB5046035C;
	Wed, 15 Jul 2026 14:23:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EE4811BD3A7E;
	Wed, 15 Jul 2026 16:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784125379; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tijUZy13OY+lpBLDlS9vMkTfAAXJmYkbRtFLhtiaaxU=;
	b=CoAUdMDyGMRWK2M4iByKGRWXdIszyR4NfGFP//GvNNqOPryLYX8xxwr5JXu0cnIm1ypGsI
	JbNNhiI0VmSvCd1ERCUNsDEreA1tRenvxbxGNqinMnWOGTOp0ai6u0IirZyqgvYgP6DKL1
	IY4mcO+2t1U2H5yT9as0Zl+K4FKBBot9rK4AxEF0GQ69Vxq0D2aCSMk1yvk7l+mf1BKsPG
	psuqlA4IvXHQ0y0ag/SgBfwLCN5YoA+g5Y+PqJUNVGApddvtHw6VRXKy4EOB6AW1O/yBFl
	gzuheHMXD4A3TQlfxvM+6+LRRC9LpWjrAi1kAS205Pvwi1ymq/1kaz8U6lCs1A==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 15 Jul 2026 16:22:20 +0200
Subject: [PATCH v2 3/7] arm: dts: st: Import optee node from u-boot device
 trees
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-mathieu-uboot-dts-import-v2-3-bc931417bd0e@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125361; l=1640;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=BiSi1t1NUOIhyg6vwnL1alqPw0iJySL8ICnheLp+aN0=;
 b=3lfIuZ00pjUhesMIxFFV0/F2DdxXFfSRCymcwCVDrr+fnITDXdhCnp3HkupTtLG8i6vkRtg2t
 oJ250VpA0loDfzIXNb0d3A0+ATPem2Ogyp0qtebyPhQiXysfjCjLPNO
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3

U-Boot is importing kernel device trees for these platforms, but adding
a firmware node to enable communication with OP-TEE. Importing
changes here will allow to remove these additions in U-Boot.

Also import the corresponding reserved-memory region.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 arch/arm/boot/dts/st/stm32mp157a-dk1.dts | 17 +++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts | 12 ++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
index 0da3667ab1e0..236da589eb90 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
@@ -22,4 +22,21 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reserved-memory {
+		bootph-pre-ram;
+
+		optee@de000000 {
+			reg = <0xde000000 0x02000000>;
+			no-map;
+			bootph-pre-ram;
+		};
+	};
+
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index 49dd555cc228..7da726035086 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -70,6 +70,18 @@ retram: retram@38000000 {
 			reg = <0x38000000 0x10000>;
 			no-map;
 		};
+
+		optee@fe000000 {
+			reg = <0xfe000000 0x02000000>;
+			no-map;
+		};
+	};
+
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
 	};
 
 	led {

-- 
2.47.3

