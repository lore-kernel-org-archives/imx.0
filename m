Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1562356C0
	for <imx@lists.linux.dev>; Wed,  2 Apr 2025 07:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577724; cv=none; b=HcdS0eFy9c5/gxvVuTrj6VdEQ7NFrx2+DwiHCfsLgS99wBwHEsi2NPdrQhV+6HBt8RKr3bm0rfM/VtqCDSARPCg0I+1joB71SGrjqtQOTEDI+q8iQjwA06Fa2UpMKVbZegiqMu/8CkXgSJM7dEDb6j7bsvlVveHALNgxBBK3+fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577724; c=relaxed/simple;
	bh=iwptS4Fiz/t1wRBCwp0WrKM5yTxXoSw3nTT35Pn5ibU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxNeCH/5eLbL54QyOAee3sr/gyU4HSTscZ+yUF/vbuQER43dIbS+Xnt32kmeSaJy4Pda/CqTiIEJYNNNfDAAT5pZUsITkxvblX1ojqJMbyGtBkjf0Vjn94SYKM86ncFg+E+/uvo844Lq9UMqLkX3x7Vu/P2iD5uhbrJ7Z7bczXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H6pSpu3a; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H6pSpu3a"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224341bbc1dso108010765ad.3
        for <imx@lists.linux.dev>; Wed, 02 Apr 2025 00:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743577722; x=1744182522; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sBLznZWhA5X82bZqkVVLBxnwT0YwdGpBuJ1F1bT4V+o=;
        b=H6pSpu3aU5RsSZZfjeiwW7IB3DP5AO8htrkiv3gqiRoWASwKQSX1Yw0Cz4g0w+Gh8P
         QtIVqs+1ycrrvMgp70Ws0/bYiKTOncaDhhzrPFCwYDdsrPY4qvqpnnWtQ5MksPMfsDFp
         xyQEiKQ0IY4zmn6lYCetdsSvLaMAgmwrVRWhP6HNWPzL84pzXC0l2IaFs5Q7DUyaXvL4
         gKtoHdh+2JuFEskDakByIykpQl9idKzqUNbMaro8f1DP8KKqEr9TAIbvLAmuovYVsCxV
         vIDTLWa9GVid+IvxJ70n9R/DH4Kkcz7Tc3AQta8Kg8Y4cHMo44WpoKplkp+8DQwW2DxK
         zCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577722; x=1744182522;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sBLznZWhA5X82bZqkVVLBxnwT0YwdGpBuJ1F1bT4V+o=;
        b=ZnLLI2EaAL+/r9m7tcJLNzbsQKYwq1rkSqXKBp0krXF07j0rLPRToeF7fsPVcncPI0
         dwaqosBdxptzXvsY4QBYFam+pG4W2QOwC0PnLSp7CIoFcVhYZTt9fY68MMYchNnysgmg
         0/PBjE8w6pSI3ejMatVZ1zIJYtmIN2xpAOFms0hLu02ANynW2rjoOTjNdD4f+8B49mgW
         x5SjSoDs6g4/QK6D23y2BmdYDMnGeseQNKH2klPcFLB3DZDUoD6yyzs/88rj0+PVRttw
         /j2SkSX7eI+71toRD1rp0RnN/iBpexaFMkMfIjw0Pq66OwUFeqXT03LSbpyL9FRiFGJP
         N0iA==
X-Forwarded-Encrypted: i=1; AJvYcCVzxtpIXqlVDOnNB8MCEh76q6fuPLQpwAdsdAVZBGLyvTKW/hMEVf1hDVnLbve6tlzBreg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTnmY7tjK3N8NFDLcSyEUm+FkdQsnon891ioOC+nbLbjcWEu1d
	cg2PDtll68Aiz4lwmF2XMqvBLfKeEnSYP0jupf/utk86RmGsQ4nUmPmvxbqxDg==
X-Gm-Gg: ASbGncuRXfzSUjY8WYAT62NO+cB9J+firS6s6SqP+O16n+LP9FtSVIuX6LMO8lFaTkp
	uFaRHYhMZ89QGL8JZ7tPky23GYFtQKzE/MvHoO1QIvzK1OjmdKEgRgug3zGlp69B+iV9f5B3p7E
	t3BJY26iV88oBuM3fxfe26wviOJh0JkrL48Y7LQ/5fNcxvG3v6gH/NPhBdXwXvlQyTuNbKbaK11
	kaL9vdIHLrNn/+umnh5bmK6FpXxHSpDH1NU7ka8d72D22OanxFCVJ3vM8fePpDMGj6WQ03jkuFy
	826aqaySuqeX5HyGwHaUI2zqF5JRv9nC13jd7OLqtLjttH/WxZD59bNj
