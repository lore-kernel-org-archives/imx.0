Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377265;
	b=aSZpZu4gmoPDFovoqUM4pGczL1NDnOXziGq5uTN7kbEgOB7JFjkjktaunvfLgOjIj5Fg
	 eUyjcvcCRTGR7nN85jKO2qAUtdh8mQ8jzaoCQ6T6MNg3p/I6LVc5hznSLoSkJ1Akt3jcN
	 N4rmK5+LPHtKJUgOEU0DoUwP4mrkngFMz/Ow+GSRxs+zC5NyRXP1jkZeh4so6W5lIV0F7
	 iU8+qsEAn4Z7AEfJVmb26dpP3m0/TQxw9K9GcTh97RikonwtTe7FTS3QIE/nXMC/V86xA
	 eclMQv75Ym5DOQWNQ2N63QV33VeZnJG/3bZfb1G9XW7s/t4h+rPgJT5MnGPkEsx15cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3LJfsKdpKDX4HmeIK5NT3BudGEfehV1hBOYrKs1Or3g=;
	b=dd9eL4KXp9rv0Pntw+FocJYDSQTbel9FSy6h9zISIrk4wTIJCA7hr0QhO0IMMB/KxGh0
	 AgJpvvPLADQAQBBNP2iiIzEdPzrKPbh2FBNBeaBVursZVelvTUwDuOqmerOuymKxwV96c
	 P2pYGC0ukZ+Z0j429kw2ZEWN61+a4B2PoITYl4wQfWGgCzvT51kcRX7hO1AoOqtUUa/Kc
	 ej1uYJMafn77PTZHwZfmFfdd+q2pEaG3wTnfXR/rxof071wT2l1J1Wp3+RlFTcKPxbvdC
	 TPp5AV3kHrmwt1f6Ze5Z3AJmpQ7Do+fR6RxwCZoh+IS8VMsdfIUKNuBKWjo1ceGeE4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDd+Ct5C;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B5C606A31C
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 16:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B5C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDd+Ct5C
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-48ed0b68895so627903fac.1
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 09:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377264; x=1793982064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LJfsKdpKDX4HmeIK5NT3BudGEfehV1hBOYrKs1Or3g=;
        b=YDd+Ct5CEW0DUVzy15QsiYMjh18SzUL6bdSDoUV2lAXZ7Sc4w+szrEn8tKFL543s6L
         MsNz5N1Z953jrGGGo4IKLmznHdPxrQR8zEipJMECRDi0+iw2Nwydfaz3zVjHBoXFtN/c
         kI2vID8TRMOM/6tCv//MlWyoOh4PqMDbu/fMtS0YN0uHDpCniDC2pto0limS/OHOXwk0
         oOuKy6i0LnmhNVWnKz29mSkoTwGAwE2OOYcsMMjhYTXgRb39+qwNNh8LhicENjBQTfp+
         DhcQTWMaP/bO2v17ZAktye6i5ZXdpNvvhdmPepO7w/xgA/N/eg54UTZtOpRMgcxecNLh
         BUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377264; x=1793982064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LJfsKdpKDX4HmeIK5NT3BudGEfehV1hBOYrKs1Or3g=;
        b=tJOqyS/SYBIaULrkU0JOLi0rBGhmL0ozmGp/tgzlMPNMAAM772rl0t3LKZF37POVCg
         QAhKjQBalnjNDlNFwZWKizNDt27v7v7rsUI0SBo+9t0JgLigjcgVEjIDlzGie7wbyLzb
         fNEj/ZYMU8vDTdMPLnJbujO7jc7gFVkVKIrLQucU8WYqA0SI424iiNvLZ4PBymGQ/sYv
         3LoMbj8XClAKEsOyPlSlZPAcw4x+PI+M0F/ZoF3P5PZVqtvUnNfKo1Fy2m1Cu8bXJQ5f
         Zrq9hRpAT+Y2AhkvJUdWril8HWq0a18AweWh4m28VxuxgkGsAhGNZqWBFodtacZajOsH
         nfyw==
X-Forwarded-Encrypted: i=1; AKwUvByzvLQ5pUZhiGg5h0ggKelnbjbB+w3C5yhjKAQq5yVa9QSiwuAFV90x2YyoBbc1/NvIzJo=@lists.linux.dev
X-Gm-Message-State: AFq9FYIyBe/MbFta/HZgxvjni8oULRKvzrYz2I4KITmBSeO9lamJaO7h
	hjFoLOc1KOQSzS9KNzeutBBDvjW3ACFN0vTnqiqjJm+2uB7qdFwWUWfz
