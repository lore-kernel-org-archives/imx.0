Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608FD1F8933
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 19:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736882007; cv=none; b=fEz4fyCIwHS7h6G2XggusvJZQFOBeOet2LjG21ibK9xAT84hTkenplPvHFlMaP4oYN1Tlf6zz44dzh4JnrZ/Dw7XsSG3NITJXH2qo1FSugCcwhUeL6YMJOmoup6ISIEM4Fm0AMXRBhmCkQ9SruhYK49nRcShdv8pQeVBgvqz3yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736882007; c=relaxed/simple;
	bh=k7IsBi5ieyhnEhM6fyajIW2nBVHAO9NmMCImrDmXTaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDMkFNCeAmdZpTunZ6FDaNIG+7nlBw7HfIFBOLPv90ugmDLqP553QhiS4VwSdQqhDX5ELhUnX990hpQ3LVCdeRTFzaGPOMUcElZx9glha3NPcQafH86RrWq9L5UQwX/0OpSVpmn22l0ko41YIGUcafAyp8tFMYwiNZplQjA6cRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hhMRS9DK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hhMRS9DK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361f09be37so7411255e9.1
        for <imx@lists.linux.dev>; Tue, 14 Jan 2025 11:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736882003; x=1737486803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Wl7tKpwKeYK8cvnyb6x9sT/UwWoYgOB2ZsNSDFKMQA=;
        b=hhMRS9DKgY1dg/8Hp/38A/AEzrZVW12gtVHgYrC11ZOgrx4rPIg3hZdUj3qyIq+1ix
         Uer7qeunJAtbFQMQLr8fGH3MQifYA2JsU7YEjfpgmUqItaYXlZSbpcg4nE2bkV7wuNcX
         tZqa+g+fetRfvGz0jsNItQ/H9ddZbmxbaJrBgW6CDmveYnP5wS3BjriZqZnGh1s//von
         WXv7W6c6ByJWnLEBmiFtlDaDNN2qxK0NBDO48ezLR6JIkNvzqVEDrOy88RbEC2fXnF5q
         NVDeSU396vo+CmxrFCr3v49+6VqExBO65D9clTcAr/sXm9YAalorl10VzuMzyCwl6GUp
         0mRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736882003; x=1737486803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Wl7tKpwKeYK8cvnyb6x9sT/UwWoYgOB2ZsNSDFKMQA=;
        b=R/9CusCw0Eu4BFT6lPHNB4hnNd1Xsr2v2UJRp15EzXNaFIymWekDp6t7roYgtYorHB
         YVH7sOsyVLl4hmkyGHC+FaQF20JCviULDz1uSVEve9CZ9hlemkptpxwBUW6Oh0k67muB
         MYLuyOI+gv58ztItDwXdOVn2l6lGUXJfc/F56Num/2q6ZU5g+IfJV0cHYtvFqTIeOJCn
         nAe1j0uu0Wk6QEIu9oYn/JZCxtXFKCAsYXvUysF8YeRzE1JSNgFl5Qt1FuLQ22UDbZPS
         z64RNcDkE6d+x84VaD6CCOq61eCAFu+u/H4RFPH6XdgQJj67OsgkANvLJQSXDCi1JBWq
         W86Q==
X-Forwarded-Encrypted: i=1; AJvYcCWG4cKiY2NNJu0e2fzhigZRhO3CV52SwcRR9H4bdvbJH9tps3b++WBY1qyjchMlu7Vpfsw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAb/t6Yngw7WQVAziNge/nuLwR78bEI7G36zIBSO3KJ7JXmB0i
	cwlj/VujB4swTtZu3YSLW4DFzN5aCf2HuEd9bKTqo5GJYhzsLTlcwzAw+hRgaR0=
X-Gm-Gg: ASbGncsW49T35aCBwDee72d68Ah8DINQ9wS4y+GlZJpAFKmkjJeTQ71OvpIaqvjGWq9
	Uk6AXeBBMUIPYYDjxzzFYgeCDEqCTm6DJHZFJCeylVOziiP9Q0HuLpBB9XiRd+Bmc63ybizQHtj
	iDQEiCQnG9uLya2vU8DKA6L6eLJFkQU+LpgV7wWuJRpIHdp2gkq+b6tmC0gvK9/XW/PqD8uUUAK
	ByBFrUkilqFHJtMSwxDoIjiuynMaTeyok72jVE3JWt2+DVzTZBHI96+Y9uunSjd/Gxe9YY=
X-Google-Smtp-Source: AGHT+IHcdisH2w41GtL10pQD5dU9j+js5oAERihWoWX2WfAm4V/01RG4LlY7+mTlTx/wiFlkIv9Wmg==
X-Received: by 2002:a05:6000:2aa:b0:385:e10a:4d9f with SMTP id ffacd0b85a97d-38a87088249mr8578870f8f.0.1736882002698;
        Tue, 14 Jan 2025 11:13:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e3834a6sm15508266f8f.28.2025.01.14.11.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:13:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] dmaengine: pxa: Enable compile test
Date: Tue, 14 Jan 2025 20:13:16 +0100
Message-ID: <20250114191316.857154-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114191021.854080-1-krzysztof.kozlowski@linaro.org>
References: <20250114191021.854080-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PXA_DMA driver does not include any asm/mach headers, so it can be
compile tested for build coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Fix subject typo
2. Drop () in Kconfig
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 8afea2e23360..df2d2dc00a05 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -546,7 +546,7 @@ config PL330_DMA
 
 config PXA_DMA
 	bool "PXA DMA support"
-	depends on (ARCH_MMP || ARCH_PXA)
+	depends on ARCH_MMP || ARCH_PXA || COMPILE_TEST
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	help
-- 
2.43.0

