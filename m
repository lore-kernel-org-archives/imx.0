Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591254;
	b=oB2zxVBqMZdVLDQSj4D9xUjsrrX0DeTCg6m+bon5esO//N2u39W2Jn13rDqE3I0HN2SG
	 brGCDm3nIj0JWG7vf8xtplcmD1/nv9DWaFaJG/iFfxZjyIY4ud/3ImYvcSXFpEK9nGJNZ
	 Depm8WWgm7sgV4NRVLhl2RhRMaFMuaAMqh+y20RufU/gglYUnsOYrlms9maEAcO/lWHiU
	 lejjSw1xdQryYPJdHO3mB42jAO1sGUnG6CNi/ijfePq8KQ39CFPGO93uxeJZElNE8dtYu
	 13obT0J0X/NehLMiXFZzYCKbwqc89rDbPdSvfHqo26nPGU5vQJtkEiWvZ2z0zcltucw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5F8HNE1pXchPLDdh5vD/VO4OIkLD+d4JqHGWbIQKRts=;
	b=4yLk/VGtxgKrPlTWx/hD8ojz1HM/Zxm37rJp8ZCn56ieMHAk5oGndc2OTRvktjbH0ayT
	 j3PAKZg9uSElxLIUVp1svy0LWT0DDNRT2aE9NDlUinLLCsJsenzqLnpJeBkK2dVDHpRSy
	 eQnSdi5zY+rzrdIJJr31uZQy3txzRVkcMi4hXhQAs8D6fkbhBwYjgM1T9kpi2yQLFLHrY
	 gR67+PzMtmZNfe8owi6S544b9KR906IAtykxGqFb5xMgh4aQyQjo1ptm1NyoWkKHWj/h9
	 grjRvupcs6mJufzqEmnhMnT9ZKEOUITfQLa/eS63Twlnz/vDi5aO6Kr+c5kBIw4IRrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pTBE3Dd0;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE6F606A323
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AE6F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pTBE3Dd0
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386ab9ab619so6385201eec.1
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 23:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591253; x=1796196053; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5F8HNE1pXchPLDdh5vD/VO4OIkLD+d4JqHGWbIQKRts=;
        b=pTBE3Dd0sGzNVe0cRLWhHBrlKpcfKZ2kfWK+knVmUFgbOalVGZUoR+mkUcKQ2l5II8
         bGa+8oH6UVrRMER5gkWop7LDgX/pG3itRKoetqcljDLQ4VLQ0Lx7tKsQtGETGl44ehg2
         7IdYC0TS2Mzvt22KpXH9m/5/enKnjqtVFMZr0E+8tV8CgsJzp7g2mcA5Fz/AARqM48cE
         NVdGs0Acp427txxnulaphBUIOv+4sIeUhDGAOpFVQwFaSK/s2eeHfhWehiqC6ovTmb3N
         bZ2fY8+H1dQBzEUfdX8v+L56gn8GS0SumH9wI7vG5oL78LQktm72pykYP4hEgUJZmVPf
         rlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591253; x=1796196053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5F8HNE1pXchPLDdh5vD/VO4OIkLD+d4JqHGWbIQKRts=;
        b=pUCjOU9v08MtHlP2oddrQWv+bo7zkZpeMUoLhJOHMfBHThRgeuK360oCSkAxp3OHxe
         UlF5oUlIRXm2RJox0cs9HarDQUzktX0ZUq3qpcZAfW/9MzsUh5T0xE8R4hFoyhaocTb2
         R5JDueMQ7ogtBVuWHRbiuumg4MZOccA/ZGXBSqIzUZ9yk+PiidzvtcK0qxbRm5laz/Km
         QmIWUcxrlR+udhDSON7GGJVtVS85GzVj+B8zyiYhnPvzL4XAh5NFcUvScp7R7U//9eYa
         qc267SIlNmf7z3wav2ejxSY24WSFte2scKpjj2H5+1+sf0onc93Z1n+6ZZO+nDugIuD5
         C05w==
