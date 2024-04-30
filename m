Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE8B1757A
	for <imx@lists.linux.dev>; Tue, 30 Apr 2024 05:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714454226; cv=none; b=Gwy0oqL5rBX3oJt8uwpqToRyQDvk+SJP1Ul5eSK2dsBS65yjO8oFxRiqrM6JhuEUpVXOfuAyEJGKTX6jVQ/kkwcni50kCwf6absrzWZ+KUeTe5AEdifp7wLjitQDCg11ysyvdZERHC5elOuqGmVWMfw5+U5YMpjfRPfpL6Pqpj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714454226; c=relaxed/simple;
	bh=X1vBe8uy2scxUJixEbvfFTMb+bweVxUZtX/Ylg3mEfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOHjQa8JMghu4SVKd3sG1gscPy+UWMSv8/55nKQzDvZ/6kVkN3tVFSKdciGAl21U/hMkRUY+sBmE7KkjIAE2J1q8XBM8yeyFkzReUhNAIhjYs+1wzpoRTgZ74GiweflZcvmQt9LRDGRc7ZB0zveF/LcWFWhzsUhqBuqASqyu3BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZqnB5DBk; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZqnB5DBk"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6f28bb6d747so4476010b3a.3
        for <imx@lists.linux.dev>; Mon, 29 Apr 2024 22:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714454223; x=1715059023; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V0avMUsDc59rYN7coX7sm9Yp5eSnR9Q04mgQzckQ9lw=;
        b=ZqnB5DBkGfH/xj9Pi1aWEji/kyKojgJDjMYdE41KKNPcG0paEj9kUwCId4kRBCT1n+
         cLLwGEkE5OXuosGKpOFqWnARUV0oPn2YSiRrEdsgPR8J8kMX9m+6OWSAvnkHd0962fB5
         7HlvdF2Voy8rt5AF/JifM7aeL9vnYxmwsHoQm+hyTiZSlX6gGjYrP+1/bbAH9ZfpGwtV
         6VBf2wCOTusQu322uxOfSy6isL+3J62I6BiRx7ZmyqB1hTmsDbMqh344L9Ze+dlO7OE+
         cC8rba4L4s/3uD84hdswN1P1fPgA7BOZjGIGUNRo9IBJkL6OiyX8XL7MM3XCbDzLWaMc
         T7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714454223; x=1715059023;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V0avMUsDc59rYN7coX7sm9Yp5eSnR9Q04mgQzckQ9lw=;
        b=HreM9KtU0P+LjhgTBs6bf0D7/UPBpboi+XBr8k1ykyCcuMJf5eFfGbSOW2x8wCorK2
         aqJUzr6+4c7uDTyh0OSgVz8xS1DuJWRL98etJ/G8b/laCG8heG8U35YrTHb5PRWT//FD
         0tdzH2b0eFsKHfvd0GjHd/xStDpkPcJTq9Fi+sMvLVuJ2VBwEzaAiLIIgp4gxoUDxy4Q
         oqAwyd095cSIyRolSgvN0eBs7rZ36Jq4h8DyWZg2S0oQ4bUyOvx9XihEf7QPe2mMZOxz
         C64JuWIbn6JPoEeA6YwttpskVianqcMeLsxri0U/G5z9hSMM5DI2nDEpoHlY2uSqkBAx
         R7lg==
X-Forwarded-Encrypted: i=1; AJvYcCX9y9BVH5Y0ethongQxesj65qHfLZsbFwsAZDvh4IImrcIcjujmvv5X/OyigWh4hMYnXiKvk6dmYvFzli3GNK1UZgPc
X-Gm-Message-State: AOJu0YzvWo0gJd3D9N5bW7Aes0asAIUi9QmXxJEabiOVVP+9hsY1zUhF
	UnLxz7rwIljWfZ/SHg7lmoMfIkWPppI7uololDIwwGtFWipiFlPvu42u2aKF0A==
X-Google-Smtp-Source: AGHT+IFWRZGQxckWXPNLxXAG7MGt/iJLdvfO4+V6xpas6sXD4xSC0z15Fh9sptvi1twg0sW4mfipRw==
X-Received: by 2002:a05:6a20:72a0:b0:1aa:59ff:5d31 with SMTP id o32-20020a056a2072a000b001aa59ff5d31mr14465799pzk.0.1714454223164;
        Mon, 29 Apr 2024 22:17:03 -0700 (PDT)
Received: from thinkpad ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id su11-20020a17090b534b00b002b27eb61901sm602961pjb.21.2024.04.29.22.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 22:17:02 -0700 (PDT)
Date: Tue, 30 Apr 2024 10:46:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v3 1/5] PCI: dra7xx: Add missing header inclusion
Message-ID: <20240430051653.GB3301@thinkpad>
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
 <20240429102510.2665280-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240429102510.2665280-2-andriy.shevchenko@linux.intel.com>

On Mon, Apr 29, 2024 at 01:23:18PM +0300, Andy Shevchenko wrote:
> Driver is using chained_irq_*() APIs, add the respective inclusion.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index d2d17d37d3e0..b67071a63f8a 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -13,6 +13,7 @@
>  #include <linux/err.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> +#include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 

-- 
மணிவண்ணன் சதாசிவம்
