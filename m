Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4CC2F7462
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 15:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783697530; cv=none; b=pYDCkNE8CihUTtaTC9T8A5NK9c+VMDf6L56MxJN/4yZdoi4kt++Azyp7ujBarTgSc5hUhP7RUlwKDj4Nz4nnyH9pPIdcSM4gV6nbRx74Q9rPWEY9EGpkqdpYSiHW1J1spTVTfI5gIVviq07VklYGO9bqcr2twhk+SeWNSOsCdNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783697530; c=relaxed/simple;
	bh=BiSi1t1NUOIhyg6vwnL1alqPw0iJySL8ICnheLp+aN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nrOZ4jQ1SRGQTVMPGk2AruMOx9jgCSwD5/a3jEqsX7h83D4/vtkYoPC5jtF6BHLsIbYVn/rxg8N/ZHgg8F42s6wyYKZeoggDFBPmldEywl57mK4bCbun9/Sc1QgKQOL6cuu6JBwP4LLJeLq4t9/+MjDf010IWlH476MZNLJKsVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hwAgVCeP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hwAgVCeP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AA0D24E40D47;
	Fri, 10 Jul 2026 15:32:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7AED560346;
	Fri, 10 Jul 2026 15:32:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4AF511BD1C34;
	Fri, 10 Jul 2026 17:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783697525; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tijUZy13OY+lpBLDlS9vMkTfAAXJmYkbRtFLhtiaaxU=;
	b=hwAgVCePQDdOl38e0eOljEd89vJodZTSjMwAfyub0tBhi8wgL60YINarvPdFNifjqc4Hay
	ceTIpKzHnDfeMeR7wY9RSh8WhGXVm7XIz58C6OL4aDAUCnFSyU48ccp9aha3S0r+NnqWaq
	XJmICvJiAZMcNDUtr7YVoDyC3LMFY3C4C7YnI2erAPvvoc3KC6iL7m/PEgS2Op5y9JKkBH
	2TBm2+HY35tPscFdW+23yUxaS+9c994VCDlpJ1fZx7Z0RaVHIB7nslZMbxewNvHmI6G+yq
	n6baH/qqOlkmwRsFVE91KvPmjOUAwyIVzwY8OHwLM6TN99Eb/DTOV7CpVuFXEA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 10 Jul 2026 17:31:35 +0200
Subject: [PATCH 2/5] arm: dts: st: Import optee node from u-boot device
 trees
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-mathieu-uboot-dts-import-v1-2-ffe0210e50c9@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783697511; l=1640;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=BiSi1t1NUOIhyg6vwnL1alqPw0iJySL8ICnheLp+aN0=;
 b=B4vFTHfXQRbCBa4gp7JA6+tDIx0+dgYq3zVpsg/Yp9hnGhSOdseawTAnqzSZuqSmUUGkfkp9Z
 RLTUNtyzpweBZkiGIDn9hSzDhROdWHjROLOt7/ttWZPDtmoqRT6FT7y
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

