Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8901474CC
	for <imx@lists.linux.dev>; Sun, 27 Apr 2025 11:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745752560; cv=none; b=HTqfzd8SW3ZBd9bwMTXIgIempkyGc5c7nefJhE6cNBLpQirG0wWqA6yMzpycLNNttL24Jw5fyShWkdjN6/6XsHD2nHtI/vSVSMfB6HBedskfIrSvZ9DXC3MiQ67Mi8dHV8C+m/vbkJZFgGU3gkBFQFs4fG7tsJc5nchdqWa+ba4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745752560; c=relaxed/simple;
	bh=IuHqjHQKIj4MI9Zg8PVsHK2jscKz451CoRU+37OGLGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWlotKgPMUjVSgI2Yq7b5lFQxir7E8nwsvPbRGjf6qtGhYdmXRIrknBddWLEC0roB5Ucl8XR2+W9h/xUSe4Q5gvgi4vcvicqJqc1Ts9qNQa5fwyzSVnruHDMmIUlHqb//d9y7B//yISRBBn1AVMqxEbjz8gqvQLQRh/gdVr7dKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vlSM/yNe; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vlSM/yNe"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-301302a328bso5428838a91.2
        for <imx@lists.linux.dev>; Sun, 27 Apr 2025 04:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745752558; x=1746357358; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YOn5uDNnmbpz2YvqS/MmIuJTmu3qB5FpprhRLnKlvIE=;
        b=vlSM/yNeJfSNOVvBT/yA9Qpt6y4YZtcz789Qp+1NYW13UH+fL9GQNJETsuqtbW65GY
         6VnTIe1iuxVt4pmTK0VTCPzyz6EFZRBwnDv5EdKOL5LugeyRY8DpA6x25I7pGEssA5gT
         ECSIPKdSxNE+EAVgOW7mrPDPZiSJe5dnXuMk6Skhjj16E9E0sVElSMb6RuOhjnzxXzBD
         YZFMyvyEA6vTdkwv5v7XAvHyhW3FtqDdr1DbA6RMBifWWA8FYVBBg0jambv6zPIirhNF
         +ICcUL0/Ons44aSn5QAH7d1vAOznC7IlQALQUwnh9adehcx6FIe532QpINPnNH6WfT/K
         4SBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745752558; x=1746357358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YOn5uDNnmbpz2YvqS/MmIuJTmu3qB5FpprhRLnKlvIE=;
        b=m7126BYTd5+MImhwCIY/1Q87ZwZ7VAhYrYcUUAnAoB1Y+cNWlgF8s7Rm1jr6AZX87a
         dmdiIa4BMnzFF3Cr/kztHIRtvWuzvGf/XSKr/c7EN0rVsdxsYYGI6lGieIdxWh0KR+dM
         db5fDIVwYgoCqaZxNWn2SaxQk7+3N4xT/DSGFzRJ9mdPUbSBE0qTMdu8/u+LQ/+gC4ya
         /Iv6El0oTNF9p0hRSV6janaa2vd0JQ4Bd0wxPGB16PpCvS1ZMAtC1PjQyoNOpAhkXqul
         umlZmlaxWau87kiLIrUiZxUDSb7Fhi3UrhcK2CqjCNdBszgqvz02vzY9PKLafg4xj2jF
         GYKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqqDpllr8tJzwYmobogaH7D0EYH2yW2xBGzOZe+9dgtzhsjAV/qAr6LKc1hzGCBJZcDlI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl8ntwrt1Cn6Fv/YojysaP4p+oatWr6MUHvcnNme121xBY12Pt
	wfz9fKt/70Qumv9SCP2Qffo5YiHAIqewq12FK6aza27lbPoN+4YqO3g5Y79ogw==
