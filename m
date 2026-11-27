Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789448;
	b=EhrPPSGJrmVYE5Ye8Kd2CpAddIra0CK4FDC4dnARzWd/ZWL+8OQkcjg8+7oRF+8H/lwq
	 upSCPtPM/gk0w/+hV3gh0V56sERifSXf5J0v6/yLfxUMaKFcvOK0b4xTjlEMV0t/N+Kxc
	 E/TJfSw2jSFOWDerhy4MyEKGOLx1+bQakNDt8+b45JP7zzAD0aX3Q7WJtWHTNTl14TPxs
	 Pv5SSRmpntOIB2ZIN1YgMznQ80F0MnMPIOl0bb9pUm+Q3aU4x0dVp5WZcxUq0O0wwbDU4
	 5lQZdA/RL31z1FhKMQoOhbEvJUxKUXIyW2zR991W6wEcPYC8+5W0Bg4peYVE0VcOuSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789448;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=wxfJPUKHoAB+1K3wnXPXnqak814WKCu5TUfSaAEjIso=;
	b=fatjgjjrBi6j88XyF0uSM3IuS3RMD9bevvp52QqCD7oXyEWxMDMq9rJ4sbIY9TbyLluV
	 WXV6nGvl/bPyoVWXP4HGZ3gOlD6AiRAifOODIzsMk4uP0d/cEgG2f17buaoYssiY2Jto0
	 iDOVv469pwJK/P8LOIyKQ9m4Gg0w6R5ztiZb/8s3IUo6Oe9D2H1pmD5f3Alqzs4tabrSX
	 3aX2wJbBgfAKqzCLQOUBLntlDaNfieicDMYgDYbsopK1RYqSvoo12faPj99AL6DUtOqUp
	 cKvzttxR9tQhlhjVMmekltlP/M0Y3PFtJieuzQ98wNg0O8/YR2OqU2yqS/mcWL2pLTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KqziPh8l;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FC5606A33B
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 14:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2FC5606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KqziPh8l
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 429AAC2AC4E;
	Fri, 27 Nov 2026 14:24:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72CDF6049C;
	Fri, 27 Nov 2026 14:24:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C07811E69006;
	Fri, 27 Nov 2026 15:23:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789439; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wxfJPUKHoAB+1K3wnXPXnqak814WKCu5TUfSaAEjIso=;
	b=KqziPh8ltiM8u5+b6eKfqHjpZwwL1tuSrz9B43KqmDBcTFYtGFxkYvIYsXji0ngHmJfQMz
	HMYknla3frw6GZAIimkPVVve5WfMCll0ltxhioVlYXjqQK8QDtC+0X4nyAizs1G2E8mjSx
	QEmiP3NpEAk1JuFMrlPs/jHoMSE3uRpjOgOXUHCyiijgIHx9/ZQG0DU/2WZILymrbq1sRP
	qgX5ttf/7/I1Ei7RuCVq0X1p4AtlqgzQ5mCqeZFZYv+l14QKJWryXuh/kRwtSZXUH+2o/P
	Br+32uJQRsmzsk7ElCYdt/m/ZNr1crLvAtt1D58vA61ocIx1A+3fg26Xcipd3g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:27 +0100
Subject: [PATCH RFC v2 05/35] spi: spi-mem: Sanitize mixed buswidth
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-5-5c93f5e5d630@bootlin.com>
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

Buswidth is allowed to evolve over phases. Many controllers strictly
apply the settings passed by the core. In practice for an X-Y-Z
operation where X, Y and Z represent the buswidth of the command,
address and data phase, respectively. We do not support:
- Y < X
- Z < Y
- Z < X

Make sure those conditions are sanitized early by the core, to avoid the
feeling that these needs to be checked in controller drivers. The
implementation also covers the dummy.nbytes case with the same logic.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 25f795d5e9ba..a1f129c47698 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -216,6 +216,15 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 			return false;
 	}
 
+	/* Bus width can only grow across phases, ie. 1-4-1, or 1-8-4 are not allowed */
+	if ((op->addr.nbytes && op->addr.buswidth < op->cmd.buswidth) ||
+	    (op->dummy.nbytes && op->dummy.buswidth < op->cmd.buswidth) ||
+	    (op->data.nbytes && op->data.buswidth < op->cmd.buswidth) ||
+	    (op->addr.nbytes && op->dummy.nbytes && op->dummy.buswidth < op->addr.buswidth) ||
+	    (op->addr.nbytes && op->data.nbytes && op->data.buswidth < op->addr.buswidth) ||
+	    (op->dummy.nbytes && op->data.nbytes && op->data.buswidth < op->dummy.buswidth))
+		return false;
+
 	if (op->data.ecc) {
 		if (!spi_mem_controller_is_capable(ctlr, ecc))
 			return false;

-- 
2.56.0

