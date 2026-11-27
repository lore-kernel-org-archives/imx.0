Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789405;
	b=Ld3fhuWllb4uSjH6jXOwbJB1t7W6ulfAZPkhuckuOvGwiuCVDtwWsxzDRunf3e+kGRSl
	 WX7QhwNct5vRdHw6zyAeFPADCXGD8loKHtp/yVHEtbtE5F81fGA+8i95cwYvtyYNrCwrI
	 RhLLLnr1PcZtvd3Z5mKvV/Nd6l9+WCg+ox4BkTLVqbLlkQ5uIZKOu1XvsnzsJBvswEuwk
	 GEbiV+TihPOtkmcDZm5td3AbcK7gDL4xr97FFraPz+1zZaYK2MS9mICbTaYS6bdohtEKi
	 wokOtiMMr2ILk1mzLgkEkViaaMDDTKlKiwEjHpgwq257kpuSOxCbqVVqIR01R0HbTEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789405;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=rylelK5stBYHCgsJxDyVT3xR4v0rhOf4pwwUfxXYdUI=;
	b=jK12U8WQJ8z4fM+vi6F2w425aF3V4CAeHPBvjPRvrLXbQNLsqTvCSSv22NxOVauUQWgt
	 TipT+kAuwgvyPC8VJzhMWOu+yDwOgQKCs5zDeTrfFeIpaZ98SxXck5DX7qgFpUonZ0hrf
	 AG4jnQSmPU8uAD1W5YK5ERHmUXOBWgZw5Z4QfNhDNeSUddXWCrRXcgqfK0wiBSgK36fb+
	 Y51c8ufQ1BPAm0zysfhAhO1QngPoWPFEuFCSPbgHVKR9Qi2gabj8/EsiIGhDtSthCBNwh
	 X1PMWKpAo7rYzFWbwJ9z7GY/bNEwa8L8shDpsjYQxDaLSa96ZpzyRUK5swpiOCkR6lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mRvGwGBs;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DC8606A321
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 14:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50DC8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mRvGwGBs
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E2B5C4E417C9;
	Fri, 27 Nov 2026 14:23:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC8866049C;
	Fri, 27 Nov 2026 14:23:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 924F911E68FD9;
	Fri, 27 Nov 2026 15:23:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789396; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rylelK5stBYHCgsJxDyVT3xR4v0rhOf4pwwUfxXYdUI=;
	b=mRvGwGBsB7Q0f+u2y2l45pm0Ao7UyLtKjC1sSTO9m0GWZe6IX+kAoss9i+vTUkyJNYFkuD
	O3jUoVn6Uwniji42sexNruGK7GjUgzX64AswTbQdWBOunm5UO0L7BOFg0p5HEAxn7Y2AFW
	A33zX2vghB2+O1XYKzBKh0y2QmJ3Ywod3DVkqSv+J+kHo04xAmQqQ9P/setsueLWoH3xfw
	pJ2fHhV4yAqJb5C0J1kpTJBKxhanF0rGneoeMUVd0pPmL6gyQ/lCTERIjcLw9Xw6CfUx63
	yQdvi7ZGWgj/Zjo1D94ZqBSZHqoP/4FCbXdXTrHcPHa2EPG+Esgy4wBqsG7jcQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:23 +0100
Subject: [PATCH RFC v2 01/35] spi: spi-mem: Stop checking the dummy
 buswidth against board wiring
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-1-5c93f5e5d630@bootlin.com>
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

The dummy phase does not transfer any data. Its buswidth only describes
the pin state during the dummy cycles, so it must not be validated
against the board's Tx/Rx wiring.

Drop that check (the sanity check in spi_mem_check_op() stays).

Suggested-by: Pratyush Yadav <pratyush@kernel.org>
Link: https://lore.kernel.org/linux-mtd/20241112075242.174010-1-linchengming884@gmail.com/T/#m7cc1a5055702f5a42a8f3949c968842d845914d7
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
This is not really a fix, so no fixes/cc:stable is on purpose.
---
 drivers/spi/spi-mem.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 8047b7508c8d..648982350863 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -152,9 +152,10 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
 	    spi_check_buswidth_req(mem, op->addr.buswidth, true))
 		return false;
 
-	if (op->dummy.nbytes &&
-	    spi_check_buswidth_req(mem, op->dummy.buswidth, true))
-		return false;
+	/*
+	 * The dummy phase implies no actual transmission nor reception.
+	 * Its buswidth therefore does not matter much.
+	 */
 
 	if (op->data.dir != SPI_MEM_NO_DATA &&
 	    spi_check_buswidth_req(mem, op->data.buswidth,

-- 
2.56.0

