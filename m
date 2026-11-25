Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591258;
	b=4jPxFHL78TR8vBzeEq/7bPnCDVOx3SU2rITY3+9sexA1ncVZmg+aVXU3hNW+XosuZyj+
	 Vo9BxYYCjm+/c7r//ofkkiHVyvzwZmCHbrwlAovX+KhCaQa2ev/rr8iiaOsDQoCm9X2Oc
	 VGVqFvFjAQwruFmOw9gRhgWDcp02omzSquxwt401JFsIfZXrF4/503gmMOFMjwhC1IkiS
	 rxdX0xrvnQU/VFqVmDpd+9lxN2LhcT6pNx2PGvRmgSQ0gDlEcSeUeJEfIlTE+utSGhIWa
	 8z4G9SaWOR8M8UyFNtuHNSQhymhGPITACfDYhsv9CxoQzNr9kD5tZGzrD7ZpR/a+X2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mS57S4IRnHol3XR4gXWGEuCh4B3ziPP7sFo4bO43kVs=;
	b=arfOz4XxmDAw+oZHmJABaoc73rKi9XdDWzr/uyv0tXsJ9CYzcgCvdUX3Rr6tLVDKVL1K
	 A3i28EZjhvlr6IYuImfaWR9L0s36pHyrBKSfjAT6n0pii7XDGAUrMGO3gBNKtWy5YISBY
	 PORPjL5V7GrbMg4hwWwpJVRNzra5mmVONRuYMAWenDHWto09k4HX0XXuQUKW9douxsGTe
	 +xxEeWNUIjlJ91ESgQeCkIaUD3Kp2gIQgVv1HLfkzj0SK6weqV22k50Ki0awDcqjD19/+
	 t5TG0EgOQiebUZRmoNiy0rHjpQnN7dl4A1lJCXxdg95AOzjXEAC6HJFRV/CZZV82nYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gvGYc5ur;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD6C606A31E
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD6C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gvGYc5ur
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38699cf08dfso6316337eec.1
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 23:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591256; x=1796196056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mS57S4IRnHol3XR4gXWGEuCh4B3ziPP7sFo4bO43kVs=;
        b=gvGYc5urSRqx50Z3dPuKMtHAhqHAW88TaQBITEDmMBKz/pVVaMUoWhMJCDwttvV9cy
         9b2PqBat2gK789jyXBznTS89Gdig2pKbDU3SHm066lkfey887GOiouisIvNXSYey2VVz
         wgmbZagsmKFzgrbAkoPMUcEQpwyXbRkZzq9LS+0tOMCKrZ3AGob1bc3n1m1I3/9MjnFg
         NgrjYNriVkSuQLbUpMe8NHh+xzbEL/OCyymydf90JZ2dhiei6zLXEW2AW5CYY8qmY8jy
         24OOpF5rLvNTnJY7qroNweZaOlsiM2UdXFunCGJsdSI3hVGu70ZLFipPEjtl2ZFD/3H2
         FxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591256; x=1796196056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mS57S4IRnHol3XR4gXWGEuCh4B3ziPP7sFo4bO43kVs=;
        b=dpSjZGFwQRbCt+VVA5TcM/P29kfXWazd/IaKlBlXUScZN01mYqIj2NN0KDYwX+kgYq
         UIRp622mY/hvluxii0dDUi5T5yawtDVd9HcMOwK3Lso5AKb/9K7cpTip65VzLqmM19NQ
         HfPutc1OYJ5wlpwBgLUFr2FrlmFYUOTOIqGL1tMBn5ZQBmxw6wacFH+B8qTMclQ5CY6c
         KRKCGTEbdF5UzosmrysKvrQ15itFUGxRDqAXYrUuVxPP5SNX7WjouoPq2lk0gJ0I8o6m
         Qh8g5Dwx5YopguRbOrb/rxDQzyf740olyyl5azytdtVOvHyRsrWFx4BaK9ecapcev7Rq
         qvaQ==
X-Forwarded-Encrypted: i=1; AL+hErFrlLSrbVZRWKkZARjL5splK5eMiYUj8icaKT6YuCKT3Lt1K+S1HgC68ezx5HyKm9e22I0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/T4+TjAy/o9WinUFQIwmoTTOufQOW5GU1ATnQbidozo91fIEp5
	9v8ZvCfRTjKVCtjtrSXvY1GW5JAkC+rIqvW2GE9RynwSfk9h5rJTa0Yk
X-Gm-Gg: AZFdTZfia3c6cEDvza5VhVK+/OWKbuJP15IL8za+urKjmnIi2J/gNeMkQTvUnIprRvX
	Y41BYB1oiVhc+5dn8bmwdbieDLXWw9mb9LbLcqUTQ1bQV0zER1Jy8uUQtqppaMJqJnN8SW/oBAk
	CjLbO+JM8jQFLQ9aWWNeQvBqmHCqsCLvkx45I/MAyAvyeKt4KIpjdbGonQ2fYRxP95V2UAwQR25
	0G66zQlSKy15rlQJ0ioxsW0SA1k8y9m5wGTZXbrB8dA8PkGx13fbTd9nTG8AtLCJAIUQVQ9OhTI
	JNk4zeUFo7paUcWW3Wh1T3E9RzU46+2kLoHh5TMqtNVPEutrXBv/TW1YJFsBdTTUd1zilXrsH0y
	soHsXaIR9zLwSme/C8yzhHdZPCV23ZzE6Eio3GjYvyrOmNNTUnGctFbrT5W3iPf8t1rvsOqD65b
	HwFVeH9mxzX9iGO6kuA1oTbkGAj6qrIGHP5GdvYfN95dT8FOVzrglIauN2LUqbVZkqEASJ+34Lb
	sa0eEF8okKTeCuOUtM5ESklMWnK7rstYJmWZMGazJaQgIYCLQ3RX6SW/dOzcMrhc/CtzEKlAjoq
	E5pYTPLbPyqAmJmg9/gTJpFGvEeKtQ5plskUUWZJa3wdL5ZosI9ymIc/JNkFu4jZ
X-Received: by 2002:a05:7301:909:b0:386:a3fe:44f3 with SMTP id 5a478bee46e88-386a3fe48d9mr12442112eec.4.1795591256101;
        Tue, 24 Nov 2026 23:20:56 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:55 -0800 (PST)
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
Subject: [PATCH 06/12] rtc: da9063: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:20 +0900
Message-Id: <20261125072026.2997493-7-prasanth.r@lineo.co.jp>
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
driver warns that it failed to set the wake IRQ.

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: ed17a2bcbb75 ("rtc: da9063: Mark the alarm IRQ as a wake IRQ")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-da9063.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
index b56b9d9cb..2bb32156d 100644
--- a/drivers/rtc/rtc-da9063.c
+++ b/drivers/rtc/rtc-da9063.c
@@ -466,13 +466,13 @@ static int da9063_rtc_probe(struct platform_device *pdev)
 				"Failed to request ALARM IRQ %d: %d\n",
 				irq_alarm, ret);
 
-		ret = dev_pm_set_wake_irq(&pdev->dev, irq_alarm);
+		ret = devm_pm_set_wake_irq(&pdev->dev, irq_alarm);
 		if (ret)
 			dev_warn(&pdev->dev,
 				 "Failed to set IRQ %d as a wake IRQ: %d\n",
 				 irq_alarm, ret);
 
-		device_init_wakeup(&pdev->dev, true);
+		devm_device_init_wakeup(&pdev->dev);
 	}  else if (irq_alarm != -ENXIO) {
 		return irq_alarm;
 	} else {
-- 
2.43.0

