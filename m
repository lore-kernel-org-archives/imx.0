Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C8F125A8
	for <imx@lists.linux.dev>; Sun,  7 Jan 2024 05:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LrxJJSFn"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5c21e185df5so620989a12.1
        for <imx@lists.linux.dev>; Sat, 06 Jan 2024 21:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704606920; x=1705211720; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=npkPTWZbSrPT/J2qTivWUqWZDlbUUJa861d4n1crd6s=;
        b=LrxJJSFn81GnDC5l46tsoWX5WIzvEzfFRTgZXpCChS5mjlVUp7p4x3yNkQx54gV86s
         Hxc+/B+JM/VSOvBm7sF3U0ok+pTWRTIqLKvJi8N+jn0DTegcuPZA2eRaFlvvAjq2sEF3
         uYfV9I9EF51JqLAhATDPy0FS3WA+mIULCEKSsFcUJn5CSH4O06eKsqf4lXTmDHokeqzU
         HqFOmTJBIVNCOJMtgEMs5CQPbIvKbD/XkfZN9mE3txN5YGZcQACNV1XIUguZtiUy2zfx
         G3m7mnKoBjNaAp5HFTQFb+Pu6RhvUDqQmc9yiCHDx3RlQ0iYluv2o3UJR9dR1r7suKmF
         Uzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704606920; x=1705211720;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=npkPTWZbSrPT/J2qTivWUqWZDlbUUJa861d4n1crd6s=;
        b=gy51E87u6kzsjsbyYoonJZ6IiQ0FUe/uQmeazBXiTTQ5sIrSqtHAoHfEvAlTePhC8o
         uwUeqalgHrEOF37mXioCIMEmwv9rIn0ed4ljPvz1oo6fJvHDxfjUlqRBNTKNsCT37o6n
         pYQufUhQ136bwb2kZ34B9XAjmDlh2gcfZjU61+FeH7jFNWGskWcfTSf8LVTk17GPre4Z
         GQZb/bFcbJA35jisV5wSnSpDHY59d7e2x9ART1hw2WdHL2ltniw3cT9c60FyMT2nEqfI
         jCoDGcDbjVd5QXrxPb1kGeWc9NPlGdKiJEFnh4q1w85gpi2ssQj0U4i2iHFf41Pnii9a
         JAsQ==
X-Gm-Message-State: AOJu0YzrcovpzdxgAeKMshA7Rx7m05v/JrTDXuzwjOz40PXiBHBY7Z2T
	NOLxviD51wfRdU/3uNVg3Xo9Rz/6mXOL
X-Google-Smtp-Source: AGHT+IGyYHLcrSwSasOKfyMhzH4xhR/SbgU0ri+aHf3n40oDj/JY/IkyQis8SJwfZ2Us7GRm5TN95g==
X-Received: by 2002:a05:6a20:7a82:b0:199:8953:6e0c with SMTP id u2-20020a056a207a8200b0019989536e0cmr1255512pzh.52.1704606920277;
        Sat, 06 Jan 2024 21:55:20 -0800 (PST)
Received: from thinkpad ([103.197.115.97])
        by smtp.gmail.com with ESMTPSA id 9-20020a17090a018900b0028a4c85a55csm4287287pjc.27.2024.01.06.21.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jan 2024 21:55:19 -0800 (PST)
Date: Sun, 7 Jan 2024 11:25:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: krzysztof.kozlowski@linaro.org, bhelgaas@google.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
	helgaas@kernel.org, hongxing.zhu@nxp.com, imx@lists.linux.dev,
	kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org,
	kw@linux.com, l.stach@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	lpieralisi@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
	shawnguo@kernel.org
Subject: Re: [PATCH v7 13/16] PCI: imx6: Clean up get addr_space code
Message-ID: <20240107055510.GM3416@thinkpad>
References: <20231227182727.1747435-1-Frank.Li@nxp.com>
 <20231227182727.1747435-14-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227182727.1747435-14-Frank.Li@nxp.com>

On Wed, Dec 27, 2023 at 01:27:24PM -0500, Frank Li wrote:

Subject: PCI: imx6: Rely on DWC core to fetch 'addr_space' region 

> The common dw_pcie_ep_init() already do the same thing. Needn't platform
> driver do it again.
> 

'Since the dw_pcie_ep_init() function is already fetching the 'addr_space'
region, no need to do the same in this driver.'

> Signed-off-by: Frank Li <Frank.Li@nxp.com>

With above changes,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> 
> Notes:
>     Change from v1 to v3
>     - new patches
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 9e60ab6f1885a..4b2b9aafad1b4 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1080,7 +1080,6 @@ static int imx6_add_pcie_ep(struct imx6_pcie *imx6_pcie,
>  	int ret;
>  	unsigned int pcie_dbi2_offset;
>  	struct dw_pcie_ep *ep;
> -	struct resource *res;
>  	struct dw_pcie *pci = imx6_pcie->pci;
>  	struct dw_pcie_rp *pp = &pci->pp;
>  	struct device *dev = pci->dev;
> @@ -1099,14 +1098,8 @@ static int imx6_add_pcie_ep(struct imx6_pcie *imx6_pcie,
>  		pcie_dbi2_offset = SZ_4K;
>  		break;
>  	}
> -	pci->dbi_base2 = pci->dbi_base + pcie_dbi2_offset;
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "addr_space");
> -	if (!res)
> -		return -EINVAL;
>  
> -	ep->phys_base = res->start;
> -	ep->addr_size = resource_size(res);
> -	ep->page_size = SZ_64K;
> +	pci->dbi_base2 = pci->dbi_base + pcie_dbi2_offset;
>  
>  	ret = dw_pcie_ep_init(ep);
>  	if (ret) {
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
