Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371192;
	b=zuMhbFRZ84/UWX6GGVJahA3ULPOLo57jlq4AvIotK1yjHoA2hp5e6xq3FUWI4hSR7XDk
	 7aJX+WB73tMa6LUX0IFAyl/tJ73AXb1zPkdnA55pFLVS6dQpxjK9kXKKRJb3VYizfAK/O
	 lN1NrHYmpKvaPK5sx+6sIU82VJGJq80Wg8Vm2h9qsVAfh9hh1hYkgDJ/akZfwbL+P6AV1
	 8Gt4dfghksb4D3gxLzKTuunEUCTsh2heEhrLrW2cm8gqXzdDb85zCbP0G/Dq4/YRP7gTR
	 Vbx5VTPMATe09fDHCLCV61L8dnD8+j3VLJyikNa4C82L/vosyKnBXw8KXa28/VGJGIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R2HclnRmIvT2ikyO/43sxrVPfYW6Mo/iFT1div/Cdnc=;
	b=ucTJ/nVIPXDpLATJEUgU6O+pH6fD1993wmXQYSfxdOmG3emebJyyg5MGUQH82aISHpW9
	 ukLVSsyIO41cmtYSj9S4nbvNh4hMmmUtYhNtwbGZdwvPUzv+szcdQXfnCTlesRQarHCbm
	 NStlo3NkVLs4Gpr5IZWxmRbuhly89By/8pgaYHFTJxetxjQLXnnwqlFUAmVZJQVOY0SRf
	 6873zH0K7z5JLLHT2fgC1YaZJ4SjPCwfXItjFVsyi0QWj27eOHbUR7hr2Nie0yrD/qCPG
	 u8bDaUwkywert3qsFw2XXPnSRNqZ6xF4v3CLl/Q5HV2JsMUbVfrtdcqzbniC1irPldQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P0sux6uV;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E76C606A31F
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 14:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E76C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P0sux6uV
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-170135e43c7so1157366c88.0
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 07:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793371191; x=1793975991; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2HclnRmIvT2ikyO/43sxrVPfYW6Mo/iFT1div/Cdnc=;
        b=P0sux6uVNhym7lm1s87DTt8BAE9m9JxWNIrJMLgaF2ze6WXrAy9sPeQFerf+8pPAPP
         Ioh6Di2vb2G82JjW9j+O2iPv1jY/tOXlI3N0eHoLhddEzFYeSb14Hb7rvbQ3G+k9cCED
         0f/gMkTjfgCKRcuLWO9u/1XpOpj2jgpZ8yyxwxTwtGY4S0zWlNN9RGQt9FN45GxcQ9+E
         b+HcxcwWIcJZc+YRBJ4rF4HEXckSuYZRQaDulLoOySy0D1GtlAGpjSOI+e5zUa6Ecf+0
         Nv+JgiCVvdJYsWjbmKe2lqlInMGWeSWJ/mFJOKsXTzBivn6JqUaYk2WAWRD2qMdIHy+2
         B6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371191; x=1793975991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2HclnRmIvT2ikyO/43sxrVPfYW6Mo/iFT1div/Cdnc=;
        b=F/8Kq5zK+H9OTFtfnF9y7bTJHx6svq6nowgl3zQ9jp0lGZ8XpztVJ/R1xYnh3v8lM0
         6ww+1sz/2GtafEmCLF2uSBBUZ8NbZfbQaFRghvsjts/QtTakJdZTCivczlSViVdNUweC
         z4183b8rRSoevDf4MNTZhj+DZI9q0V4vblwgEAW+4CuY2aJ099NeCDBjKUJXc9T8oLMB
         gKt16L8P5pJnltLWr/GJ8JUosqWdK5APjQbAJ73r0aJLzYSneJGGrDbruo5L9ireHmA1
         DS2rVkrrQEEgkuPRNk6B0wxWqVwnWpyUs6h3B/ODYi9VWS8M23RLa7Dj1vi8sm2b5tUG
         koZw==
X-Forwarded-Encrypted: i=1; AKwUvBzn5VU5JzIzeetPIIb5HX/RUT2rge5eGQXOkE6bUynKRN9YNS4T1KZdnYoysCQDFMERKA8=@lists.linux.dev
X-Gm-Message-State: AFq9FYIK1GkPJh9OWxq1OuZ9um5yh4PcS+bm8bHVBACZYGzdn8MzhA+P
	p+QdtyjEJwfw9X2b0k1QK85v0aJrNwdttQDMHEqGQ2qPIrpuDdt1euMS
X-Gm-Gg: AYBFou1mksYqiCNZEqLwscVzueJQB5fginj7M69tsEf0sdU2+9WPWGHwTwt9fyXfoSw
	t9dy4Z1bJxPivXTPAz/PMkv7ov/b+uHp2NWpHI2qtg0nO4SCsk1lb184Ec5M8UMlvrFt7CsOA0Q
	Som1tSdadkrbrZWUKes83yAQQ1bMjsM7/AXjOQAW6Wt0uXKjFvZwzRekgMAEYWJTCJrXJXQ6icO
	12B6qZYwj2zArFZNZu7U9MES5a3olVQmQBT7wRJleePWEfH54K433+iZ3i1vsqdKx5FBr7kZ/l7
	n9MwHe2o0a8RTPRzoeqF19lmru7l7PBYUTaRWAgTzbSYNRBJb5Umuncgv4G87P82oRNUy6UAfey
	xrqpEyhIICbAdmvrUCiVW2bv2Ce2SI4ObQnjF+QKqXdjhZjzTWZ2Z/ygy543EQj1VDEYMPLErEF
	f+TY/8vZD9B9iztIubzCQxNJF4msCdWzNSM37M0XMMG5y+WVz5BxqSUUY0P+t6WSuCjLaJ3iPIj
	09xjtEyOFlvcaN/nSPKS36cUnYHypc0LKIHGGhospSmiunTc7qIVxcO6WfSAylGgJ+1d5LW7dHJ
	FGDR5Ozd4zcumo8VpgHBHZTvzK+i6ynZlDuzYVB9gmDe3YJ+zirMj0SiLgsqx+8W0KJNsGDZPR0
	W3yilE+KwSitc/EQEL9kI63LAkyBnPo8194uf8gWU+eeX2ql+GmGuQD5q/yUkXQ0fSTyPUOg+x7
	9szkL8olD7uD/0KQ==
X-Received: by 2002:a05:701b:2411:b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1ac557770edmr3026667c88.2.1793371191299;
        Fri, 30 Oct 2026 07:39:51 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm7399020c88.5.2026.10.30.07.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:39:50 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH] mtd: rawnand: gpmi: terminate the DMA chain on completion timeout
Date: Fri, 30 Oct 2026 14:39:45 +0000
Message-Id: <20261030143945.2923554-1-samarth.colleges@gmail.com>
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
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.
Compile-tested only.

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc..a8106de2c 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2659,6 +2659,8 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	if (!to) {
 		dev_err(this->dev, "DMA timeout, last DMA\n");
 		gpmi_dump_info(this);
+		/* Retire the APBH chain before its buffers are unmapped. */
+		dmaengine_terminate_sync(get_dma_chan(this));
 		ret = -ETIMEDOUT;
 		goto unmap;
 	}

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
