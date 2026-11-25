Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629103;
	b=BFqZ7t5A1hBHkExGql5AKkFd5OaUvj+KfabgomMyC1gYTdf+9Etwz+Y1egLCAbbgZQOA
	 UhhwUuW1HkTMhlXoR7NFmADw6NoRdaHWotpqP6Hj/dbfiCPgG+HPXf+LGo+7ytICG+yn1
	 5ZYhvmbf3OtKHJDfv5y59J2Mqhlj3nyVtvO7hJSPoUXbxq2O2t6lut4HvaFPGMGBpDu3P
	 HbZeXcLGTpHYBGi/Fu+p1J9AipN9WEH0uXhLDgUqrR9/Po7wTFBp0gHvmAeEDRBkyOhMV
	 ijppFrW+ixYJxjIYJQBhi2sgwmn2U23BTFsCkiPBuXVN6rhYuDM98xUHtmeYKMkfGfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629103;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=aFwYFKGqCOCePbWnEjq67+DK4TXuYhQVEXTdJQLf+dg=;
	b=NyH/Yd67IImT5SWrdH4e7/bNHjtVV25jiMiRtjwecNsFxI9QF8qHt8RxBFGEl4iApg9y
	 KvL5HePkbNDm0OaTP/Yh9WxXIi07Lp8pUBrWOUAl5KqprslV1xeq6N1ctvBsT1Ier/M7E
	 KjBlTqfoYNC54EUspRhkxqC526Rekpj6QBoiSntOYdpixjQBadiDag1wdDBCfr77SYwOp
	 8zBomF8et8rlPBjk9f/gpKNq7j6fGgxh2sEa2QFHt1iR8MniODRTtbT+zsH99A1bKQHuq
	 /nxoxXLc7EzV6Z4ubVuC/rf7yh6BiIaOt2jlFUzluO6e3vKa6BzKreZWjbNrRgQID/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=s+YXv5HL;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EC7606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06EC7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=s+YXv5HL
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A37D91A17FA;
	Wed, 25 Nov 2026 17:51:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66A02604C0;
	Wed, 25 Nov 2026 17:51:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49AC111E6B0D1;
	Wed, 25 Nov 2026 18:51:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629096; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=aFwYFKGqCOCePbWnEjq67+DK4TXuYhQVEXTdJQLf+dg=;
	b=s+YXv5HLLLcg9wRN3RZSE2E3K2VPZcmJCuP5YCVc5K/JXDvxhiy9/Y7HvqWzuF2mS3mSGz
	EBsMFXxV27a0gsWZXX+PU70FO+Yb5eXNjkSTL7cQo5ixmjuN2w1SJ/fB2XYsyTTImI7RHU
	7wBk7Iq2cXZRU4H7R0JS1tmjkbC3w0RUxoUqnh78Xrgq8jmFsAIAzYF+4sGLGHcPbKBidL
	V/VLOoJP4sh7EttvnHH+Bw2WYDwmyFs9noXGMyR1Y3/16ze2ZfHIdnxYqvKlQz9KcMuMZe
	i5lIPPm7ETcuGEBHi4YtcSE36JnJ14LdoFDGQwQgs3NkxoK9LQ5e3eO97r8MOg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH RFC 00/16] spi: spi-mem: Express the dummy phase using
 cycles when relevant
Date: Wed, 25 Nov 2026 18:51:14 +0100
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr0Jm7RhaUAxbEw/g1rCodcBJbMEZM
 BjC3W3U5fs/eW8BJWFSqLMFhF6s3McEZpOBv7vYEfItMdjc7o2xOwzOSx95xmnQUcgFjh3qwBg
 ooH/7BymavLBVWeWHljwk0yDU8vytXOB8OkLzG4WeUyqO/+fqlND3IfBYZ69qW6L4App1/QC9x
 yy9pgAAAA==
X-Change-ID: 20261125-macronix-upstreaming-spi-mem-cycles-103274708fec
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

SPI NOR SFDP data gives dummy cycles. SPI NAND devices express the dummy
phase using cycles as well. Those numbers are converted to bytes, then
passed to the spi and spi-mem controller drivers. A non neglictible
amount of those controller drivers convert bytes into cycles before
programming the registers.

When the conversions are lossless, it is not a big deal, just time
spent. However these silent conversions sometimes hide bugs and
sometimes also prevent using certain chips/configurations, as recently
reported on Macronix 1-1-8 chips requiring 20 cycles. Not all
controllers can do that, but the ones that can, would anyway reject
those chips.

Convert spi-mem, all the trivial spi-mem controller drivers and then
SPI NOR to use dummy cycles instead of dummy bytes. SPI NAND may come
later.

This is only build tested for the moment and sent as an RFC because this
topic has raised a lot of questions, there may be things I have
forgotten about, so I would like all parties to agree on the direction
before I commit into something cleaner. I bet Sashiko will also have
interesting feedback to make...

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (16):
      spi: spi-mem: Handle a corner case while sanitizing ops
      spi: spi-mem: Stop checking the dummy buswidth against board wiring
      spi: spi-mem: Add support for dummy cycles
      spi: amlogic-spifc-a1: Consume dummy cycles directly
      spi: amlogic-spifc-a1: Fix a typo in a macro
      spi: amlogic: spifc-a4: Consume dummy cycles directly
      spi: cadence-qspi: Consume dummy cycles directly
      spi: fsl-qspi: Consume dummy cycles directly
      spi: microchip-core-qspi: Consume dummy cycles directly
      spi: nxp-xspi: Consume dummy cycles directly
      spi: nxp-xspi: Fix a comment
      spi: rtk-nor: Consume dummy cycles directly
      spi: sn-f-ospi: Consume dummy cycles directly
      spi: stm32-ospi: Consume dummy cycles directly
      spi: stm32-qspi: Consume dummy cycles directly
      mtd: spi-nor: Express the dummy phase in cycles

 drivers/mtd/spi-nor/core.c            |  36 ++----
 drivers/mtd/spi-nor/core.h            |   8 +-
 drivers/mtd/spi-nor/micron-st.c       |   2 +-
 drivers/mtd/spi-nor/spansion.c        |   6 +-
 drivers/spi/spi-amlogic-spifc-a1.c    |   9 +-
 drivers/spi/spi-amlogic-spifc-a4.c    |  12 +-
 drivers/spi/spi-cadence-quadspi.c     |  35 ++----
 drivers/spi/spi-fsl-qspi.c            |  12 +-
 drivers/spi/spi-mem.c                 | 216 ++++++++++++++++++++++++++++++----
 drivers/spi/spi-microchip-core-qspi.c |   8 +-
 drivers/spi/spi-nxp-xspi.c            |  14 +--
 drivers/spi/spi-rtk-nor.c             |  28 ++---
 drivers/spi/spi-sn-f-ospi.c           |  13 +-
 drivers/spi/spi-stm32-ospi.c          |  14 ++-
 drivers/spi/spi-stm32-qspi.c          |  12 +-
 include/linux/spi/spi-mem.h           |  36 +++++-
 16 files changed, 303 insertions(+), 158 deletions(-)
---
base-commit: 19d1b4de6d37bccecc3ad9144d279f1baa405eb1
change-id: 20261125-macronix-upstreaming-spi-mem-cycles-103274708fec

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

