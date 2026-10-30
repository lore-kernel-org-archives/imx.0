Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372977;
	b=U7lyY6jRVzXM6iFbyou3Gfv7S2nAxzWaVSGaYmL6o08M9iv5MfPU6B5n3vVGMfFKBIqF
	 p9jh1FEAkmZr2pY8la7T0yfc9iLq7ByJdm3Xkh6eYAZWVGlzcta3ffA3cotik/QjQ47vI
	 JKANid6liKvLrSY/wTQ5nE0QsZ3gaie/r42g28saNznnj17HNWnqd7jLZRIlrSuAd34Xn
	 DHAAA+fg6xJJ6rBRBzaguGQq4nRV7bOPK2fBmUZuEXTM48S8XM5p8vS+ScSdP/Y2lJaXa
	 nv0Pk6wqkMRzbiLeHRQKiD4j67VPf+3KHa/J2FKZYf16ZbMBgpuEMQdML6ccnKBQ7ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/UiY3oEhmm09gQt6+h2fxxhgxNmhqW0iOqLXwE+OSHg=;
	b=pPlPMpZn3kRYvgy8R3lliTa8n3qn75W0/Td11C8uspFx0KLCfmH3rKZCHNG3IRLuzdKl
	 hjDcgdkpls3yFXpLWzBTVSObh3y82+XPbE1o2vWo7RPQ+KEVFRCGP6vHvDnN2ooWYNl4L
	 f9eLKiGHuppmx0hq8MnPcy63Kz+mSX3pLmCDYgS8cKmC+qIjHbH3i5becpot5HYke6JGF
	 l9qBdaS5Z5mio7Q2MULxFEk48MCLNTWBvtLn5V9Js+Wgw0h+egv5hK9miF4XunYgl5ZSM
	 Hiz31XcIiMN80DOwM5vBwlZ6bg7uwjkX3mPB+fckJuEFsqJbfU3WSdHfZrRVR5VG/rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=czrdZMcD;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7D8606A31A
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 15:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A7D8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=czrdZMcD
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2761c69fbso2000274c88.0
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 08:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793372976; x=1793977776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/UiY3oEhmm09gQt6+h2fxxhgxNmhqW0iOqLXwE+OSHg=;
        b=czrdZMcDeRWcz5bhM8/GcgRycZqsuv79r0JPnry82sAqDwj8o8Qfn/Z61Ki0Mk3/F9
         iY4iIuXLj5xmR5YjkBBYkFTuR+qC3HNM1HwtN1uc8vs9IhcEerqALX6Gb4+5tn/wq8s3
         eD/dyvnIzVeZBnrT6jlSuLmj+NcVToejP/J/bvJzAuEtsGXjT09et10aLyIyZ4/Kj8yb
         V+f2jx+dx4WKJEDvFCXVLBL61PUeaXJudWbVKIHZPe4ABuWP2JEmwKaNwouPV/vt8wX+
         wtXT91eGfvOrYwIihZZ0HmN7mr/eQA2AMQ31HIJESUxFMe6Qol5VpkWliTnATEwOCDDM
         nmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372976; x=1793977776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/UiY3oEhmm09gQt6+h2fxxhgxNmhqW0iOqLXwE+OSHg=;
        b=B2JGZDJ1CMro+1R+rn79Y37B20h05Rw5AYxODvDKRWfd/2KcuJ2/9gI+lK6o87gwSM
         ksByfjuF7XYMBY8hwskMLwXl6OuP442Z/rtu8QjeUlYUfjyqBUYPXJsodUiBDevP7m8K
         qMmc/y/LwIjX2UzIwzZleqLBtRKz1co4D/Y4sVh2Sggc0Zype8bQW3pEP16a/zvJsBZB
         4HKZoIEh25Lodq+7Vs6o++qDvWtIOeOOQbAgiB+iSbNl9lkhDRBVNkJ51u6dOAR+8LMx
         NCPiX/ewiQ7tpTtZWd8X8TG2iw6oBCcP8ItJoQlrFgtcNomu4yjZ9je5rV8kTDJGjqIO
         XS/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzJBQ9O0lRd8nQZcKC93r90/cFt1wQn3DY3t0K3P5RZZR2k769gZnVgiZiI8nZs5JldM2c=@lists.linux.dev
