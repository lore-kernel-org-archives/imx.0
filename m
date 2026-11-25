Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629126;
	b=Ae87eO25E9Ugqp4s+9GJeXDnWYZ6CHXWgPBcDRmoAdKpr/XU/evc6odF+LY3WcDA2P3r
	 VTdB2W8PLJSAeonfqypXMrgqYrbiq95wpnHSLW4jxEhDM8o23SfnQa+seADeVKeuSCyt3
	 cpdGOILFLl3+00lXQC+ZP6XkKNzaXwpXzm0tvo1M3v53ug+X2Z7ucU8IZsCeMEd//Z5vb
	 SiWpPMUrrE8aAX0VygKk/l6P3OuSJrKGcxv2I8u9RI2nht7PnyIzakdNjiQHKZpaxc5Ex
	 jfS/FA2BgcH6Mr1GCKmbczNPituDX0pXzltbPRwigYcJEH9KU+nAcAJIx0Asukfo2kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629126;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=iZxx/bv8sERrldyegt+0p8ETCEh3QBNaziABehRhDAk=;
	b=inNk/Qo9ncadZpvnhHqJ35uN4vMozBxuKnyZtYDsBfxjJYX+Z4XyoyRacJQtyKKmW5Ap
	 GFFw5DeMPD/TEz/7fYCtdUBJfcG9/ZfD9jQHHLQQYrwPk6J78IqhlaOyLcxcxeQFGouEe
	 mn9lR6q5DP8Ao3sVqBhAxnX4vrf+3p0dFS7Tkm7DQxFQxw3IXrJmibRTFAdBmsgmqFmOb
	 mYPWGAE06743js0eIz0ip8EHtk7gBDdjphVGvdaHEydyW9F7y08IjN5hfYqS/yIhlZ7P3
	 4wgR8XS1swhfrb3dmx6XNkd4uqThuH/+OBph7VoL07opxWtmtG15qisF2sSLTK47C9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yL6AMJxn;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF189606A333
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF189606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yL6AMJxn
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8CE831A17FC;
	Wed, 25 Nov 2026 17:52:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6114960480;
	Wed, 25 Nov 2026 17:52:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6417311E6B0D4;
	Wed, 25 Nov 2026 18:51:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629122; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iZxx/bv8sERrldyegt+0p8ETCEh3QBNaziABehRhDAk=;
	b=yL6AMJxnVUerS+qMBN95vJA+Y7K3/dhFouRAcBhWhxAyGTqONCU8kzEjNSe7yny1XlTZ2B
	1eY+gEOS/9vAcE39SthkjtppvaT8ilNd0zgyRGfqcGEG6Afe9IrA7IgFgscjHhhp+KOQAP
	DL9AYhtRwBa9ZCQ5d4wJ0Vr7b5xq4Y6tYOcOWHTIiZ7GLPmkjl3RWdSMGGwynH37OOzvFh
	Ys/b/Q+BEna2T4nbn6uw8wqQSGRDQHFArZ+7lM5OjjkH1sLshzEUsT9VZN05oAzllz9F7n
	KMKsqdpUq/KO3jvXSrm3Z5EtgyPlyDsfqTSmXRpva+TWp12wUjblVK1kCBET3Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:18 +0100
Subject: [PATCH RFC 04/16] spi: amlogic-spifc-a1: Consume dummy cycles
 directly
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
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-4-fd036402fd37@bootlin.com>
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
 drivers/spi/spi-amlogic-spifc-a1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
index 388bd2472dc0..282647cd6b56 100644
--- a/drivers/spi/spi-amlogic-spifc-a1.c
+++ b/drivers/spi/spi-amlogic-spifc-a1.c
@@ -90,7 +90,7 @@
 #define SPIFC_A1_USER_DUMMY(op) ( \
 	SPIFC_A1_USER_DUMMY_ENABLE | \
 	FIELD_PREP(SPIFC_A1_USER_DUMMY_MODE, ilog2((op)->dummy.buswidth)) | \
-	FIELD_PREP(SPIFC_A1_USER_DUMMY_CLK_SYCLES, (op)->dummy.nbytes << 3))
+	FIELD_PREP(SPIFC_A1_USER_DUMMY_CLK_SYCLES, (op)->dummy.ncycles))
 
 #define SPIFC_A1_TSLCH_VAL	FIELD_PREP(SPIFC_A1_TSLCH, 1)
 #define SPIFC_A1_TCLSH_VAL	FIELD_PREP(SPIFC_A1_TCLSH, 1)
@@ -269,7 +269,7 @@ static int amlogic_spifc_a1_exec_op(struct spi_mem *mem,
 		amlogic_spifc_a1_set_addr(spifc, op->addr.val,
 					  SPIFC_A1_USER_ADDR(op));
 
-	if (op->dummy.nbytes)
+	if (op->dummy.ncycles)
 		amlogic_spifc_a1_set_dummy(spifc, SPIFC_A1_USER_DUMMY(op));
 
 	if (data_size) {
@@ -321,6 +321,7 @@ static const struct spi_controller_mem_ops amlogic_spifc_a1_mem_ops = {
 
 static const struct spi_controller_mem_caps amlogic_spifc_a1_mem_caps = {
 	.per_op_freq = true,
+	.dummy_cycles = true,
 };
 
 static int amlogic_spifc_a1_probe(struct platform_device *pdev)

-- 
2.56.0

