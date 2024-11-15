Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DAB185B67
	for <imx@lists.linux.dev>; Fri, 15 Nov 2024 07:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731654790; cv=none; b=LWl1LuALX2dxzuDeXm8YN/645XOr6qc4n/AL9siBqg7FBBYta3DzsAzySgp9vwaJRcWLHBjeQVei63gvKM4krogwnY3uBTvi1WvBYLxsf2qf4f7/S+Ag6LQAnUeII4+iAwkqQjGW4Ze7ejn5sms9wzO/ILxZQluVLhterHhpE6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731654790; c=relaxed/simple;
	bh=hW+xKYnvERyaDsTFLZMZ1tONEaJp5t202N+XMS1PyZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMdzLhuzIwTBYHR/HInLfFFkw4E4frJby8xriMqJy2A+lf7JlyIwoumCSmutA9IU2cydIYdSQB84ockYFXr7hn7f83aP2X/FK5+8vdQTVCdPfXmbic4cX1R2g/gYBZnogecuBxi+y8AwqQngeecJhIBp22rj0JqbgGsCdMvHLhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=woFFITdx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="woFFITdx"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-211c1bd70f6so12683875ad.0
        for <imx@lists.linux.dev>; Thu, 14 Nov 2024 23:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731654788; x=1732259588; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1Dz/OYJenLwT42NvbYgc5y6jl1Qc/DY1ubS7Ysj0ds=;
        b=woFFITdxGzxxu/Nh2cpHSktyyt10XQZ5DLLuidG+og2m/dmSwMt78jAXkZbQdXc/V1
         lDlFak4wSzghjkNrk3q+QV4kqzmJp6+gIOOtKGLkVaPwOgUlOEs3gC017HD1mclvPgri
         hSVs5Cx0AQfn+XR4W7MmF3sozrutWSHzIAqIhXyi7pcV/QLBPW4EyLmJIevL5/ncW5BF
         LSHhKZ5qn2zvIxOAWLvdhywL/DBBUeBP3d53LxdIQsAzRhJ45hxAWXSktWwDu08R7ynz
         KnyCAAXiihVKzIErxCb3fOBU9Ui4cUlWBaPzCbJ9QqcymIhYgcILS6AJ4FFyRoaluxHu
         lluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731654788; x=1732259588;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+1Dz/OYJenLwT42NvbYgc5y6jl1Qc/DY1ubS7Ysj0ds=;
        b=mVpsqAeHEnA94G2eloUOtAQbPY/Lbc5oA/scofVyoI/zSzoO22yGCHAmdGv91eWPrm
         2n+HFiAdwmnE5nxc+cdMsIjuh0dFSju8nUWaLApSZOEOD61azliqtKtSWH7BmJFF2bXt
         cqN0ag1/E4qXcS6EqYn8o+m+qt7K6OHQmuzEDxSNvjEdfTheuBTLgv29Fo3Wua/M1d69
         UmOw/RgqXr8jEsqb+GO54SttSEoWgnLnt1auYgNxCy9/U2+9DYJ2n8u9B7f2IKcNXsjR
         p39IQLXirMAdvHGa+nINgKuAjlmdPusPvN0ymShkFqxSLxEVjJuMt2zqq50SFHdURhXZ
         XjEw==
X-Forwarded-Encrypted: i=1; AJvYcCV6taf+3aw/sTdeh686unxDDNo/nRiL8NcRKdu3pJMBAZieC8ZR2pS9oPlY/tD19Z1tFZk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCstaBP/ngt+ylcNL1HFgW1k1YxCm9D7qtRGaR7+1Dpb4G2FSP
	YI/MagV+nTJtETH+vgSSQJR73Bjt5+5SUZY2e/Ug0yiOK8kpxGXCfV0B7FrNVw==
X-Google-Smtp-Source: AGHT+IGXzZZGlt+G0O4qFrwjzRuyPJCE0eMc4484n4Is2j1zfs167pZc2pf+Scw0xdwwWEA3jG14tw==
X-Received: by 2002:a17:903:2282:b0:20c:7196:a1e9 with SMTP id d9443c01a7336-211d06f44acmr34058055ad.13.1731654788551;
        Thu, 14 Nov 2024 23:13:08 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f56dd3sm6529845ad.263.2024.11.14.23.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 23:13:08 -0800 (PST)
Date: Fri, 15 Nov 2024 12:42:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 09/10] PCI: imx6: Add i.MX8MQ i.MX8Q and i.MX95 PCIe
 PM support
Message-ID: <20241115071257.ihticiqzmyn5c3lu@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-10-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101070610.1267391-10-hongxing.zhu@nxp.com>

On Fri, Nov 01, 2024 at 03:06:09PM +0800, Richard Zhu wrote:

In subject, do not use "PCIe PM" as it could imply "PCI-PM". Just use "PM"
instead. Prefix already mentioned that it is a PCIe driver.

> Add iMX8MQ i.MX8Q and i.MX95 PCIe suspend/resume support.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 3c074cc2605f..cf2a9918537e 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1498,7 +1498,8 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX8MQ] = {
>  		.variant = IMX8MQ,
>  		.flags = IMX_PCIE_FLAG_HAS_APP_RESET |
> -			 IMX_PCIE_FLAG_HAS_PHY_RESET,
> +			 IMX_PCIE_FLAG_HAS_PHY_RESET |
> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.gpr = "fsl,imx8mq-iomuxc-gpr",
>  		.clk_names = imx8mq_clks,
>  		.clks_cnt = ARRAY_SIZE(imx8mq_clks),
> @@ -1536,7 +1537,8 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX8Q] = {
>  		.variant = IMX8Q,
>  		.flags = IMX_PCIE_FLAG_HAS_PHYDRV |
> -			 IMX_PCIE_FLAG_CPU_ADDR_FIXUP,
> +			 IMX_PCIE_FLAG_CPU_ADDR_FIXUP |
> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.clk_names = imx8q_clks,
>  		.clks_cnt = ARRAY_SIZE(imx8q_clks),
>  	},
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
