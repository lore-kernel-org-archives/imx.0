Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591261;
	b=RAsa9ySjghgv4uG6x9UtP5D3VcX6QQHlsGZFO1jdvAD0bVpub3ZuH1nvAG2pfOyiiLN/
	 GlyUc7stz45OYYaz/dOkVzUe6Xy3sXF9uQ7YezpAUwHXryJEqcJjsIwp4X5cpgCZIle8z
	 UvxHb6TOcqi6feWadm+C/3LHBLDxRlc8yOaB6xIKwbxOQYTqwub3ubuiJPoBlzhF3VJhL
	 sn6Qnuu9XcJPltmZs1iJMY6t9+Gtu+TA+l01DcMczuo5qIvmxhd2DI/NmTtbzxVnWmmyF
	 4FjDmsRmZze4SjBoUWDkMwg8vuvmMt79jtYBfHB9GdfZd29XHBgYGOAvLM4fq+37c7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=28HBpc6z3pdJfLP1GsH9qqmR3YhVH3gJc4zTD6MNBjI=;
	b=JzEx17IhcSFDPZqGKw283n6d+6Xi8rstFYBf9ZcAXaPTX4OZAIDJyKwxFFGtcehaMTJL
	 vIPcJ1b+jObGccm1ZgzrZ5JgEsGRowvW/S3hdS4UBiv90GVwCKX+nTuNise7JP1cX8XA+
	 5G3Ztsh83XdmOHiOfB3rXrGTitasNXGJCx9zBmm+3Zf6fdLKRBx8NL3jN7QHPCR7JnZwJ
	 T42MAAGAyb4D3eHUvWkG++mt5xXKDAmap1m9O9LbufAqxtzfgorIyy9MRcJu0IGJlX/Uh
	 nY4IJrj01yojOcqXHF0x1drh6Uz2JWZXN/vG4rZ1ZAS9BUXlw74i3b1p1cnbD5Ec4GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jEWYCuhf;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96E6606A327
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B96E6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jEWYCuhf
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so5045102eec.0
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 23:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591259; x=1796196059; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=28HBpc6z3pdJfLP1GsH9qqmR3YhVH3gJc4zTD6MNBjI=;
        b=jEWYCuhfoHki3/KmDGMMl3CVwdxssdgihca4axokGAVAWpyPqXZK9fg028tFtGBH25
         YxRS2biq1SPx6k87z4OB4YoiIQpy+aA4k2iRU3WqtN3XFk4dZJbExfK8Y3P5L3Lq65CU
         9S3bx6eVbeaFRdwr+WKwUv1X+LIXJB8QOV2RQ102be2mgvRPJPvJlWu0HRm6XYdQj8Fk
         Jqe0zTWiG/c5Pd/yywFjH4vdp5/eL3+buVfClbbyEj5DrwQhnBQBAjtA+gBWwapsz+rq
         c321ZpNXqXOzfxqyytpaLhF7m8SqZUEsY9HW9rxOJ8X2rgEMC0j+1DpetZl2YpMve58k
         x4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591259; x=1796196059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=28HBpc6z3pdJfLP1GsH9qqmR3YhVH3gJc4zTD6MNBjI=;
        b=S6n0O2LMm4/U/Jt9xQK+fqfIsNjHIyBouIpeLV8x9E/Otvcqs+8eBHaNT4LEWIwVqc
         qpPH/TnlF6QiwiWT5urxYlJxYrXKw+vDXvSrMGnxjMZgZhGllw5sYzjz31WhfiAW4vh0
         0gbqYf3j+8TUyi1RHecH9xJ2raSULUrkev1B0CFFdGBUzEMpSJblHxnSOHkPkOUwcysh
         s5gF/gkPMt6yXu0YxnhArsbgYp5k8bMdN5ZJeq4RYEDxUGljFvGlQYnIpS3VQFMrZJ2O
         ASwItAU/529+MNErhjqqK3hGItjE7P4vUVLNLON+rpHAG5FJ4VGs8NVsVPvSUpZbWPUy
         V1TQ==
