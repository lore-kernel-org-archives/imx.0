Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377276;
	b=jOvo/uLwAGjXuFitFuoWXF6OR3qOzkySNpNe7VzfQPHlmouEXGIuGGCn0yayELthTbfQ
	 Ey7alif3jQT9f6wfy3Ca62i+jDJopk51EUzMa55lfuCqj1128vVzzi22GRi9DXcjawbM7
	 6q2uX+Z433nLEsuJMNpFMGrKS3hE8xh2BkWsjO1nf5B/p+xYML/IHh345ImrfyINRL/fq
	 +kYV4Rsm1sYKYffpe1usWaZYs25UNGZ3gvq7ridCOhv1uE/RlFUEZUyKCkZdbXbDMgDis
	 ziTWFdu97gGFa+z85ewwZeh44T5V9RtkLOa0YJHu9PCDTocHBwZWHxEINFJjnq221Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NiCv4TzAu5z9UeTUiidIChOBFFfvn1mb27PyQpvB9kE=;
	b=OMpFGLtAq3WXWyWjvgsLeQtvL+0DrlnwHAKfs9SHOVT8VW1c/1Rk53bN9+0iKTgPD9qi
	 Cfl5LFrX5erbx9vHVlT2yhYnK+0e1RSIoZKunavHfsFVg4OXWECuoxY8rriIYJ6PdtmOS
	 yemIWwJyRS0EsxcE5hfR9+n033fs/UZUbkAE8p15UicsnDqTmVALDgY26T9oa2Kui7kNN
	 v9qMsdVtIoniwJzL+pHoHTR28e6vWmwvaFeX9NBBuwt3QtloDaZkFVcNyrnsz54EgpYdA
	 NGFOqXP04CPI0kUgMZvixwdJVhU96UtNJjXxod030YA2F3/47tGkHXyLkTbxXK5RRHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tjxClqnN;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73359606A32D
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 16:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73359606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tjxClqnN
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-475920b9ca2so295078fac.1
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377275; x=1793982075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiCv4TzAu5z9UeTUiidIChOBFFfvn1mb27PyQpvB9kE=;
        b=tjxClqnNmyIy6f71qdmMMJXOOQJiA5k2lfNH6os6R8O7U2xHBb3d8XWq7N/4hegMIB
         UNnfIaxQ4nTaC7ghI/oxPxDW9Mwao3hURkVXnJwyTePQ7rcbSoWoR4Y+zCP6bm2RGlLZ
         3EtVT/ml+U0bKrDxRebk9O+mcyLGAEnt42Xr2rHcN7X+21ai7d4gus5GzBxM8CktmI+e
         YBMelKz81j0WF44BJUabpQ4+7TWc1gcbXpvunHdaxv1X2qQnareXxd+3xyF4XVisNngn
         xesgFJzYRPoX40CuAC+a8jeRPEytX0KwGIcC4Eky6avmM8cmm3AUDKfNi5uJS50EOhLJ
         prKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377275; x=1793982075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiCv4TzAu5z9UeTUiidIChOBFFfvn1mb27PyQpvB9kE=;
        b=KK8eebyzOwR6cdWziV7LTPNLNdz+db3uQTV8YDuhyPOD0Xhc/k0nAEj6sfowNJadEB
         S6EfMNZciwnZkXl4Q5IYeEyBBFbCkBpQE9eaIQDepAugNxemQzUNOszJD5JmPImnCT8S
         NeQyfoempf3SR3J4aA5mpAnytMBdquSJG+1tRcDiUbmLY8iU+ULCR5qAWp0SeeBcaRhr
         ZL6ZmrZnpi2DItU1MLTLG9e2ZLav7K53caQCj5kOXW4tz4UrmxFQv/TvI2wC4pTavhaZ
         IEnnqLMNxRgqzOhteyxeB7s7daDC0V2IFyqLtIG0K/yh2+VU74amPezgXa+GSDDlGQeQ
         eXWg==
