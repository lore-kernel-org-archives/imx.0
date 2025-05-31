Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EFE14F9F9
	for <imx@lists.linux.dev>; Sat, 31 May 2025 17:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748713826; cv=none; b=Rhhm7ZBn0l2Ya6scCjFstfOZ2hFlsZRbP2nCFlB2uB3E5PeOPLRh8ez9feQKrMAaXDngpmE10nHsRdQblrjDymxed+XIh9PHbRACPwUDiXK2ft22okeRa1TMiEQrJHho8VrUGbBe9x8mVZlDT2ipOcjSLzCOBBlDT7hN9dV4FQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748713826; c=relaxed/simple;
	bh=HCvJG+sgtpgwdiZu6mAcUtxYGNjIK0MPNLZyapgK+HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScNB01YrTVqAPRMdTVX4QMcZWYu/6NvRBo5TZYv6g95yMyyDfSxjoei/11U07dWvfv94RQXq6hcif/72wZcOfEGhtv6sm5/Nae45Y3tQeL0b62WOFopY10j8zA/PemBEblx9+kq152JLUakH0hGBT6KHiDLdKItk7CimpnCcgHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k8pdxSxw; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k8pdxSxw"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742caef5896so2411886b3a.3
        for <imx@lists.linux.dev>; Sat, 31 May 2025 10:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748713822; x=1749318622; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AbNlKkJboN5wZoU7ozNTe8jKHTn2i9ktrC3fw6ibsc=;
        b=k8pdxSxwLW4laIj6swwtxwXRIFlJDnUm3vGiMc9kHwfli3IQx1ZPjDFZb+TuukWjaH
         yEbzCrlUvPKvyEC32WY5B388GKn/Iy2MwdTGtwgbcQee+480uGr19QPE2dQbwBojOL/5
         og3AAKpNYJQ/r7+6nRVrBqKCHd6d/Bju397ARuDPpJ+9dZGD14yXws5qCm4DlVNQIp5W
         71jbCPz5qz1bjInBa6yOki7wOLTqRJ+SJINzY/c5xqKxyfEyYTjF6vIvf4D1mvCyCw5T
         Oba1gsHiE6X0oj+jdpL8o7dvLem4ibSq0oAchDwIwSaImboKEa1Kp0+SXdb+93s2uZWM
         hpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748713822; x=1749318622;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5AbNlKkJboN5wZoU7ozNTe8jKHTn2i9ktrC3fw6ibsc=;
        b=vAVfmjghtnO8kPWmKjwrZT4tdK7NSLy8ZcIWUywiMTH7IWHNweOePzgpDLSSdOsHIV
         pHpHCNyqY4TK/3/3QYjs6AAlNDhWsEmnfQPp279GH6ksT3L7r7H7bASiGg6X1g4oHbgp
         OWO8j9nz7b0rMAS2BlkcYW1eKkU55E8Vi42BaVoT9Faeoha7MpnYeXF2WOfUHyHQfUPD
         EmQ7qXl6WgtPmY7dKbRH/OKVqmQg1d8l/5RGcDRmVrH/0aucQJtmj+z7wVoKWp/tLohP
         Gk2fUxi18t4T1SlVogBIV6g+v9yELNv5CwkmtlbFY1aUKd3R/aaDnwgMLXyIEMYlR+Y6
         nRag==
X-Forwarded-Encrypted: i=1; AJvYcCWGirloVay5z/NVdHTLwSYnPIIg3Cd/Yj8NFrRRlCpP2YpTg8sigI516r+4MUmrGGuV7JM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOLjyb3rPlTXXKyt4jwRnYbC2+70IaqZrMnY0nI6uZKkm+iVY/
	woHYawBA7DDWj7ZK1Rat+IyCHuYnLhZT4Ygc393BLFlPS0qicoBk7ht3AN1osKyfqg==