X-Google-Smtp-Source: AGHT+IESAdavvdZhZEPYi8YmhJREn3GzNckInuKrjE2kz7qwPxEfQH3XTifLJZjh/3yYARxtAKubSg==
X-Received: by 2002:a05:6a00:398f:b0:736:ab48:5b0 with SMTP id d2e1a72fcca58-739c78430demr1761550b3a.2.1743577722481;
        Wed, 02 Apr 2025 00:08:42 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970def428sm10236829b3a.32.2025.04.02.00.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:08:42 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:38:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] PCI: imx6: Let i.MX95 PCIe compliance with 8GT/s
 Receiver Impedance ECN
Message-ID: <u2doi5nksovsxf75ahwdr3c3uixjk555mbwouvtblf5rruoicv@uvsdytcwoish>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-5-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328030213.1650990-5-hongxing.zhu@nxp.com>

On Fri, Mar 28, 2025 at 11:02:11AM +0800, Richard Zhu wrote:
> ERR051586: Compliance with 8GT/s Receiver Impedance ECN.
> 
> The default value of GEN3_RELATED_OFF[GEN3_ZRXDC_NONCOMPL] is 1 which
> makes receiver non-compliant with the ZRX-DC parameter for 2.5 GT/s when
> operating at 8 GT/s or higher. It causes unnecessary timeout in L1.
> 
> Workaround: Program GEN3_RELATED_OFF[GEN3_ZRXDC_NONCOMPL] to 0.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 31 +++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 82402e52eff2..35194b543551 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -110,6 +110,7 @@ enum imx_pcie_variants {
>   */
>  #define IMX_PCIE_FLAG_BROKEN_SUSPEND		BIT(9)
>  #define IMX_PCIE_FLAG_HAS_LUT			BIT(10)
> +#define IMX_PCIE_FLAG_8GT_ECN_ERR051586		BIT(11)
>  
>  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
>  
> @@ -1263,6 +1264,32 @@ static void imx_pcie_host_exit(struct dw_pcie_rp *pp)
>  		regulator_disable(imx_pcie->vpcie);
>  }
>  
> +static void imx_pcie_host_post_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct imx_pcie *imx_pcie = to_imx_pcie(pci);
> +	u32 val;
> +
> +	if (imx_pcie->drvdata->flags & IMX_PCIE_FLAG_8GT_ECN_ERR051586) {
> +		/*
> +		 * ERR051586: Compliance with 8GT/s Receiver Impedance ECN
> +		 *
> +		 * The default value of GEN3_RELATED_OFF[GEN3_ZRXDC_NONCOMPL]
> +		 * is 1 which makes receiver non-compliant with the ZRX-DC
> +		 * parameter for 2.5 GT/s when operating at 8 GT/s or higher.
> +		 * It causes unnecessary timeout in L1.
> +		 *
> +		 * Workaround: Program GEN3_RELATED_OFF[GEN3_ZRXDC_NONCOMPL]
> +		 * to 0.
> +		 */
> +		dw_pcie_dbi_ro_wr_en(pci);
> +		val = dw_pcie_readl_dbi(pci, GEN3_RELATED_OFF);
> +		val &= ~GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL;
> +		dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, val);
> +		dw_pcie_dbi_ro_wr_dis(pci);
> +	}
> +}
> +
>  static u64 imx_pcie_cpu_addr_fixup(struct dw_pcie *pcie, u64 cpu_addr)
>  {
>  	struct imx_pcie *imx_pcie = to_imx_pcie(pcie);
> @@ -1304,6 +1331,7 @@ static const struct dw_pcie_host_ops imx_pcie_host_ops = {
>  static const struct dw_pcie_host_ops imx_pcie_host_dw_pme_ops = {
>  	.init = imx_pcie_host_init,
>  	.deinit = imx_pcie_host_exit,
> +	.post_init = imx_pcie_host_post_init,
>  };
>  
>  static const struct dw_pcie_ops dw_pcie_ops = {
> @@ -1403,6 +1431,7 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
>  	struct device *dev = pci->dev;
>  
>  	imx_pcie_host_init(pp);
> +	imx_pcie_host_post_init(pp);
>  	ep = &pci->ep;
>  	ep->ops = &pcie_ep_ops;
>  
> @@ -1812,6 +1841,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.variant = IMX95,
>  		.flags = IMX_PCIE_FLAG_HAS_SERDES |
>  			 IMX_PCIE_FLAG_HAS_LUT |
> +			 IMX_PCIE_FLAG_8GT_ECN_ERR051586 |
>  			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.ltssm_off = IMX95_PE0_GEN_CTRL_3,
>  		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
> @@ -1865,6 +1895,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX95_EP] = {
>  		.variant = IMX95_EP,
>  		.flags = IMX_PCIE_FLAG_HAS_SERDES |
> +			 IMX_PCIE_FLAG_8GT_ECN_ERR051586 |
>  			 IMX_PCIE_FLAG_SUPPORT_64BIT,
>  		.ltssm_off = IMX95_PE0_GEN_CTRL_3,
>  		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
