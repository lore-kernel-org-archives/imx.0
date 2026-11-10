Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296699;
	b=wFTi2poDEcFBPNH3OVK9QlB8LAS8LAEsC5Ce6kBytMHWc2ELa4qIc0FtCnAS61zRj9EU
	 +8gnothW2TL8GC/pcjk3B9zc5K9zNaqD9Nv5mgDdIhRXxytje1IBmWP27UkiFI+/1OgXq
	 KCodMI/S+e4i1qqY9rI+SNTJJyN1CwF6vjwuyoTWvXjKkUeuSf4R0knwXhbVnkFbHrAqT
	 KeMbFthouw9HtU6D6XRZScO7KJv3SlwtWtS725kP8AGRaDPwcaDHrFwRw5dXGXQ/Nl3E/
	 32goezRu13Ypz2Wlln6yQA9yR0l3IIG5x9AyOsEJMnYS5bS5yXvdFXiE0UpD2MkyFIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9ndynNB7A1QLb3sbkkLOkw0hbY7VB6UW33KXzWEUKxo=;
	b=AzhnuQDLL/7ET+5i/kgodRE+Al49wWBmL2V0AmUOWrZ2Y2hUyn/Shf4EWFo4Z/tMEJWl
	 krL0YET5Y6srZDPf+/zbITGVE6FUfjeVj3MtwAUWo04n3G0umgrHxNBAgojo5qwj8/z45
	 S+Zgs+YjlcVXAm24wNuBoRGi9E3RqQ1zbvxBeH7IEdoRJEISC45gwE+55kcGdVnYmQz77
	 mKI1yIBtRH90lQLmTQUdEzpugChoV3XPF8/SL8Gtv64D/9MN9LjgBeqsHni8ZzajRAQ8g
	 //GuMmIJgB/zjB2Wk3a9WpnSMa7O6ud6AtT+y3EQkns5ufTEFmwYBpL8wo2BhbG8nTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KU41JNcN;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39C460A2639
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 07:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F39C460A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KU41JNcN
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4f699fe49b3so1177566b6e.3
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 23:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296697; x=1794901497; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ndynNB7A1QLb3sbkkLOkw0hbY7VB6UW33KXzWEUKxo=;
        b=KU41JNcNJrF9xQuEDZjVCLrrQUgjndQnQxjzknALgHxY3+ZgM02Zhe0KXBIOP9Ij2Y
         CU6c2XcvQbW1a5p/JgVaVuHwjk3zPL7h7IdlPyuG9Hrsr5SOpmup+XCWpFrwq75xVDTo
         nmSl31HyNEjbOG7xNdGOitWYe73lV57aQRJ03k70EEqL81lRNZZBTf85z9GV69ISMiNd
         R+mRypgIB4WAElT3jjrfqXmF0Pprvj2oznIBGXJ+MlIJDkq/fdxqu0+EuEIv3E+VYpNH
         VK1RsbJ9L5BoSBjvCqCDlR5oNJ7F42Iz0Bxc6Mh7BBl9fSELQY3wYrRTywfnbKvFjE+O
         57Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296697; x=1794901497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ndynNB7A1QLb3sbkkLOkw0hbY7VB6UW33KXzWEUKxo=;
        b=pKEVHxOpTfJUgHZGUL/HbsqXvQHxUwgaazXiemkmYOLlW13VL+75rajrmW6zzwbh30
         osLgGEkx+QU+yF2UH0+GNVU194AijvaW+VW+1YLSMX5a3MFgO6qizWXVEZu5hWQaJgpE
         37M0P3OknnnFmRRpS1x+3Lcpdcubx6HdIW88v7+SLfbtyXxm5tSQala5VOb5/+Z48r9R
         DXZzzQXS66/Woa+q70xtW6vUmEuBOy7ANI36TgV6olDwhMn1vSwcc8EODHnCun/BZpND
         gMA47LUjLa4LdyFj3kmdbc5sLHF/R3WkoZvKe/STC3UXly6BLvK9H3aTeyNHBzLHMT9s
         H0ZQ==
