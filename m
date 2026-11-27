Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802852;
	b=D7kXaMqihZ+4fPKQHEY2+kVh2ESybiihBu7XAVm1oHVAeAlXgORQB6MKLg4bliD38yIJ
	 Y5YGLxQok/HGusPeA5sKvGTY8AffguSmP9jGJdUiDPbx9Fh3XxNBmroa+9EWukYkpNI9s
	 0415keZOqumyIwe06VcoT07mbPEUedKoC2D7GgfvoGKK/qYXtZxfOwzw6wX5CDQuf2xte
	 BuG0vwbY7748mNCDzbu2UnkTJ7h8L3ZNaM9RJEM8E6PwZqQDsKcuKUpZLD7CYGW5VDhII
	 CJZjEO1b0oxxoA/HZqyDRjCPKtDhRFEwSbc9PDRd6/0o5azHany/AVRJW8USmK42vcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FtPlK5CQKt8igbcY+UOchey7QbaopvckYCnGVzWNupE=;
	b=Ne4tJv9Gw3fJoBGXapemrSIv1P+D9+O50xU4RtPdVjYO43+lhTBaWuHpSRUtnUf9UgRA
	 suktfEAzDlIhcYi/n1eW5cayl1nB2U/byfh2nPVTcHiEaQMrFzgfsfJy7+jXMwikp2ZeB
	 j4uGOfu5pzjaRE8Y0LiIxI4pPtQapiC1G8XHGPtphWIInIvCTujWhlmeuwRZaQQvBwU+l
	 zlC0+0j+oR5J2Wzs2hX5B3NEehMn6r3+37qGdL0gJzSXKN7TtlPS8v+gufUc5c89x/Fxz
	 usEZZH3/E2vDUNIj5Tcbj5CQd5dzjasC8JwR2reYiAL/fVpONLm4w8N5EZflLEYuYsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Da/7PkYw";
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF20606A692
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 18:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF20606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Da/7PkYw
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-99e0db26c4bso2453202241.2
        for <imx@lists.linux.dev>; Fri, 27 Nov 2026 10:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802851; x=1796407651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FtPlK5CQKt8igbcY+UOchey7QbaopvckYCnGVzWNupE=;
        b=Da/7PkYw758ab3SqBMf7bTlvmWIqqq/+LLQ81Ssxy12EfzfZ0ihpoC53Q+bBCoKmIr
         KcEVina+UM/T+sk68kpV3s6wi2YZ3sQZNFGr/A3gXykRGGAD0MgOEslonSbHQMiAyn88
         b1hwdnqPloLOxMWOGyNmryRwa5r2bTs7eNluMlxmqgyxY6PjNKXvC5Ya7mrVdoAnON4v
         b6HN14DP45LucSxZXtnk/Is6TSUd//1EwtRn4hc36GEHd86bQCMcRvwT/h609XqxzhdL
         Gw3rUAuREGa5rUd8YU9gK9ubNmRKXryGKaPdD7m4hcYoHX+HBCxIDLjpSbLymXKhT+BL
         4ODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802851; x=1796407651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FtPlK5CQKt8igbcY+UOchey7QbaopvckYCnGVzWNupE=;
        b=km71F4kKMP/kdWf8siOMvINrWx+irXMxlnnt5oiLvzrwFJk/IAYtBYRxg6Md4NIuOX
         vA314Bk7ue0G5nhdpFYYeltIowcCIe+D5J2miWbUjA8sAwJXHSGCUNTC5/wFhy0EYCB8
         tLI23hhbq7hYdb3qBCETllynaoXnmQPNemyd/c1afgUY7z4Pajxv7TQsLlVLYUlMY7yI
         PUbmPALaGTidFthSYr19spbGqWGb1OlQcGnv8L3NVJ9bcuLoRutARY4+0XIKU11ITovP
         OjmmXac9GZzfQBBdyMXBMLYVk3EVQ2V6Ji3WKrBpqH5Gm3Ked33p9mfzC6uDzYuKiz+A
         4PIA==
X-Forwarded-Encrypted: i=1; AL+hErGxIcXgyssbdjUR3Bvvu+dTtsUMKhEDSvEZa9FBxO9AAv4m3RCBZracP0wAHBk95SDtRGA=@lists.linux.dev
X-Gm-Message-State: APuU4Z96TvjqxjxLKRv2GSgxuR3UxC1tISvkPPim4FEwzuflthD4ig2N
	sR1WSVWNJwrizCjBc04o5zBHDUQdn2wrOu60iV67GzU+KmiGs0MwryGX
X-Gm-Gg: AZFdTZcrxNvPXpQXUCuLaXZJal/qFjFliy9BDw3blQIpv9YR+9jh643L1qPbF7Y4efO
	HiO4GIuemkl7HrRGUV6ZdEBnYr4TwhcxBK76ReckPGFQ2uKzKH9nGROgJ9tLYKNYQYkFMwoxkrv
	JDk6zw0mo9OGacrSp87o0Yox6gm6I/fOefnzXQsqgyOsnA9+WTghasDDoOP4TLTI0kWzBSifD0K
	LIT5chtdNY5h9UBB7Di2dUhmXmsA81gSEOBk9vL3vQhS1V67L6+6OB81a7s2ng2DSydYoILrIfM
	QhhEOliLuXwkLLhcJnf1zHsPgPcc0SQ8dI45ZEXSNdX/Grm+3Ir0xtFVonMbQASM2lV0SjIOTKN
	FBzEAM2Gi/OmIEhDzfWFhcVAJBsaiL5DuqsSJX5zZTzOmdflM7V/4bpkgzQQ0w1CtYVFFva8i9s
	dLh6uSBEmSRTOGHbSROkJdAO0ZaH1krx7VNDvIlW3O1rccTUbf9r0QlYt9g70EhUpcdiF7kjZ6B
	WJ+/ZIdCLakGvPPUVHeCXXUPEgGc7hX4d+oc3433tGKbkeuyXZmgcttN5cBd+gYtMrn4tzpSmmf
	Lb5bAhoUqwxFGnIxQ69CF6ZE5p4zCbrdcuYDzpE/iAOlybvM2/D0RlZ5ADLQgKLWGJ37wzsNnBg
	kDk8AHo7q4eTCe0RUFTCaTMoCAHifhbFe1xQpcQh+TUNbXA==
X-Received: by 2002:a05:6102:f86:b0:7d6:5e38:3418 with SMTP id ada2fe7eead31-7d72b361662mr12116275137.1.1795802850643;
        Fri, 27 Nov 2026 10:07:30 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a800:1256:3c75:eb0d:7d97:e4f8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e8219b2esm26087020137.9.2026.11.27.10.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:30 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: jic23@kernel.org,
	andy@kernel.org,
	mfd@lists.linux.dev,
	imx@lists.linux.dev,
	Frank.Li@nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v6 2/2] mfd: mxs-lradc: Convert to devm_clk_get_enabled()
Date: Fri, 27 Nov 2026 15:07:09 -0300
Message-ID: <20261127180709.315826-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127180709.315826-1-festevam@gmail.com>
References: <20261127180709.315826-1-festevam@gmail.com>
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
Changes since v5:
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

