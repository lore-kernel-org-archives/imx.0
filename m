Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D21013C906
	for <imx@lists.linux.dev>; Tue,  7 May 2024 08:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715070521; cv=none; b=nGNuys2ZaAzT9EMNK0mf0Fc+yTXf+3E6bMief2P4Ox5WjxcGBPmXA+I86i+kIYBcfMaUm05CHGrcdJiiPE4zq3NgUMyOn81EuG7JzMTmjyXWE8lT5KX5e7ZENXleW6N/4HvNMgt7XfsTCReC1g41B9kPc+nhk58kKl6eXmDoqrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715070521; c=relaxed/simple;
	bh=WAA10rA6qRqoYCr9XeTblOpVslB6CTUD6a/rB8ts6T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmi/eCMx/sJlGxtw2E742rve1AIlgP5jqx/ZksfN4pDSHIDNE+LTN5/Q8ZvtY/8vswICHUBPVZYvXlmvOzJ2XKf9QYM32reQa/7RlQLOAk6qVZKx35hMMtxRt0phTOcNUq8a4W9LdDak7/cP9I3fRClBp2RqSm3AeMnBznckNeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pzafTnR3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pzafTnR3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ee5235f5c9so9999365ad.2
        for <imx@lists.linux.dev>; Tue, 07 May 2024 01:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715070518; x=1715675318; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GVgauUSBhCFoJsX8lOkvxxApBqvEtasgyEBvsQiV6aQ=;
        b=pzafTnR3rp/GQvzPt5EJCtnvacH7mCgyJBISi2gvc4V/I1UB9QQcAoahE3pL9p7skh
         Mi8L425RW6AVgRg/OpSTqu8+jPATGNrrN/6YmuEIKLP7LGcCkMP2ZR3qEodUF3pdjDTX
         cYN/pwcQL5/Zd5klUUJjgtUwt50kjtZQMHoULCFnnSemX5O1WTH3ooJDkzLLHGx4lw/f
         JLGBRG7cULwjCI4QQy6J7gRppQrgomO9AdzBQs6vVBUEddrXBTzImnDnkrolFgECemUc
         to2DA+AYiBobwSJsZMG9LEWbZSjncgNYKnkxjTLu0R31z9IzeUyPvb+rCoMeDauZ8G7o
         KRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715070518; x=1715675318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVgauUSBhCFoJsX8lOkvxxApBqvEtasgyEBvsQiV6aQ=;
        b=mkI/KPtFrQwuHdFgoLlcuYgzr21oWJ5CvMp28XezpNybw49YeXA63oI5yoI0uk+OrM
         QOiJPoOs6RmlUbroUy5tcsWyjBYsdRwGL5Hgt3+s8aj6Bn6ooQpTwaFLyoevj0iaUF0U
         L9uqG4qxZYMBND40PR5P+8TeozKch5Ye9vR4TTYBxeg3scwqORbjtqlF1AIh+AH9P4U6
         JbWwo7ll6V4i++7QCyfVKOMNKTgiQAq5X58Bwk90K7FRqigdZFb4aCqn3uIqOZ21uj+c
         34ZRCSqYFdz8gQlEYltEIt5lxs9DjfszF7WW/0ukgB/y2FVYRASUNe/j4tYDbJObono1
         5Ubg==
X-Forwarded-Encrypted: i=1; AJvYcCV+hGcIko4VoKndrolELysFf8OiEJwuIFGSNC3pTosuN+2P7mQEAMb2q0UVXNteaBPQDBFCCG2tdGalNRrtlHVp77cZ
X-Gm-Message-State: AOJu0YxSClT4zp1Mshk22m2inzs1XAV1esIGow/x3xPVD6/SpL0zlImr
	UtfJp2ZWTLjSA3DcKudmabHAmNtRdN3qjrM2xIY0nhAgm4jdplYpG7dZlXFDuA==
X-Google-Smtp-Source: AGHT+IFkZxsg9zZ8uGCj6F9b96ztkp16VI7pxyk7k4qDQRuZ3fJBvMiqX1TfN7jL1VUt3SzWbyr1LA==
X-Received: by 2002:a17:902:ce8a:b0:1e4:9ad5:a666 with SMTP id f10-20020a170902ce8a00b001e49ad5a666mr15845336plg.25.1715070517573;
        Tue, 07 May 2024 01:28:37 -0700 (PDT)
Received: from thinkpad ([117.213.100.197])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001ec4ed47ddesm9603688plb.86.2024.05.07.01.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 01:28:37 -0700 (PDT)
Date: Tue, 7 May 2024 13:58:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Frank Li <Frank.Li@nxp.com>,
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
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>,
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
Subject: Re: [PATCH v3 4/5] PCI: imx6: Convert to agnostic GPIO API
Message-ID: <20240507082822.GA6659@thinkpad>
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
 <20240429102510.2665280-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdZUsA034L5GjF_-XELX9369PwNjONfsDV-_EC564R0QWg@mail.gmail.com>
 <20240507081441.GA6025@thinkpad>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507081441.GA6025@thinkpad>

On Tue, May 07, 2024 at 01:44:56PM +0530, Manivannan Sadhasivam wrote:
> On Mon, May 06, 2024 at 02:10:24PM +0200, Linus Walleij wrote:
> > On Mon, Apr 29, 2024 at 12:25 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > 
> > > The of_gpio.h is going to be removed. In preparation of that convert
> > > the driver to the agnostic API.
> > >
> > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > I think there is a bug here, the code is respecting the OF property
> > "reset-gpio-active-high"
> > but the code in drivers/gpio/gpiolib-of.h actually has a quirk for
> > this so you can just
> > delete all the active high handling and rely on 1 = asserted and 0 =
> > deasserted when
> > using GPIO descriptors.
> > 
> 
> Wow...
> 
> So this bug is present even before this series, right?
> 
> > Just delete this thing:
> > imx6_pcie->gpio_active_high = of_property_read_bool(node,
> >                                            "reset-gpio-active-high");
> 
> But this is just a bandaid IMO. The flag for the PERST# GPIO should be properly
> set in the board dts as per the board design.
> 

Hmm, no. I was confused by the property. But this quirk in gpiolib-of.c is going
to be applied while changing the GPIO state also or just during request time?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
