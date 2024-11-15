Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B137F18785C
	for <imx@lists.linux.dev>; Fri, 15 Nov 2024 06:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731652879; cv=none; b=T1t1xDdcLga21o6M/9TH9PicNri3RLRNfrtaShflBAyTzIfxerZlMKqPwmllidkBXVBhYBFJSFcN9L9cjKZXL6JBl4cMe5UHwFQ2D5g7c3tYpzOl26JCzOV8WrqMAx0tV57kOFonxOLP3QwBmksumcVy8W10OVzB7R/jVTmKAi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731652879; c=relaxed/simple;
	bh=+YWto08nAzQlfP7Roih16Ol20t5fEagbMxHoY96FEVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iD9eztYv4vPxLjxV2bCKB+y1GeS7JjGQsnnsSwTXmtKhTzAh6/65K3MNNBNVPdWJIAcZNe6u4rG9yCCrlEpE+IzSbVjongsaHjUgW88O0McvPfvIVYbxigJp1uKcpCPuSSKQIPUkoZaxuaXPkfXIm+fvxhRMTHJeaVdEZEJ8Xck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ndZfJZxU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ndZfJZxU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21145812538so12055235ad.0
        for <imx@lists.linux.dev>; Thu, 14 Nov 2024 22:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731652877; x=1732257677; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+9X/wxgCiPevQR8azxljXcXglwxyvUBHBH4k0NcW95s=;
        b=ndZfJZxUC35H7HTl2uF+ZgFlYPkMAHVwe75NIiybIsWEEy6Z34IMxtAaydfZHNuzGg
         6+iyxodbIbxh/B/X5K3XveKDcI1lWo88/vxaIf/SvO1iCrz4MkSsLBKsjp6ih6a6DxQ/
         rTBVEEHqqQZiSI32wVdVT1iEWaLUhS6acQo5B95616vpgJayl7j5ICyqGTu/KLyhmI1v
         SvtSVLqT9shKv1jsIs7ecQ7rYH5vEJG/SOHSxGKWNFUMABOyRMWpFKIWeqUhfWHdWjZG
         XX11+hoDJwR4YI36HnIGZ+lD4FdL5N0kafZ5Ep9lw4erspcHHfZUbJSDHKaC/n7HAxiP
         7W8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731652877; x=1732257677;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9X/wxgCiPevQR8azxljXcXglwxyvUBHBH4k0NcW95s=;
        b=LVK6rfVYaG9iZEUNlxAEMFuEpx7pPy1X5NSIsj77BRz8lt73Fu6HH204GBWLrzgF+Z
         5KQr609KSi3vRgB8ee7ywtTEiyqYICJHTV1c4T16SJFBZZIpdSLlGaUIVwEcN+U0PaOT
         0vX9+Oh6BhMnYROLPGqfITU7CjSeq37GuOrSgWvcg6IIZ4tfFNWmeUct2BBBVrzdRMaa
         Tb58U0bOvwYbwMGBToGPkrAIlLN8hP67i439++dP4cEKB+HBpzz+effovKsGOJj9cBA8
         VaiTvB+37/UhExQo6hZfb/IAm74SYrqD3C5dUIKceJb0BseeUXmvNtHIBvyIR7vMWWje
         Corg==
X-Forwarded-Encrypted: i=1; AJvYcCXQhBuDnUmC5uqCoAPfiY7ZyHWaLX34qfES8ndsFSmLswpOAc2oB6jk+08FY8ZCDxyjV8U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+LIWuWCLp54aiFvxqkay39qUDhAQ5IoG8Sq9jFowOhVSE0ieq
	A41gG4LR1G4ge+J3WuzBl04wNMXl4Oo0AGUV9LzGpCXudZGr0bYRf5utMjbTzg==
X-Google-Smtp-Source: AGHT+IGabkTqfzJ7F61xnkcjI95zLPKfJGfkK+pvHWTH/TvMDmJ1L9QNKaKVIJTm7qh/u3tDNf6Mrw==
X-Received: by 2002:a17:902:f544:b0:20c:f27f:fbf with SMTP id d9443c01a7336-211d0d7687fmr23670135ad.25.1731652877101;
        Thu, 14 Nov 2024 22:41:17 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f56e10sm6129835ad.242.2024.11.14.22.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:41:16 -0800 (PST)
Date: Fri, 15 Nov 2024 12:11:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/10] PCI: imx6: Fetch dbi2 and iATU base addesses
 from DT
Message-ID: <20241115064106.iwrorgimt6yenalx@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-4-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101070610.1267391-4-hongxing.zhu@nxp.com>

On Fri, Nov 01, 2024 at 03:06:03PM +0800, Richard Zhu wrote:
> Since dbi2 and atu regs are added for i.MX8M PCIes. Fetch the dbi2 and
> iATU base addresses from DT directly, and remove the useless codes.
> 

It'd be useful to mention where the base addresses were extraced. Like by the
DWC common driver.

> Upsteam dts's have not enabled EP function. So no function broken for
> old upsteam's dtb.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 20 --------------------
>  1 file changed, 20 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index bc8567677a67..462decd1d589 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1115,7 +1115,6 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
>  			   struct platform_device *pdev)
>  {
>  	int ret;
> -	unsigned int pcie_dbi2_offset;
>  	struct dw_pcie_ep *ep;
>  	struct dw_pcie *pci = imx_pcie->pci;
>  	struct dw_pcie_rp *pp = &pci->pp;
> @@ -1125,25 +1124,6 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
>  	ep = &pci->ep;
>  	ep->ops = &pcie_ep_ops;
>  
> -	switch (imx_pcie->drvdata->variant) {
> -	case IMX8MQ_EP:
> -	case IMX8MM_EP:
> -	case IMX8MP_EP:
> -		pcie_dbi2_offset = SZ_1M;
> -		break;
> -	default:
> -		pcie_dbi2_offset = SZ_4K;
> -		break;
> -	}
> -
> -	pci->dbi_base2 = pci->dbi_base + pcie_dbi2_offset;
> -
> -	/*
> -	 * FIXME: Ideally, dbi2 base address should come from DT. But since only IMX95 is defining
> -	 * "dbi2" in DT, "dbi_base2" is set to NULL here for that platform alone so that the DWC
> -	 * core code can fetch that from DT. But once all platform DTs were fixed, this and the
> -	 * above "dbi_base2" setting should be removed.
> -	 */
>  	if (device_property_match_string(dev, "reg-names", "dbi2") >= 0)
>  		pci->dbi_base2 = NULL;
>  
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
