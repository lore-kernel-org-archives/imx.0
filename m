Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377271;
	b=FtZB59KOy72ZqbHQQ9QUVpjuGuKIri0XZemsU5UBs4qZvN0lvAOttuTlUyAT2Y/EDIfO
	 ZeTng8ITaogeQOIuDsTWvSZRlKY/8aeicn0E1Q8Tr/B0Ql5xiTSI1SR5I+jsYtg44IftF
	 I3BZe7mJJYYBYG36EjWQnGiwLyck/yXKkCzCwP6VC5q72L5cD+6AIeZvJzvyNEUD51Yol
	 4G9JVEaldCV2jlJ8C6ejOo1cUnqeicxuPPFfxTU4aFA4/AJx/HKiE927dDIuuFMboQHw7
	 LkZj+OxhIAAay6aoxudyZoFzIiY2+TeTcfLlx1Ob4qi7TPpX+MjBPPu+Lls5X96AIVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OLRD/nhwFUuDTpwXog0Q7Wc+ALgde2fM6C+mADcBMYM=;
	b=qVUVu1Wv+Zmra4abKWbfzMAFqsDKhne27mYNyLknu9smDCnEtQACRJXjjcxkCP6QFnot
	 hhLHn1AD/LwfMW0ZjRI+ldQrkUATludfnMmRBovfcKXuR29v6NPQ2/Ce9UbA4c+utluV6
	 YyceE8svSIb9aqNcOLOx43a7/7ISIZQ2LAVT7zBfhcXXQqRogNgUtkPhx61lBSs+iRVKY
	 dUxKuzVzgQnH93xI0Nmxvlk96T8x+KA7Lswi3DD1FoYlQuAx5hzvQ6PC2i5NbTUeax9UT
	 IasEaUEwR8LFlLsSTXDi82yPLfWKUCgW0wSjMAao0+OzZN5GaZrqCQBlR7LBUstsqZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tjSnja45;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A07606A33A
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 16:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31A07606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tjSnja45
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4a89b4a59a1so1777378fac.1
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 09:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377270; x=1793982070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLRD/nhwFUuDTpwXog0Q7Wc+ALgde2fM6C+mADcBMYM=;
        b=tjSnja45N59Kkd9B9ZKLT6y10aotrkXX+7cPCjn2qZ9COUygKl7PRq6lkRX19sVLFd
         8WKFomwnH8N2XcBBBE1H0l71O9dkE2YCThByPRjlqqaKNG4FEUVwUY0RfgmVX7CsdD85
         ScSFqc2By4Si+2++r+8Zt5NLteltzPugGP0X+p+NKv/586SiINNiSIRjmDc9CNxPMmGM
         nRKkni1wekTMklsbIQKr2ec+ic8iBFb9pfTS07RZdT6zyrsVgsOgkI5hYJgInBf/o9Md
         rGVhzGWvS0oV/dzB/w5BYhEih2cl7t1DjZ2CyhyBDtclDfwIKHRII1zimqEktgsZA8X9
         THMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377270; x=1793982070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLRD/nhwFUuDTpwXog0Q7Wc+ALgde2fM6C+mADcBMYM=;
        b=U8rYwRznqU+qT0qwAWSXsUmqFVUgaOLw8K4XyfK85+v5ht2/YhMw4MCm1JycIo9gvD
         CASZjIujGDQ64+x12DxGRGtJHfqdOesGMrfKLMu/dRXThKXhCgSEqBOes/FDhkVZev3d
         jNC9C9X6D/Y/IV203ACE1m9uGZFuVLPHwlm6BUu8m8CoIdsUwBgX6KXYFK9RdtaP2EXq
         O7N4YEFJRgZqqpB8qVpXu9Ay1Hh4MTfR93I6yJo17/2i+U8NF3CD5bwoFq9Pdbr9ZjKc
         nfkZq0ytYjYCH1J2FuFuJ1CwqbiMyJGy2FM7CoOnNIE20Bsui3sYplYIaJiOlCELhMFX
         SM1g==
X-Forwarded-Encrypted: i=1; AKwUvBwL0kyCySUwpTl+ubLdkFDeFMIP72YF5yeI/y4VddD/3UY93T4C5r/tkP0Zj0OALaH1IaE=@lists.linux.dev
X-Gm-Message-State: AFq9FYKMiwJK6l0chCy0AwuaK0cf7GpKMVoFhmBaY/q7Nnj4pcEc+7ux
	MGj5AHEA98qR+YG0ySMFCaF4ah3+mpZBW1FTZU9yywPSwecQh1t/KSg9
