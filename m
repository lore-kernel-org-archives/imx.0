Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6EF188591
	for <imx@lists.linux.dev>; Fri, 15 Nov 2024 06:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731653013; cv=none; b=H5zOPBO7LlSFSXuHk1U4/J8A32ieb5Jp0ldbWs/CRgwqqeJbmN+jWtSiUq8+uj/kT9rPYrPEnUq4skaO5yBceGMyKdv8tKejnkC8humob+swXJAPen5DegnNPyZSFBq4VTtvnXyLUiFHcUaEnp8lIs3bBzmxjt4KWn2BcNLk7pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731653013; c=relaxed/simple;
	bh=yFaqn0TM8DwaMrQ+sb2LpKFQLJb2yjVSUuadb+2rd5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovi+z5oAreU7uNHlMgxdenZgIS2MvBq7HgkTTTO3ci3R4FZchThaY5znnE1WUx66KWus1zNHfOBiqnnBhmTrslSGlqBRHpOU3de9XrrLlxIZPCnJKpIHeVoaAwMabAUEamZwGXu+5VsRuYPrn5rgxcMNX/z6+HcZOBCG6tOCePU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PvdiMj4Q; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PvdiMj4Q"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-723f37dd76cso403094b3a.0
        for <imx@lists.linux.dev>; Thu, 14 Nov 2024 22:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731653011; x=1732257811; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3MYYRbyHSKnkKj/U1ajnAZh9FgwdbjyrEbwmDmiOJ74=;
        b=PvdiMj4QbGYUxTyC9JN0OFMhbzVFI3OrEYzSa28zJxv1zaeWnrBMtqjBPJwWYljz3o
         yuM2QmMtlcjQQS2td/YR7PouO3ccZYteuVCpdD0dHt+7dPfDuogK47AUDC7vyB69FSEU
         X/wKRairiYbTZIwcnCdAoRQXuZ3iUIXuBeN8CEuP6xu05OVmS6HqMB5codizJOt5kc7F
         yAttBbKNz44J/5CiTCt/xo4048PmsqhNmuE020SwstNHm4TXn3PWJkOka0+r0AZYDUQq
         TliPUzmMGiG2QfUTAdbldyxuTcfTUhlxN2Q4DoI3vOT8LVeQOWqjkuIEGW/rgcoUBh2e
         0MZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731653011; x=1732257811;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3MYYRbyHSKnkKj/U1ajnAZh9FgwdbjyrEbwmDmiOJ74=;
        b=SjVT+dg4HO07+Fmi0KEWgrs5YLwt3LOA+fzAW6CpS90SXkGdcBv1tBYYSuW/zKRKHG
         st8TP22oLTZ97+w97Z9IbEDuuZgattMcPCbgWdyJqBhEbMwjyHAxXfCDGbDY2vD4TY29
         P/m6REQZS2T/tCHy88JPKjwrDXv83tUIWU67U4y3dygVwzFvDbg6nMwNWnxHp931Wpjb
         2uiK0qdXOQUlFLz3zkJzeA13j4G5Tr45qLstLerpDM90quFF+OtxzZSv12ajBQrDrqI/
         zBGVNTJzbL3x5vKQCiVwsNRcU9wm9e9wvRSyWZHDJPu9BZkZe6VWGYeecEX13/IdB4vT
         FOnA==
X-Forwarded-Encrypted: i=1; AJvYcCXStnqkDhmYLOtVSAj7TbT5Kpb6LOeVc9m9hXJoaar60ptNg/gc1qmMUnFfC709Blxk8No=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIbx6qckuf386d2BH0xd6YCFT9et2mDcwQOLZWB0udJBwOEOSf
	qr031ucYpCnPmU21gYxRSEjTwwTQNyCVK85Gf5yA9CA1YX/1e/vDlz5uWP3g5g==
X-Google-Smtp-Source: AGHT+IHY6v9j5fvHwvuygpXSp/ldJste9oxVxyRTDqgsgbIZ7G245t9I6FYAct4vrO9HjSZAZqBz4Q==
X-Received: by 2002:a05:6a00:22c8:b0:71e:4930:162c with SMTP id d2e1a72fcca58-72476b872c4mr2212375b3a.6.1731653011440;
        Thu, 14 Nov 2024 22:43:31 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770ee7d3sm673330b3a.38.2024.11.14.22.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:43:31 -0800 (PST)
Date: Fri, 15 Nov 2024 12:13:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/10] PCI: imx6: Correct controller_id generation
 logic for i.MX7D
Message-ID: <20241115064321.3cuqng7bzmphiomw@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-5-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101070610.1267391-5-hongxing.zhu@nxp.com>

On Fri, Nov 01, 2024 at 03:06:04PM +0800, Richard Zhu wrote:
> i.MX7D only has one PCIe controller, so controller_id should always be 0.
> The previous code is incorrect although yielding the correct result. Fix by
> removing IMX7D from the switch case branch.
> 

Worth adding a fixes tag?

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> "This is just *wrong*. You cannot hardcode the MMIO address in the driver.
> Even though this code is old, you should fix it instead of building on top
> of it.
> 
> - Mani"
> 
> IMX7D here is wrong athough check IMX8MQ_PCIE2_BASE_ADDR is not good
> method. Previously try to use 'linux,pci-domain' to replace this check
> logic. Need more discussion to improve it and keep old compatiblity.
> Let's fix this code error firstly.

I really hope that you'll fix it asap.

- Mani

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 462decd1d589..996333e9017d 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1342,7 +1342,6 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	switch (imx_pcie->drvdata->variant) {
>  	case IMX8MQ:
>  	case IMX8MQ_EP:
> -	case IMX7D:
>  		if (dbi_base->start == IMX8MQ_PCIE2_BASE_ADDR)
>  			imx_pcie->controller_id = 1;
>  		break;
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
