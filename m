Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BD32494ED
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 16:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187626; cv=none; b=Pb80lcEs7J7WbaTVlidM5efRpKAfVx+XuoPI8ZaVCvMxJONkDdrE/RWmEQzwD6q3gDyaSyjNom9xlXFCxEkVETbA5caG4DBxXxn54yZ8BmLAj9i9cCTlvOUtuZFRwnqV73f7hSvD6iMgstGiYjuwj6JO1n57BfB11YEwxQEnjsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187626; c=relaxed/simple;
	bh=LIQFUNWTOqtolcuHkK+5pFdAZIsgYQVKYSFmavPARR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rAss/qHui9Gm04fAWW53MrJ8ld8TKyQRvWAybqnqYEyOp/QtdYhxc4CQ3caNZvLnBy+GjE659ZjQ0hyTYOEle9DhTQXEco1huQ5y2QrN2CS7TiwWj8WhCPkE0SS/gXnumpjZ/VLGD+t40rgH76s1KW1NRTn4As4og+eCizVcxdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HG6ANY56; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HG6ANY56"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9df0bffc3so659484f8f.1
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 09:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755187622; x=1755792422; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Uvtvrck5DhEfDGyTURDlx1K5TeMVtpeGZ6H7CuQmSw=;
        b=HG6ANY56JOW2uz8ylPiRWtR/cPR9jsjIDyorTgnusS2bbtSPBvlZ9FAKBMsiDgQSiz
         4BGaQZ2tJsH99bV9vsyoDhNYgMzLPnuawTynac8SqqeGujSgWvZ7E26CUxrzcVWVYK7X
         iRbdwF7XjWiDYcX9YUaUZI/KNNu3S2rT9x5EuqB/u3xTL0ogMJ4LED0iRJsEnUAfNx0e
         pcRjonH3utagqM84WMhT6dv0LEVmigZbZMjx/6NhssHjuOUE56qk+gBrr/nd9y9H6hq5
         cLVTUKIfKLcYfZsXJcpJrUI0p+y05yiDNbB+QJ99GEWxqtiVMoeiKafb7clVRNFhNNgs
         jJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187622; x=1755792422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Uvtvrck5DhEfDGyTURDlx1K5TeMVtpeGZ6H7CuQmSw=;
        b=IzJjCpsUJOyzcTaI1oEZ8k7ruWjC7MfRTuTArig+S1rJoH2G9Ob5trdqYW3cNZUVZQ
         vlwWaadgwpuBCiRZIFd55rCnDNZusElPE3Z642A6o91dEABKdrnWxBiFQLWHdnFBWRdU
         YVeEC3a3qyaVwdplLcwRG47kI4hj+m2ohtTK493HnNCC/0+7JnYstipWzvHr6mIeIF55
         HfM80M5Q1ckjnL9Nu0tu1CGnDJKOjM/VT0xfYBlX83VjdJTNoOSpVXJvcM738KOh6ajC
         OJwRD0GTgoBlA/WFNcj5vBAXGyiROUryrshwnGUbcWhZ/0ebxLALvH4kOpG1nVj4EWp9
         G31g==
X-Forwarded-Encrypted: i=1; AJvYcCUzFoEivuzXlbXdTnOED5HX+BrD1YQbt99+Fy0ghlgnqBrqAUi6bxoK2a1D19aygme0Z6M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxC1BfKRTvUrQpJxQDuAicaCeYZ+nOi+HWFzs+IZlklTnfwx2AR
	Atqu0KmgRbv2N0aAj9dh1XqK0QcqBENVEIVobnstyWdC7wq3NPcFLxJGxRyOyhTut/k=
X-Gm-Gg: ASbGncv/EYoNt+caVCeas6vFYb3OLmoyAgwO5lo5ESVUOMuVDaP9BB7GMtcYQRjSCYI
	EoqedBpiHP0tQYaYEhXNPdyiycJfF5Ik+eNDmauO8K0+7BUTm1ESykF4NYa2eCG9YK/VIdBZ7eS
	v5vGmEfn/8g5zB0LJp+WoBdF7r5LIpfi9RHqB5Q5O7PoNZVObZ78iw4zWQZWMbEAChXCDBoOJpH
	DUCr7tCeZlWx2x22rVx8PUVNruW/dMj0QUf0N+zdC55c1BfOfKQnS6YhBXBM9rh7ShJ5sK8czwf
	MDKMvr9F+8Bo5ZY6Jnbxk/9QaJ3+2E5nNDDw7WtroB3f/dsuUYFzoB8YNPEVY0vSNTwvbWkmYFF
	1DcgYID/y0uuQjkc5O2KYeQfOaf2bOYs/rGDfyE1xYA==
X-Google-Smtp-Source: AGHT+IGGBjbFKFRqiepm/LRwXnuwS+AKKH1MPA2LgWH+5Eq1mmSqrnU9CryUHU5mJcv16mc4hIWejw==
X-Received: by 2002:a05:6000:2893:b0:3b9:1d32:cf34 with SMTP id ffacd0b85a97d-3b9e415856amr2916372f8f.12.1755187622548;
        Thu, 14 Aug 2025 09:07:02 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bd172sm28363495e9.6.2025.08.14.09.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:07:02 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 17:06:41 +0100
Subject: [PATCH 01/13] spi: spi-fsl-lpspi: Fix transmissions when using
 CONT
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-nxp-lpspi-v1-1-9586d7815d14@linaro.org>
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

From: Larisa Grigore <larisa.grigore@nxp.com>

Commit 6a130448498c ("spi: lpspi: Fix wrong transmission when don't use
CONT") breaks transmissions when CONT is used. The TDIE interrupt should
not be disabled in all cases. If CONT is used and the TX transfer is not
yet completed yet, but the interrupt handler is called because there are
characters to be received, TDIE is replaced with FCIE. When the transfer
is finally completed, SR_TDF is set but the interrupt handler isn't
called again.

Fixes: 6a130448498c ("spi: lpspi: Fix wrong transmission when don't use CONT")
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index 67d4000c3cef..d44a23f7d6c1 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -3,7 +3,7 @@
 // Freescale i.MX7ULP LPSPI driver
 //
 // Copyright 2016 Freescale Semiconductor, Inc.
-// Copyright 2018 NXP Semiconductors
+// Copyright 2018, 2023, 2025 NXP
 
 #include <linux/clk.h>
 #include <linux/completion.h>
@@ -787,7 +787,7 @@ static irqreturn_t fsl_lpspi_isr(int irq, void *dev_id)
 	if (temp_SR & SR_MBF ||
 	    readl(fsl_lpspi->base + IMX7ULP_FSR) & FSR_TXCOUNT) {
 		writel(SR_FCF, fsl_lpspi->base + IMX7ULP_SR);
-		fsl_lpspi_intctrl(fsl_lpspi, IER_FCIE);
+		fsl_lpspi_intctrl(fsl_lpspi, IER_FCIE | (temp_IER & IER_TDIE));
 		return IRQ_HANDLED;
 	}
 

-- 
2.34.1

