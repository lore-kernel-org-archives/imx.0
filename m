Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4999F7C6EB
	for <imx@lists.linux.dev>; Sat, 29 Jun 2024 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719663790; cv=none; b=kgj5wpjjL7/wsRAQp2pLbaNFosrDXuMdV915WilMmbgTZhuIhmyZW68/s19MWWbqikFbcLrzZsoPhSJDBs6Mamz9INVoePN6Zh8Q9XeP87Gzi3tnpAy07HcbNOp7tuZu/YgJT6QzaiVxDB2R0S2WFLtxjHLMWpJOQw827L1nyC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719663790; c=relaxed/simple;
	bh=0y5cSgtBlkamEEyslLX8DfwkBZ+qF4qV5H9+Ndn+Qw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJKeRmmp7OA2RniAIb3k4rh9LsS1zFwlAR6n/pPb2SCX2vchJfd2PmAxSMSd4Ryik9GBG18fn3NkX7gKjaIEj7urRwEk1ZRlkHUc+Obiz/8ab+2NxTaSszEl7C0+McZddR/1EEMkzWvp6/QD6+5Qg0MMFITpgVrRbuLkowz06rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dJ6PXb5V; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dJ6PXb5V"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7082dd9bbf8so1196872b3a.1
        for <imx@lists.linux.dev>; Sat, 29 Jun 2024 05:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719663789; x=1720268589; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hd/fN6JrXuuparzKe/1dgdm1z2pqZRQTyP5PJ9H207I=;
        b=dJ6PXb5Vvg25woze3fV+EEBoCo8U32lv0PoyxGwLVwtgZpoU6I8auZxV+pSsxsSdLN
         2YcmoIuj0YoVfWa3XLUfB2Gl7xDHwpe09PDOn/hGUSkAgX0hdQfVQhHrGRnHEdZJN2nT
         6GGtLbN9THQXdRiJ3ci0B3ilIgTgFN4r0WZeT4ggIBjTwe52GhdhcNklmfuppoQaPTUs
         BRZ5D3VeuwlBLWnKgoJEvku/FsPL9bshZnBeWD430rCYRlabFDgBYn+Iw0OQ85EZHQNO
         tnhF1DbLPDhVNoj6XpZ8YF2DrTu7+o2uZQHWHuMAobDsHV/OogsT7+0yJ9oQzv407Hoi
         p1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719663789; x=1720268589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hd/fN6JrXuuparzKe/1dgdm1z2pqZRQTyP5PJ9H207I=;
        b=OfhomanxJFThOObcGcWNTyVf+OihH7gJSaXtVmN3CK0dM/6yAWbpErx5KVyYWmqKfj
         jOIuMIcYWZMv3HFIjhab9YH+hmwkj2IERGaJhckkemjcQhgIo3MLb2fxQvmKzwT4cSPc
         vp4WNS6p5jKAQ9M3qJCzGfckxqBnQGbTi6eXAIh15feyOaO37i6RJpbesaeIGanIrKQt
         NOOdwuC4y2FYYBHG5b8KXxJI+I0ctlEhPEnOzMCIIF3EY/kuPUcWs0XUx6hvdLb1mcdB
         M1UU/MqsQTe0t91gElKsXoR1z/OxhovUWApCRXeToRYW8kNXKQrBd25FJsvb4Q1EgR3B
         bArA==
X-Forwarded-Encrypted: i=1; AJvYcCVfaSjGCwxIC0r3DqOYZHDYNDwfTZoO/EY1ApbEeWW0Ql4FCaaKdILGSS3f8wLSfGwPEyUBWIWFi0hqmu/6fMvHfk9t
X-Gm-Message-State: AOJu0YxyGlwPLKIYzsixyiG/KcvybaI3UhTv1D2/zzRvUunjgsHWKBOj
	pV4Lh9lmqVdlD+W3pDDl3n3K/dOEdzDp3I/AI51eqIXs2p6DsIsb/5o65Oxyyg==
X-Google-Smtp-Source: AGHT+IEW0u5OjNVhFbntAWf/v7zidI2Sjsqla8PVFtRXPmZZ7xJh0N+dgrcQ2vSjwdtKDdMLAlmuaw==
X-Received: by 2002:a05:6a00:2e18:b0:706:8066:5cd6 with SMTP id d2e1a72fcca58-70aaaf31a15mr736491b3a.32.1719663788507;
        Sat, 29 Jun 2024 05:23:08 -0700 (PDT)
Received: from thinkpad ([220.158.156.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecf70asm3179116b3a.102.2024.06.29.05.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 05:23:08 -0700 (PDT)
Date: Sat, 29 Jun 2024 17:53:01 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 01/10] PCI: imx6: Fix establish link failure in EP
 mode for iMX8MM and iMX8MP
Message-ID: <20240629122301.GB5608@thinkpad>
References: <20240617-pci2_upstream-v6-0-e0821238f997@nxp.com>
 <20240617-pci2_upstream-v6-1-e0821238f997@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617-pci2_upstream-v6-1-e0821238f997@nxp.com>

On Mon, Jun 17, 2024 at 04:16:37PM -0400, Frank Li wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Add IMX6_PCIE_FLAG_HAS_APP_RESET flag to IMX8MM_EP and IMX8MP_EP drvdata.
> This flag was overlooked during code restructuring. It is crucial to
> release the app-reset from the System Reset Controller before initiating
> LTSSM to rectify the issue
> 
> Fixes: 0c9651c21f2a ("PCI: imx6: Simplify reset handling by using *_FLAG_HAS_*_RESET")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 917c69edee1d5..9a71b8aa09b3c 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1578,7 +1578,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  	},
>  	[IMX8MM_EP] = {
>  		.variant = IMX8MM_EP,
> -		.flags = IMX6_PCIE_FLAG_HAS_PHYDRV,
> +		.flags = IMX6_PCIE_FLAG_HAS_APP_RESET |
> +			 IMX6_PCIE_FLAG_HAS_PHYDRV,
>  		.mode = DW_PCIE_EP_TYPE,
>  		.gpr = "fsl,imx8mm-iomuxc-gpr",
>  		.clk_names = imx8mm_clks,
> @@ -1589,7 +1590,8 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  	},
>  	[IMX8MP_EP] = {
>  		.variant = IMX8MP_EP,
> -		.flags = IMX6_PCIE_FLAG_HAS_PHYDRV,
> +		.flags = IMX6_PCIE_FLAG_HAS_APP_RESET |
> +			 IMX6_PCIE_FLAG_HAS_PHYDRV,
>  		.mode = DW_PCIE_EP_TYPE,
>  		.gpr = "fsl,imx8mp-iomuxc-gpr",
>  		.clk_names = imx8mm_clks,
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
