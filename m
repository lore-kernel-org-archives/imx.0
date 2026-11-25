Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591265;
	b=he0ORo5vB7pk5flCrFosudR0xuPsSZfvbPqtiCbRRrUJrX0qp6xnunuDyIXOSGmJ1qYI
	 RTH03J6xO0Q0LuuCSfke1XKWDSfcWizJ3aVHnxzrF07hwhawNunsqrQZvilFrruxmFb2g
	 ozdBprTwvHX3wLdKCge3Gb6OhNtFpUJT+FkBZ1fQMrqi9doAXrKVuuLaE3xaRt6Kgx8/W
	 VR0LlL0Ch5QoR08Wr1dqg8A9RVFbGVgRd7PQmyqzse875SqGH3VyHDllr8PqIRw+DtSds
	 DWU40BvnKokqTHOS8SX8SnEZpPF/jgIivb/9Ngdfs03IJ8r4NHVv6JhrKtKO7Pat7kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nvNpguFZ8dgL57oZbzRJkOYpYD8+B/VysS9gBllwJ8Y=;
	b=bFi43jOl2ETBNQ6gTX5QsiEUQAgukx6nNE9nwr3S3YNQ7hMF0iOC7mGDkLLRAvA2N/YW
	 Hj9MnhUSBYKiO3qLoew5jD2YShstCoqZ97LKT0/Ja/rFxnNWURoMEwCydvCMk3A4Ocrjh
	 Ba3DDfYIcE36zAPch3VFxUryQToh2gkLgpY3sMdScT4UmmcoRfrdOs+4YJc/BFEbTywVB
	 D1LW33okonK3Ay6Q2Nw4Bw/h0wsSllj2x9WKVEMkJG+iKfTDe6qDETMfcYtE8Q08lFKFQ
	 icpPCYECKpQjzt+SSkbHhk9WSxXIyTCBojNsptUEZjcgzYdb9xnRtAZq8cuUTYY1xBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="H/YMCVVi";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FB9606A330
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33FB9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H/YMCVVi
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386bd881d39so3833340eec.1
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 23:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591264; x=1796196064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvNpguFZ8dgL57oZbzRJkOYpYD8+B/VysS9gBllwJ8Y=;
        b=H/YMCVViekY99X7w23Mx0XmMgh5PaYc7WMUYfwriDyTgHNBzR4ESwaKHyU7o7IgKOZ
         3k6/bTgmW4lmbXbkBmBOy8Fta/dv+xX41s6NiS15naidmxLUWX3cN9XMHyxW8EuyGp6x
         2H2nWl1BMlrAb44WqB2nHoOcCMIQUazZwfk8gnKJmDO7LuVwFjNSOylVac/T1Ubh1xvj
         dQdPLHLoQmhaaTGo6unxh/uQP54Sgl00mNoM8jd+MxKrXbTbEgwrfoUqvn/0zB7bAVTP
         kZNBX6Lfk5cS00wgzsQY6Ua/il0Ue5NP0lH+pJadqJNkAFzvHS+n0GriTlbUxGhOoJ+M
         CYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591264; x=1796196064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvNpguFZ8dgL57oZbzRJkOYpYD8+B/VysS9gBllwJ8Y=;
        b=yQUmi0gFm+s1zjU6nKs7rHDgMgr47MtTf2x2ZgnWr36JtrUUPugR0FR/TDMZzMUDiT
         omFsReZkCniLIkUpU8Zntlxl7OqubilplA+G4C7yIfJyPa15JO0BpTBkVJ4CRpiNQjPM
         PpxXHA1wkmaIRjmTsOtp3/3YWxFuVjiaiziHv+Qm0Qp90WRfqbCiPrRw2RFNHnrYVXxI
         jXWalqUsUX/pUlqsqE/I+I6ZnjT6tzZbB7pSi7t0ecvSr78/MQPnNa0Gv5aEwEZVognN
         1XJuOaZwfFMmgnSS1y6H+TiWfaJ3JrFFEyp7yvTNwSHM3RPUxQplAnAG5V9xSa1BAc/I
         xJ7g==
