Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A524D3002AE
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 16:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187635; cv=none; b=dR26G+5awSOCFRtkUuCr8NIDHJVQjnc/Whg/vYAwsVDeb44WD/1A0ULOZqHXcejwZYevW+Ql6LSjmRZTyKfEsMYzPOaHZ3macQ1CKjZvONt+8GWhDhZudzd1sqmA/QNgQF8r/Wz08aE87q8OtZJ7Z/s2vyU234/xSCJcTlkWHOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187635; c=relaxed/simple;
	bh=nLKgSvSgI7gDUsnC9ALIo8slGJAiPfy5nla9VR+CXBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Le9TUCc7694wes4gXdYPZnoimA+tSNl+oDAdAvKoeFWNOw1xKYXqijSrBOAVigPJDMIoi6JFTt7te/c8RkIqPJFVph/Y7R6VfLmttg/vYbMsYrkKsz/YIu0OqkknwxeUZKiVlDQPeQLg0JUd8pR9NK5h8W7AXGq/p+dVa68qQ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oe9qZTxl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oe9qZTxl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b00797dso7437695e9.0
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 09:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755187632; x=1755792432; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uUiAWgIv/rr4bdczjmXB0zM0zB+f4UfZqA/MDFkyEc=;
        b=oe9qZTxl/HDQk33jIW3kAnqexw3Z+qwex3e1uJxpSnrarpiSQVRU/a8Duw8+plgUfp
         i3f+GET70CkevwykUMknUgUcHyUolEGUYufIfBBYUrwj+GHTEv9g38w9j6BZWEMdz0JW
         fbZSSCxdomogj/dnEnNocg5d1kM59XmpVh7dKRpnzCleovvhq5IVxNSC6W+iv041JygG
         ExconMzlZygfGUkEMGkxKZ6UHpfIGNA7xBRMA4fGiCqY4gFv0XkJJawF/ex5PGSHv9vj
         9KjkQa1kA0a6IAnhbkyPjVWvy1zJRv32WQoO/qUf98jtlkJK0IV05TZqcqgm4eWMnTRc
         /ukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187632; x=1755792432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4uUiAWgIv/rr4bdczjmXB0zM0zB+f4UfZqA/MDFkyEc=;
        b=Lo33fbD/hBEYXgjL6YKX/griEN2hWsJ4rBe1MeVPmK/AjhdOplr0dvDQjk+pOtWsJS
         LkvzOVNPP4iQZvpzRjjfjhL+jGH9jFRN+nOGfFtY8bofpAH0OUxyG4olj0IUZ5LkuURh
         0tgp+/TXx7NLJQr/EnXusmy22cSL/aqR8Je0o/gUawgiZ8zAfFtMFwfIDo5f5lB+VRAA
         FU9hgWtFa3Bs/OvSgKm1/dt1bITpdYIqrSmg51rwvOVwDXoA3VMZ1BSAdob9EU5CwUoN
         7/fTDGgb4jcBOBJ4niGp6iSPk33nS+HqRaT93uH0KQRCiAY0FdpjtUSl4Rcc87u4hGWf
         Fq8A==
X-Forwarded-Encrypted: i=1; AJvYcCUsQ3lGOgnNXys79zqk/uadyxMX8Cejy40MAOoD3LA2Ce8Pv6WSXlEGok4CuNf9GigLL7U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtfE7aQMCtS/YQ4EGWUjHX65h4xEeSD71txaXjhWOeupQ8UrpZ
	8Mw5EvX5xSDSYJrg+kCcVYb+Uv9bks82cNDVUSFi0NfzSKCa6lIHMhuP+XIdbJ3fHkE=
X-Gm-Gg: ASbGnct2cO6hWqza2h5gyMTA09nZcFY5jxXUyYNE2XGsSTe0cBhY+zFL5iQTiC7MYvZ
	lS99v83jmBrFoL+NxD2233JXWgmxl1DkbphNIiPEJTcHRyYQh4iRj9KWEiIKiGvq9SqzUqfZfih
	Al5Gwpkus2XfTNF+6DqgfMuC6abI3nfj5ecIvsCeKebrop/Lm1vwrv3upCWNl5roTphaiY8EsP6
	wSLLNrzOPzbwYJoSCJZIPMikjgyLxUw9xoJwYUbJzQl6WTAEu3abR7B1QfpP9YedxRcYiDpeFjn
	fScyrBKFJhu5RUMe8yLx6Apwy5H2VHagb0NdIIfrTKycg7thb9FkwboIBIbT7im+jDJfoPUrTY4
	OokzzcPNnqQ7XmLk+jj9OT0hh46O6nus=
X-Google-Smtp-Source: AGHT+IFZZ/SClwkyS/5PD0FX0+0seHog/otwGwC9/uLDftMPrJiGWVG1n+A33cLiR0ff/m9sgu3Qog==
X-Received: by 2002:a05:600c:35d3:b0:459:da76:d7aa with SMTP id 5b1f17b1804b1-45a1b6758a4mr27865565e9.25.1755187631973;
        Thu, 14 Aug 2025 09:07:11 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bd172sm28363495e9.6.2025.08.14.09.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:07:11 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 17:06:49 +0100
Subject: [PATCH 09/13] spi: spi-fsl-lpspi: Parameterize reading num-cs from
 hardware
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-nxp-lpspi-v1-9-9586d7815d14@linaro.org>
References: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
In-Reply-To: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
To: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Clark Wang <xiaoning.wang@nxp.com>, Fugang Duan <B38611@freescale.com>, 
 Gao Pan <pandy.gao@nxp.com>, Fugang Duan <fugang.duan@nxp.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Larisa Grigore <larisa.grigore@oss.nxp.com>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, 
 Ciprianmarian Costea <ciprianmarian.costea@nxp.com>, s32@nxp.com
Cc: James Clark <james.clark@linaro.org>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.0

To avoid adding more string matching here for every new device, move
this property into devtype data.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index 1013d5c994e9..6d0138b27785 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -97,6 +97,7 @@ static const char * const pincfgs[] = {
 
 struct fsl_lpspi_devtype_data {
 	bool prescale_err : 1;
+	bool query_hw_for_num_cs : 1;
 };
 
 struct lpspi_config {
@@ -150,10 +151,12 @@ struct fsl_lpspi_data {
  */
 static const struct fsl_lpspi_devtype_data imx93_lpspi_devtype_data = {
 	.prescale_err = true,
+	.query_hw_for_num_cs = true,
 };
 
 static const struct fsl_lpspi_devtype_data imx7ulp_lpspi_devtype_data = {
 	.prescale_err = false,
+	.query_hw_for_num_cs = false,
 };
 
 static const struct of_device_id fsl_lpspi_dt_ids[] = {
@@ -960,7 +963,7 @@ static int fsl_lpspi_probe(struct platform_device *pdev)
 	fsl_lpspi->rxfifosize = 1 << ((temp >> 8) & 0x0f);
 	if (of_property_read_u32((&pdev->dev)->of_node, "num-cs",
 				 &num_cs)) {
-		if (of_device_is_compatible(pdev->dev.of_node, "fsl,imx93-spi"))
+		if (devtype_data->query_hw_for_num_cs)
 			num_cs = ((temp >> 16) & 0xf);
 		else
 			num_cs = 1;

-- 
2.34.1

