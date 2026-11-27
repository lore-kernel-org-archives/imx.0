Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789557;
	b=HxJP0BU7xJoYuVeL5yOXWD9A8KJ3KtnLzeY7MYtOzA444IdwoAfsjiBJMMD5i92vOErt
	 CfnPvy+IKwhw89Vp9iPcVkvPcKGt7meQnjsyElAMT+dAl95OT/X/j3Z/QxWWJqos148hp
	 5KcOcx3DHaLqgBGAMgdhzgwz3ocinAYyz5SyYeC+CHoVKM0kysxUo8856Dei1B4ADRgqJ
	 jLu4nMKp2q5IEJYSpbW7vt67Ws/yH2bg+3t6kNo1AEJAhpqvMv5ymWbR8hdN1qALScMsH
	 5HM28e6WTNnx7JkluHWryqLnrix+XbLDL8AlyWpGqb9KiundPf8QBSIhSr/TdJZHyGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789557;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=6WBYjLTAkUt6pTInKgBaz0rXcOZ9utre/zbZ1WPUTlA=;
	b=SxkMdDUBC8+R1ZqaluMtsTYSXK/GMnIpbkxEvnlnc92vZogJ3CWiagoHzMmUwui5XSik
	 do7AnsApjzmiL14I2bv+XxGc5NT/lbGIzrdzB3R+nAz/cr+GSSLQJD3cRkzT/ScW1dF4r
	 2znT3YBGriiuu4khQZfNN5Hi6Nq3ufPlRBQGmHaOv67mWIG8R3vIQqEZljtyYW6ThLiS+
	 aiGR7vApnVOfUhi2iDjE72AXSNqKrNwP10ACANhtL8SK01cjeRZQhn2+0u7CDz7jEpqxr
	 odECDBOjJE12LPpfjD1SoXAOH4WoCkE+b0w5UDNWmJnwXlhUpvdcE/tXtvMyPoyCAMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ARVAU9R2;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F88606A6BF
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 14:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F88606A6BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ARVAU9R2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 279B91A1838;
	Fri, 27 Nov 2026 14:25:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E40556049C;
	Fri, 27 Nov 2026 14:25:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4691111E68FF9;
	Fri, 27 Nov 2026 15:25:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789552; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6WBYjLTAkUt6pTInKgBaz0rXcOZ9utre/zbZ1WPUTlA=;
	b=ARVAU9R2xy9uuRKVkdmefjQoskOgHFe8fpI2N2Kov/njbz9iRUs6eTvn8rw5VXuBZfOrkf
	8orW/O6YvvntEFXT5BlcZGMtPYyPT0c21XToq9cTbVnwkrxrDpffYfFBzezjEGK4vFIpgo
	GudppOKqbE1uqFaEUuumhvwQsIi+o4BHIumyGVTmd6mzmCuOwRy/jEOXdH4J0L59TEniRd
	FWdBuytjzdpL/mKJxUexfL3MglNvAUZhnLXvSwWMsOdGP9NewhS2owG5RrDxU0WnZDSMkS
	pTrZqtldbTss89snDMycmGpBcOUD578uKhrbSholrl8JGrhfxdyuiF0qdS2e7g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:41 +0100
Subject: [PATCH RFC v2 19/35] spi: nxp-fspi: Reject mixed DTR modes
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-19-5c93f5e5d630@bootlin.com>
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

The controller only supports operations where all phases use the same
DTR mode. The mode selection in nxp_fspi_select_mem() assumes either an
all-DTR or an all-SDR operation; mixed DTR operations would be
misconfigured.

Reject mixed DTR operations from ->supports_op().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-nxp-fspi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index e6fdded67a00..04999369dd1b 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -536,8 +536,18 @@ static bool nxp_fspi_supports_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op)
 {
 	struct nxp_fspi *f = spi_controller_get_devdata(mem->spi->controller);
+	bool all_true, all_false;
 	int ret;
 
+	all_true = op->cmd.dtr &&
+		   (!op->addr.nbytes || op->addr.dtr) &&
+		   (!op->data.nbytes || op->data.dtr);
+
+	all_false = !op->cmd.dtr && !op->addr.dtr && !op->data.dtr;
+
+	if (!all_true && !all_false)
+		return false;
+
 	ret = nxp_fspi_check_buswidth(f, op->cmd.buswidth);
 
 	if (op->addr.nbytes)

-- 
2.56.0

