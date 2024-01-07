Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D2A125AB
	for <imx@lists.linux.dev>; Sun,  7 Jan 2024 05:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pRvpFaeg"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3606e11d9cbso6333105ab.0
        for <imx@lists.linux.dev>; Sat, 06 Jan 2024 21:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704605604; x=1705210404; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sUxB7wKicUOyFSlq6s48xe3dcqB2CW2xhmx3XZD8AVg=;
        b=pRvpFaegWltnk/lJjxXSIZIwrBv5napGFfGmfOlCG0k+k6z66bu7ZPTx6+c4zNw3cu
         WRpLcUzb9fbEsIbPQO0CFJD/f6KggwoLV4YraZEOrv/OtrJylGeQ1eVv3HgdC0IasoKj
         fZ46b3/eZqTkteKKy1CIrNHowkpuj9rsTdHZv+RY2mU/YhMMHp7ivGPC5l375ESunMsU
         d0Oloc1N7zMeVcS271+vFLtjURxkIosfSAyjFE5zvdnC+emZTXPJvUhAfZsfr0YqaKjT
         XiGErfB/wzSquqIcu8iwxVBspHVoX154SnYtaSrix8z7TpRaL1lACxA0kUS3/3ZedyZG
         igLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704605604; x=1705210404;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUxB7wKicUOyFSlq6s48xe3dcqB2CW2xhmx3XZD8AVg=;
        b=p0VwMJnT6O6xji6+mn2u5DK/jErZ7fF+NMOE34NrFvZTEar2ZPtJvBUi3oNasVqoi6
         4ebnsEs7Q4wNFUiC3WBifaRuHledyOrXt6t2Au0H4v49UL/+FAMT1kJ6QChuhdUWaM2F
         RdKjYHE73Du4to6VgGnoybWUkk0uYxWYVF0nwyCoU6xjE/H1dAqwPN1CxdTVTcSmNi8v
         i3kTxEcz7MmmCYzwgXAKIq6RhEnPjLGHtavTOKaRAHMMp1OAoTx2qfG0KwXQVMT0KS47
         GV5caytAAaro3iHxQZmHEapGxhCrKXOdEkYfbFmvxjH5598U4qgpDhGqdtCB9+cbTjci
         EL3A==
X-Gm-Message-State: AOJu0YwET/goSnIZfjy51SCD0Z8d2JnxuFkjR7kpHeECv6b3gtHT2l1N
	3bnDbckobhN3JvLpPbD9Z5BuDcnHgNHp
X-Google-Smtp-Source: AGHT+IFmtKRaDWh6kJgCVs2Mz99P6IEAGvyYDybSnJ6/LBG8vwMMYGCtIcWcTUqkJzaWX+SWHF8dkg==
X-Received: by 2002:a92:ca05:0:b0:360:7c05:e484 with SMTP id j5-20020a92ca05000000b003607c05e484mr3356916ils.54.1704605603671;
        Sat, 06 Jan 2024 21:33:23 -0800 (PST)
Received: from thinkpad ([103.197.115.97])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902e80d00b001d072365b87sm3858364plg.106.2024.01.06.21.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jan 2024 21:33:23 -0800 (PST)
Date: Sun, 7 Jan 2024 11:03:13 +0530
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
Subject: Re: [PATCH v7 08/16] PCI: imx6: Simplify switch-case logic by
 involve init_phy callback
Message-ID: <20240107053313.GH3416@thinkpad>
References: <20231227182727.1747435-1-Frank.Li@nxp.com>
 <20231227182727.1747435-9-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227182727.1747435-9-Frank.Li@nxp.com>

On Wed, Dec 27, 2023 at 01:27:19PM -0500, Frank Li wrote:

Subject: PCI: imx6: Introduce init_phy() callback to simplify PHY initialization

> Add drvdata::init_phy() callback function, so difference SOC choose
> difference callback function to simple switch-case logic.
> 

