Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591273;
	b=jzx5M6Y6nCfj3lqR2Mbi7niLjNzw5FPWmZ4U+/c25Hxe944cKEOx9RwPU7aytip8oc0e
	 oZ1GYgXKyhA2KoD4PFNiu6obi6RxUxT7lVyMwsEWq/CAZ1x00Jha4HA4F/o7UH6XdWKlg
	 Nf+Iw2o/hwvNxsQQTs82K1YcXsq9cDykBgMdDwCAUeNo9CVsdcWxdsFiTWuPNGr4xWBBu
	 0bQc4U/YXT2XsIqzIN04lOStjj4Jy7EK/89zuObSDRhDAIJMc2NpFOrpmzp4eZyfJQkKI
	 5ewXGgGw4S1ZfaxoqGCUMrwB7ziklI85mMS5cvMfatmjw0LpUBzFftFEEDje6if53uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=io0jgXINzxf8Pk44PIZlHBE77FZbFSzj7shA0YE3rU8=;
	b=w+/7PhQ2qlJFDJQZM1IwfOitdmfPSs0A7GaQkoVvFvCwKKzxnnEPJ6vInfMdM+lYXfF7
	 rdo6UwfEQk8sK+7K4eSd+36/DeIlFwBaJvModNKBKaLbCrtP14jDXN3V9704CNwhGJOST
	 E9BtgVlrcTF5mvtUZzIj8/w9eal0iOHEQ79RQDOYZAwC1KP19MIMtj++oOfIO01QOJZzn
	 F95un8nectZ53nX93U/+OgYLTU79rLXAzB/j2lNcOHjbUQ6Uq1f9e69FG+z5pP0XSiyWb
	 MfCb5yJaypFkf554W9+aF8RzhUXeYM+ryOZcwv6DJbH8tPfbuq4A2c52QWL13BiPxdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WV7u3SLf;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C3E606A31E
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83C3E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WV7u3SLf
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-385d8a00598so8000529eec.1
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 23:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591273; x=1796196073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=io0jgXINzxf8Pk44PIZlHBE77FZbFSzj7shA0YE3rU8=;
        b=WV7u3SLfCmBe6LrdVNLW1oUwXH6y0h94lHEZfz9Ph/+PAKXhXhfZwQcgwMaFZfbgus
         WVMJXiGC1aWRc52BdZynWOPMVpdcMyqBuIwdUvYMXRSNHvka5Fjl6gZQhfg6MdHh9/gU
         n2dam5EQSixyzlvBpbaUsKyFlg/ztzkX6duHeVExSjPBI4Ox2WHkwTi0KB3E8balfEyn
         tMS100iQM+G838vr3vb2BvkJw0/PuKo7/irWzVsUG2N4PqMmDfOEbwGfvlHeQ56zxuFQ
         kCCS0y/GGAG9kgGHWPI+dwPugLzbWgXgPB+bgN2PFUyWOqcB6ZgsZa8StQKCmEq09NLQ
         B4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591273; x=1796196073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=io0jgXINzxf8Pk44PIZlHBE77FZbFSzj7shA0YE3rU8=;
        b=2wMJTqRyuoGR0mrMZGA5nC2ywY3+u8Y0JuEBLPFSD53rMUpD95PDQZuSHw7uTOBIaK
         837KDgYjjKOkSakgOgewqDqM2gpuRcvPRBNtsfFq899ed4y/DA0T3K+MAkqywwv5xZw4
         Vd1MQmRnQFBbM8hypfj11tO97PbRsTRCvSNyTWLB219rfUs6rf4XVW2z17S0ZSGrTE5d
         s7vA78LlRsWlFCQJMe1UM69ya06HNNigYgsQllvRn4e3c+foFKC74lGPATy9zMRpxwvV
         x/4/K6a7nVeJvGLU/4p8iV6QoGPqaA1TffIQ7y4pPsUQKQKa6GPbRqC++ZGywfG35K9L
         otsA==
