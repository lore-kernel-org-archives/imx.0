Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555176;
	b=GjiMxgs9eDQ0YF+ac5moNZdm2Nrk7ohnLMG706eF48ebiLKd9PnN2f/7zeqfHo04kuto
	 GSC78VW7zRFhc4KDfHczI0Obc5apPqx9+gx+0V4UV+mQDHKYhzRUPHDaeK1fbjlKQ7doT
	 OEWq6jbeIYtfuXlePCkmCb+DOB6ElCm6YGLzcD9QeIwCobp9FBjuLjRJutZUAov/xWXdr
	 X/c8qbQIHSRDWV2rZZFl+I//PvLxzZcu4goqkK4pqZmPrwT43NZuO4RnupSStC3PqTQCD
	 v3mStPz7fNi8zQmu30+OntCrrFD70kCIuFci6tMBkXpVnhnsZ2LFGtm1Xyp1LnBSmRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4ra5/SK4PyEv0el96ww+o2fa14mgOl6L/hKOXN+sF2E=;
	b=uAXwhtje6OMkcQt94tcX+yOqfp8kdvFC3D3atc01UWYZeOY192nhH8CJW/kz3zL7oa0R
	 0U5Dct326jzF4hanMlAOetfzKVCpbMrO1jlPx3ekHk6b2Dbdx1hr38s+YR1IuhrLyXxuE
	 AlnUWZYfNOYINTcBM2tiMlfEW4P+DfrxFnPKzJmEdSoZzxiobLRQwDXv6KoSbUKibwMNL
	 EUgXYBTDXljVdvVm3vjZQCZwkaojkdH9+8drY9FoLKh8Il+bOzMSlHLhBiBms1trnikhL
	 klZaCdbbk082+pH3r7txDrKOwOjA99RcuscP5HjWY68AitM6OcTyX0AmZVqrEq+9BhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IWyXDiB/";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE94C606A88C
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 07:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE94C606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IWyXDiB/
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so10166745e9.0
        for <imx@lists.linux.dev>; Thu, 12 Nov 2026 23:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794555174; x=1795159974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ra5/SK4PyEv0el96ww+o2fa14mgOl6L/hKOXN+sF2E=;
        b=IWyXDiB/8gENMoslhPh8DzklWWd979bR7e2pI9wJaSC+JB/urM3M5T6G1G5rqpVXH8
         C1IV7rq4tAviKP5io+UXb25IDXlBD7TWxOPfD/uxKhG2B2SDSOgLB76u36ARul9hY1p5
         bhFCwfBWWnanksJFqT69kFPyc27VP7wHoZpRLQOb0fmwoQgf4aSgUFogG7zSQNOcHO/f
         pL7gTt5OhnP9vtRFEfvgwPZdk4OKYMgBNHtFUHI+bGTZu5f+a6oMJQKAqnrmFpqGYZaN
         9J2/BceikP74J5KjOUYI0dk+PCmjdlrzJJea7lIYUa5Rm4rloUlMwPOOZg3L7LTvnYaK
         rO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555174; x=1795159974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ra5/SK4PyEv0el96ww+o2fa14mgOl6L/hKOXN+sF2E=;
        b=CD67SqsMXvD0fke6XJz7mN4KpJ7jtDltQc/+4wNfKlzgDRNWuk9MLGnW+a8fKK+WE9
         O7jHzvmYyAJDJfAB+o91rvmISUhEAv0lckGjtB4aoLvA/dwTd41BSZpHwAJq116GcZ+R
         Bl0ROy87FoAUVyWUMeR9t65x3kp7GWPxAaTRD8VMXFfnVd5x9V29R0TFB2nFOEonrnS3
         62zmxqhrNKrTN/5rJWlWHT5LMeJzcF+NskibJvu1PXvB9jDQVXpSb1PNKneJsd9UNh18
         UMswSDu33HybQwz0R8lw4Tvcsh31EImyu3kGu17BiSuWj3BVkZD3TNJYuRQmQKCGKgdu
         N3Iw==
