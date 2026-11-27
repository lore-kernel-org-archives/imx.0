Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789667;
	b=y1Vbjeur1EJU2jXoTN4OP+aokZIc5xFDnqvIA4N8JThWTyCI3omZ3i54lhvCy1RIwUPu
	 HL2jlfN70hNVX5d+jkJo1ovC/EgGkGmQcpwmxpf25SRC6j1hySEiWGgoPMmyW6llWxZCJ
	 eO/HwmPKg+B0rbRugxYpBfobvRs8hK3lXq+1FCIIQJBRIaeevkl7tDXpnC63sEXdmFiHz
	 5QuGkd0EfrMX7zYNEKvsEb4UX6QOv1UoQ7tJ/pjNtoFLy6tQNmfY+Xw+kv9bo15PNiaXs
	 3TQH1InGCHdYNoBU0uOStLvNzCpOsS05KDdzq4GnMbohYaZenBGZd1bbasBmbz6igzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789667;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=UFvs3Sh13p9vwNL30rjxRs8Hqaot3198sQb8Lsn5iWU=;
	b=WYO58SKsinzeV3BWR+IeR1G/zZ49oQPHW6l9xRnu1SqwQP/RLZJhVj7GvEbdS8wvbn4p
	 h0QCoZAgD9H/t9XBu+iZt1KSKtnX5uP9WNQ2MQV+9SNg5csQbPPTpn+zs20aue5WV1uqN
	 HDW6Nqi5PTnJG03jpaSCLPlDtoGzbvgWSyBhE68c1GlZNGIpeqNXx3sKlr52voY6mMngf
	 ERP8p4QyhBNzLR5a1JkPbFY2mC6oiA9gnhl5xpmbPMFlXc55MTCW+ja9aXO0owMq3o8HM
	 bYp2HUuVsECispLonPuvlbVAr1Tu+y+oDmMop4wYTXetaQZD5fZLa5VgBFrgpPCUEjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NteD1S8Y;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E586D60A6F60
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 14:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E586D60A6F60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NteD1S8Y
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 91AC11A1842;
	Fri, 27 Nov 2026 14:27:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 630666049C;
	Fri, 27 Nov 2026 14:27:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B6D411E68FF4;
	Fri, 27 Nov 2026 15:27:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789661; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UFvs3Sh13p9vwNL30rjxRs8Hqaot3198sQb8Lsn5iWU=;
	b=NteD1S8Yj/P7aVw1HuIweq3O7KLp9amnSIsK6QkmDHxqskey209N3M+/eTBFY9B57D2I7i
	6sT0j3eoJTJ+YTp2js9v31pzgeHhIQEKbvBTH/YhqmaNdMZn3rT26mqPNFyyxSUhAxngWn
	nGyOXp9/HSsYJP7Un2zl3rWUavFJh2isWWuZYGGHY86Ni46sSa8+Vz8nVFwcBc/V/QdUuW
	B6Uj2pT+DbXl5rnDI/Q78Mje3MgIGFq4lYb6Ui7rF0eyu1vFydk9TImLvhrw4WB7ORsIjC
	2CEw8mcJq1MJbHUcLRALJ3vmbFd0G5mNk3L7MDQemBe5sn6SaKkkpp4L9USviA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:54 +0100
Subject: [PATCH RFC v2 32/35] spi: stm32-qspi: Reject excessive dummy cycle
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-32-5c93f5e5d630@bootlin.com>
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
 drivers/spi/spi-stm32-qspi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 993b09cc5124..751810a267ff 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -761,11 +761,17 @@ static void stm32_qspi_dma_free(struct stm32_qspi *qspi)
 		dma_release_channel(qspi->dma_chrx);
 }
 
-/*
- * no special host constraint, so use default spi_mem_default_supports_op
- * to check supported mode.
- */
+static bool stm32_qspi_supports_op(struct spi_mem *mem,
+				   const struct spi_mem_op *op)
+{
+	if (op->dummy.ncycles > FIELD_MAX(CCR_DCYC_MASK))
+		return false;
+
+	return spi_mem_default_supports_op(mem, op);
+}
+
 static const struct spi_controller_mem_ops stm32_qspi_mem_ops = {
+	.supports_op	= stm32_qspi_supports_op,
 	.exec_op	= stm32_qspi_exec_op,
 	.dirmap_create	= stm32_qspi_dirmap_create,
 	.dirmap_read	= stm32_qspi_dirmap_read,

-- 
2.56.0

