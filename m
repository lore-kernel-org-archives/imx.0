Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EE245C0C
	for <imx@lists.linux.dev>; Sun, 17 Dec 2023 17:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w2DWBvTa"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7b7c33eb6ceso54481139f.3
        for <imx@lists.linux.dev>; Sun, 17 Dec 2023 09:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702833501; x=1703438301; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yvzvPPOvURo9eUay1zjag8iF5jEJZnvBduw4ZeL4Nkg=;
        b=w2DWBvTaPy+QBHTy5ykQsazjXtMl8cY/rQZYQsBp6X2+veui5qVQ0dVafSI3mqBUqh
         5MoW8cIs8lGbqsqP+6R3O09oXhb7PSGdWUPFWygr16wjUgOwmVU1BPL2ko/s9gPDOfxB
         cKoGbd+IeFfeg7pXnYHl9GRtjsxan1wT1s3MmLcA18iEA93JSnIZZ8+I0w+XQNJNyljn
         Ahmu33Eix2W6A6ddVoxxdJ5wFQnXOZjGG5vs+yclYcqHs3GSCynHS6zPzEgxECjjGvyE
         77lOCkyZUYrq33n0rtm91Wfp6NotvcT2VBP0xTJaezDGVhL7n4O5InuQ85fP5b4IeRMu
         ZBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702833501; x=1703438301;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvzvPPOvURo9eUay1zjag8iF5jEJZnvBduw4ZeL4Nkg=;
        b=LIGsa/1B5yRfXcgomPZtdtyTgk9fx7LSWsNDGwtfZfOcC+jfNH6Nh47M2fkInczJZz
         CDqCXl1i6zVm7nkrikyyPONFNjCJ4cxkEiwoxtalPl1afayWDDiy8NoWXgFd45Yk4aDJ
         AkSWwKfS4cb02jYzkBxV266AG/G0EwuEhPGWkaocaG/6XiNB6oZWTOmaO7/kMV1BZtbb
         k6X4H0MuTAlxy3wzuwAV1zOjBv3fjkXJQ52YEuNxvJW2oEMl1YJ+FloUhyWU5kSrI/Ay
         gHcQlPm9nouMmDnbNO9oD+QMk+Xc94apYuIwz0LSsPpg3ILuswYG+z2M00heFN2fPLQr
         tUDw==
X-Gm-Message-State: AOJu0YxVi0XB8X1s//mI0Z8EyA8sEaWp22hVyhKPYS7y4ohffGNJewoB
	Kyzs678s4/3QL3trXr1SDfjt
X-Google-Smtp-Source: AGHT+IG3iO9wwq2fHlKI2rNEIawMaBY13xkH+6DklBN+WvV2sdv33dbHZONs8rR6f4Lcf7btRm5LJw==
X-Received: by 2002:a05:6602:4902:b0:7b6:fc2d:6b52 with SMTP id ef2-20020a056602490200b007b6fc2d6b52mr17463986iob.4.1702833501039;
        Sun, 17 Dec 2023 09:18:21 -0800 (PST)
Received: from thinkpad ([103.28.246.178])
        by smtp.gmail.com with ESMTPSA id q18-20020a17090311d200b001d3867b6424sm4383852plh.113.2023.12.17.09.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 09:18:20 -0800 (PST)
Date: Sun, 17 Dec 2023 22:48:11 +0530
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
Subject: Re: [PATCH v4 02/15] PCI: imx6: Simplify phy handling by using by
 using IMX6_PCIE_FLAG_HAS_PHY
Message-ID: <20231217171811.GD6748@thinkpad>
References: <20231217051210.754832-1-Frank.Li@nxp.com>
 <20231217051210.754832-3-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231217051210.754832-3-Frank.Li@nxp.com>

