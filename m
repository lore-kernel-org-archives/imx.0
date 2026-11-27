Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789648;
	b=XDAEzCEwUh5TZ0u2wsS2KaQCCsLdte3DQ4OCbcrS0aae+2XwpQI2Oofq8pfRaJzlv4uE
	 E06wZ4wD8RWISMLYUeQ2WPw0kA5KbOuU88xSNBg83CLvFbOZBahkKI+WJTbBjPrQMJuES
	 w9vP4a0N159qClKD5yvoTuU3zL2zO1RFszeLWbsN7K+7aXRSHIheJaQFbPkPMw7L6cWNZ
	 GFFq4tiaTf2D2F1unhmrdiDEb9q/50LHKV9fIY8xC8Js/HTzyp/qA2/6TYhyLS02l6l+C
	 XXZ/FUycgiBX0gRwkTUuR1LZoWnIXNK/HmQivXh8OqPl3zQR7BRn/FjnonSGZjcBUYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789648;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=PzsT2/vnTOLgeC13FDUQXpv3y/kUea2jI2GTpmgE9eM=;
	b=DqUdJeRKZAGZxNitpxfquq511F3nEmmlQ78GDtweg9LnA2IiVHlM0VaFZWo60/Tv3/h9
	 Hsk/hg96cXPG3idlQR1aXU1M96nTfMLIgNBsQ01ubBSGwoMlqn9DBDvJffp78el3J6Mj0
	 ujuNl6eMlzzNDie47882RCb2Crmk/9FmqYpwaN8QM5FUKMAWZ50EnsK1zfZBeDC+XIx4C
	 Q8va5A7qurCKNoZgszyicqjb5i/UDP6HDd3N+jDTbtCNHMHjON3cMkYvCWv3EyPslF9Cv
	 y84sQZDkhW2/xn1fTqtVbmujjp5RDQO5xI1MbiSXM0UGmFpMBzGX0N8WAgVCbqMOmEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=udHo41LZ;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215B7606A32D
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 14:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 215B7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=udHo41LZ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4D88FC2AC50;
	Fri, 27 Nov 2026 14:27:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 825CB6049C;
	Fri, 27 Nov 2026 14:27:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04CC211E69021;
	Fri, 27 Nov 2026 15:27:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789642; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PzsT2/vnTOLgeC13FDUQXpv3y/kUea2jI2GTpmgE9eM=;
	b=udHo41LZ9pUYk5V1GKFBsW+tpcv8NEvbhIdv1MV7PCqO9109uFbTupw+GGlpLp4jY0jUNc
	8m+eKM5zExD2ih/EIGrU3+JoJ8HjqcVBNvsxBzTVSoYjikEcax9o94bun1EBRzj4Dgl9er
	R3Ne/Rmgyh9Z1UEMsL8hTkFQ97NmuwtSmKbPC7xpSOXEHWHiLiPE6vAWniqV6lCW7PrzpP
	fQuJovv/7NBZYLkytUwsR+IF9dlAnOdttrpygKXOk/aBWIRzzizFgPBE/seqiHsrVXAUoC
	fp89ZOlDp0u7aUFZRg9hxGo1GrSFPklJCBEECRWRTrr2cxGxVvNCqgFX8wppLQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:52 +0100
Subject: [PATCH RFC v2 30/35] spi: stm32-ospi: Reject excessive dummy cycle
 counts
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-30-5c93f5e5d630@bootlin.com>
References: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
In-Reply-To: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
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
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michal Simek <michal.simek@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 linux-trace-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The controller stores the number of dummy cycles in a 5-bit field.
Prevent field corruption by adding a proper ->supports_op() callback.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-stm32-ospi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index bf42f46ce194..30d48ee1be21 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -772,11 +772,17 @@ static int stm32_ospi_setup(struct spi_device *spi)
 	return 0;
 }
 
-/*
- * No special host constraint, so use default spi_mem_default_supports_op
- * to check supported mode.
- */
+static bool stm32_ospi_supports_op(struct spi_mem *mem,
+				   const struct spi_mem_op *op)
+{
+	if (op->dummy.ncycles > FIELD_MAX(TCR_DCYC_MASK))
+		return false;
+
+	return spi_mem_default_supports_op(mem, op);
+}
+
 static const struct spi_controller_mem_ops stm32_ospi_mem_ops = {
+	.supports_op	= stm32_ospi_supports_op,
 	.exec_op	= stm32_ospi_exec_op,
 	.dirmap_create	= stm32_ospi_dirmap_create,
 	.dirmap_read	= stm32_ospi_dirmap_read,

-- 
2.56.0

