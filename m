Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629191;
	b=FBaRf6LBMLRfIiVv+SFi4oGMzcGsQcHD6mZK75b5r0jiAfbwU9XnsUB0St1TWMAFJGS9
	 wMxEw63mCE511RU7leIe9hTNtnbmxLtLy2J/96V+LQ75iIv5Tc/aUucpgQ1vH8dz96lrt
	 8UNQBUE4VG344/cC2QBlPxwJSo6MTGFIa565vDWn3sByxo/7EQMtJw3LgqL6QXz0ZT/NB
	 hZccBQqUWic2Rht1WOB+UhB+QB+C6seu2QoJdAS/U831PbLJw8Y/hPQokjAJ3wjmhsRym
	 1eD3Kthr+vBUh2KGZs0YOkMDBCiVh0qY0SZlYxvAwZpby0nJylY77OCbGRzG3E5/dfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629191;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=4e/RWoOHhDL2sVy5LbDO8W9W8W0olcvrU1DPDGSNAcg=;
	b=KM+rcJZPrsMoRSVeeUTsptn8FQI4hIEOW8roG3vWnTwSF7nxBXUJMJYQeTQrvjoG/kzd
	 fFeTgnVeOpvQIuFKmR1OI2zSEmYtsXVe0bWsmYxZSqbU63pMWpQ0O6HGb8gu0pBM1cvrw
	 E+czrV5/b97yFu/wyyQf477dt9BF4015l7YeNw0OTF39cX2bQqpaylhZoh/k6r632+Yq0
	 pOeIvljNWSwyRpfTzBPrqjQEHFraMg/oytyzCGQAEhwnwcDc/rG+Kd2GzUDCfS2ld8Gw0
	 rl0dG34zwNuS459rsFDvDSTmzQgky3XoH5HOYPuBGEssRMbKru5B2pXDZk7m5LX0gpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0I9axvAt;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14AF60A260E
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C14AF60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0I9axvAt
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 66CBBC2BB3D;
	Wed, 25 Nov 2026 17:53:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DC9B60480;
	Wed, 25 Nov 2026 17:53:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A31611E6B0CE;
	Wed, 25 Nov 2026 18:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629183; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4e/RWoOHhDL2sVy5LbDO8W9W8W0olcvrU1DPDGSNAcg=;
	b=0I9axvAtYjofLkkZCOhpkZRXZO9wrCEJ9W8xd0tJka7dFgvXC9ZZM3ONe8yTXqcbmWdvmU
	2u0mC3vpvM8T1YH13qF+TwMiyqy4HUMouxTgv812jL9BdodUDrmSJh+5DlxTB8eTJWCkCp
	rDMjiGhgogKRV3B9FSVGqeE/jtnNyClRK3hFiSQ+x1v0LB3Ej1kjp8qdQT5IkX1KUGcV90
	iqn37JYOcUO43avU/it4dEEZ25Lu3wpqlZW6pfJQNCGZfSnkv1IJuCRH3HVTAYlePx5now
	YOLAwRlHqdIagHAqfLWoZE2oNxTwIAlohyg3QGNtn4pIx4KhaFiynLXm3ndyyA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:29 +0100
Subject: [PATCH RFC 15/16] spi: stm32-qspi: Consume dummy cycles directly
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
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-15-fd036402fd37@bootlin.com>
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

The spi-mem layer is now capable of providing the dummy phase in cycle
units rather than bytes, provided that drivers advertize the dummy_cycle
capability. Since this controller is consuming cycles and currently
converts bytes into cycles, flag it capable to consume cycles directly
and drop the extra conversions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-stm32-qspi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index b77daba6db83..993b09cc5124 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -393,9 +393,8 @@ static int stm32_qspi_send(struct spi_device *spi, const struct spi_mem_op *op)
 		ccr |= FIELD_PREP(CCR_ADSIZE_MASK, op->addr.nbytes - 1);
 	}
 
-	if (op->dummy.nbytes)
-		ccr |= FIELD_PREP(CCR_DCYC_MASK,
-				  op->dummy.nbytes * 8 / op->dummy.buswidth);
+	if (op->dummy.ncycles)
+		ccr |= FIELD_PREP(CCR_DCYC_MASK, op->dummy.ncycles);
 
 	if (op->data.nbytes) {
 		ccr |= FIELD_PREP(CCR_DMODE_MASK,
@@ -593,7 +592,7 @@ static int stm32_qspi_transfer_one_message(struct spi_controller *ctrl,
 		 */
 		if (transfer->dummy_data) {
 			op.dummy.buswidth = transfer->tx_nbits;
-			op.dummy.nbytes = transfer->len;
+			op.dummy.ncycles = transfer->len * 8 / transfer->tx_nbits;
 			dummy_bytes = transfer->len;
 
 			/* if happens, means that message is not correctly built */
@@ -773,6 +772,10 @@ static const struct spi_controller_mem_ops stm32_qspi_mem_ops = {
 	.poll_status	= stm32_qspi_poll_status,
 };
 
+static const struct spi_controller_mem_caps stm32_qspi_mem_caps = {
+	.dummy_cycles = true,
+};
+
 static int stm32_qspi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -856,6 +859,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	ctrl->setup = stm32_qspi_setup;
 	ctrl->bus_num = -1;
 	ctrl->mem_ops = &stm32_qspi_mem_ops;
+	ctrl->mem_caps = &stm32_qspi_mem_caps;
 	ctrl->use_gpio_descriptors = true;
 	ctrl->transfer_one_message = stm32_qspi_transfer_one_message;
 	ctrl->num_chipselect = STM32_QSPI_MAX_NORCHIP;

-- 
2.56.0

