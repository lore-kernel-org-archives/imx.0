Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789418;
	b=YkufE78SzFc6sF6tFHD9D8iwYzuFNLp9HM3DfhlhQ2eVrGetSupGLLTn6Ww2suGeexP0
	 P0tSfhNOfqD2gkgaIo3TpgcE+t1t1JgeQx40RvgLTfg52K00adctKCdtm/SxuRBi2jvSX
	 LFqekbAQc+qacevgNuxtJyZPiVvD+9RMtFwU6VHcKPtTT6lQ3Sfg8EU1PjhxmKK8kIWHf
	 Su7ZrjuBqpaX14xfWmTcm5SdkRyosi9gynPtTzutEU0oxPu43TuHNQC711nI8LJsf9wlm
	 +VIDH+Xm2IMW+Nd5nSUa/DDW1H2wpGE4uQbnJrIaw46RDVQNmvyYZj+pjFPZLt0ZTQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789418;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=YL0LWj0GcbHfK49EIrBlf9jCG/E4YqaKYD91ZbSxEeE=;
	b=0vgPDQPVFoBiYY7IgSL7ufo3bytI2mAKgRN+36RoMAQUVOe7VV7zn1FIMKiO+iszl14v
	 nsVK3CLDQucsZaO/OtuMb6IMj9cRAXG5fr6LcEmEmZ+MMzyz9RkJjv31fLU1AmDuYj623
	 L1tpmfQohT7LbZj23PCxfqYmcg+9/nFIrdFllvF0PJQY3YRhLTxVG/MblA3njXUwK7b7R
	 yHs8VUyi3cNiDZnOXO8ICokaL+T2dN0QDHcxT3UBKgoC7deCoUMm8KXWhT3HjlbtOz+xF
	 B4EqjP9bA8vxTFAeYgAYCp4KPutNz7b1sKb9npQyRijNcIGhbwJql1WCMiqaFO3+4ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qQwaRkz1;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6097606A31E
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 14:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6097606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qQwaRkz1
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 998734E417C8;
	Fri, 27 Nov 2026 14:23:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 663A36049C;
	Fri, 27 Nov 2026 14:23:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BC0E11E69006;
	Fri, 27 Nov 2026 15:23:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789408; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YL0LWj0GcbHfK49EIrBlf9jCG/E4YqaKYD91ZbSxEeE=;
	b=qQwaRkz1NcTtKMJ3rcaD9AaD0G88VYsq9rRXNdRhGxFwrpHJQNa4Qan2umCsy+PgAzkjJi
	YbIeVsEiyfbdLNBIWdd319ntMr1ek7feEq/y0wE2JDkJRgY51bvte2zxJidEhNgWWLyVtt
	5fT4uEQYUESgkzfJYZG1S1+J6VsQWhjPWLBP8TGnXE4GP52SSYhPaagtRkLcR046vEep9V
	/7NBqPAyP0q9YFqATDPFlJR4ttvE+XUEYcuGcu+Tfz1BEYBsfm+/R6dvMss+C4T3MmNQMB
	LK48fjtnD5qHJws2gtwCMBizByQA/gXTJ0ray9Gwg35xbRdb/lRy8A95FuL9CQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:24 +0100
Subject: [PATCH RFC v2 02/35] spi: spi-mem: Fix the odd byte count error
 message
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-2-5c93f5e5d630@bootlin.com>
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

The check rejects odd byte counts but the error message claims that
even byte numbers are not allowed. Fix the wording.

Fixes: 8618271887ca ("spi: spi-mem: Limit octal DTR constraints to octal DTR situations")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 648982350863..f4d71f740163 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -188,7 +188,7 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 			    (op->dummy.nbytes % 2) ||
 			    (op->data.nbytes % 2)) {
 				dev_err(&ctlr->dev,
-					"Even byte numbers not allowed in octal DTR operations\n");
+					"Odd byte numbers not allowed in octal DTR operations\n");
 				return false;
 			}
 		}

-- 
2.56.0

