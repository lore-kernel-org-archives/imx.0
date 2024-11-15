Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714D01CF2B7
	for <imx@lists.linux.dev>; Fri, 15 Nov 2024 18:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731695120; cv=none; b=X9sHReHKeqh6IW5QR5bZpqY4u2gRQo6acOUX1uxlpvenOo+jtDSmTUuxP4tpLt0IFpt3svE+gnVh9CUzREwBhvFvyW1D5miLyYEHAtRiSBhkewWTq8qfBng1fuhJfvT35ConKFL2Sb3xr/uADtL09GibVda9CeI6I/lpPnbvVvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731695120; c=relaxed/simple;
	bh=LofSGZKkR67hmKxCOYuJW1GjLBLX+NDv8iq7jtavsg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jO9fkoK8dHmRcw6wUtoRCOdqH6gAKCdnWjY8v+qYVBrZGPUTZ5SOOgMo7kAFHVcpgboPDFC9R+c2bwSKef7xuVC8rr6AtqIBADl8IGDaa0P0J4+jxvPzB7si6F++sVPGj82fPDnKMBt2H4H0vBQ3bisndLy/jlCymiNwbt6ax54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hVnsSR7O; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hVnsSR7O"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20cf3e36a76so11908795ad.0
        for <imx@lists.linux.dev>; Fri, 15 Nov 2024 10:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731695119; x=1732299919; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s9XJvqo1TjVxClmTuPUa2mnZBMZRL0LlNGR2vRqPsWA=;
        b=hVnsSR7OhF7mYDSPOxXH/2VO9Pc7uTTsUIg229yDeDAZQTtMOC+dyzSKQsm8jj/7W8
         wY5zaF5em71/0ToHbGH6+M3OmflJxps8yoErDXIR9ES6FJeymJ5VbYHrtiRyaKp7ZCRJ
         yhBDkBFHLVMhpYa3MhSLhhwXfDb3XTMh1tv9E9Pp8PukGPZ6yW42YLIDvPX58/sgaQAs
         nLc2a2C1CsAj6y2gWG/FhftYOPc887B+kGLA9C7anOLJtMtRi0UOVr6Bd8I0/gUkxC2q
         xqCM0Ygpu7YHZHaW7tBAZIc3+fjSBBa5hYh7bjKqTvutnbt35+XAAeHrQQ/wqWWUlrql
         4lRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731695119; x=1732299919;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s9XJvqo1TjVxClmTuPUa2mnZBMZRL0LlNGR2vRqPsWA=;
        b=UKNGZN60U++KQrQmS5gCPI83fASeHDZ09YS9u/BkDLsP3WtU4/v78/zdZ6xwCiYW7n
         Ge6Qm7zp3NndPGUV7AoWYUdt/ECeQsy1zTiVJ+qZoYqa0U9Z57KYlI7x1pnG66MxYM8u
         qPswMLwl1xo/iVLA0oRpqjiyHxvUCpSU9n0q5wnKNjemgaOhs0SMRDKl6tNc9t4it1I6
         l7cIDWeHe+MQ3WpEvu1nooCAdOmtkpHVnXLtenjY7toSETz7q6eGYafP4WK67IHXr4MF
         EQi7qrxMBWCR6KYYTQl+T2P1QtZAa8K9sRhSN2trTCt7S4/f+YQyEM6nI2Vr6wd1LCce
         xT/g==
X-Forwarded-Encrypted: i=1; AJvYcCUlCs3efcYsEgrypQjvAkpjzDG3g+UqVQv9qnk8Z+LAGjgVgPEEsZIO+wLiP6W9Wta2NPE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq23NEiP/8gR2F4yRqREmjSIt8MHjw76htq9NTza/M6NUPEZpb
	mfUHX8JGcnRgIAKkRI6twftQakxNemjxzlvBBlq3l5BqxWwg1PxDcBSW+w1Tbw==
