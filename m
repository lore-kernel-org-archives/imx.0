Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789466;
	b=nKmQyDfULXAiCUYd8i9M/njnteWn1diOGqapOt90bJOy3s4/EleJ4XffsyUj0MLxFOk6
	 A14V5KS7MQW8CXGf+cW5GajO4HtDE24LC/JpHrbuIiFeIKlWNpWRSE0VV2+ZZPnrugZZ8
	 xUuhSHg2ZPmoKtPDxshhQywsHG9t5e05jprjOFtmjIZ9VufJbMwgKJghVN4EX4IT70AT7
	 UM4Ek6Mb9/z4OdLzc9++nPQYOlC9xC8XA5ffhkXIJxuJ+A/kakN+yYOO6cJg6FMuk86P/
	 rCK6b5PO58CvsPceefHnLCQG963owHHgmcdDfQ7hLeH5XQiuxLF/9m0mtO4WHGgEyUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789466;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=zonOBGO6156kvCeWKd0snm1db/Bu74bIS0ahMayf6oc=;
	b=g2cuY883PCIPdGw8MJzbGFQqYdvzgquGEalDSKHcpUznviOmOlOh54T9McHp+4kQimI+
	 0nqIQUaM7oGjD8lntzLN9rtb95dY+EcB4Epw0rdQq2cAL+QUy1VWmxnQJg1tk+GCIbzdJ
	 fr5qFFBssMb15T3thQ1B5brbzjJy1gd7Dc/au+4Cqy5vE19MfA1TOX7kEcpuNCVKaBg/N
	 Wr629Lz+0WorayDOkfQfn2hmtd8uXzDCgcLDFYNk1SPwidM0ErhkjfpDzXktRsDZXLJLl
	 u8ngi25+ybNODq5SLm7XgM3o02i3W1PIeAWkHB+FY8ZB4XHzNL9JhbLSiolKPLfCnUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kYxGE0WH;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD07760A2611
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 14:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD07760A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kYxGE0WH
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C2F24E417CA;
	Fri, 27 Nov 2026 14:24:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D9AD6049C;
	Fri, 27 Nov 2026 14:24:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5124C11E68FD9;
	Fri, 27 Nov 2026 15:24:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789461; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zonOBGO6156kvCeWKd0snm1db/Bu74bIS0ahMayf6oc=;
	b=kYxGE0WHExEavfLxiryWok6MCYv5qIIkKetTtYMLHh4ksnOXG7zujnaqyGLojlf06KvXFm
	eB8dboYQ+STmwq5m3wUaEJfos0toy8eXRzBxKyM2ydvJ3pUNz/5N7gG4W2izgNY31CBKMQ
	q2+kSWBMWPHSuYCfrABK2wjoxhAjbG3HQgYnW9caRPR50XLRzrSnXJhTNWZYFWr4KxU/tS
	Lhsslj3xuCmwQF9pSd+eB4zLX5e3LxkNzboNZgZT8vwviWsu8Zvc7kJ6EZG2y0TfMfUMd4
	kXhD+GoufkgNjXdY+EoNKlhhBVgkpndlzJxLxNHlFzvqXDr5/AL2GXQiKVc+EA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:29 +0100
Subject: [PATCH RFC v2 07/35] spi: amlogic-spifc-a1: Consume dummy cycles
 directly
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-7-5c93f5e5d630@bootlin.com>
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

The controller programs the dummy phase in clock cycles, but the driver
converts the legacy dummy byte count into cycles. Advertise the
dummy_cycles capability and use op->dummy.ncycles directly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-amlogic-spifc-a1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
index c7cccc8de6dc..d99c72c7a965 100644
--- a/drivers/spi/spi-amlogic-spifc-a1.c
+++ b/drivers/spi/spi-amlogic-spifc-a1.c
@@ -90,7 +90,7 @@
 #define SPIFC_A1_USER_DUMMY(op) ( \
 	SPIFC_A1_USER_DUMMY_ENABLE | \
 	FIELD_PREP(SPIFC_A1_USER_DUMMY_MODE, ilog2((op)->dummy.buswidth)) | \
-	FIELD_PREP(SPIFC_A1_USER_DUMMY_CLK_CYCLES, (op)->dummy.nbytes << 3))
+	FIELD_PREP(SPIFC_A1_USER_DUMMY_CLK_CYCLES, (op)->dummy.ncycles))
 
 #define SPIFC_A1_TSLCH_VAL	FIELD_PREP(SPIFC_A1_TSLCH, 1)
 #define SPIFC_A1_TCLSH_VAL	FIELD_PREP(SPIFC_A1_TCLSH, 1)
@@ -269,7 +269,7 @@ static int amlogic_spifc_a1_exec_op(struct spi_mem *mem,
 		amlogic_spifc_a1_set_addr(spifc, op->addr.val,
 					  SPIFC_A1_USER_ADDR(op));
 
-	if (op->dummy.nbytes)
+	if (op->dummy.ncycles)
 		amlogic_spifc_a1_set_dummy(spifc, SPIFC_A1_USER_DUMMY(op));
 
 	if (data_size) {
@@ -321,6 +321,7 @@ static const struct spi_controller_mem_ops amlogic_spifc_a1_mem_ops = {
 
 static const struct spi_controller_mem_caps amlogic_spifc_a1_mem_caps = {
 	.per_op_freq = true,
+	.dummy_cycles = true,
 };
 
 static int amlogic_spifc_a1_probe(struct platform_device *pdev)

-- 
2.56.0