X-Gm-Message-State: AFq9FYJMB3YOvh+GtG0Z286u0CkKI726Ay/eK4DxosnYyqGiIRhTwVfl
	W6OM4yykWHQuOxm5p/0TIb94b+o7V8zgr/rM4ddyVKkhe4Yy7yyRAIKU
X-Gm-Gg: AYBFou1vE24yQ/GD5DCSACSF4LYan+4GkiKr0r3v2d4U0JLjbASU9LUBRSG3yhXONAY
	S1PqIvI6BTmcw9bjUl0xmHpBAz9L+U2kwJ8t3mmUBhry9x7C1B4Mu/WsZ0tqYMBfO6sPmjaTt82
	4kbjuqTsdUtd6q6uMmnH2e1CD7y+UnPdAv+fUypIg1CMZ57Ao9jZKKiMZ4whaZKOKWI6MYizYak
	0XN89os+T3odhZT4wbchjXa16dg4f43HbTDrfpqxTgFYvjntZpNkG2dQXln0IZ/FwoBJjiYW2Kd
	t7Xbb+8gyWPaQKy8uq83CpqsmyTwfKXddpeShPFxv9qFHcq+mDWdG3ODm3LKY58zGLBQ4dQzYhJ
	mBqwKsq6Dd3ODc8I9OzdRHXKgnHquMlG2uTg/txRkpPe1TU5XDhIIcxQb2hpdd2/UNQ/AkhfGX8
	8OGL3rLZoTLbe42wvjpws75zq2ZkhPjB0Ik9AYHiYYQdzK0DDey2HYfc5i40jsIFrF/f8qSaWjY
	gMSkK4pZn20CgXPH7TCkFWL0BiC7OWkL/XcthkEaVkSzwBbzeNfGdts/xUCdVuLElR8oFUe096n
	R/TPzP7NU9holHU6g0SMxIyqyQMPaKiSEDgeeJJwZ2RXTpLYntD4bmNTVNhQp2hvlgLiHPIJV/Q
	3jJv9A/I14lUwjgyqvZKAolcEh4KaZVBYcUFNYzpYY+KPX6IMYqY1CQfrt3qk8DcTBZnzDYZBB8
	Udy9peGPYTOHanEYI=
X-Received: by 2002:a05:701b:42c2:10b0:185:1640:5536 with SMTP id a92af1059eb24-1ac5ab52fa9mr3803741c88.19.1793372976047;
        Fri, 30 Oct 2026 08:09:36 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm9193386eec.29.2026.10.30.08.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:09:34 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2] mtd: rawnand: gpmi: terminate the DMA chain on completion timeout
Date: Fri, 30 Oct 2026 15:09:29 +0000
Message-Id: <20261030150929.2944717-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
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

When DMA completion times out in gpmi_nfc_exec_op(), the driver unmaps
the operation's buffers and returns -ETIMEDOUT without stopping the APBH
DMA channel. Since mxs-dma leaves the channel in DMA_IN_PROGRESS, the
pending descriptor chain may resume after the timeout, while a
subsequent operation can append new descriptors to the stale chain and
cause the old DATA_IN transfer to execute again against an unmapped
buffer.

This can result in DMA writes to memory that has already been released,
including buffers freed after ONFI parameter page detection in
nand_onfi_detect().

Terminate the channel with dmaengine_terminate_sync() before unmapping
so that outstanding transfers are stopped and subsequent operations
begin with a fresh descriptor chain.

Fixes: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
Changes in v2:
- Drop the code comment

v1: https://lore.kernel.org/all/20261030143945.2923554-1-samarth.colleges@gmail.com/

This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.
Compile-tested only.

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc..a8106de2c 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2659,6 +2659,7 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	if (!to) {
 		dev_err(this->dev, "DMA timeout, last DMA\n");
 		gpmi_dump_info(this);
+		dmaengine_terminate_sync(get_dma_chan(this));
 		ret = -ETIMEDOUT;
 		goto unmap;
 	}

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
