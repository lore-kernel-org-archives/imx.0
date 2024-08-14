Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D21D1AE843
	for <imx@lists.linux.dev>; Wed, 14 Aug 2024 10:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631762; cv=none; b=eNQpfuFgGfzIdLQJKuYoCeMGL/0uV/erQO5CF255NG6+xjEMktKE005FTVf6X7IUUTjuvkol5VhJpAMGJ97NFoC+sz4pGktRlGnv8fTWUUUoOIthMiVoi8IE8iTLCk9gLt1358YCgjHtoHr8CxLEfbUwWJJNy12nZ6A/6UyGnRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631762; c=relaxed/simple;
	bh=vskeAuKrhfXrsp2ZcFFQuCibXtmv9qVHOZR6L6FnN20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V1m01m/IFqbVO9LlXSQejzQ/zRBoBkKkBvaO5WWqktkTDWnLuUwVnHhVbprMGE3xY5u4kMfIVzZl3m9WPZ0ukA0pJ5eEHXLTbkmJlD4/snUK1mZcVcJs7R52kOKL0PiwWxhYfuIgMWnuGXbnu2CRDRLXL9glq0/hTqkHNf1bzcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BWQeEzfJ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BWQeEzfJ"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f15790b472so80393211fa.0
        for <imx@lists.linux.dev>; Wed, 14 Aug 2024 03:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723631759; x=1724236559; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYbj97TWkeN06uXs3dFmCbhWF9ptmDF/h8TBQ2K7IzM=;
        b=BWQeEzfJGqEvOlZJEC9igv5CsIqRlIX8GACqR/xsgGWIwafg96wfiN4slMg/TfZ/cf
         h2kYY1E+ZFIQSpCVoG6AHR0okypi7W8X2Xk6iYwEgz9/GguexfO/0B5h9EAsb6fRyOEy
         N5gS3ra4R5P+3ffrAy1d0j9XuLWFP6S11wNGG/7l2BnJcDhwCULZWweb9CRCx+BW0t+m
         2Iden6NE7d/ntIn9lr9clN5tG62QX/+PcrFSTeS0cLWFJ7pPva8uCowt7H9LU+zhYIH/
         ek8U916Pw3XoRuPvRzyvoahyvBfsBc4wYGM4WI6kVE117JxgmOKrzDEXnWrhyzRWni8y
         tuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723631759; x=1724236559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYbj97TWkeN06uXs3dFmCbhWF9ptmDF/h8TBQ2K7IzM=;
        b=DTZDh1Jxzmr2IgBrRGRlsbL1lH50IeD614NJ042jCaUnz4R97UfxXiHiXkzxsUMYKO
         UGBoov+oI/7Mjkkh94Sq0c0cUuykJVpjHAQq50WYlJ9hai7ZyPHOAyA8BDUxn2i/zSMD
         pZdYD2BjCWZbl062cFPn84xmjH+Log8AE6g+LVMu4Q5TcsaSreeFrBD1L61ALA2OVU+w
         x5qfo4zF1iHFDpQxUPNKvShIo0UMAOFwzZBOdwPVVoxOTdKlylgP7lGLvF6amojpkUoI
         hrjh+9hXrBSlQ1W9zKAo+3kmd28jxi4DD+pd+LvncPOE7p2q/PfWEnH/EMRP5rB2i9e8
         ylWg==
X-Forwarded-Encrypted: i=1; AJvYcCWrXN7ReoSWErhNovwRko4QFD30+qEBx1evxaCv4+KR8N6l6N1vJof/xGUUVK9TEPGfW4QzMWbfsqzYnbNu45xwWz+/
X-Gm-Message-State: AOJu0YweNqD+le1OGI3RxfJtVxKRXVD+5eVB7e2p1OBhwNtxHzkA1SyB
	WeT3ztziMWRbE1fVROSFb8v3BAd7gG090588DvnP8uPR23LE22cjqxbTtAuAiSc=
