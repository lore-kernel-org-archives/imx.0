Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983D030FA3
	for <imx@lists.linux.dev>; Mon, 16 Oct 2023 16:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p6RTuco8"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d9a518d66a1so5618265276.0
        for <imx@lists.linux.dev>; Mon, 16 Oct 2023 09:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697475515; x=1698080315; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Afu5xdjrM60kr5jPKowmDpQRJUH3WWvLNXM6VlnD7Ds=;
        b=p6RTuco8YIAKe+EY39PcErkcfG3u1bY4k9GDNz4l9adXRpOJQEBk03FRPT4UrNJqPj
         sq5aIQ3Mr+ob54qIJexYG2NWee4M65w146wukhBWfqBuQw/vXZqZq27SDGtV+7Jgddor
         hAkbB9zC3FQgpHtAvHo4R8pl5SeCm1upYaFJLQONuHmsga/56WrICkQ1v/m5jBqdQ5xN
         Pg17s6rCd41cdRsWyxzgg1Mn3Haz78xOVWLIXJB1p2T7E+FhP2rerZTKqwr0d8UY2Hzy
         6s0kA4qqZj0K96NN8xK5cZmSoxfbHHNVl/O6bv3y19Vfwm9/lZl12cu2C0g6BP3Vp9zv
         WEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697475515; x=1698080315;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Afu5xdjrM60kr5jPKowmDpQRJUH3WWvLNXM6VlnD7Ds=;
        b=vbfOhUd7se5P+/1VHPIEEqywqQ81eB6TK6ZuZevuCvLa2FAGjqMDufJGtw2efJ/jkp
         0YfxwhwGieiSlkrkHto5c29UiFqoEfZ1pv8DxQmEdor0SW+85tBxez+6KikFJiIOOmSV
         JyaNtp0gacvaHeK/3Au65n5E63p5VoYMLaMPNEnFUiUris7U4xvyZd9+0KEDbnKwTSk8
         uOqJRIykzBaVzB4R90UVO1tCY7HKXhPlNMGC7ZpRlLTf7kHNtefayKMI16Pj14I8q3cg
         tM+uEo4VF0PtvE5MFeTZEp2m+D6KvxkE0V1ufYw5PBivVsru5DLAcHo+hUY5VYlcKM0z
         z7Yw==
X-Gm-Message-State: AOJu0Yw1TrjWXgrz1bWqHaTg7sjy9TyQGvX6S0QBUYCNanaahz3Rxo9S
	8Iaqs2MBZff5aHUxNnZ9u1ze
X-Google-Smtp-Source: AGHT+IEFaxm77O8Qvj9+hGJ9O76en3aHbv05oX+Ne6kwKs5h2XLGTM7ESsLfBmjCk7ynOa6kMoTGzw==
X-Received: by 2002:a25:ae85:0:b0:d9a:4362:67ac with SMTP id b5-20020a25ae85000000b00d9a436267acmr18122044ybj.15.1697475515480;
        Mon, 16 Oct 2023 09:58:35 -0700 (PDT)
Received: from thinkpad ([117.207.31.199])
        by smtp.gmail.com with ESMTPSA id s8-20020ad45008000000b0065afd35c762sm3564494qvo.91.2023.10.16.09.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 09:58:35 -0700 (PDT)
Date: Mon, 16 Oct 2023 22:28:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 2/3] PCI: layerscape: add suspend/resume for ls1021a
Message-ID: <20231016165824.GF39962@thinkpad>
References: <20230915184306.2374670-1-Frank.Li@nxp.com>
 <20230915184306.2374670-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230915184306.2374670-2-Frank.Li@nxp.com>

On Fri, Sep 15, 2023 at 02:43:05PM -0400, Frank Li wrote:
> ls1021a add suspend/resume support.
> 

Please add what the driver is doing during suspend/resume.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-layerscape.c | 88 ++++++++++++++++++++-
>  1 file changed, 87 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index 20c48c06e2248..bc5a8ff1a26ce 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -35,6 +35,12 @@
>  #define PF_MCR_PTOMR		BIT(0)
>  #define PF_MCR_EXL2S		BIT(1)
>  
> +/* LS1021A PEXn PM Write Control Register */
> +#define SCFG_PEXPMWRCR(idx)	(0x5c + (idx) * 0x64)
> +#define PMXMTTURNOFF		BIT(31)
> +#define SCFG_PEXSFTRSTCR	0x190
> +#define PEXSR(idx)		BIT(idx)
> +
>  #define PCIE_IATU_NUM		6
>  
>  struct ls_pcie_drvdata {
> @@ -48,6 +54,8 @@ struct ls_pcie {
>  	struct dw_pcie *pci;
>  	const struct ls_pcie_drvdata *drvdata;
>  	void __iomem *pf_base;
> +	struct regmap *scfg;
> +	int index;
>  	bool big_endian;
>  };
>  
> @@ -170,13 +178,91 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static void ls1021a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +
> +	if (!pcie->scfg) {

Can this ever happen?

> +		dev_dbg(pcie->pci->dev, "SYSCFG is NULL\n");
> +		return;
> +	}
> +
> +	/* Send Turn_off message */

"Send PME_Turn_Off message"

> +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> +	val |= PMXMTTURNOFF;
> +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> +
> +	/* There are not register to check ACK, so wait PCIE_PME_TO_L2_TIMEOUT_US */

"There is no specific register to check for PME_To_Ack from endpoint. So on the
safe side, wait for PCIE_PME_TO_L2_TIMEOUT_US."

> +	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
> +
> +	/* Clear Turn_off message */

"PME_Turn_off". But I'm not sure if this is really required. Are you doing it
because the layerspace hw implements the PME_Turn_Off bit as "level triggered"?

> +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> +	val &= ~PMXMTTURNOFF;
> +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> +}
> +
> +static void ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +

A comment here would be good.

> +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> +	val |= PEXSR(pcie->index);
> +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> +
> +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> +	val &= ~PEXSR(pcie->index);
> +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> +}
> +
> +static int ls1021a_pcie_host_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	struct device *dev = pcie->pci->dev;
> +	u32 index[2];
> +	int ret;
> +
> +	ret = ls_pcie_host_init(pp);
> +	if (ret)
> +		return ret;
> +
> +	pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
> +	if (IS_ERR(pcie->scfg)) {
> +		ret = PTR_ERR(pcie->scfg);
> +		dev_err(dev, "No syscfg phandle specified\n");
> +		pcie->scfg = NULL;
> +		return ret;
> +	}
> +
> +	ret = of_property_read_u32_array(dev->of_node, "fsl,pcie-scfg", index, 2);
> +	if (ret) {
> +		pcie->scfg = NULL;
> +		return ret;
> +	}
> +
> +	pcie->index = index[1];
> +

The above syscon parsing could be done conditionally during probe itself. There
is no need to do it during host_init() time.

- Mani

> +	return ret;
> +}
> +
>  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
>  	.host_init = ls_pcie_host_init,
>  	.pme_turn_off = ls_pcie_send_turnoff_msg,
>  };
>  
> +static const struct dw_pcie_host_ops ls1021a_pcie_host_ops = {
> +	.host_init = ls1021a_pcie_host_init,
> +	.pme_turn_off = ls1021a_pcie_send_turnoff_msg,
> +};
> +
>  static const struct ls_pcie_drvdata ls1021a_drvdata = {
> -	.pm_support = false,
> +	.pm_support = true,
> +	.ops = &ls1021a_pcie_host_ops,
> +	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
>  };
>  
>  static const struct ls_pcie_drvdata layerscape_drvdata = {
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
