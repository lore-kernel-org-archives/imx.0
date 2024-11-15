Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E5B2BB1B
	for <imx@lists.linux.dev>; Fri, 15 Nov 2024 06:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731653832; cv=none; b=GnO4ppUJ/Spv0V9Wqpdqt2Be3KSpYWY5Nfuwymn+dbFg6VqG07oCNolZjmivlRus0VyxCH9k89ZaHXnX90+WyhzQ+ra7oGDJjNWEILD9WgKadXo5+pdbjeGtBPDBLcBcvKCFYkv6RGxXHSrJBTrdGVcpCkUUCVOT5Rl1ywgnnjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731653832; c=relaxed/simple;
	bh=dpza+eGWv/xmHMp57zlEEJfK0Yeu8rMvSSrLh34VFDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lh31iH9M2HI8SP/kIQbIHDBd+H/RyY/N2S+5U2Wdj09cmVSUIImamq42oW+blwkuDcSVATY7Wife594B3igD2oz5iLMuFbRHYTrN/3ChgKKFiYXPnmCTmXxBVE+0bzKpcFJu2oUS0x++/tPluH4hbQJacS+DlyZy9b/+btLQPrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VU4HzptX; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VU4HzptX"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cb7139d9dso15917915ad.1
        for <imx@lists.linux.dev>; Thu, 14 Nov 2024 22:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731653829; x=1732258629; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UUnANkLZ+cRlOTdO0AUsRhtlxHbXsgSkLLst9mQNAEg=;
        b=VU4HzptXnODbHtWgkypVzfDyJ0X4TguEWmQjZr1zEPJdNyGDMiINOIukZLgXK3cmxy
         jhHBgFGVozDH/GWjY12s6KbmVQAZJN2Yn+L+m5BaxRIb6SQ3HeeUY1xaKrENqiHB+5iH
         LUqsLiAASH7izZgDH6S5ydL8S9aTrW+U8yEWngNlXDLQ/TP0UrztsH/EvfOQfln/ldyT
         YCrDQTeL+bYt4gdaaCZ/49xOd7ySmmhjO4CnaV1o9lTmnKF3CETA6+nxvrc0X7MmO9WI
         L8xrcg3cTxwSMl8HGxXI+oKgv6k+/63x3JjbX7mWd1byoBBRqaVygKAAa7KcHNYpr0ZM
         yzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731653829; x=1732258629;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUnANkLZ+cRlOTdO0AUsRhtlxHbXsgSkLLst9mQNAEg=;
        b=p0QEaXX1YWDyCzvxQtPktXdTq+NGyGECSeD/sywy62OOUFNLvi7uAk07krDVO1hmQ3
         b1uPOdAqvQqehdOjxf7wLMv6X0yFbBkr96RRp6rTPAcQjS20SQrSKG43L1PzA2QJXWtV
         MYSxPW49PY/YEH8vBkziANuqPkPjSw9/PFR32xuGaJg/mPhZk6Yk2NszRNVLfagAbZjo
         7XoCfgOsvFm4/IshtKYRS4aSFoVXBZ9JAzlrBZRU3qc1Pc6QlnbKOKBbh6DPGtgr9awu
         xuSS88gW8B/e5NG8PT6B0gFJx1Xm+JxVKo5nl6TG9gaJEyUeYd6i5hnSvd5tmojc1FrL
         j4Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXWxWzajERtlb10P7Y0IO1F4mPOjXepWRylvkG3hjznAoq6kJoT7h6vAQ3+4y05Vp4r2vA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHen5KCrROMI5D+jMTNjwWGNyy88T4un0jcwoni+2y4XQ8Li8A
	gZ6XuKkh8tci3Dno64ySmaB6PLGdbMgVuRuBxWhbVWlllDQe4IJMXKHwcu9U5w==
X-Google-Smtp-Source: AGHT+IGyxlQ3XKDLt3Kpg+bOwQr2O6U0ym9WxGmFcCu7LdeG9Tf0de/64JRmH23hKPfODvd+Dxxf8w==
X-Received: by 2002:a17:902:d48c:b0:20c:94f6:3e03 with SMTP id d9443c01a7336-211d0ed2e36mr24090375ad.47.1731653829586;
        Thu, 14 Nov 2024 22:57:09 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f34698sm6210935ad.133.2024.11.14.22.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:57:08 -0800 (PST)
Date: Fri, 15 Nov 2024 12:27:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 07/10] PCI: imx6: Clean up codes by removing
 imx7d_pcie_init_phy()
Message-ID: <20241115065700.gfz7dmoijhh43lhd@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-8-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101070610.1267391-8-hongxing.zhu@nxp.com>

On Fri, Nov 01, 2024 at 03:06:07PM +0800, Richard Zhu wrote:

> Remove the duplicate imx7d_pcie_init_phy() function as it is the same as
> imx7d_pcie_enable_ref_clk().
> 

How about.

"PCI: imx6: Remove imx7d_pcie_init_phy() function"

This function essentially duplicates imx7d_pcie_enable_ref_clk(). So remove it."

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

With above change,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index bb130c84c016..fde2f4eaf804 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -390,13 +390,6 @@ static int imx8mq_pcie_init_phy(struct imx_pcie *imx_pcie)
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
> @@ -1526,7 +1519,6 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.clks_cnt = ARRAY_SIZE(imx6q_clks),
>  		.mode_off[0] = IOMUXC_GPR12,
>  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
> -		.init_phy = imx7d_pcie_init_phy,
>  		.enable_ref_clk = imx7d_pcie_enable_ref_clk,
>  		.core_reset = imx7d_pcie_core_reset,
>  	},
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
