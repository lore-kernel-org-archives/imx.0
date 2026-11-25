Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629168;
	b=fcY2+0iS6JpGUWW56A40owZ5OG8QE9aO7LNDw3vF6+ucXNcogw19lVoQK53zl7PmUGQ6
	 bMIfi0jC3xARIpYqGAm9PqWwezZNqkRST9SUFE42vxBoskbniXAZBCHBPPjfJRxDzXYDE
	 WCaHAOFCto7/IsN/cD2JL8Fqi4TvQ7tqpzjkeq5bs0hwol/0n67ko3vSMselGTA3QDqR0
	 xtcAC1xKx6BG37t+pWnOHXZvkQV4UOhRgBfAOLt4cjNmCgrQV8A928AX9Du8N1CLTKN4T
	 BUKQLkyuol14jCzTM4hHVdzTtBSky4KmFza/wlGub5Kn92+VeipCHHoRo6Nk3Pgu9Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629168;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=3kouSNyK9R23I+qZ3mr2DQ2vQHuvZbqCaS8A5GKpSiI=;
	b=oX+MrHdznjVFJyndiCYywwtljLIlTFJYGGbj2sFMobociIUoyRpKhbjfQmGoFfT9Q9vP
	 0g6ASLHpdrZAEqKiW6WBFOQn3Gu8gnJT4n/2ntCCeeVFanSKl6sW6I6udFImMIFxqAoHw
	 R95TSgR/3o4kEcA04Dg9pHHG3wGgQg3vlaRXDj3CwMlGWYY9/snvZzmMOPnLfP0qVo/yh
	 UhDzD5EjRMfJUcx4AaoxpHK2C6y5QEq8m1qmPPVF3fzn+u8Jy1G/JTqOD15OOazdoVkPf
	 iyu8sZqEy6FYJP29G8jLHVT9uGF+WPL4HqRDxPLfm4/ctR8hpXc0PwjQpCY9Rgvps2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RYp9veoh;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5431C606A33E
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5431C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RYp9veoh
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 038274E40B00;
	Wed, 25 Nov 2026 17:52:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0E9260480;
	Wed, 25 Nov 2026 17:52:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B65A11E6B0D2;
	Wed, 25 Nov 2026 18:52:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629164; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3kouSNyK9R23I+qZ3mr2DQ2vQHuvZbqCaS8A5GKpSiI=;
	b=RYp9veohHs2JdLBosL+OsjxwlR5ySlzQOAAtmxVHB0PF+kGJfjYwbk9Zr8zNeXJ6OlEbgv
	6zMyoPjAOXUJULNnrP5XuerZtky0pwNWlOa/oUwIASW95rOPRxAwmAdBoEfqWhjloAAkRz
	+af48+G//LVpdAxvoMbQb1UibBI5CwcDQtJVmcpSki4kh3KMYcxwHtCgaBDn2SKGwmhk12
	Ayf5LyU9tRq5MLbV+cfO5AoxQxPhP0QmO9Hhnel5CvxyUPfGLyrWQpzO6gCul208u8Whpu
	KTRVmtC3+gA1XP/32Aztz+aRTBVY/MvNjItZCiK/GLlZt6TFoHBApm7tO375vw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:26 +0100
Subject: [PATCH RFC 12/16] spi: rtk-nor: Consume dummy cycles directly
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
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-12-fd036402fd37@bootlin.com>
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
 drivers/spi/spi-rtk-nor.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-rtk-nor.c b/drivers/spi/spi-rtk-nor.c
index 55ea7c371854..6febeee2541d 100644
--- a/drivers/spi/spi-rtk-nor.c
+++ b/drivers/spi/spi-rtk-nor.c
@@ -92,18 +92,10 @@ struct rtk_spi_host {
 	size_t			dirmap_size;
 };
 
-static u32 rtk_spi_calc_dummy_cycles(const struct spi_mem_op *op)
-{
-	if (!op->dummy.nbytes)
-		return 0;
-
-	return (op->dummy.nbytes * 8) / op->dummy.buswidth;
-}
-
 static void rtk_spi_read_mode(struct rtk_spi_host *host, const struct spi_mem_op *op)
 {
 	u32 opcode = op->cmd.opcode;
-	u32 dummy_cycles, val;
+	u32 val;
 
 	if (op->data.buswidth == 2)
 		opcode |= DUAL_MODE_EN;
@@ -113,10 +105,8 @@ static void rtk_spi_read_mode(struct rtk_spi_host *host, const struct spi_mem_op
 	val = readl(host->regbase + SFC_CTL);
 	val |= RW_DATAEN | ADDR_EN;
 
-	dummy_cycles = rtk_spi_calc_dummy_cycles(op);
-
 	val &= ~SFC_CTL_DMYCNT_MASK;
-	val |= (dummy_cycles << SFC_CTL_DMYCNT_SHIFT) & SFC_CTL_DMYCNT_MASK;
+	val |= (op->dummy.ncycles << SFC_CTL_DMYCNT_SHIFT) & SFC_CTL_DMYCNT_MASK;
 	writel(val, host->regbase + SFC_CTL);
 
 	readl(host->iobase);
@@ -192,7 +182,7 @@ static int rtk_spi_command_read(struct rtk_spi_host *host, const struct spi_mem_
 	size_t len = op->data.nbytes;
 	loff_t offset = op->addr.val;
 	u8 opcode = op->cmd.opcode;
-	u32 dummy_cycles, val;
+	u32 val;
 
 	writel(opcode, host->regbase + SFC_OPCODE);
 
@@ -203,8 +193,7 @@ static int rtk_spi_command_read(struct rtk_spi_host *host, const struct spi_mem_
 	if (op->addr.nbytes > 0)
 		val |= ADDR_EN;
 
-	dummy_cycles = rtk_spi_calc_dummy_cycles(op);
-	val |= (dummy_cycles << SFC_CTL_DMYCNT_SHIFT) & SFC_CTL_DMYCNT_MASK;
+	val |= (op.dummy.ncycles << SFC_CTL_DMYCNT_SHIFT) & SFC_CTL_DMYCNT_MASK;
 	writel(val, host->regbase + SFC_CTL);
 
 	return rtk_spi_byte_transfer(host, offset, len, op->data.buf.in, true);
@@ -346,8 +335,8 @@ static bool rtk_spi_supports_op(struct spi_mem *mem,
 	if (!op->addr.nbytes && op->data.nbytes > 1)
 		return false;
 
-	if (op->dummy.nbytes != 0) {
-		if (op->dummy.buswidth > 1 || op->dummy.nbytes > 7)
+	if (op->dummy.ncycles) {
+		if (op->dummy.buswidth > 1 || op->dummy.ncycles > 7 * BITS_PER_BYTE)
 			return false;
 	}
 
@@ -464,6 +453,10 @@ static const struct spi_controller_mem_ops rtk_spi_mem_ops = {
 	.adjust_op_size = rtk_spi_adjust_op_size,
 };
 
+static const struct spi_controller_mem_caps rtk_spi_mem_caps = {
+	.dummy_cycles = true,
+};
+
 static int rtk_spi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -535,6 +528,7 @@ static int rtk_spi_probe(struct platform_device *pdev)
 	ctrl->mode_bits = SPI_RX_DUAL | SPI_TX_DUAL;
 	ctrl->bus_num = -1;
 	ctrl->mem_ops = &rtk_spi_mem_ops;
+	ctrl->mem_caps = &rtk_spi_mem_caps;
 	ctrl->num_chipselect = 1;
 	ctrl->auto_runtime_pm = true;
 

-- 
2.56.0

