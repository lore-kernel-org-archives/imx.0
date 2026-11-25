Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591252;
	b=MEkBBdL2Kvxu0hJMWX7+KXwRAPmrPbD6vGo3W7+e2ZGr4NEFolhaBKis610eN3uS6qPd
	 PVh4jdUcZ2G+8Vy6B/HL8G7e9UanbaXvHaGxitmdUYcCiui5QgHMVCHbqEGsby15G7g+B
	 z6SVdhB5Ue/+LGwmkbH16zwbvFIpp2Mqq2tvot3B5UVKky1zea/t3wq6QJohGzlSaZrnX
	 wAnJPn/PiDA4NOi0Y5JKuEL9kq4hFuiXNBzprW+OeGhCiy30PwTrn/T0jlXZJL4/3P/nb
	 7vA/9fI96aqiVH/8JGLXEzsZau4w2vT6g5CBcXxtfFF0KmGANn7wceJegk4TRM7GbEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=SGK2H2xiYDiUmvolMkB/QNxXM88jn7GQua/KqoQPV70=;
	b=b2FGhtNBIH4W5p9a+Eo3gfneIPBdnUhuTlWqsehVZvXL+b2+r/3s7mn0aG6hQ1r0MVt0
	 dkiM88Yu44rdv8JXUhyqENRfCJZDRxdwCisjI3EsLI3A00+8gks0seTKSipd/uVSIPQ/K
	 hNXp1YuFY2jHCbb9k8ADcEEjs2XX8szWhsNVek8e1C4hWWYZBh9ABDJZY9ZBVHf2wQHsJ
	 MzwMWCV3hXI9VHa7P3X9HlopIMJPmnpk1zIUaNKwKh1/GmPfbwHgBBGgwIZHIA2T36c58
	 gAakTNA6cvI2cbWbFlbYfNpyhr6p7H1widmD5dZSO1nMzKWehG4GcyD6TwMgnHc0ZIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uoCDOiko;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A116606A327
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A116606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uoCDOiko
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38190551625so10862601eec.1
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 23:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591251; x=1796196051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SGK2H2xiYDiUmvolMkB/QNxXM88jn7GQua/KqoQPV70=;
        b=uoCDOiko2ecTmvLOY7Xsq2glAZxp+hO9dbxAVwAZHQbQ3Ip7vojtYTPC2lEaq8qGj8
         I9J/uQSONwV60yZH786qi4uYXKK7jY2EzlQg+uNEMa3KQXnga50QW4Vs5ozB9Y+4c6TR
         CDtKeldCVJZlmHO/dRoL+RCF4DbLFoasImTrnw6GhRZI1EIyM+0OL24GQUBKDGXgEaru
         LJiuvFRtfuEoA9+4F6HW+Fc8Lsu1rXW1LVnfAu2lQ/SqXsJF++8Cu1d8QZt4k0HDU7j6
         Yt3+Ytt8yPRPQmzgxL02YhgK/AS2YVNmqp4do7Mbgqr9TVy1QRET4iQhXtokfdiypZN3
         IPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591251; x=1796196051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SGK2H2xiYDiUmvolMkB/QNxXM88jn7GQua/KqoQPV70=;
        b=Evrb5pVhgnAV/FfhSnlO3NrSjkIOIhdyIy5pWZGSHMxgtLoalFHWSok5wjIRpTkhhW
         H1y91hExnMhz6biadiydhTlL3sORjXmln7xmW7FIwsGWZRUGY2sCEYe9ajaGPvEvNbZc
         30izXuLbTcXpxrytF1nvseusq5i/gcEARD4J7jChD9DIOdpROxWbMODXvRK0NtromSeM
         1+7YZxlTRxz9Jxxnjiza03GMCGzaVd+xDnMH3PYWtRz6KfkefolZEsmCLXYyFRiXpBi2
         AiLamZBdKqj3v+ErbAv8/22LZcOFWb3cdBh0wEL4ggdQribmcdJq/tLvwsmACTG4kyuU
         ze0w==
X-Forwarded-Encrypted: i=1; AL+hErGEoisXsojvkGYWxfG+qUcZGe7wQY0bdtgyyvqSgi4mn0EVZVsuOsqWihBkAEX0SVKV0q4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Eg+28/PodUC5v0vS+4PlwIiziVrY6WG/tVDB5xhEy4fMB+IOW
	Zx1KiCYJfHay51bQ/YcGUV1N57DFhxBSYKix0odYLVLr2yi+Fbrzr/Xj
X-Gm-Gg: AZFdTZeB5QaAqx+0jfhiwkO52UWn2mn6jJEZsXDim+OgSuNEP91ZJiAsHZ28jZywEnS
	zRlOI/oaHMj4zZj4ZoLcGyDGI0ofIvqCU3h6wtCoj1vciXI+rvuxKFhgeZkUV13lUOWdQOFta7r
	+8CQ16igP8+yB2kjSnDLxSXOwkUiL/0LgpN3mbQjlPjLadi3Prd6CUD2HexZ6NQe+T6gVuSqIvW
	h3/xu6JWV3wluWzZxfqo2AhVkDOw3c5b+9RPvKu2/n6kndEtYEdIft/InzXS/gda1fJHx6LIhCx
	p8vtpMO4qmyL0vj5vy2GjbdhXULFBW7cE07Lwo2A8CI7OmCwVmMKdPJZvkukO/3d4wD90v6HzJc
	ChL3fDQK5drq8wrjtykj3DO1p6d4YMOO52Yk/tk3SV754wKNXZpUCyhUve5I2VzzJ7nbIgXmuSp
	OS7x7zWubk3tZL2zstfaI/OhGByYcDX/erBHNDijDh6z49MtB+KYdFy0TqXrN8E19V8cXicxQRP
	js9Ei6K8XugdqHDosIe6wD6zEhFlt1EHHjzB8HYbxIBN+zdwc6fdOv5iA5tWWEttqKI0DBphyx9
	UkqpZP+PL4+6Dj4qkTxrnZqj6cMHn8BS+Pd3NQHK0WZgHvfjqx0zUvV30WtHUvdQ
X-Received: by 2002:a05:7301:6e9a:b0:37e:9a3b:76a3 with SMTP id 5a478bee46e88-3856f14b9edmr16647445eec.11.1795591250594;
        Tue, 24 Nov 2026 23:20:50 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:50 -0800 (PST)
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
Subject: [PATCH 04/12] rtc: mxc_v2: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:18 +0900
Message-Id: <20261125072026.2997493-5-prasanth.r@lineo.co.jp>
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

mxc_rtc_remove() and the probe error paths do not release the wake IRQ
set with dev_pm_set_wake_irq() or the wakeup source enabled with
device_init_wakeup().

When the driver is bound again, dev_pm_set_wake_irq() finds the old wake
IRQ, warns "wake irq already initialized" and returns -EEXIST, so the
driver prints "failed to enable irq wake".

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: fbc5ee9a6955 ("rtc: mxc_v2: use dev_pm_set_wake_irq() to simplify code")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-mxc_v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
index 35a18b75c..fe3a55b00 100644
--- a/drivers/rtc/rtc-mxc_v2.c
+++ b/drivers/rtc/rtc-mxc_v2.c
@@ -301,8 +301,8 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 	if (pdata->irq < 0)
 		return pdata->irq;
 
-	device_init_wakeup(&pdev->dev, true);
-	ret = dev_pm_set_wake_irq(&pdev->dev, pdata->irq);
+	devm_device_init_wakeup(&pdev->dev);
+	ret = devm_pm_set_wake_irq(&pdev->dev, pdata->irq);
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
 
-- 
2.43.0

