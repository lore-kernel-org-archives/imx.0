Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B181AED50
	for <imx@lists.linux.dev>; Wed, 14 Aug 2024 10:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631766; cv=none; b=ivjNUKK9MXIAWO5W0v1xH8AS+nYJKZmOz7vPQTw8dkJJLVb1tZP/vp89ro+tlj5B7NZ17uHkpi5NiRJUuqrkqIZxmDNfknyTMW2BAeW2lo4n8KzwVhT6Q1NyOYMiWqSG+3/NwAafV63nLFmOF7TOYYXEHxayV0dWFVuuPgPuREU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631766; c=relaxed/simple;
	bh=6w0FwQBoUqvtw1ZqzZIIkPCVnvDefZcLlt+ogevlVh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G1Zhf8/HFjMj8er9Bof7KnKzxciPatLee3Atk6NrJrG0TLnFeI7Hx4OpsNnqFL0SYKNI39CmbjKTrtH7YMNWMGGPx3vV5pnOi/IIwi47JOKLiPdyWHXL/mi/gtNTbYDcrg3GEbrC157XCz1r1eTvtkxxd8IfWaEi5vDWbvGKK74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ufG6iz3G; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ufG6iz3G"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4280c55e488so4374475e9.0
        for <imx@lists.linux.dev>; Wed, 14 Aug 2024 03:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723631763; x=1724236563; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cqO+4rAxBNRyDDhNBHedGtky2fSXIy5hPBgThD6ecM=;
        b=ufG6iz3GvbrZD9GnUlQuvCW/XiKzf8oGKKzEHYDzY9FpYP/EleE5G3854lPkBgBXqM
         uvLjZPael6LC2Vbzv9BEBgfuc9EaKFoSwhQqD7S1vRtWOCF6QPlDnS242ng6Uu4yqXmG
         sKGW05EiR0nIUzpwBniBvCf3a7vSSOpXxkz0q/dKNLr9T6rbWK3Ylmrs6t5Nf41zRc5L
         3bWjeCC/4Ndgs29taprtq7XWaTz4AoExXvRp7x23e/Kc4mDac0vE+7B2pwtgzRvSR5sF
         jIAQyZYBxU98/TpwF/jb/wIJ4QHIMPFTkg49KVBV7CGdlSi4x/1ota6whZZUXD6zHKM4
         IAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723631763; x=1724236563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cqO+4rAxBNRyDDhNBHedGtky2fSXIy5hPBgThD6ecM=;
        b=aIgsCHSIIo6IoitIgdoNKMHYypdm/PLjdXCJft1vThpE0cDMBl/fMgguB+BOO4DoIU
         ycDbgZ270C4k01whch4do9H1SUuyLmFRT18lIVqtSZynr6WVPybXTv6rSxPSMSPIf4ZP
         17FwDQjUzgeMbtBzfMYd4RBdfWTkpccG737OX3/438bfDRb380/66nhlvx0owYwe0FX3
         uFzlvw8nYjc9hnqrCY4KZ/4BTQfTpkBlpb9tIRgAtaJLnCu9tFtUztLNJGiKQbbfORdz
         AP/kHtMjGY3TCTG8wdEv+UovWONeKd5bpvgm4UjpscGd5vQyDxmYo/NeX9LnVxm/pkXL
         iWCw==
X-Forwarded-Encrypted: i=1; AJvYcCVtS9/Ylx0MHTGJCkZLF6UuhK2Lj3Yxl70OH5LJrOfYTnxU59YuxJwiz+LLjUO7XEFFnDk9I0lXSaUvRTWYy4iElDSz
X-Gm-Message-State: AOJu0Yy2BIAWZPcVK+cdd8ZNbBmc0lZThrNWckEzm1l1odOhO3y0ltx1
	B9lfE14EXyKdAveLTPP8/4n/mU8dwZNLbGH5VuVC0QgiYFayHkHbDbZrLybVPA8=
X-Google-Smtp-Source: AGHT+IES2mQhu6MdPtwV64PYKAc4oDWsVzNHS1sfgfyJ1Y6SRvJ5KM7FhWMYBHfvz5L1Tw/i6VxzIw==
X-Received: by 2002:a05:600c:3584:b0:426:6fb1:6b64 with SMTP id 5b1f17b1804b1-429d62a79fbmr48006525e9.7.1723631763306;
        Wed, 14 Aug 2024 03:36:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3dd4dsm15501835e9.29.2024.08.14.03.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 03:36:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 12:35:40 +0200
