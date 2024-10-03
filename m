Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5DC49638
	for <imx@lists.linux.dev>; Thu,  3 Oct 2024 06:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727935468; cv=none; b=gT2srnXWBpYH9IX5qwIzoPi9ZlYZgHD8lUV292J+82umykfaWIpPND4bcjH4tn60xxHtKvRS6qAnirxLOZJazEwa8GvHk0zy/j1KdA/Px8PUZtPcX/1vD1QW+e+txkY4rqmZTi1w22X2EztNTgcoFIbHR6lQ/w4hjDAz7WFvRm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727935468; c=relaxed/simple;
	bh=X2pDXwzUvcJDk5paVKoKsB3r0vt+Ai0zPt8NKqANJkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFx4rybs6WkjpzJ4FLCeG1BDfEHoM2NYhLLe/b1rLfQjxuvA2u5OXQy3/+qfYLIR5h0Yw9ErDYOdUed+HTvhe3bTKmypgGmf1wdGTWebLKGrx0GLRXr82IOP199WGZzw8UtzxcRahiLSpLA0mHKF32+Un7mAi2psxbufwWvhEAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f/Grd3nY; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f/Grd3nY"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20b84bfbdfcso11375245ad.0
        for <imx@lists.linux.dev>; Wed, 02 Oct 2024 23:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727935466; x=1728540266; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DSlA9LdetpttvG342s77JyTcYN0Pv4f2/NSU0/ow4Vw=;
        b=f/Grd3nYTkqmGH9MxII52E2myLWOZCc5wRTbFXrgPPLRWUv0r4fH3xspKddPKP9KwJ
         zkUqk7OPQsmvlxdyS3HkT7jX/jVqXQq0BwsxxSiBRsEPI9nXfA/+oczfx9pmbfRCIfdi
         aKYo41Zi8201z5KEhMlwrQ0IKUDgXpGbum/DHTFBz9+B8TYU49bR0s1IFmWGz5LDniia
         hWglTXSDi5WcSrEEAUiEHPkotqALihav58w6587FqKczc6asm3knO28yHE29FxIiqOqx
         kTNsGbU8m1DyPUWPAN5bgUoyS65ToNjOIcuE7FmmffPobB0aVJwgG/jsZst56YzigX+7
         Xeag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727935466; x=1728540266;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DSlA9LdetpttvG342s77JyTcYN0Pv4f2/NSU0/ow4Vw=;
        b=M8lfQxCwbPPz1rJVLYY7JE9TyFGSvhuhsL5QuYEYm2ZeiCe+Xmfob6730w1E18/1jh
         7fbz5qpR6ViXDqULFVzKON8bCT6ED8MxNVuu+L/ScOa8l36YaMek+dZuWFYWce1f5RFc
         G8N3YewxVOJEV0oL4qbJT8pYVP8pVPoS3U/2CvOnEzFJABTcHM9/Ut84dzxd5l7QwOjQ
         56SgOtkWzppXhdnnRIHllaiVZ8HVfMDkteTcZsPi5qrFPRMCcSsi7ffP2vLt88pl+APK
         my/OZJSccZTagxJEl/B3SZkJMuMk9k7tOXZoanWPItZoViZosgNd0KTqmdQrGaZ6XItq
         WoNg==
X-Forwarded-Encrypted: i=1; AJvYcCVws/FrSAoulqnR63FZErokSCZmwLe7HjRyy7s1U583Jt/yAw8o+BRd20cnWb7JRTzDGME=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcpeWS8LrMLBrsWJ5Ze4IzaE+AGm0O2quu53ixdFEzrNRObnQF
	XBNayPRUogepd/mhkfDayZ4LgJfd/E7un5cFHGoIKIrMRlIlJCoD8EcGGsPlHA==
X-Google-Smtp-Source: AGHT+IEbkU9RN3nbPopsmQ73+roAKVA+VXZZkTBotV2rwtzyji8m7LBm5NKo07zHuz5P5iw5DLR6+A==
X-Received: by 2002:a17:903:11c3:b0:20b:59ae:fe1d with SMTP id d9443c01a7336-20be193af84mr29711125ad.25.1727935466244;
        Wed, 02 Oct 2024 23:04:26 -0700 (PDT)
Received: from thinkpad ([36.255.17.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20bef7fd9casm2384025ad.245.2024.10.02.23.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 23:04:25 -0700 (PDT)
Date: Thu, 3 Oct 2024 11:34:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: jingoohan1@gmail.com, kwilczynski@kernel.org, bhelgaas@google.com,
	lpieralisi@kernel.org, frank.li@nxp.com, robh@kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v1 1/2] PCI: dwc: Fix resume failure if no EP is
 connected on some platforms
Message-ID: <20241003060421.lartgrmpabw2noqg@thinkpad>
References: <1727243317-15729-1-git-send-email-hongxing.zhu@nxp.com>
 <1727243317-15729-2-git-send-email-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1727243317-15729-2-git-send-email-hongxing.zhu@nxp.com>

On Wed, Sep 25, 2024 at 01:48:36PM +0800, Richard Zhu wrote:
> The dw_pcie_suspend_noirq() function currently returns success directly
> if no endpoint (EP) device is connected. However, on some platforms, power
> loss occurs during suspend, causing dw_resume() to do nothing in this case.
> This results in a system halt because the DWC controller is not initialized
> after power-on during resume.
> 
> Change call to deinit() in suspend and init() at resume regardless of

s/Change call to/Call

> whether there are EP device connections or not. It is not harmful to
> perform deinit() and init() again for the no power-off case, and it keeps
> the code simple and consistent in logic.
> 
> Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../pci/controller/dwc/pcie-designware-host.c | 30 +++++++++----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index a0822d5371bc..cb8c3c2bcc79 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -933,23 +933,23 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
>  		return 0;
>  

There is one more condition above. It checks whether the link is in L1ss state
or not and if it is, the just returns 0. Going by your case, if the power goes
off during suspend, then it will be an issue, right?

> -	if (dw_pcie_get_ltssm(pci) <= DW_PCIE_LTSSM_DETECT_ACT)
> -		return 0;
> -
> -	if (pci->pp.ops->pme_turn_off)
> -		pci->pp.ops->pme_turn_off(&pci->pp);
> -	else
> -		ret = dw_pcie_pme_turn_off(pci);
> +	if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_ACT) {
> +		/* Only send out PME_TURN_OFF when PCIE link is up */

Move this comment above the 'if' condition.

- Mani

> +		if (pci->pp.ops->pme_turn_off)
> +			pci->pp.ops->pme_turn_off(&pci->pp);
> +		else
> +			ret = dw_pcie_pme_turn_off(pci);
>  
> -	if (ret)
> -		return ret;
> +		if (ret)
> +			return ret;
>  
> -	ret = read_poll_timeout(dw_pcie_get_ltssm, val, val == DW_PCIE_LTSSM_L2_IDLE,
> -				PCIE_PME_TO_L2_TIMEOUT_US/10,
> -				PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> -	if (ret) {
> -		dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
> -		return ret;
> +		ret = read_poll_timeout(dw_pcie_get_ltssm, val, val == DW_PCIE_LTSSM_L2_IDLE,
> +					PCIE_PME_TO_L2_TIMEOUT_US/10,
> +					PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> +		if (ret) {
> +			dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
> +			return ret;
> +		}
>  	}
>  
>  	if (pci->pp.ops->deinit)
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
