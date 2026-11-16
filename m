Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869309;
	b=X+SGuk+hTIETgfrkHlPJFVzzW7Gt6wFidXs6pTSJ7VPeQIsX5BihhxBG1oEhfIV8wFHr
	 nMsFQ2RZIr51LhDH4pmn0xMWCJ4/NRztuev7rtlpOK9UFFBHMcpEPAdYRkBUhXAXDEC0T
	 nBr3tvpwH4hgSdvDdbd+Lg//YDUKeTVrEs9N4HPEbsFProcwzSQ0MvLV6OpGVlcd9f8fd
	 xdF35dq+4KuRtqxdvLgmmj+KPyVfZE6rnKQR0haNOYS0qTELLclb6JQSgCovmZfhg57DD
	 kq691QvyZEVLEubMJuPpamyBiF9DFr/sogDalrbLC1l5vHHNlP8wX2iFZUkVqHRSfew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bZKF6TYd/oNwfZR5R6RX8KffmVrf3Im0dZF68ZrZGqU=;
	b=jveAZ3lJkvHTtBz6nCJ85Cv8XqhnKOcMxm+GGFf6iFDT3ZA48GdgJEPtF/8Jegyijl9X
	 Wsr/+te6Mt8SXL483MKN+WD5dI6jW7GeHDraqTXC0ZUmIG6sawArxMXyLscK+BIasUukP
	 ftkIndKEgcjPH+JKIVBzxGP0H4NSXcevaHBcWtLs8MERvTVfiIl2DIwfDZtXl8+BdOsY9
	 +iQGxKvOM0B0BdBwC86WLrwM7B+/PIJwBf04sqTsLSjQf45vEsMTh5Wc8EMZ3585e3vjU
	 u4PL5zOcFmAPTXpO6nogl4K3HHMmOUY/1ds4KmzoUkcf3ohUMbf5Usl4456DQILgj3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mnugZclL;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4B5606A323
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 22:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F4B5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mnugZclL
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4d5e645d1so12598717b3.1
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 14:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794869308; x=1795474108; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZKF6TYd/oNwfZR5R6RX8KffmVrf3Im0dZF68ZrZGqU=;
        b=mnugZclL1bia+g4S5QuEGJtC05tZ1Sotz2EX8Af5BnBOIbaDkVaFyUg+7zttgeECeY
         1MACz0h+k5mmQQvb4353GHBqWlYVHJ1conhNxwXKhCmbKfxQlpCd4DLfptQFY4kO59s9
         uKWnUh1t6D7EHDC78X2kQCXSzIsEgJIQZJbEjMUEAYc+WlenfBIUqStNBQ1fF0vHOtDj
         d0gYTI3T6T1XhUdIe9l2CaJxzTOqosbqwBB5R3Xq2KHvWWZukrZfAAGA0qDN4ek7bGn5
         bvfmw5JKQ7fpciK1YSNDaCV0lLlLfi5vscNEK18NvGodF8eeN5KpAim6QG5n4rcv17cl
         j1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869308; x=1795474108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bZKF6TYd/oNwfZR5R6RX8KffmVrf3Im0dZF68ZrZGqU=;
        b=SCAx3i/GKyR3y9BnA0oiJzsGVoPGTD300CzW7ieFlnNr9IS6UKKEtpgLYIBph+trnO
         XALeiHDTkkmxI4ToojcE+dFTP7Vn/qx9Jjww1k0E47q+IQ0zDx2dGFGV8cpRin2gZccS
         LVn6p5xqZXaiKUjOuZHZdYC/iOsfBEnm1wHvSuQxH/6t+myUxha/Kggob2YwKeEbwtBe
         IBrg37bwk1ltk/mBxPoFUBLIvphV/KLjY1mUky521RTl613WLKAH9od5JZidItIBsup1
         4Ou4pzsliIlR+qjY7h3guPxJXRlzvGc+F15HtY4rLcnkdfmdiCNDNkBOTwmMLGP+cav2
         JuAg==
X-Forwarded-Encrypted: i=1; AL+hErHLKGMNEzvlI/X1VWvTyt1FjWbmZ+ohXg9aggJ3ErFvZ32lCyNahzrJoa04ImxsnxiFVSM=@lists.linux.dev
X-Gm-Message-State: APuU4Z8hAdI8Mo/B1nq9SatT5hJu6WEonJ4vQQvQf9B7+Tz2GS+A47U6
	dz+kjRiVcVw1WWVKaDOrJLPmWY2x/DbPFAqW0lk5oPnfsjoBf8AzlOk+
