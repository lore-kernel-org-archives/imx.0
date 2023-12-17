Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC3E46B8F
	for <imx@lists.linux.dev>; Sun, 17 Dec 2023 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GK5Fwv3p"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7b7876fe9f0so112599239f.2
        for <imx@lists.linux.dev>; Sun, 17 Dec 2023 09:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702834497; x=1703439297; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CpKSkkBtYtil8YsODktdMUzC93N2+NEa5cKCVj6f1J8=;
        b=GK5Fwv3pGpFk3xQL2c0/vIOK+ItB2t+7Or5hnZkmbFu75o8TxeMcX1S4T0FPlSQuwG
         LV51zsJphntiTqhiRhaVnipfKcTHrvLb722fLO9wppzHReR4junnmRjZgWOdFksGHy3x
         7/zMWBvk2/Mlpt3Kr4TW/i04C1y2pE4U5p7yVMh2ZXQvGqptA0YgyJeq71agzfEmg6x6
         2jelsHk3HVJRmbeqGTDFuruJi6rBc9JkHJOOux6IjBm+yuGzzgTlahWhxsd6HUhQEKhh
         j6+IQ56GV1zW4YYMrrsGJK8Yp94HACgOvvhbCL5uEhcRDD3TIbFw9HIqVjUT2GMNzDM9
         3X6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702834497; x=1703439297;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CpKSkkBtYtil8YsODktdMUzC93N2+NEa5cKCVj6f1J8=;
        b=TVKHWtB3X/aN0cc/P/ufkLNeq8ZM+6Ugy26ajKIgJKJ2BBtR0Yk/q2ddQXTHDwg1Kb
         wX25vYvJbryfZ3v02+vP2+6g4nbgCigJjWpgu+ChFMmPJBT5FHbNf9L/1KLD6qfkAVlE
         +X8bqitLzcbNF4dqs1BZ1xf45HAk8hIfEFhxu5RG+Wh6Um7aadxuZun5j8eM0SyU5qAo
         +Eb6Ifb+4hMLQ5u9gW5dUDjiMwha+9dljOvHXpv1FaYyeN2AsgFbkKXzLPAoyhT75pbp
         QAuTQ/GefwMCl5W11wgOi2wPqCjbfxY69VpuXi5p7UYJ8eR9GTNhU/ee4HysnHwGzNls
         C+ZA==
X-Gm-Message-State: AOJu0YyFQtobIsaoRB1xuabiwxcvsHumBJ7YGfQjIN3l1VL5GwqoWMV/
	7N88HWjVAf6livO7AX2n9IXt
X-Google-Smtp-Source: AGHT+IGHWdluX+d13fjmLz/ABghE6j6WwAmobyNjIu6qplVK/PaeUQ8SB784FrCWR5EvBvm3cuqloQ==
X-Received: by 2002:a92:c54f:0:b0:35f:9d17:846e with SMTP id a15-20020a92c54f000000b0035f9d17846emr4967548ilj.31.1702834496885;
        Sun, 17 Dec 2023 09:34:56 -0800 (PST)
Received: from thinkpad ([103.28.246.178])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d31500b001d35516262esm1303557plc.158.2023.12.17.09.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 09:34:56 -0800 (PST)
Date: Sun, 17 Dec 2023 23:04:49 +0530
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
Subject: Re: [PATCH v4 03/15] PCI: imx6: Simplify reset handling by using by
 using *_FLAG_HAS_*_RESET
Message-ID: <20231217173449.GE6748@thinkpad>
References: <20231217051210.754832-1-Frank.Li@nxp.com>
 <20231217051210.754832-4-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231217051210.754832-4-Frank.Li@nxp.com>

On Sun, Dec 17, 2023 at 12:11:58AM -0500, Frank Li wrote:
> Refactors the reset handling logic in the imx6 PCI driver by adding
> IMX6_PCIE_FLAG_HAS_*_RESET bitmask define for drvdata::flags.
> 
> The drvdata::flags and a bitmask ensures a cleaner and more scalable
> switch-case structure for handling reset.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

One nitpick below. With that fixed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
> 
> Notes:
>     Change from v2 to v3:
>     - add Philipp's Reviewed-by tag
>     Change from v1 to v2:
>     - remove condition check before reset_control_(de)assert() because it is
>       none ops if a NULL pointer pass down.
>     - still keep condition check at probe to help identify dts file mismatch
>       problem.
>     
>     Change from v1 to v2:
>     - remove condition check before reset_control_(de)assert() because it is
>       none ops if a NULL pointer pass down.
>     - still keep condition check at probe to help identify dts file mismatch
>       problem.
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 108 ++++++++++----------------
>  1 file changed, 41 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 91ba26a4b4c3d..c1fb38a2ebeb6 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c

[...]

> @@ -1441,31 +1407,39 @@ static const struct imx6_pcie_drvdata drvdata[] = {
>  	},
>  	[IMX7D] = {
>  		.variant = IMX7D,
> -		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND,
> +		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX6_PCIE_FLAG_HAS_APP_RESET |
> +			 IMX6_PCIE_FLAG_HAS_PHY_RESET,
>  		.gpr = "fsl,imx7d-iomuxc-gpr",
>  		.clk_names = {IMX6_CLKS_NO_PHYDRV},
>  	},
>  	[IMX8MQ] = {
>  		.variant = IMX8MQ,
> +		.flags = IMX6_PCIE_FLAG_HAS_APP_RESET |
> +			 IMX6_PCIE_FLAG_HAS_PHY_RESET,
>  		.gpr = "fsl,imx8mq-iomuxc-gpr",
>  		.clk_names = {IMX6_CLKS_NO_PHYDRV, "pcie_aux"},
>  	},
>  	[IMX8MM] = {
>  		.variant = IMX8MM,
>  		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND |
> -			 IMX6_PCIE_FLAG_HAS_PHY,
> +			 IMX6_PCIE_FLAG_HAS_PHY |
> +			 IMX6_PCIE_FLAG_HAS_APP_RESET,
>  		.gpr = "fsl,imx8mm-iomuxc-gpr",
>  		.clk_names = {IMX6_CLKS_COMMON, "pcie_aux"},
>  	},
>  	[IMX8MP] = {
>  		.variant = IMX8MP,
>  		.flags = IMX6_PCIE_FLAG_SUPPORTS_SUSPEND |
> -			 IMX6_PCIE_FLAG_HAS_PHY,
> +			 IMX6_PCIE_FLAG_HAS_PHY |
> +			 IMX6_PCIE_FLAG_HAS_APP_RESET,
>  		.gpr = "fsl,imx8mp-iomuxc-gpr",
>  		.clk_names = {IMX6_CLKS_COMMON, "pcie_aux"},
>  	},
>  	[IMX8MQ_EP] = {
>  		.variant = IMX8MQ_EP,
> +		.flags = IMX6_PCIE_FLAG_HAS_PHY |

This change is not part of this patch.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
