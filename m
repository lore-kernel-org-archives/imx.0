Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446946;
	b=xwSXDPm9bNVqAEWhNvspsjfbIf0vxwxrDKux6PbRBKVAcHzFCpgK1zdNMpFTpKajk/Gg
	 pCiq3cR+lkFmCgxdCaiTmGAaE+/efzYBAdUcwQ0aDNIfNrg6vI2RhnaEp2U0GreStw9DO
	 z9NnPUhas/Zidv2R5/rmxUxoQJMRre4q8GAqTHoOghyO45y6b24E8vEVQd0k2H3LPh9Xn
	 jV4u+ytY/lxDV7Nm+7Z8RVL6MEwwe6t3ATe4NtQZawW2GhGTGfwYOC3KgFu/h3JXYLpne
	 JvfzD47bVVL23fRIpK008Ui++XKUkJXEFQuR27LGx8U9avCHJmp+ljpNY9CP7MAuj0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
	b=Fq4wWT8J+uzUqxhvACc58woMwRoc0tNzcKtlJIkBiFcz445RSfEGuU8v/v5bRK0ch8lt
	 +lEFmr3WiqAWxW8P+WrXv0A7w8y4M5NgulSKU2+KUl6c5zi7zYAiUGuNRbw04pv+nBW/o
	 EkQ/+iWX5cWmMmhWS+Dj8NVFLyDcVcBCNDZQaxsG6WIH5mvOQo/NlelZrprT6Fuh08HLN
	 DYMb+y8bibDDL53Ds5W6GBvxY54JrK5wI5Z5tqw5SQwUYi21EEP4ZONhZ+I8Xx5BIRjjx
	 wFsOLz7yX906T+TOoELLD7fOJJ33oijrOmFiV0NT+DmsOr0LA8Wot6akAZ6M48S11tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SWwJ6TWq;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E077606D174
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 01:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E077606D174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SWwJ6TWq
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-55650fe1f0dso1933810b6e.2
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 17:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446945; x=1795051745; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=SWwJ6TWqXqZeB2c2yGbJ6DTd+vFi+s1DBYFm/hQpdeezzHjUCqF/y1a40fFm7DeCcN
         6z1TnPCpccJZfAPF7Zj1yXuN+91pD0vQc4yC/5AJQ1mk9QXEwAzhYGlDdFlDSDwSb4Oi
         8rIt8G9YH64wrCiNUiksnXstt8e4UPKe16rt2ozYu35Imxl874y++vqOMyA0OEvv8ACy
         DjH7tSjXSPxCe4BfXn1BgMJrH8i8JUrRbVM/o2si4afpTol3rZc6xefrzfraRN0nhWqc
         sPst8eNei8zAEbjJEnYTCnMSqOEOYbzdZFGX971nW/V4tOLpn2n0oVutxbtM67V6ZUQZ
         Nu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446945; x=1795051745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=N8exncMyIUH7mH0LyUzY4FwjNLJRNyBHz5TfSP4vXaYG1AARXMiUd5Cn9NHQuwHlC/
         +Q0OtkkGiTuRPjO1vXurLTUu19dkd9UsNfec7jfI3fxu3YglK6TDb6UzcgMndvd1qT/i
         l9gNbEYFLZ+/73p1oWiWsPNq5Om5momaYuGVSJquJg0TDzeqMyisEf/qeNt3nISGWGD5
         jtNgiDvZocIJ9YuUgByHFA02ntNCQM/UDgNF6f1/kckUBneaPPWmMF+V9XaEJsPtmVWf
         a6809AGgtzDRriW09VNCll++tGhu/Asq9IXbELFyj26MUgNw819pw8HV3V9K8QWf9w/h
         uIJQ==
X-Forwarded-Encrypted: i=1; AL+hErEpm+VxxohSON7tQgBFyKMUUo0W1m1v0eZu3uPd2r02oR9JXvtFXRGhBAURsuXrcgtTlfE=@lists.linux.dev
X-Gm-Message-State: APuU4Z/uo4coF+la8loqUBYHwAAoXEsQX55WHyELZ0xeqlUUwkEDdlzz
	KThIwGr6kFSL+0d9vknXbsVFFTl9iSPDu6NrA1FykLvaNJ62QtuRlki4
X-Gm-Gg: AYBFou01rZ1CWSiSW+bySDyBddPQne/hxsbLmNs70/YXyf7lmc5fV20P9+OStFNGMdE
	hJ9xFIkFLusDQJ2/2BivVOSJ9AiCKu5oVYGN/NSqNWXq6nzNF5WbYTEGN2JcrBjdRqsvNVwEDzC
	WuKRV+Zn/pmVfPZsg1pyZCyrrEL+QtKVZYyndLRN0yjUXBYpJHCbBZv8Bfli+zclAPvEFpHD5MU
	0XsHEuOn1sQVTJbQGqAnPtOWhixhc9TXjMyzIFexO0vsix671tDs2sR9MqNdO1vh7a7ohnf0ZK6
	cnze8YPWPTQu3Jjh4Qxq4M386EChzKEMcWxAJD4oU37Prip0oIEVPmT+3N+hlhWye3s7t2hTFpS
	vlWVm6tQmlzVpANcckrgk6rk0L1Oz0WZwC6O6qoun6O8xgcu7YnBcCeRZj3gkz0eFd/8lnw3U8S
	CyJgFIk+pKdAtTFfd9xxvLxEIVJXA+fcmJ98q+v28K31eAAG7rBmABpuI12oRnrLXUYFs2w86WZ
	J5HJeEYgen9LCQPVVn2hmHIVJMnaOcCXwadV9aVMhtCCkbT+GU9XdM1qxIOY5lxfGXd2kyTQfsy
	MbaAI80985M0DNrkBqCNIaLBNdILasoAEgRbeAva+3Ps+zHbQnu3Pz0CkrDzndPB3ahmt+KEC/f
	qPzoeCejsYpl+re9fAP0rGa5c/Wi4ZfldUsieM9dZk7nCmfL0XpPwL4F0PPAairVTWsG/XMN2oA
	NaR9xqKYG0SmtrHxNbAe9unehNy1PD4nBh0K26q6kFPz4amI4Klj1a
X-Received: by 2002:a05:6808:6401:b0:4d6:90d3:e185 with SMTP id 5614622812f47-56b97d0d831mr3893218b6e.46.1794446945179;
        Wed, 11 Nov 2026 17:29:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:12 -0700
Subject: [PATCH v3 33/58] mtd: rawnand: gpmi: retain open-handle state on
 removal
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-33-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, Han Xu <han.xu@nxp.com>, 
 imx@lists.linux.dev
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep geometry available after removal while releasing DMA and clocks.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Han Xu <han.xu@nxp.com>
Cc: imx@lists.linux.dev
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 4822485bd512..8fc78e679f0f 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2744,7 +2744,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
-	nand_controller_init(&this->base);
 	this->base.ops = &gpmi_nand_controller_ops;
 	chip->controller = &this->base;
 
@@ -2759,9 +2758,15 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_nand_cleanup;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_out;
+	}
 	return 0;
 
 err_nand_cleanup:
@@ -2787,9 +2792,12 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	struct gpmi_nand_data *this;
 	int ret;
 
-	this = devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
+	this = kzalloc_obj(*this);
 	if (!this)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &this->base, this);
+	if (ret)
+		return ret;
 
 	this->devdata = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, this);
@@ -2838,7 +2846,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
@@ -2846,6 +2854,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	gpmi_disable_clk(this);
 #endif
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpmi_pm_suspend(struct device *dev)

-- 
2.53.0