Same subject can be used in commit message.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     change from v1 to v4:
>     - none
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 135 ++++++++++++++------------
>  1 file changed, 71 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 717e8fa030deb..d66a2db53bdb7 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -69,6 +69,9 @@ enum imx6_pcie_variants {
>  #define IMX6_PCIE_MAX_CLKS       6
>  
>  #define IMX6_PCIE_MAX_INSTANCES			2
> +
> +struct imx6_pcie;
> +
>  struct imx6_pcie_drvdata {
>  	enum imx6_pcie_variants variant;
>  	enum dw_pcie_device_mode mode;
> @@ -80,6 +83,7 @@ struct imx6_pcie_drvdata {
>  	const u32 ltssm_mask;
>  	const u32 mode_off[IMX6_PCIE_MAX_INSTANCES];
>  	const u32 mode_mask[IMX6_PCIE_MAX_INSTANCES];
> +	int (*init_phy)(struct imx6_pcie *pcie);
>  };
>  
>  struct imx6_pcie {
> @@ -323,76 +327,69 @@ static int pcie_phy_write(struct imx6_pcie *imx6_pcie, int addr, u16 data)
>  	return 0;
>  }
>  
> -static void imx6_pcie_init_phy(struct imx6_pcie *imx6_pcie)
> +static int imx8mq_pcie_init_phy(struct imx6_pcie *imx6_pcie)
>  {
> -	switch (imx6_pcie->drvdata->variant) {
> -	case IMX8MM:
> -	case IMX8MM_EP:
> -	case IMX8MP:
> -	case IMX8MP_EP:
> -		/*
> -		 * The PHY initialization had been done in the PHY
> -		 * driver, break here directly.
> -		 */
> -		break;
> -	case IMX8MQ:
> -	case IMX8MQ_EP:
> -		/*
> -		 * TODO: Currently this code assumes external
> -		 * oscillator is being used
> -		 */
> +	/*
> +	 * TODO: Currently this code assumes external
> +	 * oscillator is being used

Wrap the comments to 80 column.

> +	 */
> +	regmap_update_bits(imx6_pcie->iomuxc_gpr,
> +			   imx6_pcie_grp_offset(imx6_pcie),
> +			   IMX8MQ_GPR_PCIE_REF_USE_PAD,
> +			   IMX8MQ_GPR_PCIE_REF_USE_PAD);
> +	/*
> +	 * Regarding the datasheet, the PCIE_VPH is suggested
> +	 * to be 1.8V. If the PCIE_VPH is supplied by 3.3V, the
> +	 * VREG_BYPASS should be cleared to zero.
> +	 */

Same here.

> +	if (imx6_pcie->vph && regulator_get_voltage(imx6_pcie->vph) > 3000000)
>  		regmap_update_bits(imx6_pcie->iomuxc_gpr,
>  				   imx6_pcie_grp_offset(imx6_pcie),
> -				   IMX8MQ_GPR_PCIE_REF_USE_PAD,
> -				   IMX8MQ_GPR_PCIE_REF_USE_PAD);
> -		/*
> -		 * Regarding the datasheet, the PCIE_VPH is suggested
> -		 * to be 1.8V. If the PCIE_VPH is supplied by 3.3V, the
> -		 * VREG_BYPASS should be cleared to zero.
> -		 */
> -		if (imx6_pcie->vph &&
> -		    regulator_get_voltage(imx6_pcie->vph) > 3000000)
> -			regmap_update_bits(imx6_pcie->iomuxc_gpr,
> -					   imx6_pcie_grp_offset(imx6_pcie),
> -					   IMX8MQ_GPR_PCIE_VREG_BYPASS,
> -					   0);
> -		break;
> -	case IMX7D:
> -		regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12,
> +				   IMX8MQ_GPR_PCIE_VREG_BYPASS,
> +				   0);
> +
> +	return 0;
> +}
> +
> +static int imx7d_pcie_init_phy(struct imx6_pcie *imx6_pcie)
> +{
> +	return	regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12,

For consistency, return 0.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