Subject: [PATCH 04/11] usb: dwc3: imx8mp: simplify with
 devm_clk_get_enabled
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-usb-v1-4-95481b9682bc@linaro.org>
References: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2471;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6w0FwQBoUqvtw1ZqzZIIkPCVnvDefZcLlt+ogevlVh8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvIiCl78tzBS9uIuiF3Rohph/DlAc+GfXXGrOG
 eS+1ArbuWSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZryIggAKCRDBN2bmhouD
 1/DeD/48dKqEg1rZRiz6+hjkctEx6+iMDYay3/t3lA1ygHh67v6RO4XxGRvxqTGvRsK2fS1NAVt
 nA8+SHIKxwudDMHUcL0nYgrJ3ciLOR1rCtBTaX4jx/yC6PdLYm80L1xfttNU5CA0eMZzillE3RE
 zjP0SAEkmUZJer7hYR50bHM0AfbVkvaZAT4Q7nF3XcmlTyNkzWUjgpdvmgkzynJ5otGbquxP2d8
 MiN+2ONYIf1dArLXBxR0Vo8qlEGk3fSRVEt0kTlP7+uviQSAuQUYZYkArFuWMjbFygXoKy53inQ
 cYRxJ/Y/GmZLUI8vJ3B8UmuXZlL2fYkiL8X0dshjEqJmNQVWU2D1IhXofBca7ltD7SrwKIWKhsR
 5xio7cUFk3OoH033uk0BvKvK2DMyTUozZ0HdTaraIbfMR13Ir0kUTcjtg5q79c/VlMLLS0Z4N0M
 uWBmVkE4/KmOTIaTIAf+dshbxfwzVFm3025RRkOtYzqd2eZsV0Y/ugsxzWZyXKD0QdnhLJHxy+8
 ae81x+rq5ZvI9w7MvLVywxABWKzD3Ien8yfGQ78UXlQ+WBijJDnECG3ujrVt5zxx9iIKcYlOEbf
 NIX34IibhiuhWA3LVdvPzTeohL/5uhTbmXh0SUqFhNDQrks02MaqnfIICErUuiXc5i6NXvFu8DD
 maKo0o+M5z7Xvtg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use devm_clk_get_enabled() to drop clock preparing and handling from
error and remove paths.  This makes the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 32 +++++---------------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 392fa1232788..8c91e595d3b9 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -178,37 +178,23 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 			return PTR_ERR(dwc3_imx->glue_base);
 	}
 
-	dwc3_imx->hsio_clk = devm_clk_get(dev, "hsio");
+	dwc3_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
 	if (IS_ERR(dwc3_imx->hsio_clk)) {
 		err = PTR_ERR(dwc3_imx->hsio_clk);
 		dev_err(dev, "Failed to get hsio clk, err=%d\n", err);
 		return err;
 	}
 
-	err = clk_prepare_enable(dwc3_imx->hsio_clk);
-	if (err) {
-		dev_err(dev, "Failed to enable hsio clk, err=%d\n", err);
-		return err;
-	}
-
-	dwc3_imx->suspend_clk = devm_clk_get(dev, "suspend");
+	dwc3_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
 	if (IS_ERR(dwc3_imx->suspend_clk)) {
 		err = PTR_ERR(dwc3_imx->suspend_clk);
 		dev_err(dev, "Failed to get suspend clk, err=%d\n", err);
-		goto disable_hsio_clk;
-	}
-
-	err = clk_prepare_enable(dwc3_imx->suspend_clk);
-	if (err) {
-		dev_err(dev, "Failed to enable suspend clk, err=%d\n", err);
-		goto disable_hsio_clk;
+		return err;
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		err = irq;
-		goto disable_clks;
-	}
+	if (irq < 0)
+		return irq;
 	dwc3_imx->irq = irq;
 
 	imx8mp_configure_glue(dwc3_imx);
@@ -259,25 +245,17 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 disable_rpm:
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
-disable_clks:
-	clk_disable_unprepare(dwc3_imx->suspend_clk);
-disable_hsio_clk:
-	clk_disable_unprepare(dwc3_imx->hsio_clk);
 
 	return err;
 }
 
 static void dwc3_imx8mp_remove(struct platform_device *pdev)
 {
-	struct dwc3_imx8mp *dwc3_imx = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
 	pm_runtime_get_sync(dev);
 	of_platform_depopulate(dev);
 
-	clk_disable_unprepare(dwc3_imx->suspend_clk);
-	clk_disable_unprepare(dwc3_imx->hsio_clk);
-
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 }

-- 
2.43.0

