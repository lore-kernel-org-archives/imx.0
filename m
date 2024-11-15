Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDA318734F
	for <imx@lists.linux.dev>; Fri, 15 Nov 2024 06:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731653552; cv=none; b=ssYodlGZtqM/m7Flc2uHOvodbqvsusiW056rv1+xxovXAKWWUwUvdrHym1q1S88lnJwwVXk7oBGTtNoFQSHW8nb1ubdSrRVN4DCYEYD/gs3dAjaWY8VDujploa3BFTQmkB1TRjSUEFzIp2OvLWFTNG7wMQOPl+rPFXSkrj0L+/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731653552; c=relaxed/simple;
	bh=CEMXhu2MGYVzDLJ2Eh1N2Pyu48lfVTlo3bSjDF1UB9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJEoR5GPZeQpUNBgJZXNoYQD4cfNizvhDY9MSU01iJBIllwNhUlg2IDeQ7yr1wTh54+sDnYC0Lin0D/040eimfOFb+QDRgNbRPlFKp8r+XLv3kM4DMC/s8pRy5NLjOeFANk87KfuXozBqwypIU0YyzSKAoVTlVtWNM5ZbRMcBRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QKQPB/L/; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QKQPB/L/"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-723db2798caso1311944b3a.0
        for <imx@lists.linux.dev>; Thu, 14 Nov 2024 22:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731653550; x=1732258350; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4/1UwVe3Qsy2MB0A1h4O60dSR7MLmU1E1u1iWJ0FEAI=;
        b=QKQPB/L/GUNktpL265CUQAXF+k9JA3yOTwIqvj7uhuSzQ/dKuUJR9SvXHNXnXeKsj9
         iEMq4soCkBZFws04bb4u2vaHmPkxIgBjV/UKSxriM3Y33JK3X+5D8Bk5n+Z7k4DqUdO2
         KwKcaFmyEyQrcmSgSyt3ivekyss9cLrmlYe+rfP7DO5ph0ROd7SwU1gWOru+nxLml86m
         nXEmh5P/Z3+PNslYnbZqgBNtY/b4We4ipSkF+N5428EzS++1veecR0UqqaKXVJ2B0+e2
         7bSH4Sy6MPfzg1uh0BcBQHIl/sqH4CarFOOowou/6hUxvzKggVRzQWJxsYVvG+iVILof
         5Acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731653550; x=1732258350;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/1UwVe3Qsy2MB0A1h4O60dSR7MLmU1E1u1iWJ0FEAI=;
        b=hC1kp+bHRDEuMHqKHlj06+U5ZoZvOMsTg4PfgXnlynY5U250ySzAgxPnA2fjXjQP3b
         vZN0DJUcSUv7iSesMmC8I5AITRhCoqK+B0kAb7P9ezVUvZZ2CVJY+BpCIkH90NQWJjcu
         CutM7jfvepAxVYSn5LM8x4tnuqblEwC7QijCCq83xAlrnm0ah7t4ZcYIyZA3iEBVNFwa
         20ImJf9lvcSUgBjSzVkZy6iPbVokiJgM9SN7ttCQQUtXBvob256gHHlNhr0X2ajRqCAh
         ix00wqDRqE+3uWUyDz0NhXzVZH8aIE7quE69Flwkn4wt0jH42Mq0SroQPhJEtOU+N6Ir
         e9aA==
X-Forwarded-Encrypted: i=1; AJvYcCW4B+fst1/ke6I+jG7jqfzlgycUl4xRqgvcgvYX8/Uv8dJ1eneH0v2WBlLxEni3q8At2YA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcC+Xs6IZoAEgqG66aLh5dbHtx6pibhSMaEj2ejg0/y4DQjvv4
	HbJMkiJjNwRXBvdymkGa5CEsvjppPMcQM7tkJ8o2wVi7gFiheHst1E0NqpK/aA==
X-Google-Smtp-Source: AGHT+IE/YBLChBCuslucF1k1xTrQEVYs0lhSpDpzi5LeohRmyIqqfR8TDB+1oTszXaCrfQURCH52AQ==
X-Received: by 2002:a05:6a00:998:b0:71e:44f6:6900 with SMTP id d2e1a72fcca58-72476cfc9a9mr1771780b3a.16.1731653550107;
        Thu, 14 Nov 2024 22:52:30 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7247711c0cfsm690383b3a.51.2024.11.14.22.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:52:29 -0800 (PST)
Date: Fri, 15 Nov 2024 12:22:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 05/10] PCI: imx6: Make core reset assertion
 deassertion symmetric
Message-ID: <20241115065221.scfb2chnoetpdzu6@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-6-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101070610.1267391-6-hongxing.zhu@nxp.com>

On Fri, Nov 01, 2024 at 03:06:05PM +0800, Richard Zhu wrote:
> Add apps_reset deassertion in the imx_pcie_deassert_core_reset(). Let it be
> symmetric with imx_pcie_assert_core_reset().
> 
> In the commit first introduced apps_reset, apps_reset is asserted in
> imx6_pcie_assert_core_reset(), but it is de-asserted in another place, in

I'd suggest rewording like below to make it easy to understand,

"PCI: imx6: Deassert apps_reset in imx_pcie_assert_core_reset()

Since the apps_reset is asserted in imx_pcie_assert_core_reset(), it should be
deasserted in imx_pcie_deassert_core_reset()."

> stead of the according symmetric function imx6_pcie_deassert_core_reset().
> 
> Use this patch to fix it, and make core reset assertion deasertion
> symmetric.
> 
> Fixes: 9b3fe6796d7c ("PCI: imx6: Add code to support i.MX7D")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

With above change,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 996333e9017d..54039d2760d5 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -772,6 +772,7 @@ static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
>  static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
>  {
>  	reset_control_deassert(imx_pcie->pciephy_reset);
> +	reset_control_deassert(imx_pcie->apps_reset);
>  
>  	if (imx_pcie->drvdata->core_reset)
>  		imx_pcie->drvdata->core_reset(imx_pcie, false);
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
