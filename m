Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095753;
	b=RuphSS5quXxqasZfq84rbsWcf6J4WRjG9qC9LNt5Y/cG41k++QMSgJ9vqGu482JXYdEM
	 HaX0l4eUSrc6whwerahBlNGGvNVumFLCoMZMdX1KbM/SPGorgGdyoZkqxGTJHnVOUo4as
	 jvPENpTStnSGdOz285NdtAxR5/v214TUqV4xroY4F6UtQg98eEQumi4UVejwokU/2XUYu
	 D4z/kTfgjZO/LwETg7cxkl5PdqtCdUSeeVpADQGdAI3bLRTQnB0EoHCO+xzofKG7orQ/A
	 JomxuwP9nR665WINeH6BrNilRuQnI3o6HxHM3RKAZXL4BLX3RWzpuQjZuV1oh0HdcZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9qeJQ2WcAvPP7/Q2COJ9+M/C2lXq9FsH5eUhG/hiMvQ=;
	b=pLR9do2R2kUs+O/3hIF1sPnM4IoZgtIIJZzG2HDw9X9Fr6njJP7PR2TAqXLdFuU/tlqI
	 wv0DyegjUnQjoNm8vROx8cp3JRKI0GanLVVO+xV+sAeEIw0AKrroyxeRbhetCPuNa55BF
	 3q/a+AaFlblwCtpcfDnLQYKIyG6VIPOAPzPp/fJvYyr18O9inE/hRZC2ymlazCgJJmYXb
	 l+1URHdFoK0v0yy1+n3jPuwJv/GoudbESgknvrZYctOLy/40TBIjk08V46eKSZYbe36ed
	 mTfu9HSS3IwnkJzamdMYXb3IlM6Iiqkivou3KqbXJOeRbKzfJezQOa26Ywtiw3taGHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XcvEs4r2;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7084260A3820
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 13:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7084260A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XcvEs4r2
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so1280354f8f.0
        for <imx@lists.linux.dev>; Thu, 19 Nov 2026 05:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095752; x=1795700552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9qeJQ2WcAvPP7/Q2COJ9+M/C2lXq9FsH5eUhG/hiMvQ=;
        b=XcvEs4r2IKyy+5vVQjk1mALFozfH4NikdCOtB9y3sHv7F5LP9Etu2mWTrcRZ4YitiF
         FxXd2SuXglwr1s7HTSBmnrhgCC32ZpwZOVK0Nc10c7eFPI0cBKdw4Cr+v1K0Pl1qqKrS
         DuLjX4mJA+Lx8iKaw9ZQQgEHFrlQdfFo3UXNVQZF8gcgu0DwES4mprMSM/PGTRqWmxfO
         KMnNZ/9z3oeEEoJF0+t24xNxbUbKeEuiXD5nWyT4lfkECjRdMI+qKMX4zGADpO/yTZRd
         HprMrDb7gNKRMWBCjzChsjf2sv8As6DqClbWqz+DIU3JPn17iTX91J5AoW05IODvGwV8
         dBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095752; x=1795700552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9qeJQ2WcAvPP7/Q2COJ9+M/C2lXq9FsH5eUhG/hiMvQ=;
        b=cIjvZJBJhThfhBXl0hQmXPa3JNdmnbuABsCcwFymF/lkHYZrh68yTXtIIv73cqp8BM
         mvEeb1RDVFhgXxFRsplv5bzM++nV8ocf2uB/I+Qxd0sulv32KwGBXnuhC52FchXntEDM
         YWikJTuSwpAs+8M2ILcZ/1i+bNnLHQCTSZH8KnCsSKsf0kcrPWHgjst9AwGhy1JK9Svn
         ryY1SYvGmfkJwQB1RqzMOXpkvKupOb69lSBPyhPAKNSQFGrzUquhhPWe2ViH7uIzUqOP
         adY6D1HzDgTLI6wLrOHvKEalQ6XU9R9tt3Vwgi4mCASv2XpnXtzYsj+ufWATOxq++Qvr
         OAzw==
X-Forwarded-Encrypted: i=1; AL+hErGN4IV3WxUAQE4I96QzFBGW2T+8O35aeyI/qYK11gRWQjeAbWLiQIyots57Bp/ZsKlGAcU=@lists.linux.dev
X-Gm-Message-State: APuU4Z/QjgQdbIMyoOycSG2Th6qfy2/C8B/5kmjQeB8cZJURnVOeUlGZ
	4+KJC14z/bZ5Gr/OxYWHjK8Gld4wkIfnR4e2+0zSssOu4NjKVLPcaNYI