X-Gm-Gg: ASbGncuA1oADFmtMaxJ6aOIIf2DTII5EEDuAbUQnHLSg+crZ/95qVUaFewaJKoaxNi/
	ltlVZcxH6lapal39QRFuQ6ZxEtHrmzAledwdaL7SzntbrME0aQ0GD1Na3EejUD5FsHNbfQ3zHpz
	8Bp3j73ZxOXzYWoY2Nh9EP1i9za71t8N1mWwuLTo+4faz+uu3WIIGQ7qal1WC2COkRkbtVSKZGj
	NWKrGOMN9igMIHDRuKas5I+ajVIkSVeTzqv34K1HGlNNrmMEWrrOIQpOLp3SwHHhlz4DrlbTkxs
	aDFlMn0z1/2Ov8x727b0yFs1PZMQdU4NNtiEEIHmZIZxv6h7LX+Mmn1tWbkVMGw=
X-Google-Smtp-Source: AGHT+IFLgscZ/lYINfuAkkH9jISjtRT3pDQ1Z95sY0g7bHDD7akZs8rvcSaagngpu+qBp7Bz7x7Yig==
X-Received: by 2002:a17:90b:2dca:b0:2ee:edae:75e with SMTP id 98e67ed59e1d1-309f7dd8a34mr12567779a91.13.1745752557651;
        Sun, 27 Apr 2025 04:15:57 -0700 (PDT)
Received: from thinkpad ([120.60.143.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7cb2sm62778045ad.112.2025.04.27.04.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:15:57 -0700 (PDT)
Date: Sun, 27 Apr 2025 16:45:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v6 4/7] PCI: imx6: Workaround i.MX95 PCIe may not
 exit L23 ready
Message-ID: <4cbv5uzo2vcigrjmpisg5ndovhkp2cpyg5sczpxsde7gmv5fd2@cf4li7yqkxwn>
References: <20250416081314.3929794-1-hongxing.zhu@nxp.com>
 <20250416081314.3929794-5-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416081314.3929794-5-hongxing.zhu@nxp.com>

On Wed, Apr 16, 2025 at 04:13:11PM +0800, Richard Zhu wrote:
> ERR051624: The Controller Without Vaux Cannot Exit L23 Ready Through Beacon
> or PERST# De-assertion
> 
> When the auxiliary power is not available, the controller cannot exit from
> L23 Ready with beacon or PERST# de-assertion when main power is not
> removed.
> 
> Workaround: Set SS_RW_REG_1[SYS_AUX_PWR_DET] to 1.
> 
> The workaround is irrespective of Vaux presence in remote partner.
> In the other words, this workaround should work whatever the remote
> partner has the Vaux or not.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 7c60b712480a..016b86add959 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -48,6 +48,8 @@
>  #define IMX95_PCIE_SS_RW_REG_0			0xf0
>  #define IMX95_PCIE_REF_CLKEN			BIT(23)
>  #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
> +#define IMX95_PCIE_SS_RW_REG_1			0xf4
> +#define IMX95_PCIE_SYS_AUX_PWR_DET		BIT(31)
>  
>  #define IMX95_PE0_GEN_CTRL_1			0x1050
>  #define IMX95_PCIE_DEVICE_TYPE			GENMASK(3, 0)
> @@ -227,6 +229,19 @@ static unsigned int imx_pcie_grp_offset(const struct imx_pcie *imx_pcie)
>  
>  static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
>  {
> +	/*
> +	 * ERR051624: The Controller Without Vaux Cannot Exit L23 Ready
> +	 * Through Beacon or PERST# De-assertion
> +	 *
> +	 * When the auxiliary power is not available, the controller
> +	 * cannot exit from L23 Ready with beacon or PERST# de-assertion
> +	 * when main power is not removed.
> +	 *
> +	 * Workaround: Set SS_RW_REG_1[SYS_AUX_PWR_DET] to 1.
> +	 */
> +	regmap_set_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_1,
> +			IMX95_PCIE_SYS_AUX_PWR_DET);
> +
>  	regmap_update_bits(imx_pcie->iomuxc_gpr,
>  			IMX95_PCIE_SS_RW_REG_0,
>  			IMX95_PCIE_PHY_CR_PARA_SEL,
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
