Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377282;
	b=15Pl9VbevRgud5CvNhd5uuKsFG0crctEFC6ds0w0ao9RD+q2+KpYbp+9sk0FXxa4ksRW
	 6chWsa2zDVlCXIxt68niukhEhQjQ4tEVzz0rPygtso18HloqY1LIJllop1es2/gt9dFxZ
	 UO6ms0roE7RHJTOLkIvZj6UEiw7m+sSjFOmhMTR9s+jVXOFWmiHE0nxeUoDI/ZMakJOzW
	 P7ecJWt1iyrzkD8Kc6ZcVaUofBz/MCcwbrQ6LbJvSzPgSUkGxxBUxzy8XPd4WEHI4XmRi
	 5fo91t3w4T8lCkJBucaAXTjMct16qF4G6iJfGkwUt+tK9DEtwqLndC5lyQltU3ceYxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P3sMZdQ8vNG+NMmxWGi58o4c8YdyyCQhTB94DmlU1wU=;
	b=h1H5NQaRCdm9+XKf9+BH07Vmj63F/ARjjPptwz13BDg+8pOgFc3SPI5E2wtLdRSmsUgZ
	 +G/Gwxy72pKYYFOqHkk7vCwpd7dSfv1pnupKBCjXl/PadFZi3frfSF6Wwy/9uD0+T0SA3
	 HfXeaTzKGcsSBV4teoCXT5IrDNXpYmOO2QcVhkabJJG7fUZ3t5S08cbT6d/qktA5WY4u2
	 nqqEpcnWSm8sADkh9kx44bwIaM+tx4J9tMI/VnmF2maE/UMbwR/232Ul7hFYM6MpexVgY
	 ssMQoz4e30E5Zmib/WjiFc8DcAHcCahkRy4OwwZxwC5TNBVOJzRuP4Cmv1LPBk7+Sew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMmLdd1g;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B438606A33F
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 16:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B438606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMmLdd1g
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4a89b4a59a1so1777647fac.1
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 09:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377280; x=1793982080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3sMZdQ8vNG+NMmxWGi58o4c8YdyyCQhTB94DmlU1wU=;
        b=OMmLdd1gWDUrKk7EenayXg3WZ8dsz8JSa0mtxRnptaX1VcH9O9DXoAgW5dGviAvzSf
         rbJQo9H7N+1kRSDBVOXyJ4wkxSsnY0j1iWLwHTptmnVZlxddb7NX9BSJNlc0GTxKTgFY
         QiKXIWVXZ1F0elZSCXtKTBBeP/WV3DKpDFJHe0etksRuVH06icVzaYKSmwin3mWIDWlf
         g+5XBNotq0QHfmXc41STkqyPfg3wUjMZXtvqPkq+4g1pgPyu8xEB491reH1yUoiPAAUo
         mRcdYwQCP4qpEUyrX7jyfR/rfreIDQ9Wl3UtRbY+g5WOt9NvaI+T3egX9TVYA2aWl58R
         zaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377280; x=1793982080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P3sMZdQ8vNG+NMmxWGi58o4c8YdyyCQhTB94DmlU1wU=;
        b=JE0SJ2z+eca9Z/XkgiIs3A+3AOK0vjPe853pckxz7vWk19IaAIhR6cWTmDZ5ZewAL9
         4m62VvCV0TmZETEkdvSsPaxtBl1hqS4Ls+ucVV6COfw0mXb5HAnSW8z2qh1NbFbQSRoB
         yt5scdr073vAGkRg5XwBr8qLuUzRxGLwYQgLWrZ3w2SKqnPRZCnmQgTkbSLx35TNuLxf
         Z763RiPNi2K37USWnAIGUxbMEE0lanm/BS5Rwj+W3ML5Oo7ZxacV5arKdva7ss+AWarS
         bpQ2DoN6XUeHyfGaWL613RGp5sdXGuUazJg6RJeR29z/9OwZKL3r+bo1jkiC/0ivRS/n
         nj0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwf72ab8LhyTysDYSRoaW1cnxRHAUkIDSG0LTAj67eSeDqZReBK65mDrFxxb10W+jHxJDE=@lists.linux.dev