X-Gm-Gg: AYBFou3GpDB7629weXCM3MKBCv0K40s/HNXV//gW7/XP1+5U/A6av6dstN7zi9x1CMP
	7JnU46zf+9ab9J9McgM2xZqb2+tF9gzivZFpJyERZSjQGEMjpb7VCWJgQ4we/WF3q6vI8m5vxsQ
	xVOcdOq/adfNSHyL2Ou7+31UoCzE9/CAiFgaAhPcRoVluvfayDxxewTCvxa3p0vsy2bLP7pa/a/
	ZHarPEWOoxlaBzG0ttpoh1vf7MVW2qVsS5eVT7+gcgTUw5RVxxAf8l7zBJyqGtZx1FJ4l73Ahd+
	Ab2h/hD2mefNUtNG3SdyyxMXiTbssvqAYKdChxCNHyWpxGobAn4Rg1RfQd91BY5iQToc/hsJURt
	krxiP2yZkyLoG7alOpLtC9ztMCfn9tE7oaiM9ANhqPgH3fvGF8zvzkkk3sIVDeSxpHCV0yNe0qw
	lNgaqzueWLJuh0G+DEJXJevcrvINp0iAFqK6l/DdijY+PkLD8xtltP9y7OiZ7GHBiEdIOBaJfQW
	6ze1J9Q25BW5FR1tAvNyPy8hE0UDaWbI/34fCWvKehzU83gErYAn41JACKCIY0yXwI3+j6TVfc8
	hvoDVHzgYj0JsDDY6+Rr/9MLutT7Rtrlsmnyq2qrh1xwgVBtMHs5PFfB6DlCK6oIYuBqD9xh+bP
	dB9AbQZCSehJ3QFzBWEwgEZzpiZQDVJVqEgDs+Sj6+UFlKDM65jT3GHyR8FWIL7OsAQMXT/hKV+
	Us70HMQr1s+ZMJ9r8i
X-Received: by 2002:a05:6871:5224:b0:470:e96b:43e6 with SMTP id 586e51a60fabf-4a90775db3amr1316890fac.18.1793377269740;
        Fri, 30 Oct 2026 09:21:09 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:09 -0700 (PDT)
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
Subject: [PATCH v2 3/6] mtd: rawnand: stm32_fmc2: retire data DMA before unmapping on errors
Date: Fri, 30 Oct 2026 16:20:38 +0000
Message-Id: <20261030162041.2998170-4-samarth.colleges@gmail.com>
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

When ECC descriptor preparation or submission fails in
stm32_fmc2_nfc_xfer(), the driver unmaps the data scatterlist without
terminating the previously issued DMA descriptor. The descriptor may
remain queued and execute when the next page operation starts,
potentially writing into a buffer that has already been unmapped and
returned to the NAND core. The timeout paths have a similar issue, as
they use dmaengine_terminate_all(), which does not guarantee that DMA
has stopped before the buffer is unmapped.

Terminate the outstanding data descriptor on ECC error paths and use
dmaengine_terminate_sync() on timeout paths, ensuring that DMA has
stopped before the associated mapping is released.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index c08d6b176..82d630106 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -915,6 +915,7 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 						   DMA_PREP_INTERRUPT);
 		if (!desc_ecc) {
 			ret = -ENOMEM;
+			dmaengine_terminate_sync(dma_ch);
 			goto err_unmap_data;
 		}
 
@@ -922,8 +923,10 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 		desc_ecc->callback = stm32_fmc2_nfc_dma_callback;
 		desc_ecc->callback_param = &nfc->dma_ecc_complete;
 		ret = dma_submit_error(dmaengine_submit(desc_ecc));
-		if (ret)
+		if (ret) {
+			dmaengine_terminate_sync(dma_ch);
 			goto err_unmap_data;
+		}
 
 		dma_async_issue_pending(nfc->dma_ecc_ch);
 	}
@@ -939,9 +942,9 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 	if (!wait_for_completion_timeout(&nfc->complete, timeout)) {
 		dev_err(nfc->dev, "seq timeout\n");
 		stm32_fmc2_nfc_disable_seq_irq(nfc);
-		dmaengine_terminate_all(dma_ch);
+		dmaengine_terminate_sync(dma_ch);
 		if (!write_data && !raw)
-			dmaengine_terminate_all(nfc->dma_ecc_ch);
+			dmaengine_terminate_sync(nfc->dma_ecc_ch);
 		ret = -ETIMEDOUT;
 		goto err_unmap_data;
 	}
@@ -949,7 +952,7 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 	/* Wait DMA data transfer completion */
 	if (!wait_for_completion_timeout(&nfc->dma_data_complete, timeout)) {
 		dev_err(nfc->dev, "data DMA timeout\n");
-		dmaengine_terminate_all(dma_ch);
+		dmaengine_terminate_sync(dma_ch);
 		ret = -ETIMEDOUT;
 	}
 
@@ -958,7 +961,7 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 		if (!wait_for_completion_timeout(&nfc->dma_ecc_complete,
 						 timeout)) {
 			dev_err(nfc->dev, "ECC DMA timeout\n");
-			dmaengine_terminate_all(nfc->dma_ecc_ch);
+			dmaengine_terminate_sync(nfc->dma_ecc_ch);
 			ret = -ETIMEDOUT;
 		}
 	}
-- 
2.34.1