X-Gm-Gg: AZFdTZco4+gfQYa00O1aWKXIwpo/oW3VVCn/bjKZuP44OwesRHZW7YfB4gjG6CYLrf+
	pPNA2/yxBxd4fXON8vmg6hwXLFze/smTMAivPK8Pzh0ZEwkUB3zPmAddWe9xt9qLJTJVs4YBih5
	U+gjTNO1/KEnIz9WeZrxm5B53aCKCXtouzZMzmEJmN3N+bfNEv8MdokFMvgt1oXCqfOMqOcfi41
	6ENSw+BAXfSJ1zfghZjoY+130nm4myVthy29VihTSSRVh94Sqae0Hj+7KiBaFOWA6RC2G0gnEYm
	rEGAO2yltn9p24Obyv/fJdynbZ7R8RYE1Qeo0R0fAdxQv48p6souJSIWIL2Ikc2hFQFDEHJU4QJ
	029Rk5RC8NgU46aLvrQK2izYxYyz2ZpKus8w+8yGJ9QnI5UvGjw+t1WNxxerV76Pg/3EhuytVCj
	sECiN+IeWyd655kDSjpxI3QWL7Ygv+jLP3vYntJILbJlUOKPYkpCBTNuUKWx/D2tf6TB3NxgW32
	9vTfFdoYSFoWNpxyPcsIXcjLTiSCNS0HF6aKR5o12uaLzgJc2XEPifz8yOE0MmnP80D8fjTyxWi
	W18QsdyMcdvkR7x399EFX+7M3PZgivtvRowkGjeYvCNDPMtHxg9VVhqNc932zYZxeNEQs2QySjL
	O/HcnySf8NYYQMUbcSFKrFmI=
X-Received: by 2002:a05:690e:d42:b0:67b:e822:6ccc with SMTP id 956f58d0204a3-67d895e5aacmr4455238d50.33.1794869308071;
        Mon, 16 Nov 2026 14:48:28 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:1afe:e1c3:da60:db44:d0c8])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67db0361f39sm5259534d50.19.2026.11.16.14.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:48:27 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: maz@kernel.org,
	andy@kernel.org,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-iio@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v4 4/4] mfd: mxs-lradc: Convert to devm_clk_get_enabled()
Date: Mon, 16 Nov 2026 19:48:03 -0300
Message-ID: <20261116224803.61154-4-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116224803.61154-1-festevam@gmail.com>
References: <20261116224803.61154-1-festevam@gmail.com>
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

The LRADC clock is acquired with a managed helper but enabled and
disabled manually.

Acquire the LRADC clock with devm_clk_get_enabled() instead of a bare
devm_clk_get() followed by a manual clk_prepare_enable(), so it is
prepared/enabled for the device lifetime and released on unbind.

This conversion makes the code simpler.

Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v3:
- Newly introduced.

 drivers/mfd/mxs-lradc.c | 35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/mfd/mxs-lradc.c b/drivers/mfd/mxs-lradc.c
index aa55f88399ef..c3dd2d80e7f1 100644
--- a/drivers/mfd/mxs-lradc.c
+++ b/drivers/mfd/mxs-lradc.c
@@ -160,17 +160,10 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 	if (IS_ERR(lradc->base))
 		return PTR_ERR(lradc->base);
 
-	lradc->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(lradc->clk)) {
-		dev_err(dev, "Failed to get the delay unit clock\n");
-		return PTR_ERR(lradc->clk);
-	}
-
-	ret = clk_prepare_enable(lradc->clk);
-	if (ret) {
-		dev_err(dev, "Failed to enable the delay unit clock\n");
-		return ret;
-	}
+	lradc->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(lradc->clk))
+		return dev_err_probe(dev, PTR_ERR(lradc->clk),
+				     "Failed to get and enable the delay unit clock\n");
 
 	ret = of_property_read_u32(node, "fsl,lradc-touchscreen-wires",
 					 &ts_wires);
@@ -193,8 +186,7 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 				"Unsupported number of touchscreen wires (%d)\n"
 				, ts_wires);
-			ret = -EINVAL;
-			goto err_clk;
+			return -EINVAL;
 		}
 	} else {
 		lradc->buffer_vchans = BUFFER_VCHANS_ALL;
@@ -204,29 +196,17 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 
 	ret = mxs_lradc_get_irqs(pdev, lradc, data);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	num_cells = lradc->touchscreen_wire ? ARRAY_SIZE(mxs_lradc_cells) : 1;
 	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 				   mxs_lradc_cells, num_cells, NULL, 0, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to add subdevices\n");
-		goto err_clk;
+		return ret;
 	}
 
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(lradc->clk);
-
-	return ret;
-}
-
-static void mxs_lradc_remove(struct platform_device *pdev)
-{
-	struct mxs_lradc *lradc = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(lradc->clk);
 }
 
 static struct platform_driver mxs_lradc_driver = {
@@ -235,7 +215,6 @@ static struct platform_driver mxs_lradc_driver = {
 		.of_match_table = mxs_lradc_dt_ids,
 	},
 	.probe = mxs_lradc_probe,
-	.remove = mxs_lradc_remove,
 };
 module_platform_driver(mxs_lradc_driver);
 
-- 
2.43.0