X-Forwarded-Encrypted: i=1; AL+hErEyHAyQ82TxWeQ1dsgDYtqwurYf/u1GebBIqfIi5b5g9cqDVbCdmuLiG0F+sFXVG7Lj8NU=@lists.linux.dev
X-Gm-Message-State: APuU4Z+UCwUAj0+gmoJ2VyDtzbXQFsc2CRrpEzkXZ+2NbvMZa9fiCxG2
	ocgryPpV6xyZBcFbJXcKg43CWJOj+LsZ7hujZ+bDcPk+2CyoVAgHwbqO
X-Gm-Gg: AZFdTZf46Y0QWUv2hkJSo1aXqM3NQ6Ef899NsDaAZQ64o4lDYWTLmR7wkik5PcdgnPn
	XSAOL/P6cOnFR0e3qIbhtByrbTXWvQPJXM32LzXRLroESklUvVF801aPWQ8zD3aMEta0dOAzi4C
	/Uxg10NNk9Fzcz4ViW+/nedw+IZdCKRtMsiQewtiHbI1LK3Agms7lQAN6vdNyi/uE9Irnt9midM
	zBm+rwAepssXqJgPuGVzqZvwhCEEhEqXPGB9K4ba672mYtF3o+FlCz1ygcEXxrjFDSF6vdMuOfi
	vV7yQTFcTywYofKJXM4np2U8fdRdY0DY3G+yjJG2PKhIOyEnfxBdvkqRYVZMi482hFqQHuB+Qqr
	BPs4mjfQVQHd5NVJE66Np1uLgdWGD69/xOyYT5iHmMoGsCM1A4EBAzkMRrKuqW7E2vhwdpmQm23
	vGgO/FSjLeyFrvzExaQ4mimMkoOWJFHauTkcGZXhsnqlW8PAFRKy7/HBCoqUX/9sC68lvgWenuO
	1ysKov8EZAI10bu9NpP3DwHXIO4flF1LQ4TBxpxevbwNNHLspX+Z8am7y2zLHSIN+3fSSY5TX0q
	izxZ66grauCqvLFyrSxpl4ihg0NtOpNbYYyBXWh69DeeDan/RfNKpM2syiy+lnqG
X-Received: by 2002:a05:7300:fb97:b0:381:6ac8:ef2e with SMTP id 5a478bee46e88-3856ff5db0bmr24055433eec.25.1795591272607;
        Tue, 24 Nov 2026 23:21:12 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:12 -0800 (PST)
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
Subject: [PATCH 12/12] rtc: rv8803: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:26 +0900
Message-Id: <20261125072026.2997493-13-prasanth.r@lineo.co.jp>
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
driver prints "failed to set wake IRQ".

Use the device-managed variants so both are released on unbind, also for
the wakeup-source case without an IRQ.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 2f80de657f83 ("rtc: rv8803: Add power management support")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-rv8803.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 7445c8151..9dbbaffcd 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -700,14 +700,14 @@ static int rv8803_probe(struct i2c_client *client)
 			dev_warn(&client->dev, "unable to request IRQ, alarms disabled\n");
 			client->irq = 0;
 		} else {
-			device_init_wakeup(&client->dev, true);
-			err = dev_pm_set_wake_irq(&client->dev, client->irq);
+			devm_device_init_wakeup(&client->dev);
+			err = devm_pm_set_wake_irq(&client->dev, client->irq);
 			if (err)
 				dev_err(&client->dev, "failed to set wake IRQ\n");
 		}
 	} else {
 		if (device_property_read_bool(&client->dev, "wakeup-source"))
-			device_init_wakeup(&client->dev, true);
+			devm_device_init_wakeup(&client->dev);
 		else
 			clear_bit(RTC_FEATURE_ALARM, rv8803->rtc->features);
 	}
-- 
2.43.0