X-Google-Smtp-Source: AGHT+IGNnEvKYgHjOlM+F8zslJoez+32u1bT6xmeFHQ2/ZeUJOaLf7dk5BPLnJuHX9IuZgxjc9jlDA==
X-Received: by 2002:a2e:3003:0:b0:2ef:2685:177d with SMTP id 38308e7fff4ca-2f3aa1f1bb2mr14654091fa.20.1723631758721;
        Wed, 14 Aug 2024 03:35:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3dd4dsm15501835e9.29.2024.08.14.03.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 03:35:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 12:35:38 +0200
Subject: [PATCH 02/11] usb: dwc3: st: simplify with dev_err_probe
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-usb-v1-2-95481b9682bc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vskeAuKrhfXrsp2ZcFFQuCibXtmv9qVHOZR6L6FnN20=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvIiApf/404hSWCwrTIbqTV+JJM3N30EgD7ku7
 Zsz1Z4gWiqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZryIgAAKCRDBN2bmhouD
 18wpD/4m8mmVOueU/GuhjZB2g27J7VlVXkK0jkGm7TFlyRFyiF2XYlGnZqaXOpmN0ESdexzXM3d
 slE+ElE1ppbQkvNFg4aDQFGuxXKY5IWMAv5FJuXs0kohxCvZTGEvIfpymJ+4pTxjS23v8AGhCxW
 bdN783ZthKaw+vTytIyOKbW5fA3V6XB0fssYWKvgmB926my9VU2zj1hB2Ww2uLaDUN7rdxInGZy
 o44duqg10/m+duq+7L5UhVy2yL1VHdqea4/1L+C3s3r42BeDQeEnLjfjv8wg/RPF6VOj0mgjktr
 SOEZIc7ui6Rj18eXhhyl2TWGfyv0pLmtzy1dqbiiJzKaNRyuIcsN3TwCURpYL3AjLGILkaf+8M9
 j0MDj697885SoSa0Fn33q9oscQEKDYIwew3dzxTSrftVIKM279oy3uUAHYV2Td5IwxhxlWxJ045
 x0KM/mgjF9SSI623mjdZ+Xnr85ZjSix/n0Frwzt18U2CtpgyzHfoT9pvtNGcTwWmCysOHxK21EM
 2CK7iNGaZDhuKbff2tKDpcxPOeXa+V+WISeWC5Cd1UrD7Oz3zWACUeBfYxcUTsSr8wjpWnmfPZd
 uYeQxAeN1KZO/G1CwTfshZ15a/I+ku52qqz0t0YHnKo4SomBpymirVhv/RSgnsUW1Ld9Pxbhs0w
 xtXyrU6Q4UlpCtg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use dev_err_probe() to make the error paths a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/dwc3/dwc3-st.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index 98f43d7082d7..7a0b1821768a 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -237,10 +237,9 @@ static int st_dwc3_probe(struct platform_device *pdev)
 
 	dwc3_data->rstc_pwrdn =
 		devm_reset_control_get_exclusive(dev, "powerdown");
-	if (IS_ERR(dwc3_data->rstc_pwrdn)) {
-		dev_err(&pdev->dev, "could not get power controller\n");
-		return PTR_ERR(dwc3_data->rstc_pwrdn);
-	}
+	if (IS_ERR(dwc3_data->rstc_pwrdn))
+		return dev_err_probe(dev, PTR_ERR(dwc3_data->rstc_pwrdn),
+				     "could not get power controller\n");
 
 	/* Manage PowerDown */
 	reset_control_deassert(dwc3_data->rstc_pwrdn);
@@ -248,8 +247,8 @@ static int st_dwc3_probe(struct platform_device *pdev)
 	dwc3_data->rstc_rst =
 		devm_reset_control_get_shared(dev, "softreset");
 	if (IS_ERR(dwc3_data->rstc_rst)) {
-		dev_err(&pdev->dev, "could not get reset controller\n");
-		ret = PTR_ERR(dwc3_data->rstc_rst);
+		ret = dev_err_probe(dev, PTR_ERR(dwc3_data->rstc_rst),
+				    "could not get reset controller\n");
 		goto undo_powerdown;
 	}
 

-- 
2.43.0

