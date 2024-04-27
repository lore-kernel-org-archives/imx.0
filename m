Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB4841744
	for <imx@lists.linux.dev>; Sat, 27 Apr 2024 06:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714199933; cv=none; b=IoxQ38fIxhcVjUVPD+K3lAsaZyWV0zzaA97eEakaCwUyCIX/Ag2RTUPr4SXBgLQZnUtsUYkyvkr1A4JUiQjHqbHgCLcVx0hO82F4lnAc7+tOKPFp1W6SmWH/UNt6L2G72AXmloIA8cGHm4ACiM17HNSsNV8XOqJrB9FX1u8CF38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714199933; c=relaxed/simple;
	bh=rMhrAE8YXNfqvYLpIvyBbY1dUGHNrT55DGekIZ7UUJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuSwJxE56adR+1JTHUBOPHBPxnl31vVo/TDVfmVbgeNIecRNirDgipWXzNWAPnRgRSOOjA3ug29KRBmzud+xv2mhfRgRQR1IG5cF8Se8H5IYpEJm7s7+Jyiz8Ig1vdRMTm/PBbaGY3qIKb72kZUBxhXJ1BiujTMfwucBcPbDBY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tFoevi4p; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tFoevi4p"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-6001399f22bso2021838a12.0
        for <imx@lists.linux.dev>; Fri, 26 Apr 2024 23:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714199930; x=1714804730; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u5BZd/9PlqkZZUs68lDdFcJ5CEc1B68syvKugYGnzVE=;
        b=tFoevi4pzr+hHu8viR+XQh31HNCowdDWQdJxP4bo849MOV7C86EYzXHTJrnk5ca/oD
         fB5ijJUqKAFj9/e0jo8zvI6Mxs0jc0O3PVCeFfDsNOCST9T3fgxDSN9+53IE4xyMp46M
         /Bg1IlvARC/H3Q/I65owxdldXGVBv09lFKW/EUxS1Qd32XNp0wFxP5A/NAx3T1TI1AE9
         hy9JdMf1Gf8fhx8m9GWy2Dv8ILGHqgqfOrXBExHJkMHjPX96+0y4Tkxss/hoxH6F7RC7
         tDon5QOy66susjUHrIrQU9Gf3sb8PTN9/oVCWuRs2J9Kzn2FDsQ2D2fFDC3Sc4YUb5jm
         uasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714199930; x=1714804730;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5BZd/9PlqkZZUs68lDdFcJ5CEc1B68syvKugYGnzVE=;
        b=RRSTcq2iYMYEVOXjLTvmCUm8INGUUWC9KLdh1y7Yod0jlf01wMCRi2ofNlO4crLM/n
         JxRhj1TNJ9z04MAC38bDfEIE9OCL3P5JJX6lMrvqZURp89YBMFhj1Uh6lEeI9+Yrqksz
         hxCkNvSEYrezLf5AfOOZPHEca7/ixC/0r1o2Yl8bP3hGIh1eGfPaoiJ2DgWp8MuRAIMV
         w4cHpNTMxVdBM0vQZjp/0xFYuKOk86phwIOkZNVQ9yM01150j/UcBiU6UGm7mypUE3wZ
         DAIbAJo4gJOg12sQqII5qt9P59T6smKeZ7EPSSo1TLtZ8LuyV4f3crQKa2/WjV4o+3TU
         TeNw==
X-Forwarded-Encrypted: i=1; AJvYcCWRJ7eoAtzM48ejJ0G+RysTgb+xUmo1s/BZd83xRw3vhajrUtRaJEYMLebEQkalNIRSFl2EXcW+OOpxV6nIdSS42mDK
X-Gm-Message-State: AOJu0YynZ6Hw+f15Nk42ka7TI4n3q4MH8ll2KvaCxmM3gB5QT1e8WJhI
	4XuWX4r0mG9kHSiU9MnmHpcK86CdcNTv91UBCHLZOrKO0BHCPXmQx1vUs0g6fA==
X-Google-Smtp-Source: AGHT+IFOTwYBRJQ6hpSLIlWNvowiugvVRk7RGAo5g37wQTTmlbJt9WKRQxSRhuQmeF2kLwvwvDKZ0g==
X-Received: by 2002:a05:6a20:f394:b0:1a3:55d2:1489 with SMTP id qr20-20020a056a20f39400b001a355d21489mr4790412pzb.7.1714199930233;
        Fri, 26 Apr 2024 23:38:50 -0700 (PDT)
Received: from thinkpad ([120.60.53.237])
        by smtp.gmail.com with ESMTPSA id r18-20020aa79892000000b006ed0c9751d0sm16232311pfl.98.2024.04.26.23.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 23:38:49 -0700 (PDT)
Date: Sat, 27 Apr 2024 12:08:32 +0530
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
Subject: Re: [PATCH v2 1/4] PCI: aardvark: Remove unused of_gpio.h
Message-ID: <20240427063832.GA1981@thinkpad>
References: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
 <20240423172208.2723892-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423172208.2723892-2-andriy.shevchenko@linux.intel.com>

On Tue, Apr 23, 2024 at 08:19:04PM +0300, Andy Shevchenko wrote:
> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it, simply remove the unused header.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pci-aardvark.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> index 71ecd7ddcc8a..8b3e1a079cf3 100644
> --- a/drivers/pci/controller/pci-aardvark.c
> +++ b/drivers/pci/controller/pci-aardvark.c
> @@ -23,7 +23,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/msi.h>
>  #include <linux/of_address.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_pci.h>
>  
>  #include "../pci.h"
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 

-- 
மணிவண்ணன் சதாசிவம்