X-Forwarded-Encrypted: i=1; AL+hErFsCUq9ph2rZfeUUPU6vn9OLVZrvvBUdXVZk2TPVcfR9e/yfV6ecsRsqRq2RZ3i10PciOE=@lists.linux.dev
X-Gm-Message-State: APuU4Z/OKDRz2ukJTNn1QUx5RrkSyEo1o1BnpkzYVjqCm0mzB6nHlTS2
	Og4favlgeggo5eVf3fdcikOZW6kdHe1VuYvMIDTDAviwNZiVONFRCh7V
X-Gm-Gg: AZFdTZeumyVXKtWjNghPrlY/Ik57hTu6sR7vqusLNhpsSAdg6O+HvA4D30CWOw1EWQZ
	wmUmmqaVbldlQdRheGWX4auYyr64XOK5Dm4gQZeBo+YHLuHOUmUoLpCThV5YugwcxrqQsGtbDQ9
	3AzdYVafqk19qn/P1F6Sqon7K+Yr03ReTs/7v40Mr7/nmpZqr6mwRjaZ1XHoalDkU0YaytGIuSU
	YFwgg0db9BLWQCJjKZfWzf8wODX9fRefud/S7RKDFrh9r6tvwhd2Pc5JDY6zlcgnr/WsrHNwRTS
	O2bMjozZK4YCEywWUQ9zHCrRD0hIfQAgAeKyAHTp1mKDQgeeuHxAKDOjwsjD9W8Pi94qpaK2ntL
	hfwU0QeQ8YNj+WqMePWo3ChU57jOLqd4c1/fmytE4EtETFceu1QCN5ZijoZ459o77dsoLq/HzXJ
	YiD/eVpfI5H6DjsTsRSm0/Wc4fskqtaVuO/DJuJQnYdoNbTmHrBhCSil0ZmeruQtBWROczao4Cl
	ILeOfitQfdhf+W2ua2sukF59SWXCScf0MJJBSBjJA1yGe+4RppKLXnmDEm6pOvtnYeIW4E5/YCg
	WjKdIq9LPxnufPSNWRHPvzR2hhbkh68Uh9zz839hp1tKFoIj2e5DRve+tan+RI+B
X-Received: by 2002:a05:7300:88:b0:386:959c:11ac with SMTP id 5a478bee46e88-386959c141bmr16142558eec.6.1795591253408;
        Tue, 24 Nov 2026 23:20:53 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:52 -0800 (PST)
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
Subject: [PATCH 05/12] rtc: imxdi: clear the wake IRQ on removal
Date: Wed, 25 Nov 2026 16:20:19 +0900
Message-Id: <20261125072026.2997493-6-prasanth.r@lineo.co.jp>
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

dryice_rtc_remove() and the probe error path do not release the wake IRQ
set with dev_pm_set_wake_irq() or the wakeup source enabled with
device_init_wakeup().

When the module is loaded again, dev_pm_set_wake_irq() finds the old
wake IRQ and warns "wake irq already initialized".

Use the device-managed variants so both are released when the driver is
removed.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: bcae59d0d45b ("rtc: imxdi: add wakeup support")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-imxdi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-imxdi.c b/drivers/rtc/rtc-imxdi.c
index 4066e32b5..a1afe84d6 100644
--- a/drivers/rtc/rtc-imxdi.c
+++ b/drivers/rtc/rtc-imxdi.c
@@ -812,8 +812,8 @@ static int __init dryice_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, imxdi);
 
-	device_init_wakeup(&pdev->dev, true);
-	dev_pm_set_wake_irq(&pdev->dev, norm_irq);
+	devm_device_init_wakeup(&pdev->dev);
+	devm_pm_set_wake_irq(&pdev->dev, norm_irq);
 
 	imxdi->rtc->ops = &dryice_rtc_ops;
 	imxdi->rtc->range_max = U32_MAX;
-- 
2.43.0