X-Google-Smtp-Source: AGHT+IG8xYEUyxbkvzwvpJ9n8KCZIy6/ye3xoYrVPeMJNXB6RnHN6free7fMoWUZKt6qptIgJECrgA==
X-Received: by 2002:a17:902:dacd:b0:20e:986a:6e72 with SMTP id d9443c01a7336-211d0d92195mr50180975ad.30.1731695118780;
        Fri, 15 Nov 2024 10:25:18 -0800 (PST)
Received: from thinkpad ([117.193.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f61670sm14893285ad.281.2024.11.15.10.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 10:25:18 -0800 (PST)
Date: Fri, 15 Nov 2024 23:55:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v7 4/7] PCI: imx6: Remove cpu_addr_fixup()
Message-ID: <20241115182510.zyaopwz4phl2szzi@thinkpad>
References: <20241029-pci_fixup_addr-v7-0-8310dc24fb7c@nxp.com>
 <20241029-pci_fixup_addr-v7-4-8310dc24fb7c@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029-pci_fixup_addr-v7-4-8310dc24fb7c@nxp.com>

On Tue, Oct 29, 2024 at 12:36:37PM -0400, Frank Li wrote:
> Remove cpu_addr_fixup() because dwc common driver already handle address
> translate.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Great work!

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Change from v2 to v7
> - none
> Change from v1 to v2
> - set using_dtbus_info true
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 22 ++--------------------
>  1 file changed, 2 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 808d1f1054173..533905b3942a1 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -81,7 +81,6 @@ enum imx_pcie_variants {
>  #define IMX_PCIE_FLAG_HAS_PHY_RESET		BIT(5)
>  #define IMX_PCIE_FLAG_HAS_SERDES		BIT(6)
>  #define IMX_PCIE_FLAG_SUPPORT_64BIT		BIT(7)
> -#define IMX_PCIE_FLAG_CPU_ADDR_FIXUP		BIT(8)
>  
>  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
>  
> @@ -1012,22 +1011,6 @@ static void imx_pcie_host_exit(struct dw_pcie_rp *pp)
>  		regulator_disable(imx_pcie->vpcie);
>  }
>  
> -static u64 imx_pcie_cpu_addr_fixup(struct dw_pcie *pcie, u64 cpu_addr)
> -{
> -	struct imx_pcie *imx_pcie = to_imx_pcie(pcie);
> -	struct dw_pcie_rp *pp = &pcie->pp;
> -	struct resource_entry *entry;
> -
> -	if (!(imx_pcie->drvdata->flags & IMX_PCIE_FLAG_CPU_ADDR_FIXUP))
> -		return cpu_addr;
> -
> -	entry = resource_list_first_type(&pp->bridge->windows, IORESOURCE_MEM);
> -	if (!entry)
> -		return cpu_addr;
> -
> -	return cpu_addr - entry->offset;
> -}
> -
>  static const struct dw_pcie_host_ops imx_pcie_host_ops = {
>  	.init = imx_pcie_host_init,
>  	.deinit = imx_pcie_host_exit,
> @@ -1036,7 +1019,6 @@ static const struct dw_pcie_host_ops imx_pcie_host_ops = {
>  static const struct dw_pcie_ops dw_pcie_ops = {
>  	.start_link = imx_pcie_start_link,
>  	.stop_link = imx_pcie_stop_link,
> -	.cpu_addr_fixup = imx_pcie_cpu_addr_fixup,
>  };
>  
>  static void imx_pcie_ep_init(struct dw_pcie_ep *ep)
> @@ -1446,6 +1428,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	pci->using_dtbus_info = true;
>  	if (imx_pcie->drvdata->mode == DW_PCIE_EP_TYPE) {
>  		ret = imx_add_pcie_ep(imx_pcie, pdev);
>  		if (ret < 0)
> @@ -1585,8 +1568,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	},
>  	[IMX8Q] = {
>  		.variant = IMX8Q,
> -		.flags = IMX_PCIE_FLAG_HAS_PHYDRV |
> -			 IMX_PCIE_FLAG_CPU_ADDR_FIXUP,
> +		.flags = IMX_PCIE_FLAG_HAS_PHYDRV,
>  		.clk_names = imx8q_clks,
>  		.clks_cnt = ARRAY_SIZE(imx8q_clks),
>  	},
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
