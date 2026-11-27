Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789619;
	b=elpC9yl6Ber2s7YorjeejuvyWnUDyyCAkoePyEjiQom06xcabMaDEqfq+h1e7v3Je9cr
	 LEH64VK1kb1COv4+L4YgGpwGGCC9by4as1Xha1gw4kCJNTT/4Hef+mkgBriX7v1BaDyl1
	 +mb1lzUR4ArrTRQ17r+Jh4BoH+hYKbcIOftIC4kumqaoxB7r7VGWnnCeD0EGjYd2CdD3D
	 QXYmA7PbBI50+SvBIHVI/dGht3mcoJiyz+FKZ/L8dgGnMw3Kz72bfP2b0+k6j1sKzifaf
	 cCO0UlCx/i8VIIatkZ+IhKj6o+wnvycDlzaiuAy0uhjhygXk0tWkvgfREDrc+qd/xmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789619;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=RkWpdIcMYE1qUrSwQ6cT++4Zmo/YUx2kY/UpVSD4g1U=;
	b=0/oVfVa5aaKWMN3FMaPLRaZc3yZmfAw4bq0evcUpLY9cMnEGOY2+p+pia2nQHsA4BmVJ
	 TVmNDWP3ldRhqaxJGGqviq4fBiNVosy0nc/wpjD9D315AZaSDAHhjBxwhbVzYKyjvkpyA
	 azIoOBT8vpwlDuOcPwzjn3ttqRx68B7QMxauAdMmoVz92BqcXSGBnANNcK/MXYmY7CRjf
	 IzGH9jbboMXU+ksnOMD1DUOJ48ocGN8h+UCoV1xwhYy0Wt8lZBnCBDuSfpKkt1Xv2lh7o
	 Egb2rCydf9hbAha1BO1LH1DTo+GszAiewPkxjxa4kHGSaH8rCccfGHwSY05kl3jmTyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xUKHApLT;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A008606A31E
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 14:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A008606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xUKHApLT
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 03782C2AC4E;
	Fri, 27 Nov 2026 14:27:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 380A76049C;
	Fri, 27 Nov 2026 14:26:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67FC511E68FF4;
	Fri, 27 Nov 2026 15:26:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789614; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RkWpdIcMYE1qUrSwQ6cT++4Zmo/YUx2kY/UpVSD4g1U=;
	b=xUKHApLTmpzwZ0shJxRBf3V4t+FY3xbHepnyoQtp1vN/aFk2tnCz/PEUKH/vV/zT/u8Z0r
	fyHpysVFXcZrIkHcEJjMoBZIgRUFAPIh3xO62fcBGZK67KqOrd8v0M7fQ+TnfhhlWZ2j4S
	Vi1+zd91hXkjDpMNV18eGD37J1SYrAuoOW6HxGoNHaXCwzW8LOtSAo0+oFx58pp2+WTmbU
	l7e6q514l4qPFU8+JUnOEc7flUpJlvE4bLUpTXXPcsqGrXgxV6OTFlyG5vookvNpeffMc1
	ExLhV6MDJgeUjiRlbjy/mCu/YMnGDGl6NCwwa5GEeWE3qdLCp7BIAWyLD1laBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:49 +0100
Subject: [PATCH RFC v2 27/35] spi: sn-f-ospi: Consume dummy cycles directly
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-27-5c93f5e5d630@bootlin.com>
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
 drivers/spi/spi-sn-f-ospi.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-sn-f-ospi.c b/drivers/spi/spi-sn-f-ospi.c
index f0320e96fe23..2f6d493a1ba4 100644
--- a/drivers/spi/spi-sn-f-ospi.c
+++ b/drivers/spi/spi-sn-f-ospi.c
@@ -104,7 +104,6 @@
 
 /* Parameters */
 #define OSPI_NUM_CS				4
-#define OSPI_DUMMY_CYCLE_MAX			255
 #define OSPI_WAIT_MAX_MSEC			100
 
 struct f_ospi {
@@ -114,14 +113,6 @@ struct f_ospi {
 	struct mutex mlock;
 };
 
-static u32 f_ospi_get_dummy_cycle(const struct spi_mem_op *op)
-{
-	if (!op->dummy.nbytes)
-		return 0;
-
-	return (op->dummy.nbytes * 8) / op->dummy.buswidth;
-}
-
 static void f_ospi_clear_irq(struct f_ospi *ospi)
 {
 	writel(OSPI_IRQ_CS_DEASSERT | OSPI_IRQ_CS_TRANS_COMP,
@@ -348,7 +339,7 @@ static int f_ospi_indir_prepare_op(struct f_ospi *ospi, struct spi_mem *mem,
 
 	f_ospi_config_indir_protocol(ospi, mem, op);
 
-	writel(f_ospi_get_dummy_cycle(op), ospi->base + OSPI_DMY_INDIR);
+	writel(op->dummy.ncycles, ospi->base + OSPI_DMY_INDIR);
 	writel(op->addr.val, ospi->base + OSPI_ADDR);
 	writel(op->cmd.opcode, ospi->base + OSPI_CMD_IDX_INDIR);
 
@@ -553,9 +544,6 @@ static bool f_ospi_supports_op_width(struct spi_mem *mem,
 static bool f_ospi_supports_op(struct spi_mem *mem,
 			       const struct spi_mem_op *op)
 {
-	if (f_ospi_get_dummy_cycle(op) > OSPI_DUMMY_CYCLE_MAX)
-		return false;
-
 	if (op->addr.nbytes > 4)
 		return false;
 
@@ -580,6 +568,7 @@ static const struct spi_controller_mem_ops f_ospi_mem_ops = {
 
 static const struct spi_controller_mem_caps f_ospi_mem_caps = {
 	.per_op_freq = true,
+	.dummy_cycles = true,
 };
 
 static int f_ospi_init(struct f_ospi *ospi)

-- 
2.56.0

