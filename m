Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591271;
	b=ikgwXvTUkS5jhqaAzQ7/wOQKk45sCSRmOJNmfgO+MxcueUvkv7iK5lplAL+aTjyQq6wA
	 x5WTGw8xFW7dHNfe3eSboRgoVY9YXN15hriM9zfizIMkPoFDMSkPh6WX9zt6kLFnnF4ZH
	 yJeaXMiTlK1Db1ghU5YYJ6wc6ZU50zp+n9pggOg+JBv1Hm9pJEzui3Dgc79l1HpfMbgts
	 KmLl4ZQk/8J7cTflQmtXcS0wz9xAezyH6/2/1mlVB6Qr9E+NkzPg+2QucjO34Gl2BeHT4
	 90VEk03Y8V/NT7RTnITE7De1o/1lo1vOarQ3HARP131ypLx6VwUPcs5ZCUIy2+bYP3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=F8GSEEYgk4hpHEtSF34GSLfYJQCwCXCGgSvUQtVjSv8=;
	b=kVXzkmF63EiLhSNFbFjUMW3OGILU1S1JrqD6B3aHLuiwYcGMizzhM/p6o9/Kc0okA+9f
	 i2Q9AQyVV048moYHOypG0AmwMxbOBmhA+vQo36U4I2LtK3JcDPvOQfB7UmPuLfGfOJVha
	 e+L+7XzYUcVqnSMGyr1bKNGp3ZQdQY+RJOXUSgpPoPGdRjMHMUbjfXIcYKUploThLbgVx
	 99QYNyW255ToJ+pZgbAriJgzMccSmgynaxvkUeRrvw/SGDjyZwqv8Q/uPNR5UKdJB+hSH
	 rk3WvSLQ420kyXVq4w69Rqx+Kdh05vLKSo6C9bstcV22ExzW4SV/XOneFNcfNyVTg+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QREaLzl5;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E493B606A32C
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E493B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QREaLzl5
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38644aedba1so8322027eec.0
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 23:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591270; x=1796196070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8GSEEYgk4hpHEtSF34GSLfYJQCwCXCGgSvUQtVjSv8=;
        b=QREaLzl56HWosVHWdzTnZIY6DD+fAa/JxQsS4kF4iB0MqlbaPEgaNO2Xh8NBQnsMLP
         Q7rrm2DwiZm4RcKHFX2fOvhQAuW8/+1dmIyvfMdSiyWfHM4ANWNCTipyPQM98gMqbo3J
         0TLPNyzbU2PmN1qduylPDZOFtBKxL/tGepy/GgGrfkz12b4dWIqPIF30siD4gSC3tbFQ
         nrq75YqQfQmyKutpVbgog7J2mKfgdbMzK9vDwcA8R4ceNSa9oU6w82hh3vaGaWiAb3jo
         NpvphSELxeRVCLtDjVvffAkB6DrzAVq5Yon0m8rf+IrUMf3SrxMSdXdjASRRw9pQmSa2
         QotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591270; x=1796196070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8GSEEYgk4hpHEtSF34GSLfYJQCwCXCGgSvUQtVjSv8=;
        b=Yg3Wu7+EyAee/HxbuCQTZF6kVq1YEQGJQq7pwlK+pGqIQiC8r7YOKpOyOx1tm/drIF
         iv29aGPxu+zQIU8ptNv3VEy3uFizm7L+UhMmU0BmXY2oOvx172ODJm2C0hFkzLdqmhC9
         UgfpBjFkX315HmDGYm4x261k5rB7D8cV/JkhWG3v9cEuHJ8sJ442b3mbjgUR+36DcHlF
         QLhfjmmlB34C8VHT0Ss645Ab8yxShzSU8TgIyR6Yb6lbebmFB030/yTzWskiGLsh61Bq
         Q5BlKJkFOzHg6OTI4n5/0W42snQMYA2TuChGcpDr802aRLmw7Dq0zU+9pE0B9xAkS20N
         cDUA==
X-Forwarded-Encrypted: i=1; AL+hErGTI5u55W0MCqQYxTxpM9ems/OJrGkQlrChPMP2IRpuO0dI1bTgSGy3Zh66MEv/tJ7YxJU=@lists.linux.dev
X-Gm-Message-State: APuU4Z/SugSOFUagGViaDjvG+iIDKnF/Y0CNY+JbrYVI5Ue8e7az/kL4
	LQt3U2j0P4QSGaskW+K+oSbMytd0knThl+djhCylFtLFJzNBIMbBlLb/
X-Gm-Gg: AZFdTZdVqkplse105iYMKQRyjbobUWjIhsU2fYKRuZfn6FYnU5Aows1HLV2sFKCJ0bn
	9x7kues8pya6rBtrpJ9iqcYyQyhnivgHMMqeEo5kirU5JjI1RuU0U54iRXdqcMuHqoHtbYmyJJ2
	OD9xx65/JFnaDVe+Eln5f4ubpc5fEHy9Bwq5feC6ujGXpZKtPAk2MARupE79S0ZIcyxrWisGvLz
	crNgtRAMHWS0yob+Mfrf1J9cz0pVj7Qgf/3ROmrd5+NF0gRau3CmVcu5XsHni6iVqmD04zEHMuy
	uLpDoDS80CKvUp1jyVCo0KHyh5c5szuKwIW2OeHVPkowxrdr+jEMW1+FQA5FcKKiCqtaOaKuSBZ
	RSWjjhk07hx5tq3QfDjtycCGtmWhGncAxpKfRHm2vnQkaNqm5eo5+tcP3iZIXca+U9FBNTrCUzN
	GCQ6By21M98DfVmGoKlzFbkeafk1+UuZvWyr4srV7VHOS0EuSf+a4y76+fJD3CZHg010vPREj77
	gPxsO2SFSe9trj60HTVCqgC/IdBJWNicmPsJD6/Tkx8aoHAXkxjedb63e2YoSJfU2/EHF9H5UOn
	ILIiCENrgQA3NJur9t2tMFfYYBUlG966Zv1isC1NkJSVWBaC+kH0ESaWpAOCMnfcl1KXnkCKds1
	040t/9p9RUmY=
X-Received: by 2002:a05:7301:4704:b0:383:729:cabe with SMTP id 5a478bee46e88-3856f8519ecmr18522481eec.19.1795591269843;
        Tue, 24 Nov 2026 23:21:09 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:09 -0800 (PST)
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
Subject: [PATCH 11/12] rtc: pcf85063: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:25 +0900
Message-Id: <20261125072026.2997493-12-prasanth.r@lineo.co.jp>
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

Fixes: 05cb3a56ee8c ("rtc: pcf85063: add alarm support")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-pcf85063.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 819648619..909c96e5e 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -704,8 +704,8 @@ static int pcf85063_probe(struct device *dev, struct regmap *regmap, int irq,
 		} else {
 			set_bit(RTC_FEATURE_UPDATE_INTERRUPT, pcf85063->rtc->features);
 			set_bit(RTC_FEATURE_ALARM, pcf85063->rtc->features);
-			device_init_wakeup(dev, true);
-			err = dev_pm_set_wake_irq(dev, irq);
+			devm_device_init_wakeup(dev);
+			err = devm_pm_set_wake_irq(dev, irq);
 			if (err)
 				dev_err(&pcf85063->rtc->dev,
 					"failed to enable irq wake\n");
-- 
2.43.0