X-Gm-Gg: AYBFou0viT4mRJxSp4z3GKdbYbhXyYQMkeFgWGg0bJD3j2uxMl620PfJEvCk7CWz7IE
	IrRdimrp5geCHntySnuQHfL1xqarBHqJWux9qBOR063kOkbPJqp+VOwRKeI7v0AI7vEeuiUkFvq
	LKPmaUw8r+9OyaRLiqnzTUMVozO8TXPL9kRbCpvWtStt4rqbrqQ83dFo/KyKhLoJTz+bHpigLED
	0Dt6incCJ3n/R2kuBRuMqGt3R8OvqzPkP+iJ9sfpjYBzRI/bFy1W8RmAXiAYn8ns54jag31jiVt
	sXxC55EZMzq6LmpkH6i0gTTURLsEVt/fX9eVUUIG4k6wyfl0RD7xHZsGr8IP4pEDL9QG3c6CM0S
	nYEPNO9XB0STvoomtw4QNineVFMC+kiMhi4angEij+2LSj/aaM2jKkMkjIUzYE5AZx/nWDGgVEk
	wIxLFlLeEKbM0VnQDn76m2IGZDgedfL827m+pVOY/jvEiIuupHmBxF4f/zZQnI30zAqtVV3FqL0
	cunYzrY5iq+1KncoV9s9s6qRuAX5I+Q2t7dgEwqkH/9TGf/s0bXfQl0M7IXYhr/BcGz35+ZqwA1
	XjIQNqHuV3kcHFKytTEiwWEuFyeF/1fWAkCm1TmfRPeTF3fNFXsmkbxlnph+dMKOX5o7FaCST5G
	yM79nkyTrtcwZ/jujDyf7nsUtLCW7epKeR74PYoQD35gE4gwznxZXCbCN1QHtJo612frkBUs86r
	yrHLfuaHMW71d5cBw=
X-Received: by 2002:a05:6808:4fd4:b0:4cb:f21b:6f8d with SMTP id 5614622812f47-5640dd9e77cmr2333862b6e.32.1793377264401;
        Fri, 30 Oct 2026 09:21:04 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:20:59 -0700 (PDT)
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
Subject: [PATCH v2 2/6] mtd: nand: qpic_common: terminate DMA channels on transfer timeout
Date: Fri, 30 Oct 2026 16:20:37 +0000
Message-Id: <20261030162041.2998170-3-samarth.colleges@gmail.com>
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

When DMA completion times out in qcom_submit_descs(), the driver unmaps
the descriptors' scatterlists without stopping the BAM DMA channels.
Since the issued descriptors may still be active, the RX and TX channels
can continue accessing the caller's buffer after it has been unmapped
and returned to the NAND core. The ADM path has a similar issue when
dma_sync_wait() times out.

Terminate the affected channels with dmaengine_terminate_sync() before
unmapping, ensuring that outstanding DMA transfers are stopped before
their mappings are released. On BAM, termination resets the pipe and
discards pending descriptors.

Fixes: 381dd24539a8 ("mtd: nand: qcom: add BAM DMA descriptor handling")
Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/mtd/nand/qpic_common.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
index 4f3e4dd76..250154a08 100644
--- a/drivers/mtd/nand/qpic_common.c
+++ b/drivers/mtd/nand/qpic_common.c
@@ -592,11 +592,18 @@ int qcom_submit_descs(struct qcom_nand_controller *nandc)
 		dma_async_issue_pending(nandc->cmd_chan);
 
 		if (!wait_for_completion_timeout(&bam_txn->txn_done,
-						 QPIC_NAND_COMPLETION_TIMEOUT))
+						 QPIC_NAND_COMPLETION_TIMEOUT)) {
+			/* Retire every issued pipe before unmapping its buffers. */
+			dmaengine_terminate_sync(nandc->tx_chan);
+			dmaengine_terminate_sync(nandc->rx_chan);
+			dmaengine_terminate_sync(nandc->cmd_chan);
 			ret = -ETIMEDOUT;
+		}
 	} else {
-		if (dma_sync_wait(nandc->chan, cookie) != DMA_COMPLETE)
+		if (dma_sync_wait(nandc->chan, cookie) != DMA_COMPLETE) {
+			dmaengine_terminate_sync(nandc->chan);
 			ret = -ETIMEDOUT;
+		}
 	}
 
 err_unmap_free_desc:
-- 
2.34.1