X-Gm-Gg: ASbGncu9rViFX249AGxjVK/pEfO3wRZELy/SzAubztuFuzGiSy3AwaSAXCK4rCj15I7
	wqQCrDLSelYV2wt2F2iNdxUY9ZVsTw2RfkMzFKc5r8wvU2m0Zf5ySSCvaiBXeb0HQVSbJWsLJCY
	riGQHuwXVGPxVAKEt/ewS3UbjFCv7JQQBMnJbgNR/dpMYgoRgA0AjxN98UxNvtHPZiJYGDIdW7f
	30Uk0grIwUrCyl5EPLAIXWju3o8RhsEpd57ftu7yLmuIfU6KgQyesyhIPKELKE1YHLrVSS00GqJ
	NmDDMcg4Fgs1k8MhHWu+DAT/kE5Xtl5Z62EAKMUUFXXlCzynGWRngPPYrONMuQ==
X-Google-Smtp-Source: AGHT+IEdPK+JHZ+t44u8hV+Tuwo0Dn5k2WtHvYf+YRYNtFb+Y0T4pf/Gas2+IG+qUK9yX+xyBHPdxg==
X-Received: by 2002:a05:6a20:1583:b0:218:76dd:a66 with SMTP id adf61e73a8af0-21ad95636d1mr11124498637.13.1748713822539;
        Sat, 31 May 2025 10:50:22 -0700 (PDT)
Received: from thinkpad ([120.56.204.95])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb4834sm2748724a12.74.2025.05.31.10.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 10:50:20 -0700 (PDT)
Date: Sat, 31 May 2025 23:20:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: jingoohan1@gmail.com, frank.li@nxp.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] PCI: dwc: Add quirk to fix hang issue when send
 out PME_Turn_Off Msg TLP
Message-ID: <xq6ojgyh5tpm4zbpymb2wvtf4at3xq7bai3ztuublgh63e7qdn@vfxan6mew3os>
References: <20250408065221.1941928-1-hongxing.zhu@nxp.com>
 <20250408065221.1941928-3-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408065221.1941928-3-hongxing.zhu@nxp.com>

On Tue, Apr 08, 2025 at 02:52:19PM +0800, Richard Zhu wrote:
> When no endpoint is connected on i.MX7D PCIe, chip would be freeze when do
> the dummy write in dw_pcie_pme_turn_off() to issue a PME_Turn_Off Msg TLP.
> 
> Add one quirk to issue the PME_Turn_Off only when link is up to avoid
> this problem on the PME_Turn_Off handshake broken platform, for example
> the i.MX7D.
> 

Why do we need to send PME_Turn_Off if there is no endpoint connected? We should
skip PME_Turn_Off and L2/L3 Ready transitions in that case.

- Mani

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  .../pci/controller/dwc/pcie-designware-host.c    | 16 +++++++++++-----
>  drivers/pci/controller/dwc/pcie-designware.h     |  1 +
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 0817df5b8a59..a62bf7e0ade8 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -956,12 +956,18 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
>  		return 0;
>  
> -	if (pci->pp.ops->pme_turn_off) {
> -		pci->pp.ops->pme_turn_off(&pci->pp);
> +	if (dw_pcie_get_ltssm(pci) <= DW_PCIE_LTSSM_DETECT_WAIT &&
> +	    dwc_check_quirk(pci, QUIRK_NOLINK_NOPME)) {
> +		/* Don't send the PME_TURN_OFF when link is down. */
> +		;
>  	} else {
> -		ret = dw_pcie_pme_turn_off(pci);
> -		if (ret)
> -			return ret;
> +		if (pci->pp.ops->pme_turn_off) {
> +			pci->pp.ops->pme_turn_off(&pci->pp);
> +		} else {
> +			ret = dw_pcie_pme_turn_off(pci);
> +			if (ret)
> +				return ret;
> +		}
>  	}
>  
>  	if (!dwc_check_quirk(pci, QUIRK_NOL2POLL_IN_PM)) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 05fe654d7761..d752af660e95 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -283,6 +283,7 @@
>  #define DMA_LLP_MEM_SIZE		PAGE_SIZE
>  
>  #define QUIRK_NOL2POLL_IN_PM		BIT(0)
> +#define QUIRK_NOLINK_NOPME		BIT(1)
>  #define dwc_check_quirk(pci, val)	(pci->quirk_flag & val)
>  
>  struct dw_pcie;
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