X-Forwarded-Encrypted: i=1; AL+hErEI3pjwzGLc5QgMBQ3uTSx4eIOwmgubUhwpUyOwjpN79WEtCaoZ6Bnm4kwxXRr0sfZNp1M=@lists.linux.dev
X-Gm-Message-State: APuU4Z9HfgmsqAQKiD7ZXbJIRmZHbWhI6cGx99K5Pk+F2gyTzM8TkY69
	oAqSrff34/y1r8yS3+nZlwKeGxRw5S9DxHOR9IIxWfpfBxkxvuHImb/w
X-Gm-Gg: AYBFou3wxOkB4lIwhJZoHzycljyDN8OzDn2H84Y/8/bG83HDqVaGz9JmLqesaRiyhH2
	YifDZihKKcpSufyd6fd7ts5nQusEFKk9+DC79FlkrIxME4bikpMKe89guPx97/H8Xu/RHGxHR2Q
	amOkvQI+jiJO7SGhXYEMVR2ia1Og+W2uYGJQeXgS+BGhjv1qqnREAF5Fzk0iZm9oWPoAqJVfPoc
	CsiwKnXgh9ACFMjDvshX2SpqBQB8pEt1k0ujhr6uoCkv32EE/SSHMYLowb81nHJfOQ1kR77r3uh
	oLSkUSMJ7dncV1FfbH9waoZ6dOHFFH+MkzHlLxZUU2LvMh9rCdlMWkvuJ3Tfyyg2U5c8Mm0fXYa
	TeG9G23K+82TcMGbhWQhiaO/Nci60KQjckIkZ6tHidQDLba2uhOAi8DWbz3boyhvlQAMP6v/7tT
	Pu/I/WQtYyd/iF/uaLNQGnAueX36BKcfHTRvDDJrDpHm5PMb6KIsLcrNF89ZqcRHlk6k/Lifu8L
	CPjMZHRX8y1JxaS93GZw5AFC7cVx9Mm8CHiHzlY8wjLcMj3lAPAoiwF+bxodX366Yq7B+fGqLtX
	R1LTtBXtZjFVMFURoXSseRrrbL9kX+YEM1cZy7WgQdpygdJSKG2XvQmhwwR4RsxClD4vl8GOfy4
	kUb3W7XhOV0gKclZO/ogonn0sDm4mIx0o33u0EDk2X8eI5cc/aYgX/gognVcBZ3ekoYd3w4EOfI
	9o2SlDlCs8SImu82ztScalptvbnfkCUoEEwwtvrpqppMduf657wCNgOfrP1ExrZZAeNJerSms1k
	g==
X-Received: by 2002:a05:6808:c232:b0:539:c292:8b04 with SMTP id 5614622812f47-5683c9dfddcmr1448284b6e.8.1794296696889;
        Mon, 09 Nov 2026 23:44:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:36 -0700
Subject: [PATCH v2 33/58] mtd: rawnand: gpmi: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-33-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Han Xu <han.xu@nxp.com>, 
 imx@lists.linux.dev
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep geometry available after removal while releasing DMA and clocks.

Cc: Han Xu <han.xu@nxp.com>
Cc: imx@lists.linux.dev
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc839..cda3bbdca928 100644
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
+	ret = nand_set_release(chip, NULL);
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
@@ -2782,14 +2787,22 @@ static const struct of_device_id gpmi_nand_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
 
+static void gpmi_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpmi_nand_data, base));
+}
+
 static int gpmi_nand_probe(struct platform_device *pdev)
 {
 	struct gpmi_nand_data *this;
 	int ret;
 
-	this = devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
+	this = kzalloc_obj(*this);
 	if (!this)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &this->base, gpmi_nand_release);
+	if (ret)
+		return ret;
 
 	this->devdata = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, this);
@@ -2838,7 +2851,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
@@ -2846,6 +2859,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	gpmi_disable_clk(this);
 #endif
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpmi_pm_suspend(struct device *dev)

-- 
2.53.0