X-Gm-Gg: AZFdTZcwiS390Adzd+RyScyD6Ht2/Q1kdANoDHVjAOH8Gi5RFTZsWvMw2VMvSHVdnQg
	aLLPfGxNjQjURTi+USqmNpLNBVhw/H28x7IV8uOYlXkEXrwVih1PH6YabFhMWroSTufY2vVCS+D
	evvtgrdLq+DfDJgsekH+ca3Jy5lKXLBca37yNdp7c5ABBLf/BYzpQ6sixuaiZ4G9RuYjsNGVeUA
	WLJlvhEpzTUBorcpMy2WSljqr90cGbC5LKuXWHsaL7GGnoHao5nauEHVAJNy5lxFbEp2yHt0DsV
	S92+AZ7/hQYcCkc1SooXxXaVYdnok8kANUjZ7TJ122z+YkNr1PHIYRlkmZWghe5zxXiA9GSg69J
	E4Xfmaajb+8vuXhuIRP2i2k5JODV1V+slg3B0ZHgeJ9sMuPkPlEOqvnG1zSXowaB0TlfMtEqUZb
	ln/TDP9ryXfnOlnZN9KQl6/F/vltkHlmxr26dEjxaKRBtrBLRVo7KsAZoA74BWkUmXDm5f/VStq
	mj3l8c9rLOaUW96ySSbC4Yww/J8m42C0opGK5sbiTa2rwHI996q0q0DIvmB5Y08yDumCv9d04AW
	bjd7xjSIdQcMIiXuriyHArQLhx+sxebk4eh44gG3ckMKZxtXipYU4SYQ
X-Received: by 2002:a05:6000:2c0a:b0:4a7:1fca:e52b with SMTP id ffacd0b85a97d-4a71fcae766mr11850285f8f.19.1795095751841;
        Thu, 19 Nov 2026 05:42:31 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm9437971f8f.42.2026.11.19.05.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:42:31 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 3/3] i2c: imx: return -ENXIO at once when a DMA write is not acknowledged
Date: Thu, 19 Nov 2026 14:42:25 +0100
Message-ID: <20261119134225.265242-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119134225.265242-1-mehmet.fide@gmail.com>
References: <20261119134225.265242-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

When a byte of a DMA write is not acknowledged the controller raises its
interrupt and no DMA request, so i2c_imx_dma_write() blocks for
DMA_TIMEOUT (1 s) and returns -ETIMEDOUT, where the interrupt driven
write returns -ENXIO.

Let the interrupt handler end the wait when it sees a missing
acknowledge during a DMA write, and return -ENXIO. The last byte the DMA
writes is still on the bus when its completion arrives: look at its
acknowledge once the byte is out, before the final byte is sent.

Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/i2c/busses/i2c-imx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index fbfabceb29ac..06b082c677a3 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -480,6 +480,9 @@ static int i2c_imx_dma_wait(struct imx_i2c_struct *i2c_imx)
 	if (!wait_for_completion_timeout(&dma->cmd_complete,
 					 msecs_to_jiffies(DMA_TIMEOUT)))
 		result = -ETIMEDOUT;
+	else if (dma->dma_transfer_dir == DMA_MEM_TO_DEV &&
+		 (i2c_imx->i2csr & I2SR_RXAK))
+		result = -ENXIO;
 
 	if (result)
 		dmaengine_terminate_sync(dma->chan_using);
@@ -1123,6 +1126,9 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 	switch (i2c_imx->state) {
 	case IMX_I2C_STATE_DMA:
 		i2c_imx->i2csr = status;
+		if ((status & I2SR_RXAK) &&
+		    i2c_imx->dma->dma_transfer_dir == DMA_MEM_TO_DEV)
+			complete(&i2c_imx->dma->cmd_complete);
 		wake_up(&i2c_imx->queue);
 		break;
 
@@ -1248,6 +1254,9 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 		schedule();
 	}
 
+	if (temp & I2SR_RXAK)
+		return -ENXIO;
+
 	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 	temp &= ~I2CR_DMAEN;
 	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
-- 
2.56.0