X-Forwarded-Encrypted: i=1; AL+hErH+eFwVaZBI2sixbGOMgVV1YHGBC1hSEbRY6s1Mg72E+azmHnWpxQ2mz7Qdw30seWAg2dA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8AatnDm36OYfd/fnTdwV1bXKxZ1W+J7By/szJDS3XgvDCNU0B6
	jvj/RTwfNzh25NHMfU3AZZaN/j4mJImJ8gpQvnpdN4PJ1QxZNhZCfEU1
X-Gm-Gg: AZFdTZeSWqiQJr6Vw43gjF58AZQdAdyJ0kg7HFjSnuvGO3Imz9p9OZnanucM7iWJQoo
	OTFLrRSP0an2rYthg7HUDkn3YkaYHASTA7q8NAo/X3PYOtLprPGIbO37DLW10u97QNpQkiNRRuB
	hepn1i2KOOppiDLyHoN0qupRZD34SmgHA3PJovk/agJBdRSbAuZQD4Mse8zVlyob6l5oJLCy19j
	jVpH8F1ZnLhPOgPvRsd+A0QuE9y5p7TUMr2U9zSwnt8dzHmn+py8R1H4zvNjdvVuL+EB7n2TbO1
	B9R8Rnvvk4LjN7F6suHyLjr8gko+X/S2fvHDVtgW0ViGJAL0lph+Hvqedn0aXH3HC2Q18O3GcUM
	4cQxK9o4d4bRLKYrV5bGqOUkxFVZ0Kw2vSHLTvOjnK3fPTPOicplh/qEXzN/gc7iIVkKgVRq8lI
	MqwM74SC+677bXxt/AxhNrbqu2J2mpzABlgLztcc7boUmQHgHg47oN4xlB0RISbgXQ62AekOnXx
	Qz7JRBb+1ZMVzv11KM6aBSR2Me1vrupvCNoNFvN3Tf6TOVnxGxNCTLYXAwZp+bk8FCfRvJa2i9P
	RPnFdHvK+56ASL9K7+jakw0qBkVs0eS+tBbfiGkdvx41zDpteHMDR5KI44jb95Y5
X-Received: by 2002:a05:7300:f68e:b0:383:d3d1:f31e with SMTP id 5a478bee46e88-3856e94760dmr17054999eec.6.1795591258774;
        Tue, 24 Nov 2026 23:20:58 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:58 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	CL Wang <cl634@andestech.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [PATCH 07/12] rtc: fsl-ftm-alarm: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:21 +0900
Message-Id: <20261125072026.2997493-8-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
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

From: Prasanth R <ragaprasanth@gmail.com>

The driver has no remove callback, so the wake IRQ set with
dev_pm_set_wake_irq() and the wakeup source enabled with
device_init_wakeup() are never released on unbind.

When the driver is bound again, dev_pm_set_wake_irq() finds the old wake
IRQ, warns "wake irq already initialized" and returns -EEXIST, so the
driver prints "failed to enable irq wake".

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 3a8ce46ce15a ("rtc: fsl-ftm-alarm: fix freeze(s2idle) failed to wake")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index 5473f697d..565fd0df6 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -281,8 +281,8 @@ static int ftm_rtc_probe(struct platform_device *pdev)
 	rtc->alarm_freq = (u32)FIXED_FREQ_CLK / (u32)MAX_FREQ_DIV;
 	rtc->rtc_dev->ops = &ftm_rtc_ops;
 
-	device_init_wakeup(&pdev->dev, true);
-	ret = dev_pm_set_wake_irq(&pdev->dev, irq);
+	devm_device_init_wakeup(&pdev->dev);
+	ret = devm_pm_set_wake_irq(&pdev->dev, irq);
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
 
-- 
2.43.0

