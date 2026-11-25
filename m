Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629132;
	b=fWSWtQZ34I4ij3+zOfWDoVL0uFj3iq6bQLfJ0PLzeHUP2MrNaXZBd7HAouC1wdwa3FwA
	 1v23sjIzaAM6WnmBlPeGdbAzF51AOrJ5dTpTELwphpN7Kqleu82r1MaRLaeebVL+di9v3
	 uDPmZbpqFLnZrGLuHfqoYVAdkRrMHTLT35j80Icaav4ryqeocg8CG+1BtkLTQX6Yx/z78
	 yYPSDN8hU80UPKtkiX4iNBqbKsCjSY2jTvPOlJHyPxy/MmICFkElf+aMtobIFLEIcamXD
	 cu76hEwxECl/DCXIX6UK6rh8uPA7g8JCg4rJsz2FQb7gQf9pUzj/HKJ4EsfaFh/33sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629132;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=GRvEh7W8Gjjan8aSW0NgE3dBDol3XNo3W6oSUBUObAg=;
	b=togqmsvUSTUSXuo0soY8j6YLP8rK3uRq8pkwDPGQ5WdmC6T/QetUHkxAybJDPYkP2OuL
	 KbTaV9Zhtn6P4dsnfAKzM/TEq87EpCv40IY+daJ8TUhatqXL7gsjfWvehv6HcfTUpjVeq
	 e6Y+ylvkyHvYwcd3eGdL9+w1+Q26j90SN4S8QIQb/sFiy4ZM1iW4vDURWkb4pegRA3jNI
	 tABG3DwD4owQ4FJkWQfoSPAx9l89aoMKZtFL8ZVoec/KyLE0gj904D2mwrNaL3oMZ0jkX
	 Qz9lIyQoKnelQaTIVb1ZGKESCBX4y3ylVPFroEu8n4prfYzYFXUDLYe9bDfyJX47F0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DvQ+ecRI;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2160606A333
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2160606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DvQ+ecRI
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 64CC94E41789;
	Wed, 25 Nov 2026 17:52:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 29E2760480;
	Wed, 25 Nov 2026 17:52:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4DA311E6B0AE;
	Wed, 25 Nov 2026 18:52:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629128; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GRvEh7W8Gjjan8aSW0NgE3dBDol3XNo3W6oSUBUObAg=;
	b=DvQ+ecRIp4ZWXBft+KDUn2D+H2bk1RLiRV5zLdDy2/B/IgMyTrffM1a08oJUWzk9B1IARq
	lJN01h6ms0R4PsKeOvFsXvjLSye+io6+SylDwxPDvcS91SPCCKsV/qo7s4fnFBaxUyHS8b
	jAMPrASVj0ZUglQN4E98MjSof9UB+0hEgGBkDmQjDwE8w3mFDnv2SQi2nsRGL8KYREyGah
	ZF+E5cDzbBMV3QBC1gmR/Tfs0wdIjoKwGQ8VL5FB7xkVZKqIGHucZDgvzQPlPP9NFHEm6A
	iFfZH09zSNv0zVBLRx6vkrXulUS/HjTucHLi2Mw8IXeqiL42O+UpgaBl9IKjDg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:19 +0100
Subject: [PATCH RFC 05/16] spi: amlogic-spifc-a1: Fix a typo in a macro
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-5-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Han Xu <han.xu@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>, 
 Yu-Chun Lin <eleanor.lin@realtek.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Correct the macro name: sycles -> cycles.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-amlogic-spifc-a1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
index 282647cd6b56..d99c72c7a965 100644
--- a/drivers/spi/spi-amlogic-spifc-a1.c
+++ b/drivers/spi/spi-amlogic-spifc-a1.c
@@ -43,7 +43,7 @@
 #define SPIFC_A1_USER_CTRL2_REG		0x208
 #define SPIFC_A1_USER_DUMMY_ENABLE	BIT(31)
 #define SPIFC_A1_USER_DUMMY_MODE	GENMASK(30, 29)
-#define SPIFC_A1_USER_DUMMY_CLK_SYCLES	GENMASK(28, 23)
+#define SPIFC_A1_USER_DUMMY_CLK_CYCLES	GENMASK(28, 23)
 
 #define SPIFC_A1_USER_CTRL3_REG		0x20c
 #define SPIFC_A1_USER_DIN_ENABLE	BIT(31)
@@ -90,7 +90,7 @@
 #define SPIFC_A1_USER_DUMMY(op) ( \
 	SPIFC_A1_USER_DUMMY_ENABLE | \
 	FIELD_PREP(SPIFC_A1_USER_DUMMY_MODE, ilog2((op)->dummy.buswidth)) | \
-	FIELD_PREP(SPIFC_A1_USER_DUMMY_CLK_SYCLES, (op)->dummy.ncycles))
+	FIELD_PREP(SPIFC_A1_USER_DUMMY_CLK_CYCLES, (op)->dummy.ncycles))
 
 #define SPIFC_A1_TSLCH_VAL	FIELD_PREP(SPIFC_A1_TSLCH, 1)
 #define SPIFC_A1_TCLSH_VAL	FIELD_PREP(SPIFC_A1_TCLSH, 1)
@@ -195,7 +195,7 @@ static void amlogic_spifc_a1_set_dummy(struct amlogic_spifc_a1 *spifc,
 {
 	u32 val = readl(spifc->base + SPIFC_A1_USER_CTRL2_REG);
 
-	val &= ~(SPIFC_A1_USER_DUMMY_MODE | SPIFC_A1_USER_DUMMY_CLK_SYCLES);
+	val &= ~(SPIFC_A1_USER_DUMMY_MODE | SPIFC_A1_USER_DUMMY_CLK_CYCLES);
 	val |= dummy_cfg;
 	writel(val, spifc->base + SPIFC_A1_USER_CTRL2_REG);
 }

-- 
2.56.0

