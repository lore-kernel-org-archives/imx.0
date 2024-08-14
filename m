Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8B31B14E8
	for <imx@lists.linux.dev>; Wed, 14 Aug 2024 10:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631774; cv=none; b=TPj7wgN2Cg4kl8UxDY8ZnT/XrGLh/3tr59Ys8I8E3gE6/+RwyoMidHosNsbymb5A9EOl+0p9Q7wjJhvKschnpcMgPkcPeeAI8TmW3fEMm/zVt371pBgoAwCZssFaqSdoEsOa8EzLyzxmmGrsp54inHUv/Qdaj6mfng7lB/ioqPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631774; c=relaxed/simple;
	bh=9nfeEKWWXK71lyt3E4atHiwSSVqqIMbCjN5ufCKLQuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MbZxmfwGu18JS10ctVA0oEet4lsCh1n0cCIlst3sc9aBfsh/8rpYq/V80zxPx0818kfyjqB77GCCRC8GymWI/CtUbgfwLHfafPUB3J27U9D7/spvgtY1dEnEJm23aeVCeu4n2qBvBwfIB+GE1Z3TI96LLt1EJxONqMUR/yvT2TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KerYnefq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KerYnefq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42803bbf842so63676255e9.1
        for <imx@lists.linux.dev>; Wed, 14 Aug 2024 03:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723631771; x=1724236571; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmBhmMFWi1AK4p52cV4BVjQgGxMNMRXnfeGS+WqO0BI=;
        b=KerYnefqa5SwbxfPTjlwAP4Ejg3haaNDmXw6hdDGKZYOGHEMQyHjVenT1CTM2ngX/m
         m34XaOgAiiKZw6MrikKh7Au8EjBIiO391sKrU+H4bOQMR3OLzhantO12S0Wndg7DDJcS
         stZS2M9Y4BNGOQGSPsIQumJvuHb4lbuRV/lPndoKuETWlB4NLkj8f6ZHS7hmRh8s3PST
         Ll/Z+tbcrDnnigyxBPxAZq2r+NEIW4pUK9+Zcn/arKViD63xTpUH+QvsKVKoYnbgeVHZ
         6i9mQWlOfHuCLWpcWyMQJgnwNMSC7C5Ob0S1n6UgeVuN5z4Nks/qwWLjLmj7zVg85hB5
         DcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723631771; x=1724236571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmBhmMFWi1AK4p52cV4BVjQgGxMNMRXnfeGS+WqO0BI=;
        b=FBYMB96eBSlMjjy61YvCuZo7RGqkE8UPWB1GneRBmRy+gw8i7YukZHQEPnxq6fW3CP
         Wfz71lXek1e6qOsxKeWiROo8ck0MtBqYgxOQBHynGTRkuduRU4LbDqKeBrzP9UOBG8ZQ
         3zjAFG6YNv4T+EvPImqXwYtXN8Ve7IoKI0DytrbjQct0VXX4QnX61R1J3m3IkM02Lwg6
         ItdeVgVkJP3POaIRspxLIjN/d2nsQCUo85mgWw/2q1/3VjDjjG4+dBk5bFkBwrNoK7tB
         SCMCh2e4bsKyyZf7N1z82YHNBxPVI57tt48oDgfqSEzfrBP6d6XINlfyZyYh8rniKUMO
         odRA==
X-Forwarded-Encrypted: i=1; AJvYcCX0/6GGaS6Ao7rTBcKUFYGJGls55ByqitrLnRqC+FABf7Xt4aZnPSeGbpES61+VtBVc4xhGUPE7Wdd1avw8CyDBUqWh
X-Gm-Message-State: AOJu0YyhNce5+uBDcXRvwK3lyKcFAJITAuWRkEBkxINN8rLUxxDkCQRL
	SGkUbgKKtpQEo7ka0JLCXcc1vxAdHgO9VhCYXeVhKQcwB/jEQR59Gfsv1VpaeT0=
X-Google-Smtp-Source: AGHT+IHogHV6eV4RqteTVOs3Qb1UfpP1jzjdAVvS0baMy3wCgVxuJ7NXLTXDYUfBCeeAh9lh4GZipQ==
X-Received: by 2002:a05:600c:4588:b0:426:6857:3156 with SMTP id 5b1f17b1804b1-429dd25f703mr21588475e9.27.1723631771253;
        Wed, 14 Aug 2024 03:36:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3dd4dsm15501835e9.29.2024.08.14.03.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 03:36:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 12:35:44 +0200
Subject: [PATCH 08/11] usb: dwc3: qcom: simplify with
 devm_platform_ioremap_resource
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-usb-v1-8-95481b9682bc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9nfeEKWWXK71lyt3E4atHiwSSVqqIMbCjN5ufCKLQuQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvIiGfD4TwRONkGpsojmFbdJcSxCiCAlJTVmsp
 KTv9CRBwZ+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZryIhgAKCRDBN2bmhouD
 181AD/4lWRuDxBwo2xHM5NlbKzYfoEBMH+TJwD1iZQQQN2t2LkSmIj9sIhJf9aUuO2SWqiS8N1/
 JZMIpmiRSmYlx/Hedr/t5KA2t3EfnF2j1LDxCXXBTmOC/ofE40HAg3uX0gq4M7xauGNagy+3anP
 trYHS1fuhm1DvmAvkQbKugDjFzjY7p76NpoT+xkk1vU8j5Lq46zv00diuCL7O+TdQ4wiy7+l2d+
 +uZx/2z4yNWasYn8RecqsSVnZ+PPV12SlVp3zP8PqGoKzKIriw/CeVmiKITRfikqPbBfa54yBj8
 ObbF2WipNF/9cuHL3760xAbK8yqwO4LKq09FBl7QoIrrElGcjqDLNH+HT97w+efH7lHzrpZr7tU
 Z4aKEFT/IjwHW4GOgn43l77NZLC6kBHdux9fxme01si6NvNNQZRxoiwfye08skne95AfYERVKgI
 000GDxr91kkr4Ro9cbdLY0QbRfCnYHq/Tu/OoxS7PuuFm0ZlOhqYXzxJEOmpUOsv0cTaunYFBwI
 tPXXcipxhrN10OGd/Bjk+ET9XRnGpfqRi9n15NzDgRojb1ru9sIHnx/QKot4ij/XRl3xLX3rztp
 2lKSTt5Sb46k9Ovq3XkiJdpjWiHA25ZUIZnH3in4yJyyKtmgBhB0QKpRn0TuV72QV2jik9P5RUb
 /TOUUf/yZvxkx1g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use devm_platform_ioremap_resource() wrapper instead of two calls.  This
allows also dropping local 'res' variable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 03a8f080078e..c1d4b52f25b0 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -735,7 +735,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct device_node	*np = pdev->dev.of_node;
 	struct device		*dev = &pdev->dev;
 	struct dwc3_qcom	*qcom;
-	struct resource		*res;
 	int			ret, i;
 	bool			ignore_pipe_clk;
 	bool			wakeup_source;
@@ -773,9 +772,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto reset_assert;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	qcom->qscratch_base = devm_ioremap_resource(dev, res);
+	qcom->qscratch_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(qcom->qscratch_base)) {
 		ret = PTR_ERR(qcom->qscratch_base);
 		goto clk_disable;

-- 
2.43.0

