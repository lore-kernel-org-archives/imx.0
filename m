Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095675;
	b=Kb3uSt9GiG1qHB+NNbjLmnIvQzg1gUNN625UiatWAdJUAm6PFm/BojYv0vvtUrcT/8iO
	 gooOS5lq8l17KhHVIr4eslcCqA5ZHjXsYQIEh4I+AA3Ns01Drrb4nw+Z0xox/2Z0UZLU7
	 bJgRvC7XM3wiHa9E4OIC9bjFqQwXgdbpH0p2nScKcl01bWtMJx9/uA2m+2RffhDaY9+4P
	 uzkTjhN6h8Qq8v76zON8NkVeJ5yNMTiTFBFQKkjZB4RIqdVol0Reqc+qbc2fQHLFr222c
	 DYBWM8MiyF8gSozy0L3OblUqmT5H2vrLV2XtCcwQPqgKAFpe5bDlxxvjE1iPif87IYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4c0G4YZiEJEesEvJcSiHJ7KCJftI/dPzJGtmeIgLqHA=;
	b=wSiOcvEMVrrRq5m8W4DWAJU4OrKK3s1Wcz+bPOkM0yRXJ8X1mUQWL5mgcjZQFZ9/PSTW
	 cuDI5C723n4rh3FnSdENMIhMKxUoWZD7EkO2T+a2HHfRoRzdAmll6g33uCrobUV0XQNWP
	 tljTBxFgXBeekoQQ9DwIIyXwKLq83oayxtd6Gt/4yxq5wTIZDku/0l2uYCuU7P+FEcpu0
	 5fZ8ON/TUxSxxAjTE25YlyRSggZybqDrX2jFXAHgZu/cU2sZlAHhb78r2jT6ymLSrEFGz
	 qX/gXvIFyWbtRBgTdXXtJeOp+FNw0T//cRJ0bomhW3M3XdkZGgR4ke52d+qa9fYg+Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cfWlR86j;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705E7606A335
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 13:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 705E7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cfWlR86j
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-99071945aa7so1124623241.3
        for <imx@lists.linux.dev>; Thu, 19 Nov 2026 05:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095674; x=1795700474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c0G4YZiEJEesEvJcSiHJ7KCJftI/dPzJGtmeIgLqHA=;
        b=cfWlR86jkEmxkM1a8hHbu3eYtSsKGjJQHaKjGhQWtO7FqdCSZ2UxiKT3QOOCehVxxC
         /BWywjaxsUVrE1Dbsov60qLC7QPGr46ylmOFOjHuO+NAAcrPh8Z64SHcVkAUyYhG52DF
         j52SNXUpvntSleu5FLpBggFamesVEWx2jFgnwh9yx+yu8qbNmn5GGlCKXdWbyNiAohqh
         wJLHJs/7v8pU8pMmZQ+duGWz/+EjsglRJBVRTsocEZnmuMVPpuDmCQ//RNm8Uf7n8bTX
         DFA0Llq6cJtJB8h3af++n8vz5Ju4G89i6bQOIu69wCQvXul2ZkI8UWddeNNaxbDtCLsg
         /igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095674; x=1795700474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c0G4YZiEJEesEvJcSiHJ7KCJftI/dPzJGtmeIgLqHA=;
        b=A6u/t2/DawodaldzwGIKh4AUW0UAlG4CWo1hY9b92WQvYk63zQgnTDevqnH2o8xAE3
         X6BqX7M9/8GinpcNchPS2p8sEozI/uMw54F3gJO/ROYy1vNS3SvR12iME9VJTKzzF1bc
         DMhC0cmC5j2WjpU1WioB7JDJ943pXhLcxmhaSEp49kKtwweYS4SqVq9okkvrvgxMqZlQ
         jKPG7bAAuWUYExjwiyvm9j2EAkggEqZwdETlKWLPs3k5YVb5Gsz5jz+5EA12EqKQIJHy
         OonHTD35C4//u8o4BXFMPsDqT1LvjuOZFedFgCyS5XcX2uiRoDvAYnTrmz7vBYLb2OwK
         GgRg==
X-Forwarded-Encrypted: i=1; AL+hErF3avPdTq9x4fvzwMczWv+L+m8K0TQiu1cfpgT69TBzq2ycHI9M9K0/SBPHgogXJI1YDiY=@lists.linux.dev
X-Gm-Message-State: APuU4Z8gFz5YntLQFAElz/N/KN8iG6MxWxAv8gfD05k+HTTH7MAYC9u8
	u8i/jcBEHOK1hU+RX3LSh8kd5hX+57dDnh2NCETFjPpYwf1HYR1P3oeV
X-Gm-Gg: AYBFou3CaDvqnQu028pE1iSzTyBxqKEaHo8EuuKuFIwfj+iRdo7chgoJjbp7rOjdnFi
	7bbsXF1WlZBGYxGjgE1GY446CLCyNVHsis4aHcRymP6YvlzfXsK+HGEWWhxTay5ttQFgE7mMNZA
	VqEm0DuOJDgYlvpyDwtEx4sY/nVdY7cLqCF90YW0U0J9PTWYdrQt+VHW+tbcaIdpbcO+2TsRndm
	fYyV/1pZ/NYF+WmRS9UhLarzt4LCa5BPlhivo1hCGw5NC5o9HzqsW2xyiM7KjQGvuiQG4oRgKgb
	fih0TC1x2sr1E8cEBP4OsdCPIMQplkvPjEOXcWaU9rwNyrRwZmEy2W6QGmLH40qqh9tF+hRJ/N8
	IL3crc+oZ9Nn0NbhhCNTaMFkN+QB7nLY8z8fiM7GuWnRvGZER77Jqh86oLoX/Li+FUf2OI6wQ9f
	tXXGKA8O19FTqik5+zVSgq5R6VNv3ZI2ZvzYV6PIUHkhdBNwzzaHgxj6TXZVtjoCslSAzaZK4pd
	mBLfFdG1DUmZppd6068amM5HLqzefn73gTe6qwNeSoTWlJ1K5ChlN30RiUCNFv818Vy8lsTjGeJ
	9PiCLVDGXiQMxCrUZCdD6PMIAszjrxky9t/VWg/AAmfXDrdn7uw86DNHv5GRa1dGFFRymP8HhSC
	D/HTjRUAE00Jl0nX72dg=
X-Received: by 2002:a05:6102:2c8d:b0:7d6:49a9:fa61 with SMTP id ada2fe7eead31-7d6ba435c6bmr2530171137.15.1795095673999;
        Thu, 19 Nov 2026 05:41:13 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:a13e:f40:91:660f:4d51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a240ac5sm4134862241.7.2026.11.19.05.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:41:13 -0800 (PST)
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
	crofts@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v5 4/4] mfd: mxs-lradc: Convert to devm_clk_get_enabled()
Date: Thu, 19 Nov 2026 10:40:41 -0300
Message-ID: <20261119134041.16611-4-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119134041.16611-1-festevam@gmail.com>
References: <20261119134041.16611-1-festevam@gmail.com>
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
Changes since v4:
- None.

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