X-Forwarded-Encrypted: i=1; AL+hErEu/bX/3yY79QR6iJNGzBZWfxlANWdsLdDx2v2UMRUhEcFMtED6fLzjzHFm/2/eHJxO6g0=@lists.linux.dev
X-Gm-Message-State: APuU4Z8+bMsvZGMIzKjkZOx7D0DIMEuBTFwpg6FiTdL11hMlxwBv7TB5
	9QSjPsShQSs/+/KMLsVt8lIP78SuDGSVByt4yRqX5edjrO9JTrlr9EqF
X-Gm-Gg: AZFdTZeSVzM6aFbum7ARsI4vZpWJjYU3z3SqNmLDTcq1YPhvwp6sizt7cyewrhh/hp2
	BBgvirniWUusgByJp92cBsDKh6g8VbrUMmn7N/lIyFn6/uciOOtoF8YPlIJYt0QIqrzPE4TIaTd
	ppqpNHQfL5CkOajeOWL0KicsiRGOMyCFu2yMmA7pBOJWJXuxTi/2hDS4djk8xtTlkg7EKW56SAU
	K0OVAzYd9cJIjnqAbVs8apgRPPOzvhFQwD/mZlL9RW9tAg9S/WXE1dsT/B4a8wpe9V6S2iNn+no
	SdkfcZpymMEneN0BX+PrKMD2Px7QPQ1Pg8CX4NQxqSW9ZA/+WILv1kMzjXKV7skVyzyRnpfnwei
	j2j8eryAPVhC0Q4BlMD8/unfQeyaxNjuFqK1Pzn4H9mDPx3VJgL9B5RwYT1zwr1npSSN8W1czsG
	FRuCIiCc+GBY5Q2Crz0VOeqSC0WqGqEO0F+zpJinKb/V13OcdoIHBUNY7GSXraZ6w39zmih8lsb
	Ai3/THm/fQPQG2y7wF3AbHMC8y1bpR7doZiwfncjci2QjFv93lvfdSD0/dV5UAQbRy+xjPNy6T/
	rTVhi4cIMXOiGrbaRZ1EWRySa/xRkHvcs37KGHudQWypTuanhkYOKtoxl1fEoz3w
X-Received: by 2002:a05:7300:5994:b0:386:a915:8b97 with SMTP id 5a478bee46e88-386a9158dcamr12709277eec.27.1795591264064;
        Tue, 24 Nov 2026 23:21:04 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:03 -0800 (PST)
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
Subject: [PATCH 09/12] rtc: atcrtc100: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:23 +0900
Message-Id: <20261125072026.2997493-10-prasanth.r@lineo.co.jp>
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
IRQ, warns "wake irq already initialized" and returns -EEXIST, so probe
fails with "Failed to set wake IRQ" and the RTC cannot be bound again.

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 7adca706fe16 ("rtc: atcrtc100: Add ATCRTC100 RTC driver")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-atcrtc100.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-atcrtc100.c b/drivers/rtc/rtc-atcrtc100.c
index 25183331a..2c78192db 100644
--- a/drivers/rtc/rtc-atcrtc100.c
+++ b/drivers/rtc/rtc-atcrtc100.c
@@ -318,17 +318,15 @@ static int atcrtc_probe(struct platform_device *pdev)
 				     "Failed to allocate RTC device\n");
 
 	set_bit(RTC_FEATURE_ALARM, atcrtc_dev->rtc_dev->features);
-	ret = device_init_wakeup(&pdev->dev, true);
+	ret = devm_device_init_wakeup(&pdev->dev);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to initialize wake capability\n");
 
-	ret = dev_pm_set_wake_irq(&pdev->dev, atcrtc_dev->alarm_irq);
-	if (ret) {
-		device_init_wakeup(&pdev->dev, false);
+	ret = devm_pm_set_wake_irq(&pdev->dev, atcrtc_dev->alarm_irq);
+	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to set wake IRQ\n");
-	}
 
 	atcrtc_dev->rtc_dev->ops = &rtc_ops;
 
-- 
2.43.0

