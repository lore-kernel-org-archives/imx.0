Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789509;
	b=eJstdGA8eyZFqCTdB5P1/EPqcvy53Ynx1pNoLE/VffH5gLZlsOF8s5412LhDJ7MCc6Vq
	 TH1rJFEdVKQX5U3gp6wmeaBcFNhXI74K+aIOkorDJmYvDRVvmtiRMqPbtZFh3uur1FN4Z
	 TffIUAXsLalQ9DRt2wxyB+JeQDCwb3X7ukhj+zujDYbQ4TurseLnqH3hicZqx6Y2xZBQs
	 7QjBMlIxf4yJcPrOvS48fnh2l0zJqxEj58+6JFuTaBOwpjmx6UEoVkEumH2bw+yUlIUTO
	 DzCXcanJ6b6rB2q10nSuWkoQiZa58ngAtJSArjWE0bFQB/qyCUxL3Xuc7VcoEJm0aaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789509;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=VDYSicKqp2OeFF0Ws3pjAHSZvsSuFmA+Av5A7v9g3uU=;
	b=SUEq5UjHaHOHV0PNzDH2dtPRYknKbbMyCGWqE0jCAUoKXYAXy3OQ9VJUW80dAR04HFo3
	 TgWI19p59246ZE+SKHdqmCX4oXYvwy95sx1Suj+kXtg+dV82QumhtTLlhlTJojkzElMYb
	 gR7a7T+LW0MJigORCtdE5V8VHjkQGBmy5vTzyEWOGTgcaFOLBAL14lYKfbDHuNUdN56PY
	 HGUiHRKaxiHG31U+1g/Nxr9wFZYNPNe0BnfE5APWb8hlxEH6jn+jEyJMJm1rV9ifp6eRA
	 3YHsilyt5VEqUmh2Nxg/8jRdpAtV6CLGFBKBSr5qI7VQvVwjED6jzlL8DEez4LY5NfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mCPupFMk;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E84606A6AC
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 14:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2E84606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mCPupFMk
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A28104E417C9;
	Fri, 27 Nov 2026 14:25:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EC866049C;
	Fri, 27 Nov 2026 14:25:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3EAA11E68FF4;
	Fri, 27 Nov 2026 15:24:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VDYSicKqp2OeFF0Ws3pjAHSZvsSuFmA+Av5A7v9g3uU=;
	b=mCPupFMkcRfnTzAr1Spz4Iuoof0rLblYlcTgdlvYugdCRiPEsvTHWNKbhADlCvSGKwJ1Je
	lG5Vz4gbMxFDMXUAKX2zEYbs9SW2y0Jt47OVeQdpx5boCZeYYwietaLpwk2CBCcFzA01od
	hVYZ222UDqBIVsfEuci6NiuPKeuD2ZvKxyVqhraL0Objx+rpc+fqiGjWVnPgNKypPf0fKm
	JBTqjtXV9bIr1kQI/iTrkEOQPe34K0Ljw8c3zBiDtM4FKtg1390PqeJTgE3ARKDWqV77no
	PMvdPfBmyC4s/lrYEyIosPnLrCgIz2+uZdciTN3WxwezM/pZCt3kVrFNO09jVQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:35 +0100
Subject: [PATCH RFC v2 13/35] spi: cadence-qspi: Drop redundant checks
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-13-5c93f5e5d630@bootlin.com>
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

The core already sanitizes the spi-mem operations, these checks are
redundant so let's drop them.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index df7c04e0e2d2..97725ffeae93 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -476,9 +476,6 @@ static int cqspi_setup_opcode_ext(struct cqspi_flash_pdata *f_pdata,
 	unsigned int reg;
 	u8 ext;
 
-	if (op->cmd.nbytes != 2)
-		return -EINVAL;
-
 	/* Opcode extension is the LSB. */
 	ext = op->cmd.opcode & 0xff;
 
@@ -1515,11 +1512,7 @@ static bool cqspi_supports_mem_op(struct spi_mem *mem,
 
 	if (all_true) {
 		/* Right now we only support 8-8-8 DTR mode. */
-		if (op->cmd.nbytes && op->cmd.buswidth != 8)
-			return false;
-		if (op->addr.nbytes && op->addr.buswidth != 8)
-			return false;
-		if (op->data.nbytes && op->data.buswidth != 8)
+		if (op->cmd.buswidth != 8)
 			return false;
 
 		if (cqspi->is_rzn1)

-- 
2.56.0