X-Gm-Message-State: AFq9FYLHatIhDqKSWWBjxGUfmeGdxJuepydJQtaTRvFhyfb72V+BLLT2
	rlwy8MYdWytObIT6vsQi7/glpmf9DmUaoitybhghaJD40lK5/fsQanye
X-Gm-Gg: AYBFou3e9nSo9mx1jRoKS2Z6qAJ8GCJ+d29TUv55Qt3Ms2xN1Hdo9uYpd1x4G9Pnr3W
	YemHDvSqhfJPLHDy8MVPSFWIPVQXzhUIx8+pOEoQB5Zxk+Ckjv/G1ED2/tsuI9+EIdDPwsMFi2q
	vbBRKyeSRmcyzELqazDadl0NwE50rI4dwYS+vhMCx7/TdCO5/oiAWC10n1L2OIifynjOESbu0en
	ovelS2I2cUx9uJ1rgiB8WCi6tNC1OOeI+aBfyl6tQVVmZSl2pxZFVQMQ1DiMo/KucMpfqyVnK8s
	s+cBb+JEJTJSSeVQ4pydKjoWEFK6W5CYYxYMymYdJKtxPH3tThHQXW3gL1TfEqdtQ9TugmF+567
	QCYcFSO50G55D+V/HoFJBgcZHVzJuHYK4kUYIpokix5kxbwjkAJBjyUOXLJe3y2fRxo9Zqxc1Ij
	FgaHeSyLK3t/Sgcd39dipiNAW98izPIzQJqUDZ5w1ErQ+TkQwz8YzzjC4FLkPuADhxSEPof+AaJ
	UxL0sXi1WJXenxypdG+t1KH6xEb1nFFbCUDvOoy40xqoFr/L21NfAqscKNdEbMEzy7RP8CjKPMI
	XAbVT3rc6SHOb6+LzJ3JHDkBC7w6X8peXK+gPPXv1GKtQTvHqVsd54rhO6Tm9583e/tkXJgYWO1
	mD70thQXfR5sYh9aGdMxvpDtrizIPemOyFs6fqR7P3422pNhxixUt0tynHjhQnek7bunwjL9Ngo
	yHHnzqSwqVEx4WXGMtfySpUfNdYx2zd24qBZ03
X-Received: by 2002:a05:6870:c191:b0:4a6:d831:cbb1 with SMTP id 586e51a60fabf-4a90767d2f9mr1286539fac.10.1793377280468;
        Fri, 30 Oct 2026 09:21:20 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:19 -0700 (PDT)
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
Subject: [PATCH v2 5/6] mtd: rawnand: marvell: stop DMA before unmapping on timeout
Date: Fri, 30 Oct 2026 16:20:40 +0000
Message-Id: <20261030162041.2998170-6-samarth.colleges@gmail.com>
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

When marvell_nfc_wait_cmdd() times out in marvell_nfc_xfer_data_dma(),
the driver unmaps the DMA buffer before calling
dmaengine_terminate_all(), which does not guarantee that the transfer
has stopped. As a result, the DMA engine may continue accessing the
buffer after its mapping has been released.

Use dmaengine_terminate_sync() before unmapping the buffer on the
timeout path, while preserving the existing status logging before
termination so that it reflects the timed-out transfer.

Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.

 drivers/mtd/nand/raw/marvell_nand.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 38b7eb5b9..a342a48e2 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -900,14 +900,15 @@ static int marvell_nfc_xfer_data_dma(struct marvell_nfc *nfc,
 
 	dma_async_issue_pending(nfc->dma_chan);
 	ret = marvell_nfc_wait_cmdd(nfc->selected_chip);
-	dma_unmap_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
-	marvell_nfc_disable_dma(nfc);
 	if (ret) {
 		dev_err(nfc->dev, "Timeout waiting for DMA (status: %d)\n",
 			dmaengine_tx_status(nfc->dma_chan, cookie, NULL));
-		dmaengine_terminate_all(nfc->dma_chan);
-		return -ETIMEDOUT;
+		dmaengine_terminate_sync(nfc->dma_chan);
 	}
+	dma_unmap_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
+	marvell_nfc_disable_dma(nfc);
+	if (ret)
+		return -ETIMEDOUT;
 
 	return 0;
 }
-- 
2.34.1

