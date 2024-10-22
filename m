Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A4D1BC9F6
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729616397; cv=none; b=XfrvW28uAqURgwuxk5TYdkUOllfSITkp13IVB8vOQ1+i51AOz4Oz7AvXfJ3zC/BlfOKY4vBgQR4ha38CeZd3bIGdJwZwnrt8iSDDUzh4Jx7dmAn2rbNEQ1Bl76DJvP4MEMtD5qh1SDPbLQbZ8WeF+xlV3cSJ4JiqaZpR9g0a+5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729616397; c=relaxed/simple;
	bh=NY/4WIGOYWbosC9nYshjQw+85FLhnQpOJ5Wim0TS7rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRPf8IgXAhNghlzYqlTlgHsFoRvpWAW36Fa39cH0bqffY2csQ2Ed1DXB9oZ+RyEbMqpEGGOrOqRzNMV9RA5WjAHAh7Jy5LVQw/gGiHx7YB0qXpS7bSvsh/OhCRK+VaDe0wRr89YXH8lZi6wBSdQI4Fb4Du+Lf41bprDH5Aeowek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MTD0HlBO; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MTD0HlBO"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cbca51687so58824815ad.1
        for <imx@lists.linux.dev>; Tue, 22 Oct 2024 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729616396; x=1730221196; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VS3tXfWam2DO1i7ilVLotgRr0xGMHWMFEHP5fSK9K/M=;
        b=MTD0HlBO81V/tGlt0Wz4+8s4dO8n69BhWNz3qWmovgw/rurLXm5bSXz5uWFuv6xzwC
         b+cAIrgrghSX90hXcOsj0DQrYO8NTzzsQkl806s5BgKb1gcDFnTTgp/GUcHeB10EW60/
         u5rOauOyBOAjnkiGO1FELtHmccd8u6bCKM1Bb8d1jKwikltEScYk8h6jVPVb6K03j6Sg
         NIV/CnXnAhDSTI/a6z17bO7Taf4e+lRJrHQfZ+iaZryoy+Wmca+Ff1peL3wVIsn4PfVG
         ABUZFVDNsuHmacBDmPSDD8F/0CebahsmgkgpK8i4x2LagB4SgOoQ+w0HOFQSjXCj+BwT
         36RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729616396; x=1730221196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VS3tXfWam2DO1i7ilVLotgRr0xGMHWMFEHP5fSK9K/M=;
        b=u0G5uFCuUxPIdze1WGkICDDck+6Hv6rzCcKE9FyqZ/rYQOTbO4AT3x+8c8c5zCF1ml
         u29ljmsttYXrr3aBR0/+ru34dmATXKXoTWWuKeWuR7nd/YxwfK7fvO2xgaNuLJ0joXsx
         xk8d9ejrLPXmFN5yK8mikcPOgIDa2FTV0CkJ/QtYFyYZrwuPgJPnYMo/xsAB21s/H7fs
         KGP76B7W+6Rvyv/+mGw21iyyw9dDwnejiKBBUQ9ruuTVVQRycUjdPIDWuR7hSAXySjtI
         bseiq3XF9JSt+QpWAogbCaH3m66XA5IcinoE4IWKwt6atuH4BfiqwWrPtv+P7PKOlSHT
         sixg==
X-Forwarded-Encrypted: i=1; AJvYcCXuTE7xde6AYr2mJvUrkjT9jkH2+Gm8MQ0LTKA1M5CTVjJleqHvCVEhHXwG6O0O/yxpUmE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcXilmUtOOW3kFklDK+BHD6jKPFUzWkg6mbng/LpzN+EZzpL10
	+JRQj+KomyLfYGGZ0v+y6cMeHMDS/xPlPHTvwu4Uvqtb0mUOy6YWhh8UwBVPZA==
X-Google-Smtp-Source: AGHT+IEYx820a1axe7TYA5uJ7U5XpkZcGO8wslMBvWfwxZnRbZqXMJz1tinZzuebUznia7UTdzMS7g==
X-Received: by 2002:a17:902:ea0e:b0:20c:8331:cb6e with SMTP id d9443c01a7336-20f39628369mr1028375ad.19.1729616395600;
        Tue, 22 Oct 2024 09:59:55 -0700 (PDT)
Received: from thinkpad ([36.255.17.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0bf197sm45044345ad.150.2024.10.22.09.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 09:59:55 -0700 (PDT)
Date: Tue, 22 Oct 2024 22:29:49 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: kw@linux.com, bhelgaas@google.com, lpieralisi@kernel.org,
	frank.li@nxp.com, l.stach@pengutronix.de, robh+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, festevam@gmail.com,
	s.hauer@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 5/9] PCI: imx6: Make core reset assertion deassertion
 symmetric
Message-ID: <20241022165949.dn6wzgeocond2ia7@thinkpad>
References: <1728981213-8771-1-git-send-email-hongxing.zhu@nxp.com>
 <1728981213-8771-6-git-send-email-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1728981213-8771-6-git-send-email-hongxing.zhu@nxp.com>

On Tue, Oct 15, 2024 at 04:33:29PM +0800, Richard Zhu wrote:
> Add apps_reset deassertion in the imx_pcie_deassert_core_reset(). Let it be
> symmetric with imx_pcie_assert_core_reset().
> 

Am I correctly interpreting that this patch adds the *missing* reset deassert
for 'apps reset' line?

If so, then there should be a relevant Fixes tag. Also, there should be some
info about the implications of not deasserting it.

- Mani

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index ca8714c625fe..93e2bcf9aa0a 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -770,6 +770,7 @@ static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
>  static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
>  {
>  	reset_control_deassert(imx_pcie->pciephy_reset);
> +	reset_control_deassert(imx_pcie->apps_reset);
>  
>  	if (imx_pcie->drvdata->core_reset)
>  		imx_pcie->drvdata->core_reset(imx_pcie, false);
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
