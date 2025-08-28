Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFF42F28E5
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376129; cv=none; b=by6jcBVq0Y6MHcPwcomwx9LlQRgD8XHf9ztRg+2yEcSCZUtY7wD7nybfDBo18NOX78qBzY0ZBc3oMxfr0D/gbUrgoxS19WcAn0eLRjy/AKKWkZbhH0AhMDIyhyFvsu9LBAhrRof65QNKD1wiTmwOZQtaXLAJVxPLPFyQHasxlbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376129; c=relaxed/simple;
	bh=xyKYNfQ/SYdt2+/QXl/uiVJkm+ZD9FCpFhATvHlCaY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQqHQQYY8C7/1QxbXwtr+CnQOV0SxEQGf3g/kmk2mrOFfGBiZAtFzPkIUYPVkUb/If2acZ+ngGjV2PwV8a3cOx8IcmOS6lxZlW6Ya2NYHjaqs6B+P891pj8UuRu/5/inHZwF3dOqZljaJMn2VZez7eREBHqo1MkuGaf+fLvE/cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jFPAZHbZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jFPAZHbZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b4d892175so4232225e9.2
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 03:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756376125; x=1756980925; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GF7goOQZfjJy/n1Nlvaz/a0ipflIe4W5tqv+WNMdl/E=;
        b=jFPAZHbZl7qsSAsvBWQonu0XYa2rsTHjZ6g0KaJs2eBovW3DRfHD4+dTqHX0yQ6ZBu
         v0RnK81Rxhe1sdc3Wi/h8N6KkWXO+VQzxIc/PnpIOOeYxX42mizstS1xZQyE6Qk84iZf
         DvxY1eehKFKLMcfBdkNimujZL98+WXXREBzeEpntb+AjuKBsbyxEttv2UEEfm94hsyhy
         4faiTnwSx8BlCOazA2qe/oBLpd8byM9yAZEZhXU+UO116JtXi5+YZ1NUR1umC2WQEZ7P
         rXk+TkTZJz5vlx2DykcltpG+1xSYwR0juMvJlskq5Tjdxq3AzwFGJ2tSQdzlL3HUQtLz
         R0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376125; x=1756980925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GF7goOQZfjJy/n1Nlvaz/a0ipflIe4W5tqv+WNMdl/E=;
        b=AIiIBUC77GejhHCckaImO//0GhAQmj7i+z5TBuR9hUp2FnYO5e4Te3Z7DYHPPGmsWS
         +TkeUj1DUz+3ZgaDe282jG2dA4j7Cilr21s40w8fXgayUyz0/T+0tq/dTyALwuIg8H9/
         eWqJg13j0gBWHi0k/Ub95O7d4AQnAWq4YOTucb+x2PaanFDjhc62Pxn2/I4UHVuMOPE9
         9eRz8u+XBx+RujxGht4h9IXDnNSJgBgGP1hEBm9XTDoo88bSP/UvOsbJjNhrdLqSDyOv
         6wW1VfgDCuoIjDQSowYT2XBjdcIORlblQ1v22tWW6EQUjV9e4xjdMV1gw5RvZrqYntVG
         izxw==
X-Forwarded-Encrypted: i=1; AJvYcCVIgU2ZUBZWav2J0YIHrMuZnMTsq9NnbwiZwILzBh8pl1CdcBqyOFEI70p4knaRLin+C1A=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXRO8UH0GlcDB4JKCT5PdDud0igpIgtd0eWokhXxhqBPByvPPi
	3KGLXxgXukEQ1weQppEp1aDpKCrO9jHSMpK+r4l0btEbz4YwC8WB0h0Q7YewsIJTSlg=
X-Gm-Gg: ASbGnctMLiOJR+1Nma70kTyg79PM5e3lPsDWOq4Y7+wHOYahqXc51DNIZz+N83s2ppo
	s0uyLZ9MakdA7qa+/RQ5AxP2TzP5dk/kV56mubofCrnPna5prPj1ecn9u+rGecsMZnS2hQrik4U
	YvGPRWRqiHpehLYFBkiZpS/QF+ddKjfphkD8g4Qm+GCKFbNcRrWF+MXcaqg6VpJJx9lmWbwEuBU
	0h2cz9VBlEWznSm8iwAI9A6sCQPSGK5vRWqTUIKIJPZUovi+2rEuzoL425rv2jIHJJCbJ0v1fFj
	TF22svJppCNj6SdAEdELPBlskckff0rOJxIg53fW8sYk+UCRogwWz3+3y144BmzsyiIHjVOt7Cs
	L/d/rJVqfZhEfGWOuC6V4d0z7EPVRXYUyJuXCV3vviw==
X-Google-Smtp-Source: AGHT+IGEnzU63OfzICnb/K9gMn/j3/S0WtT5qqEXBUUstBaHlJHuR/FdnvKe65O/hXpHlmO922euyg==
X-Received: by 2002:a05:600c:1c17:b0:45b:72a6:4861 with SMTP id 5b1f17b1804b1-45b72a64b3dmr50996335e9.24.1756376125382;
        Thu, 28 Aug 2025 03:15:25 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b66f2041fsm49976305e9.5.2025.08.28.03.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:15:25 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 28 Aug 2025 11:14:40 +0100
Subject: [PATCH v2 1/9] spi: spi-fsl-lpspi: Fix transmissions when using
 CONT
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-james-nxp-lpspi-v2-1-6262b9aa9be4@linaro.org>
References: <20250828-james-nxp-lpspi-v2-0-6262b9aa9be4@linaro.org>
In-Reply-To: <20250828-james-nxp-lpspi-v2-0-6262b9aa9be4@linaro.org>
To: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Clark Wang <xiaoning.wang@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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
index 313e444a34f3..eaa6bade61a6 100644
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
@@ -785,7 +785,7 @@ static irqreturn_t fsl_lpspi_isr(int irq, void *dev_id)
 	if (temp_SR & SR_MBF ||
 	    readl(fsl_lpspi->base + IMX7ULP_FSR) & FSR_TXCOUNT) {
 		writel(SR_FCF, fsl_lpspi->base + IMX7ULP_SR);
-		fsl_lpspi_intctrl(fsl_lpspi, IER_FCIE);
+		fsl_lpspi_intctrl(fsl_lpspi, IER_FCIE | (temp_IER & IER_TDIE));
 		return IRQ_HANDLED;
 	}
 

-- 
2.34.1