On Sun, Dec 17, 2023 at 12:11:57AM -0500, Frank Li wrote:
> Refactors the phy handling logic in the imx6 PCI driver by adding
> IMX6_PCIE_FLAG_HAS_PHY bitmask define for drvdata::flags.
> 
> The drvdata::flags and a bitmask ensures a cleaner and more scalable
> switch-case structure for handling phy.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Change from v1 to v3:
>     - none
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 2086214345e9a..91ba26a4b4c3d 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -60,6 +60,9 @@ enum imx6_pcie_variants {
>  #define IMX6_PCIE_FLAG_IMX6_PHY			BIT(0)
>  #define IMX6_PCIE_FLAG_IMX6_SPEED_CHANGE	BIT(1)
>  #define IMX6_PCIE_FLAG_SUPPORTS_SUSPEND		BIT(2)
> +#define IMX6_PCIE_FLAG_HAS_PHY			BIT(3)
> +
> +#define imx6_check_flag(pci, val)     (pci->drvdata->flags & val)
>  
>  #define IMX6_PCIE_MAX_CLKS       6
>  
> @@ -1277,6 +1280,13 @@ static int imx6_pcie_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	if (imx6_check_flag(imx6_pcie, IMX6_PCIE_FLAG_HAS_PHY)) {
> +		imx6_pcie->phy = devm_phy_get(dev, "pcie-phy");

Can't you use devm_phy_optional_get()? This will return NULL if the PHY is not
defined in DT. So you can use IS_ERR() to catch error if there are issues in
acquiring PHY if defined and NULL can be safely passed to other PHY APIs like
phy_init() as well.

With this, you won't need a flag in drv_data and can also get rid of the
condition around PHY APIs.

- Mani

> +		if (IS_ERR(imx6_pcie->phy))
> +			return dev_err_probe(dev, PTR_ERR(imx6_pcie->phy),
> +					     "failed to get pcie phy\n");
> +	}
> +
>  	switch (imx6_pcie->drvdata->variant) {
>  	case IMX7D:
>  		if (dbi_base->start == IMX8MQ_PCIE2_BASE_ADDR)
> @@ -1306,11 +1316,6 @@ static int imx6_pcie_probe(struct platform_device *pdev)
>  			return dev_err_probe(dev, PTR_ERR(imx6_pcie->apps_reset),
>  					     "failed to get pcie apps reset control\n");
>  
> -		imx6_pcie->phy = devm_phy_get(dev, "pcie-phy");
> -		if (IS_ERR(imx6_pcie->phy))
> -			return dev_err_probe(dev, PTR_ERR(imx6_pcie->phy),
> -					     "failed to get pcie phy\n");
> -
>  		break;
>  	default:
>  		break;
> @@ -1447,13 +1452,15 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  	},
>  	[IMX8MM] = {
>  		.variant = IMX8MM,
> -		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND,
> +		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX6_PCIE_FLAG_HAS_PHY,
>  		.gpr = "fsl,imx8mm-iomuxc-gpr",
>  		.clk_names = {IMX6_CLKS_COMMON, "pcie_aux"},
>  	},
>  	[IMX8MP] = {
>  		.variant = IMX8MP,
> -		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND,
> +		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX6_PCIE_FLAG_HAS_PHY,
>  		.gpr = "fsl,imx8mp-iomuxc-gpr",
>  		.clk_names = {IMX6_CLKS_COMMON, "pcie_aux"},
>  	},
> @@ -1465,12 +1472,14 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  	},
>  	[IMX8MM_EP] = {
>  		.variant = IMX8MM_EP,
> +		.flags = IMX6_PCIE_FLAG_HAS_PHY,
>  		.mode = DW_PCIE_EP_TYPE,
>  		.gpr = "fsl,imx8mm-iomuxc-gpr",
>  		.clk_names = {IMX6_CLKS_COMMON, "pcie_aux"},
>  	},
>  	[IMX8MP_EP] = {
>  		.variant = IMX8MP_EP,
> +		.flags = IMX6_PCIE_FLAG_HAS_PHY,
>  		.mode = DW_PCIE_EP_TYPE,
>  		.gpr = "fsl,imx8mp-iomuxc-gpr",
>  		.clk_names = {IMX6_CLKS_COMMON, "pcie_aux"},
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
