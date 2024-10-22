Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFAA1B6CF2
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 17:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729616723; cv=none; b=gsnKUnyVfkRA04jJ4MGnFJ2jKiaznpjXBUQq96qwuYR6e7k0THfAR3CdZIQXdQZfHZWYsS0z3uVfVI1pnCFKFwppDImOQlaXfiB/7MBI4HiiT3m0Ld92SBCHD+5jqsqvMkkDb2JIInXDj33ndDoexnGWc/d+iT8Nx8Lgf7pPQtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729616723; c=relaxed/simple;
	bh=GIQYkP95DpNNqjHPx+GVVjcUxfLNLK4bVCRYu91sUN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m72coXHl+1/0dNBnYJUspcRC/Cvk716bI8ruHVEUn124QTdrkFjybizh9pf1bi2KT4WFdIvXppwqYJD1i9x3GS4D5IteAXp7pmfTnO+kB40Y2o/G36xkiDRXrrDAMz58BghQnXVwO2wFUbSKJkWoH9Q4PF4ByY786wFkYGNHebk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CAUCGxjC; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CAUCGxjC"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c9978a221so67175715ad.1
        for <imx@lists.linux.dev>; Tue, 22 Oct 2024 10:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729616721; x=1730221521; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ApU3fV+UtKxcEYZyM6H87gs38rNpBSSNhr/eTWWEXY4=;
        b=CAUCGxjCU0FC3ie3H4B2XPIZblGr3opoGI3ZyQ0pab0eRD8UcrjtKcCfowcIKwPIaw
         jK8dDycod4XrYPWgQ59N6UqUs8pdo3IA8PFEKa6tu5z4nwZzhlTAyR8vQ9kO20ObCuf1
         aRM272nNqzdU6GLcfbCV2VZUfKmg60ef7ChhOXKwEciUitxg3Yxz6Iutx1GZcJ8HjiRF
         3ToglhUhLEoRfKVgTFcugGyl+htEGOT071X6FIztvxmiTNiKLXH8MXo9uXGI1RGd8QHO
         /rNCQqASRuuzaZ05ZkxA36pmKJlmkvkjcfFgtyvpXxSxmOuPOGCLCqedbhagQoe1I5cq
         hSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729616721; x=1730221521;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ApU3fV+UtKxcEYZyM6H87gs38rNpBSSNhr/eTWWEXY4=;
        b=NHJ9X7Ql1mOe0GERGyB0Mgj4XzRX8eJ1ktWT5sWMMHyFWt6IpaQk2/HXuAFkPTOxgd
         sdbHHKywrjbYtu7DEaMh3oo+VKjXTgS4511t8tk/adjq+0IVSjAaJlUEakqhvxGuTghF
         2dlJxNT4RTMtXQ/gvSbOV+Fq2uFdqsWgkCmUXJxW+lQPeYcocP0dllIwSngbhfOS2zV8
         EKsrGy9xfsbrLxwgcvN+kbcj3mBH/BHFQgHyHKlpC2lBzitfab/Cwfi+soWd9ECXEwDa
         zkuheUhDgb0BdC7YoJz2H/ZMd9BZOH+Qv7cq6COmOdFvPCY2ksJkycuk90eB9xFft3a5
         jvfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb3C0LBvS4dPtKmoyaD64ZomOsUlhhGQSJYumyZiMbd8elSkXCgxsQ9cAP1kmqdT/1Xso=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7xm0XeNvUhgM/w42yDDZQMxxjhL69TUxO++eCyDYJ6KauPlYJ
	0u5wmA4for0eEiL5fTVo7MT79L3n2iJ6uPni9GOeK1Zdm0EddRn0zmAT+5ga1g==
X-Google-Smtp-Source: AGHT+IHRqsW0sRulSaBfDKEdAZUSpR9q80CX2UTyubbP2o+xbSDVjhZp8NPAD81dLI0BL9hvAVo41w==
X-Received: by 2002:a17:90b:1185:b0:2e2:cef9:4d98 with SMTP id 98e67ed59e1d1-2e561a01146mr16890078a91.25.1729616721232;
        Tue, 22 Oct 2024 10:05:21 -0700 (PDT)
Received: from thinkpad ([36.255.17.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad389146sm6432096a91.26.2024.10.22.10.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 10:05:20 -0700 (PDT)
Date: Tue, 22 Oct 2024 22:35:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: kw@linux.com, bhelgaas@google.com, lpieralisi@kernel.org,
	frank.li@nxp.com, l.stach@pengutronix.de, robh+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, festevam@gmail.com,
	s.hauer@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 6/9] PCI: imx6: Make *_enable_ref_clk() function
 symmetric
Message-ID: <20241022170514.s6ejwj2w64nivqui@thinkpad>
References: <1728981213-8771-1-git-send-email-hongxing.zhu@nxp.com>
 <1728981213-8771-7-git-send-email-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1728981213-8771-7-git-send-email-hongxing.zhu@nxp.com>

On Tue, Oct 15, 2024 at 04:33:30PM +0800, Richard Zhu wrote:
> Ensure the *_enable_ref_clk() function is symmetric by addressing missing
> disable parts on some platforms.

This warrants a Fixes tag. And the patch subject should be something like,

"PCI: imx6: Fix the missing reference clock disable logic"

> Also, remove the duplicate
> imx7d_pcie_init_phy() function as it is the same as
> imx7d_pcie_enable_ref_clk().
> 

This is a cleanup, so should be a separate patch.

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 33 +++++++++++----------------
>  1 file changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 93e2bcf9aa0a..161daad34a94 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -388,13 +388,6 @@ static int imx8mq_pcie_init_phy(struct imx_pcie *imx_pcie)
>  	return 0;
>  }
>  
> -static int imx7d_pcie_init_phy(struct imx_pcie *imx_pcie)
> -{
> -	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12, IMX7D_GPR12_PCIE_PHY_REFCLK_SEL, 0);
> -
> -	return 0;
> -}
> -
>  static int imx_pcie_init_phy(struct imx_pcie *imx_pcie)
>  {
>  	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
> @@ -593,13 +586,13 @@ static int imx_pcie_attach_pd(struct device *dev)
>  
>  static int imx6sx_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
>  {
> -	if (enable)
> -		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
> -				  IMX6SX_GPR12_PCIE_TEST_POWERDOWN);
> -
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
> +			   IMX6SX_GPR12_PCIE_TEST_POWERDOWN,
> +			   enable ? 0 : IMX6SX_GPR12_PCIE_TEST_POWERDOWN);
>  	return 0;
>  }
>  
> +

Spurious change.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
