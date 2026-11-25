Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629116;
	b=E9REKdf1VcD+ZJhFIJR56Mi4ysOVwntMJsXaAqk3TOrE/TpTeRC2x7ew4wH6i1h6Zo1U
	 kPjDM7kiJsjIp5pY27eZrW9zfl4MqAuPgKkaTo2+TA/3W0f//uz2F5dJJ0EVaoJxhg8nB
	 0JyI7Gj9aWQsycctyuBZXganZwbIn+WV+iVO1eKBXS52yNoLCfsLJOE735ZD2qZmCYZBX
	 Nibmth29K9xqDlwChmFN/KlQy6/SfpeqHKkIGGuW1F/L6QNdAZ1rwC+64oi3y400YbamW
	 HVJbXQUV5E4bZfJreB45d3O3sQ/AIa3ZpdsikG489dxPh3yo50ll+eD2oJkWPXiy9eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629116;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=q8BfvstXLNTUj+5boXrPQXXFN+Zijn0f6FlTbabfiXU=;
	b=gvWRP/G8sYtmObHhWVDUqcGhDRH/u8inqQCWIihBJVhVM/6hr9Vmlu4oLXAdqnRIVjQM
	 J+XlWQ6QuufO/Tedl1xQgwcN8Z58Sq4YmE8scjYC8YSctMtlXjQ5Gcrblc5xc0sjA2Rlq
	 5ZKttJ4aEF0SvEHCAHmwQfUt7FWumr2vpIn6nKWE96IlDz6v7ogRFTiFyUWpeyeydGRUj
	 9OFwtLM37hINAr8B0/D0EAXLJooWIsTvmk2xjMgaGLoyddt+Yb8hnNYhE2XwXETFJchXa
	 MEiMphrgK47Hb8u/r1szCJc/CC0/iYJlBgSO5Z8+DJL7kEgWtOrreexRZ2QAxpn9DbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=c182h5op;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F9E606A330
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F9E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=c182h5op
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 760041A17F9;
	Wed, 25 Nov 2026 17:51:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40DCC60480;
	Wed, 25 Nov 2026 17:51:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B777211E6B0CF;
	Wed, 25 Nov 2026 18:51:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629108; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q8BfvstXLNTUj+5boXrPQXXFN+Zijn0f6FlTbabfiXU=;
	b=c182h5oputdeGdLZCwJ5lOGEwgTpwvAjW5CjoqMTJxuyd2+k364QIcbmwb2hOAu442HocG
	0ifbjq67c3om7zY2FH0+bVCsrDpUZEcMMQQ5qgSHWUiOolYJ0nNjxB3ngX5AB4XlHanig8
	z4MeGabdbR9/oZ66HXf3YBvfjP/0LXaxUJgKWT17utiZlQwEho6Aya5vZuZgekVJKi+k4R
	PiXQKI0EtJiTYhueF0YaiWfaCBYSzBKPumBkJAGRvTFsANKzJ60Ab8GCg1+/cVvKtvGPVr
	QMm/HdeRkQFtGynCGnrZq1uIKbact2Q+fVCVRKlHzYo73gdFkCM+rF3+3/ZEgQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:16 +0100
Subject: [PATCH RFC 02/16] spi: spi-mem: Stop checking the dummy buswidth
 against board wiring
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
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-2-fd036402fd37@bootlin.com>
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
index c64e906ba919..9b8b8f2b3387 100644
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

