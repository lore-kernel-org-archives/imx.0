Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA53B42F6FC
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 15:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783697540; cv=none; b=Q+PGJSCZ6ihVtRdHfjpBynwpC3X7q1l3LjAeG/BtVgaOFN4CH5JOujAsxeOAM53iJCddlspyB2PLR3UEXg09+5jAWAr69KJBdzO2KFQkkwQZipARm5Yjs72QIUXO5qoSfWM6tAMMi38jIQTjFgZNdfnxIebqM0bIS6CBZPNTJUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783697540; c=relaxed/simple;
	bh=+pXpwbDFKXObiXFKtLc8N/VwCyU4CpbIpalQxRbGp0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j19MTEGW9dfRrhy1TfkOUPUpqjIfolKr4Jz3GeNRp3+pBiH5n7xBl6NgsXGHDJcrTot/ulkyeKcT9ENjGpz4s1CnX8K+tnF+75mhwHW5v4brNtsHAHWF4mBromeRWVoZ2wPGzW3xFCf2SOqmSv1IroXOcsE7ojpBGvmWr4/Ecf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HF0LEBeq; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HF0LEBeq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 974D21A0F44;
	Fri, 10 Jul 2026 15:32:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6222360342;
	Fri, 10 Jul 2026 15:32:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFD6D11BD1C3B;
	Fri, 10 Jul 2026 17:32:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783697535; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IL51/pID62YlF9u7PwGo05/ugBph7LsRcUIyFPiTV3Y=;
	b=HF0LEBeqbFPwdtQ2ye2HvoFuOANtYuL992/K1lVV9mhigt+dOmn45Vhczz23W+oDCmgjlb
	PGgY+LspJ3g8M7KusB2KT9+1VKQ5y4Q8j5PZhNswAAPNXJimdqZQA5KlJe3QL10lgCj1jD
	Rxe8wvM63OLLSe+eJIwsmDsfoZtfxzv0q4JVNvPNypRbW9MII57zrtZdjzF59oPkONTvwk
	mVgyg6roCmS+v84dL0z4ZpngyPHHjEwtsD0gyHmuLa44J+uQn8h5NIu6Ln/ptYoTAJLeZs
	0PVhrTicjvIaSvpAkC4JAl3w0lSMaGRA/9GRCdOKWHYwm0YeiTQdyXesIqbfiw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 10 Jul 2026 17:31:38 +0200
Subject: [PATCH 5/5] arm64: dts: freescale: imx93-frdm: Add OP-TEE device
 tree node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-mathieu-uboot-dts-import-v1-5-ffe0210e50c9@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783697511; l=820;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=+pXpwbDFKXObiXFKtLc8N/VwCyU4CpbIpalQxRbGp0U=;
 b=1/aCHPW/Jxnr4fVcgBIrsm2LS4ppfg9dk8CeOs8EuDYNNcADF9K3pjB8EnrT5KEOu8io8/+LD
 v7p+XTXWhztA84Hgl1oENLu1H21x1JfaHfmiAVFQaxuQAQwCA8peoPP
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

