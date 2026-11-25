Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629107;
	b=y3s4eSH8KYPi0iYNMFvAGOyYl/iADwJiLibBrScZYyXRuZ+U2Wzo79flFrXEFu4bNCj2
	 11xJLwglpAawSj1iyH0TCeVeCKndYQEiIorpnlRdj/eXYNNEe5ByAeMcOkYgW2s2buXu9
	 sHHUW+14izH0wC+5n3qI3TlehoCNFoG19guKfv0dBS84xAzEHlSsbXhhhGcTWBAaVN3Df
	 GcMM1EBtObYTTTnVyrLdqZwIBl45i1UbNdBu5cja4lCffX4sKBhODmHdNDhp9tjGmHk4h
	 fzNvVVEza/CHqJHi8ZDxZO626/MkOXRUbtkj2SE2P7wajbHIVJHXHFkEkLRR5UxWDrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629107;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=fhMRTzkLSH5MxpIkUJMv2XmW944j+sfZQtVHooeXfNc=;
	b=YwZeYcKLFzS1OE3pV5e5W3iT7IcAdwZgxXyEwZ/apqOa5xcoG7/f8hQD1svFEDdEm21c
	 EsERYymhhCOC9sJ10HsYZukS7MUlrwF91aPN6bjt/DvRzypxzNsOOS+M/FT7foB378EQa
	 7GGmam2DezHz1LjK7lxMkriLTlsYaCHCBgiPn0sw07QydClShGeWiLzwY5YGdWKZQSqQA
	 fDn9kSbFlDti+d1rZVGsZUduUTJwlmRKkR6SuHaARUw5zovLDv6Cx2Iw/Tjf+hssP+B7E
	 15Mp4Ps29gTxnNkgZgmF7Y1NT81fpS9/wM4UPlFReQiS3oIKb8Ti/5QoYZHKIcqolGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rjIba73h;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B03E606A682
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B03E606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rjIba73h
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 570AD1A17FB;
	Wed, 25 Nov 2026 17:51:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 203C260480;
	Wed, 25 Nov 2026 17:51:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6C4E11E6B0CB;
	Wed, 25 Nov 2026 18:51:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629099; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fhMRTzkLSH5MxpIkUJMv2XmW944j+sfZQtVHooeXfNc=;
	b=rjIba73hZY4git7Vg/XhATFE76hCuXmQOIhpokw7phcPJkpu77IDcANyPWfhmWmpm/wwkw
	7zbQD+YFwagsL7TNez3rOk+tOFWqoaCfJAx1uuqP216t7R8+f4CsYaufNaWbd4w2ksU6ls
	o09e1p0lj1XUqz7LHURSpJFtq+Htd9sNCARv4WJwIT/kU4e9pb0KPG4o3J5r6pNSJh8k44
	2smGQ9sg7zZrrVxSReD/fxJB3988w6XyQ0OTBaxpRuQWXI9S5DchsjnJOE9ylpGWH584fK
	UT5SFyzDHqH0XSUkJ1oQK2DgBG1Vi5MEfWCZMTtyf4OYFjw9GBbwtUwG2zVYGg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:15 +0100
Subject: [PATCH RFC 01/16] spi: spi-mem: Handle a corner case while
 sanitizing ops
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
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-1-fd036402fd37@bootlin.com>
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

Some mixed mode operations (such as 1S-xD-yD) will be flagged with
op_is_dtr but will not enter the ODTR checks. As a result, the number of
command bytes will never be checked.

Reorganize a little bit this helper:
- If the operation contains a DTR phase, sanitize it.
- Then sanitize the op, should it be:
  - ODTR (8D-8D-8D)
  - anything else

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 8047b7508c8d..c64e906ba919 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -170,6 +170,7 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 	struct spi_controller *ctlr = mem->spi->controller;
 	bool op_is_dtr =
 		op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr;
+	bool op_is_odtr = op->cmd.dtr && op->cmd.buswidth == 8;
 
 	if (op_is_dtr) {
 		if (!spi_mem_controller_is_capable(ctlr, dtr) && !ctlr->dtr_caps)
@@ -177,23 +178,22 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 
 		if (op->data.swap16 && !spi_mem_controller_is_capable(ctlr, swap16))
 			return false;
+	}
 
-		/* Extra 8D-8D-8D limitations */
-		if (op->cmd.dtr && op->cmd.buswidth == 8) {
-			if (op->cmd.nbytes != 2)
-				return false;
-
-			if ((op->addr.nbytes % 2) ||
-			    (op->dummy.nbytes % 2) ||
-			    (op->data.nbytes % 2)) {
-				dev_err(&ctlr->dev,
-					"Even byte numbers not allowed in octal DTR operations\n");
-				return false;
-			}
-		}
-	} else {
+	if (!op_is_odtr) {
 		if (op->cmd.nbytes != 1)
 			return false;
+	} else {
+		if (op->cmd.nbytes != 2)
+			return false;
+
+		if ((op->addr.nbytes % 2) ||
+		    (op->dummy.nbytes % 2) ||
+		    (op->data.nbytes % 2)) {
+			dev_err(&ctlr->dev,
+				"Even byte numbers not allowed in octal DTR operations\n");
+			return false;
+		}
 	}
 
 	if (op->data.ecc) {

-- 
2.56.0

