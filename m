Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377256;
	b=vDQQHpzQ/tW6rjblFI2tOtvBVRWeSjZWiijIF7aSx1/Yy/TXIRqBSV1QOvZ4Z0Nw+7sV
	 DNfBRj+ixcyCMj4UT1aLjngVWWYrEYHZxjvUO8C3/5shOmkZV3Z20+zD6SN9MQteMSXBo
	 DXAGg1GAaSlZlZdU5XHbYsnWUKBnoV3oquOZJL4ir6ovyG7aD7B2FpBadrJ9jdgDKdcPN
	 0VuEVX6yjjx/QDB5c0e3TlmPNce1QqkC0TVdD8wvuwrpKOaGgY8Y72voqhmPWZe7E2SqK
	 YiVs9XCb9rAKDwcU3J7G+0bhux9O4VM/6DSbmy+iyg0oG6mjdfzagAy4Hz+cu68SxFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iaMtQnbofJSAxTx/DkcM6OMXQPU8wWZ6SE6xw52uqKs=;
	b=WM1S49T6S7LKD6UT5EOJSu3cBGO2s+Z38PDSQSoEd2DYuvYb6E2y46jx2PwfkgQLm3hG
	 znCVk9btHjdNEEpf/uRt5W1AY0NIKS3lB78HFGTjT88TSvmXSXN0FEh4hyf0ShjNpUWc4
	 eFtDIqAhCwXAtfdKrzKx9s18cFdJTj3/B9yczO0weLnvYrsgGHGekm3LwyB3/oJlenm1H
	 T0LMsvAlV2vASzwIzTd0SzvNQQ1bO5+l7E5MrVyxL84PBg8UuOnhB7u/6HuL4xLqnYokO
	 IGLfRPM16At5hpThJ8AOKgtGSzlQS67LQVlK4/fMSrgz3EZc/z1EBSA5sWbg/yMUhvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kw1KZA9U;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C63606A31A
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 16:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1C63606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kw1KZA9U
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-48eee44b908so546950fac.1
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 09:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377255; x=1793982055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iaMtQnbofJSAxTx/DkcM6OMXQPU8wWZ6SE6xw52uqKs=;
        b=Kw1KZA9Uz3TfbdfRzEMAKqPNmju3FGIFhl+VtO7Zldzua0o2CYBEN+lmStArpCw9vL
         EXPR9rb9IjwvdV5j8UUeij/eVbx3hF5m7UJE+Ac6x8ZDpC/L1n6oEY7CSEJDry8vnWhk
         TjmrAA6X3d/QsX3+8JfMco89cosdsPFYW07H4L4H52GW26KqXWhmnC2qcLlsjCPwCOLb
         ZtdxC19AWKo3rRZNFDwVpGbS55FrzN6JcusHiObvijRW5Ct2ff3LLdSScGCR8Rz1oAbQ
         CD8LoKCFpXPFzlHPXoJR6I+xwtCNo2+Dkx18PFEZEbQg72Lr4OmH6iEVuK0YZSmfxBNV
         359w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377255; x=1793982055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iaMtQnbofJSAxTx/DkcM6OMXQPU8wWZ6SE6xw52uqKs=;
        b=KdA/3oueqFxyvmMAYgL8mrt3/BbM3j+0XgWT4qzFfcWd7jR3VQK702ljgsw/kxPUG6
         iKdFgzQEo3gKxd+Q+Rz0AhaY+A51P8qadBtccPuS4yj5QmK4+cqAXqGM+Xdan7GuftZZ
         pFXuEX/Fl4Ids2Wa+XMkksiTUsLP6n6F++59F9GHRwco/N1DZW+bY7fVfXICjiU3JkTS
         E+abQXDnOX37SmBPq3919K/NpI4msnmxY6OLUi6YQ31dN3hiPPtLB8qreUhNI08V6aKC
         +0r4y2vIuG9TDvlrQVNXpZQ6Fl8Whhij9GPiL+kkLC3p+7E34yMH/lNwsNPjgeJA6DgG
         1SZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLyAMMidh0gNZoSsj/dwpIH8tpKjS3Aie+ockLI1X3E0ARz6TlWYzWX1//8La5HMU0KCI=@lists.linux.dev
X-Gm-Message-State: AFq9FYI200YbrMKp8HjTk/34GptB22VmJLYnT6/OisKO+l2XxTHIP1Wy
	tTT1nCLEJojnaLwLtsVVpj4KtcV8RQX3Yhvd5h+tv8fl8zK+HOe/qZXU
X-Gm-Gg: AYBFou2+qYPAJ0in6x4HmAB9BncSmkjwPaTCNt1Geg3FGltXtK/k8mv/0nz3f6wnuUt
	wlui1FOLI09L5OYGcLp2Vgu/wXwMlR7LezEXNAAHv0jcwdOdtOimHRuTm+/mS+eQW+fxAZcSluJ
	/9GUi/fWnlSn4UswtygM2CDH0wLBapsSOHv7hIian4+XLqzxRGXBc9szNwr7D6XbM9d3MqL+WEv
	KJVJ89mphOWg3UbESoBZ6qop7tOac3xXBX4hGTFYPY19WrAHLvFE2/gWS0Tw/gKkTrTjDRni2EG
	Z49u5nJBor9nzW5UI7BLpw6bbrt2IPFoxdwYM0Jby4IPyxspQu6BKvMnCuNLrVbahVUaVzxhzTo
	979U89XFmIE3q+VHpIX4B01Hm3UQIBFiYKqHkbauLivgrzctxnjhwCvG29Y668fDV6vOj0oA/72
	29houJoJdQHxZBSclUN+gEHm34gKs0BJnDi3DzKvOv5g7+aI2SLKKa2aB0D5QxHh9xQ8fE294a2
	34CKWR+H5ZVrXejRT2/JqtwxNXCzeTndaCNTuW8/ZMrFEkI7kUfq3Fdmcpk/W9cNt4pDPydy2va
	JNwjAlQrSeGerVzJlJOPsZALS3mc939lW1z/Gc08dp4pm5rdgNf4sncCpNqCfgZsb8GOCryZlft
	bbkldUWnBl4NeqS3GeK1SlZXV4YZGWdd2sN/5L5yLwUW+CFJCT/bYHUJhP2jsyIL9XBws26nr79
	xzeJh4ASwrNdK5ypY=
X-Received: by 2002:a05:6871:a1e7:b0:49e:334f:312d with SMTP id 586e51a60fabf-4a90764b81amr1805240fac.16.1793377254766;
        Fri, 30 Oct 2026 09:20:54 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:20:54 -0700 (PDT)
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
Subject: [PATCH v2 1/6] mtd: rawnand: gpmi: terminate the DMA chain on completion timeout
Date: Fri, 30 Oct 2026 16:20:36 +0000
Message-Id: <20261030162041.2998170-2-samarth.colleges@gmail.com>
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
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc..86163a552 100644
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
-- 
2.34.1