X-Forwarded-Encrypted: i=1; AL+hErEGyb5i/ODSAbvKWIVFDC3Fca/UaH8cX+wYkLHM3Q5qJe77YrgOMkb5stC+55SSgJtovx0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/KbCUEWXWZ7+aPONfOcbQ43aP1pZVUjqqea66PRGOO1b9F27a1
	1RSXxizFYZHV4AVqzl3XLZCuhbt1iNTRrXlB8wH8ZERKEhXQcxmG6Pc5
X-Gm-Gg: AYBFou2bqw6t6ca7Va3tcj9n/lvSOKV2NxgC+41E2NnH5i7frr4nF0tj2roFMJFKEVQ
	xpjJcmDM6aEAFzxV5pfv7vOCR2J8SX1X6FLv/pHSdZz5PClcjytAMweCueYoQIjrqvCPFSJWrrJ
	DsbSi15W6wu1G1a/9Q3WCdxvaivvR4EtMI8TWQzMTar982AUNX6+oGEoin0sZIkoSavdK2aiuES
	RcqZn5TMcZgHCL9u32KPZJAEqaHade2QEhipC2MN53KDyhwUdRFmTLgBJy8zynhyh5ex72zwcYd
	4Yv8VeMXTw4JYwjpGBaWPHnKWxJa6F/YJGQ7Wlb266/KbIhAHX+nMHmlx/4Un5MfY39Tn1v0dew
	rB/qnOOtdwi/VT/pH873ayv3tQ9Wbf9ijDx5V++g++t2N4mdImQbu4bwCZ7MQpW21DR858OjNU1
	+cl9QlldMPRvQ2lEmUsrpm5r88wyRhGfGIMdNeh0b/8wf2vIVMQm7AE7RufxH+/MmF2m7bqxERo
	8JY4g6MpOPiwRdCz7K/otYUlXx4fpzeh6S70sevfRJP3u3M6f5s5Au9aB5wPLlTylR4YeG1VOHH
	bJInKgWPsXur63OnwRUFI4tNC5gQsz/kElc=
X-Received: by 2002:a05:6000:98c:b0:491:49c2:3b3 with SMTP id ffacd0b85a97d-49c71d48644mr3357985f8f.51.1794555174171;
        Thu, 12 Nov 2026 23:32:54 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm3799903f8f.8.2026.11.12.23.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:32:53 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] i2c: imx: return -ENXIO at once when a DMA write is not acknowledged
Date: Fri, 13 Nov 2026 08:32:50 +0100
Message-ID: <20261113073250.1037215-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113073250.1037215-1-mehmet.fide@gmail.com>
References: <20261113073250.1037215-1-mehmet.fide@gmail.com>
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

When the address of a DMA write is not acknowledged the controller
raises its interrupt and no DMA request, so i2c_imx_dma_write() blocks
for DMA_TIMEOUT (1 s) and returns -ETIMEDOUT, where the interrupt driven
write returns -ENXIO.

Let the interrupt handler end the wait when it sees a missing
acknowledge during a DMA write, and return -ENXIO. No interrupt arrives
while the bytes of a DMA write are acknowledged, so that path does not
change.

Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/i2c/busses/i2c-imx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 1987a0fd8132..09934f3b13ef 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1108,6 +1108,9 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 	switch (i2c_imx->state) {
 	case IMX_I2C_STATE_DMA:
 		i2c_imx->i2csr = status;
+		if ((status & I2SR_RXAK) &&
+		    i2c_imx->dma->dma_transfer_dir == DMA_MEM_TO_DEV)
+			complete(&i2c_imx->dma->cmd_complete);
 		wake_up(&i2c_imx->queue);
 		break;
 
@@ -1225,6 +1228,11 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 		return -ETIMEDOUT;
 	}
 
+	if (i2c_imx->i2csr & I2SR_RXAK) {
+		dmaengine_terminate_sync(dma->chan_using);
+		return -ENXIO;
+	}
+
 	/* Waiting for transfer complete. */
 	while (1) {
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
-- 
2.56.0

