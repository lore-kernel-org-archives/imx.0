Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C50214210
	for <imx@lists.linux.dev>; Fri, 10 Jan 2025 14:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736520364; cv=none; b=p9ANT7izaOkI7aRLfnBYJKJy4+mRMgIKEK2TEOc2mIw55VsHjWBc/Qpcy3kIic2NZJykQLIvCcvoyph7Ev0vD6NjahW1YpLvQP/pEEjFxCVUZww23CYaPLSH8jmuJwJv6D+odTRr2NduR/l/ETn/Q8JJyCUOd0ZkSectSAA4sUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736520364; c=relaxed/simple;
	bh=JVqvW6rQl2LacvX4vH/OnUdGU8UgjnscumZu07+kC1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m2q9j2mkOb9f63nYwJXx4CMynEG/aoFNKMRT6KDObCh98LH1KWPZjZI5auZ1+Qs3RxQlIUbEDu/3xYjy2DkXE2nOX7ay3IEpg9Rsy2qTnudQkIR6ht/00SqeyDK/HfWJiMyE8hLcXq+9ioptVcjj/QA3HE5qy4daMUbdEbif9m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=knxkeRs+; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="knxkeRs+"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A47C0FF807;
	Fri, 10 Jan 2025 14:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736520361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gqGs8PUET+BsGpw1lvBa5lHh5wRhBBbsSXm21QijbQY=;
	b=knxkeRs+zHJjSM4mur0EIav6g23HRoV1lnS4+lKJdZz5fYG2wByIPYx71fP8PFtE9m0n1+
	Lm5tNODPnNZG6BQWzHfBRhpwJlyk08XVMhzlHJS7Cg2uK9ESXuInSHhdj2CZzk4tbmCZSX
	p5yxJK3JQcjO9u4/0gB7gGiSjNt/GArPkCwrJ2E2DI9vFgfIVNtqJDmRBA700lhMrwk9Oz
	63srEcX99i9+LSSqmz3lsUHLvOzGs5hez3PUtpg16xQ3yPR8XABiVV2Hyyc5ype/UCIlNe
	NYtR0wrTL48JuM3smxZnH4XV4ekV59+bHA2Kgs0FOHyo3oR+TgD6AA5D9U7/SA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Jan 2025 15:45:25 +0100
Subject: [PATCH v3 23/27] mtd: spinand: Enhance the logic when picking a
 variant
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-winbond-6-11-rc1-quad-support-v3-23-7ab4bd56cf6e@bootlin.com>
References: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
In-Reply-To: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, 
 Serge Semin <fancer.lancer@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mtd@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com

Currently the best variant picked in the first one in the list provided
in the manufacturer driver. This worked well while all operations where
performed at the same speed, but with the introduction of DTR transfers
and per operation maximum frequencies, this no longer works correctly.

Let's continue iterating over all the alternatives, even if we find a
match, keeping a reference over the theoretically fastest
operation. Only at the end we can tell which variant is the best.

This logic happening only once at boot, the extra computing needed
compared to the previous version is acceptable wrt. the expected
improvements.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 94f33c8be031ac60208e22e4e3fa0d90cfae093c..a2a8cfd1752139e3227fa4a39ab0e25bbeec53f8 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1198,10 +1198,13 @@ spinand_select_op_variant(struct spinand_device *spinand,
 			  const struct spinand_op_variants *variants)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
+	const struct spi_mem_op *best_variant = NULL;
+	u64 best_op_duration_ns = ULLONG_MAX;
 	unsigned int i;
 
 	for (i = 0; i < variants->nops; i++) {
 		struct spi_mem_op op = variants->ops[i];
+		u64 op_duration_ns = 0;
 		unsigned int nbytes;
 		int ret;
 
@@ -1220,13 +1223,17 @@ spinand_select_op_variant(struct spinand_device *spinand,
 				break;
 
 			nbytes -= op.data.nbytes;
+
+			op_duration_ns += spi_mem_calc_op_duration(&op);
 		}
 
-		if (!nbytes)
-			return &variants->ops[i];
+		if (!nbytes && op_duration_ns < best_op_duration_ns) {
+			best_op_duration_ns = op_duration_ns;
+			best_variant = &variants->ops[i];
+		}
 	}
 
-	return NULL;
+	return best_variant;
 }
 
 /**

-- 
2.47.0

