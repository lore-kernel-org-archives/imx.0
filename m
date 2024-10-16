Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4543210C1B
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 18:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729102337; cv=none; b=kHc/TdgC8P+fdz5fe5L1OxF90HiEfvpv17cvq7kjAp9lLG0sBbLiPzaeRsdn+3u3BR4iH8EXiCMjNyTrBpddQpadpMoNnmLgc0MdQkIwOlcfuT3HO2Y3cGc8oMp8lcR/1tN6IFA8wR8DwcZRAiTEpciv1ErFdB5SAxJgMa5VgO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729102337; c=relaxed/simple;
	bh=pjBU7bP0Uk4e/xSSM+yH9JXOnBNOap5sy3aYwNVqicY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohwTB8GENhEFsBGmAM0lPk0B1qiROGmL1n7hDMRAcoacKwSKV541+LKaWfyzh4NJJ0nnjupH2GGZ1ghioFGUprf+yhZCBXSLVZ+qu/ob1M+MRfZbnz8NUjIMKlEN3VJiNIK3ScM9HDZYypTyNCIgAfphYvP5olTqeFmy7NnYtKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FUZQMD/O; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FUZQMD/O"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20cf3e36a76so1210875ad.0
        for <imx@lists.linux.dev>; Wed, 16 Oct 2024 11:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729102335; x=1729707135; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AGUSxJLSmS2t2McaXLEaoam4uNrhNWjevpowsdK4u6E=;
        b=FUZQMD/OXJbJJ9OnoAzT85hmnqp3Cnask9sm33dZb6nYGD7wYkzKyQwYONeeJ62OWO
         hBF3wRirgGKhDnMc5rC/eadXPX+zHVYqzxzRMwojp8xQHjnpoarLfMNdqwHXKH6gbSFo
         K6sBCWqk2IqT+cQW4xaxo6SK/knGSQzvsdg86w5BRAE/ZwTFdw9QL6BVWreutkQKqIgB
         zzlDZnC+CiUC3p/p84sVZ4+BWQ7UfeAMDGovkIBenr+DDVfi4Ha32N+zykmjaVXDHajl
         sm6cfx/o64q4ZjVBK79sS6AZS7QEQ7WaZYnYJHy6AuOQ49WGgQnZSV3QntAzuwbC49HB
         AQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729102335; x=1729707135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AGUSxJLSmS2t2McaXLEaoam4uNrhNWjevpowsdK4u6E=;
        b=VHH04zVEQJqENcxnKRfv3wdSmuOLfUDOHipifoyG0C2JbQFuJ/c42zCglsagk7GyZZ
         JjzK5nXIIJt6Yna6Eyq71hFL4PkBDHsaa8QshxTpV5kBk8azQyZi5zwJXN4kHsUCD71a
         JCIA6y7SzHQFyDu+9BwCxPijKk+Ome9j3LjGRXjI7u/LYIwYy6LlX3K2ksULXOPCi7hF
         hwT0fskkgZ+s3lEnpIKntQMW++wwfL2nfUKEHG0i1X91Fd5E0aGbTQOuhFrM+5zorKuU
         o8dHLxfYLoOiV4Gy8c7SBM1mG6iii4B1EWH5Anh3P5jwXNd3Ltjm6523SnJe96bg9M5c
         In8g==
X-Forwarded-Encrypted: i=1; AJvYcCVGJ+A27rbb3cJPHwPbnP2C43RkIu8SrOIrEaqF60+r/7YPpAyUY8p0RxKp3NW0pkoN4U4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiXdgbeDhphOU4x7KLgq3EH6j9gu8dZtAKUiFg9TojgfpiiUbG
	6WN+M/lxfuROWzyadBJxGYV8K439Jmxkt8fsDI7NiQAg4czzUQXKzTB00HsguA==
X-Google-Smtp-Source: AGHT+IEC4f0FCA7jD/T3S9Y3FpFfE6YgpsYbswvi8qmMeUEzDMbMadrb3Bae263HJGs3xq7PNu5TDg==
X-Received: by 2002:a05:6a20:d80c:b0:1d9:1c20:4092 with SMTP id adf61e73a8af0-1d91c2047f1mr608016637.16.1729102335093;
        Wed, 16 Oct 2024 11:12:15 -0700 (PDT)
Received: from thinkpad ([220.158.156.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e774d2a0csm3376997b3a.181.2024.10.16.11.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 11:12:14 -0700 (PDT)
Date: Wed, 16 Oct 2024 23:42:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v2 3/4] PCI: imx6: Pass correct sub mode when calling
 phy_set_mode_ext()
Message-ID: <20241016181207.qhjkhz266quak6ve@thinkpad>
References: <20240923-pcie_ep_range-v2-0-78d2ea434d9f@nxp.com>
 <20240923-pcie_ep_range-v2-3-78d2ea434d9f@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923-pcie_ep_range-v2-3-78d2ea434d9f@nxp.com>

On Mon, Sep 23, 2024 at 02:59:21PM -0400, Frank Li wrote:
> Fix hardcoding to Root Complex (RC) mode by adding a drvdata mode check.
> Pass PHY_MODE_PCIE_EP if the PCI controller operates in Endpoint (EP) mode.
> 

Patch descriptions should fit within 75 columns.

> Fixes: 8026f2d8e8a9 ("PCI: imx6: Call common PHY API to set mode, speed, and submode")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 808d1f1054173..bdc2b372e6c13 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -961,7 +961,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  			goto err_clk_disable;
>  		}
>  
> -		ret = phy_set_mode_ext(imx_pcie->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
> +		ret = phy_set_mode_ext(imx_pcie->phy, PHY_MODE_PCIE,
> +				       imx_pcie->drvdata->mode == DW_PCIE_EP_TYPE ?
> +						PHY_MODE_PCIE_EP : PHY_MODE_PCIE_RC);
>  		if (ret) {
>  			dev_err(dev, "unable to set PCIe PHY mode\n");
>  			goto err_phy_exit;
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