X-Forwarded-Encrypted: i=1; AKwUvBxXWkYdioLMl0nInscB8ME61mlMuaEXnnfOP9Hv9IFXJpGg7SdXGznlfjfN578xtndoXWQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYL+lXjDzPDT65PCA+sm0gILQiE7RMvV3y4isXsyf1jtbmO+JOYC
	X4DkKbVf9toBkNqg/z/v6qFC+yYUeGTkW6z74O3/GRQG0iI8/FEF8bqH/ftABfddoQ0=
X-Gm-Gg: AYBFou3kJ/e7vScIFBm3/lo7tJ6Uj4Bc9R1uvEJ1NmTCvm1VdqeyaIT8ISL/dCCq39o
	Nen2vo6q1iBIqfeTJPhL5m2EpBexDAVx5ujVJ9xF6xRnURnfKow4VIhS1kOklDBMoRoeTM7UdLD
	HaB5jnhh41bkmBUNRQ7vEp0nOyNq+KSbvPgdxM57kK3ZxKzA0Uu0/vjog5uUaXPJcRo8cDh6r0Q
	NpuErjzWess2PsZgmGmhQ9L9U8h+WS79oYtLs8b3ZGMFzjiubW+tBK4AUkxZhmUF7LXcO7Vl4Xv
	aHFZSBvkdLMERL2Ex/IH2X0p6ugFFWjoBHl2i5AIyuVGB/YA6g8rhWnkOEzUbA2UUJ7HYrFjaUO
	wQyGMdKUMzpSUcIAft407ZFu8s5/1ARTr50IHE6yhRE/LprRzOtB2tBzVUx65QTf+YIFHPrfjf0
	c+Ei9imZuFdcam0TrZAxYeyIiPymJHtZelUYhVTMftJzUSIXLQpW175OI2N4vvtPE6b/mcFAiCY
	yQyC2Z3X1AizI+Kw0gtdIu/85qf2IWOUMvU6T5FgFV17wdx95x9YmcLGKs+G3UZHGf2yDxg7rcg
	eHTG0LDlLTGagDDon7hpaR/04ohN4RzYx+oRxOOaH2rm5RcimvqU3HydoeCgQ5v9/xREp0u086k
	fjQOUTlsOXPlYEfMNb2KWlhQAcPT4NMOmeSWItg4mCaKrclo5Uur//CYJ+TS/SKxi3NtHoZHY4F
	3Ewf6/7/GcuLYJwB0=
X-Received: by 2002:a05:6871:3149:b0:4a7:4323:3fe1 with SMTP id 586e51a60fabf-4a9075f9d96mr1952103fac.20.1793377275138;
        Fri, 30 Oct 2026 09:21:15 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:14 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 4/6] mtd: rawnand: omap2: terminate DMA when prefetch cannot be enabled
Date: Fri, 30 Oct 2026 16:20:39 +0000
Message-Id: <20261030162041.2998170-5-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When omap_prefetch_enable() fails because the prefetch engine is busy,
omap_nand_dma_transfer() unmaps the buffer and falls back to a CPU copy
without terminating the previously issued DMA descriptor. The descriptor
may therefore continue accessing the unmapped buffer, while its callback
could also signal info->comp for a subsequent transfer.

Terminate the DMA channel with dmaengine_terminate_sync() before
unmapping the buffer, ensuring that the outstanding transfer has stopped
before the fallback path proceeds.

Fixes: 03d3a1df6da6 ("mtd: nand: omap2: Start dma request before enabling prefetch")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.

 drivers/mtd/nand/raw/omap2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 552f36da7..b6bd4386c 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -417,9 +417,11 @@ static inline int omap_nand_dma_transfer(struct nand_chip *chip,
 	/*  configure and start prefetch transfer */
 	ret = omap_prefetch_enable(info->gpmc_cs,
 		PREFETCH_FIFOTHRESHOLD_MAX, 0x1, len, is_write, info);
-	if (ret)
+	if (ret) {
 		/* PFPW engine is busy, use cpu copy method */
+		dmaengine_terminate_sync(info->dma);
 		goto out_copy_unmap;
+	}
 
 	wait_for_completion(&info->comp);
 	tim = 0;
-- 
2.34.1

