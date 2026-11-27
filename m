Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789516;
	b=X4IQPggEPuxoRevGzjtMmXZgGc/frdu5IW23EWBHm17WzvpGbsXNUS2wpU0Ygqcgb97S
	 BEnLfrjWrdv0et5VAeoEuxxf6eXfjqrgvY2yYs8EtjRrdb7d4t0h3K/msBG9rLKWCFN7b
	 mxVirkskerip0Y7mFGgni6ngQXjS5fzwRTcB2QcUwXqqaRmUoZ0A90ra7UWsE1ta0pE3f
	 tY74MrAoArou+tcalSd4oKm6Q33DGgRYJr3CIG2zbexKjudwlTa7TRJ2KxKbcKoANyMQj
	 QCfME+wH0v3rrgSf74PtBH/p1k6IdT9PZ7ptVjZ8xsgrSYuBthmkvPQ3KgcO59L4cnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789516;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=jwWNjtl5ORcZ1deftfr5RsBJJtV3zrm7nwySNJ1wAXA=;
	b=E9TQqb0w0kBlQ4n7HlXY93bUFW67A7HC8W3F2Dtpz9seOO6/bE+WCW3f++nlYFZrfl7P
	 PRpZCfs8CFxulE6VhtBbOapCi9+2PhVdGI52fabuSMOGtnUMtywJugGqqI4qAWfuV3FZw
	 exWS+HQfD5UNxiRy7MojfcaEFYOVCBMH37Udgj5td1SLNgJLW7bdkGHqnr76zH/6eY2fg
	 ioS22R1lvI4ke65FFu5op4d1qSopbmHd5NXY85OPmiFLN/x1925bUANMP7TDlH843wsf/
	 whelT3DHHMetg6a8J9TQ4woi36SW5pDZDIVyNIWyDFzvSQ8CoP1GceY8NZv2BLxU5oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UGbmJbOd;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678D5606A6AC
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 14:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 678D5606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UGbmJbOd
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 20B2F1A1840;
	Fri, 27 Nov 2026 14:25:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1F2A6049C;
	Fri, 27 Nov 2026 14:25:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CE7911E68FF9;
	Fri, 27 Nov 2026 15:25:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jwWNjtl5ORcZ1deftfr5RsBJJtV3zrm7nwySNJ1wAXA=;
	b=UGbmJbOdcNVCi3ELelQsVl1jbj/ViXJ795sQ5pB3eqnkHRfW37/lv0w4DTEUZsimBvjKCZ
	bwLNRPX6CT6PCRoWg4O8d0RqL8UAZjsezDbumzXw1CxZHA6jNaFMZm96NIyled1ziyLbto
	EDofliexKT20UNgI/5pJY4LUYzTNFdlI8Y+PHZ1gbd+CdwFHrEYUQSkSfi+aUFjpRu06Tk
	zbPC6kZLAYg0sGkrMBcyaw6bKjWtQzrQOmpW4Ka+gZ/Hgi5+nlbcUbjGZ5pzPxjrE2Wasr
	ysa9IYTRL1ou53CorKfDhH/uN5bAQr9L6imMuj7CJS7cODFKpnbgndqbzELLtA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:36 +0100
Subject: [PATCH RFC v2 14/35] spi: cadence-qspi: Drop now useless checks
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-14-5c93f5e5d630@bootlin.com>
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

The controller programs the dummy phase in clock cycles, so the dummy
buswidth is no longer used. Drop the check requiring it to match the
address buswidth.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 97725ffeae93..d52e0aa1ea41 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1522,13 +1522,6 @@ static bool cqspi_supports_mem_op(struct spi_mem *mem,
 		return false;
 	}
 
-	/*
-	 * The controller has no separate dummy buswidth: the dummy phase is
-	 * clocked with the address buswidth.
-	 */
-	if (op->dummy.ncycles && op->dummy.buswidth != op->addr.buswidth)
-		return false;
-
 	return spi_mem_default_supports_op(mem, op);
 }
 

-- 
2.56.0

