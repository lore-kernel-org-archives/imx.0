Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EF11E2601
	for <imx@lists.linux.dev>; Thu,  7 Nov 2024 11:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730978020; cv=none; b=GKXD9l0dSd2dqkLDu3iod/OspGe7ADMNaF531uSQM7/ps08MSjWkL0uEYjgaxlt8kRg+6dSxer+eA1AeBuEJMr+INUGLZdUWKx3gPhoeo//X9tsM5mbidyNgbO6vU8/qgLESonNY7xpaiqDSnVDfhdKoIlv3yFfxQV13pOPxW64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730978020; c=relaxed/simple;
	bh=xR5pdVfgkT00dQCFk3s5OdvuMU6MRoAKCsf2yaeddaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKyfDmJo6TQxhXL7DCOpDJFXwNB9Uvi0D7VXf1RTBdYlvThLRqI7omUwwtQw8CPyM3LbuiEIbn/6ZuUpaSmj8Lg4YzEPWQT5JL4lBC4Y6YTGp3OYIem5J6FswBNozRCVvM3Qt/W5RwKqCqdSnvOv2oEKfI6sSBNvdF1fVhHwim8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KSGNs8b7; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KSGNs8b7"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so1225984a12.0
        for <imx@lists.linux.dev>; Thu, 07 Nov 2024 03:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730978017; x=1731582817; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4/3w+/l9YSjeY64zgTCdy6DkO3ioqAuiza1Q3OTguoY=;
        b=KSGNs8b7PQEp5W10FxB1DZQ1gajO8GfxDQzPX/RL/jQsQAsPW2fB37ka8mr7ipB5NJ
         3seOnsaepN4Lt7CzKivobDtys9VZltL/KPnE9R25bnzEp+1bOKufbsRDKxFVrv1OOE3o
         Tpx4DZAutLkp3wx7VHYAtvNjB1DadbLEUByPUOL0MiE/OwPy70Jm+RNizZd4GDDPZptu
         FPYbsAI1ClkCH7g2Vp2siLpQMp4k6UvHLAUJteaEQOK5ra8RsIYhI8Phwm4dA2p6BhyG
         8FTta/AXaePmvp7LFUGlinkctbi/leE2Q0lopH7AfALGTHk814YDBzFB+HrLc1l9IvpZ
         HgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730978017; x=1731582817;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/3w+/l9YSjeY64zgTCdy6DkO3ioqAuiza1Q3OTguoY=;
        b=CemelqaIS4aExql/IO4q1evl7KGeD4/nN4dAhrUd7YBaEDpvOz8QyGu42u3srxQv/p
         nIhTdaoBCm29EcCjsF3NmP+Y+dRhpfXtirPmp+UvvgnS9tNTyBhBMpd523VGfy6vspFO
         7osrF7JGgYzUgC7UhSEp5u3VFBEy0zZV6A1/vaqOOOijqHsWYDJh/ser2dVmVTnCptPh
         jC+5nCxytDHCv7YwuHXqtQddqixFP1gy44NnY+wkWF3LoGsryWcIHEBaw137Xg0VDpC0
         x5mKObIhrAZVRkpTIustWtnLCJQu7Z9495ssFuusJXxNoXHrEyScG7K23lZF1JLWJsMY
         VX8A==
X-Forwarded-Encrypted: i=1; AJvYcCV6VJsyuiawCmXVlyPrA6w/UY/WC939vgXW4QLKcia3dldsxKNDcRzP2F6X3fCefI941gc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkcedXPV3PuwKdLz5BCch2Mdl0X5vTH3aT7VnH0O5tSMCp3qYH
	JgwztXNhRa+jxQmuTv6ZUg+t8NT0x9KsFdJxYapNAfYGVjvS6DCWwGRxWN4jzQ==
X-Google-Smtp-Source: AGHT+IEF+y4T/yBDvNKsM1yFvgAPhXYXn3816WCOJX1Gqz/PtM2p2O/kE8pi/kOMGYXwMKuR2W+sFQ==
X-Received: by 2002:a05:6402:5188:b0:5ce:d3a9:ae76 with SMTP id 4fb4d7f45d1cf-5ced3a9b427mr9874492a12.3.1730978017061;
        Thu, 07 Nov 2024 03:13:37 -0800 (PST)
Received: from thinkpad ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c7cabbsm658776a12.79.2024.11.07.03.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 03:13:36 -0800 (PST)
Date: Thu, 7 Nov 2024 11:13:34 +0000
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: jingoohan1@gmail.com, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, frank.li@nxp.com,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] PCI: dwc: Clean up some unnecessary codes in
 dw_pcie_suspend_noirq()
Message-ID: <20241107111334.n23ebkbs3uhxivvm@thinkpad>
References: <20241107084455.3623576-1-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241107084455.3623576-1-hongxing.zhu@nxp.com>

On Thu, Nov 07, 2024 at 04:44:55PM +0800, Richard Zhu wrote:
> Before sending PME_TURN_OFF, don't test the LTSSM stat. Since it's safe
> to send PME_TURN_OFF message regardless of whether the link is up or
> down. So, there would be no need to test the LTSSM stat before sending
> PME_TURN_OFF message.
> 

What is the incentive to send PME_Turn_Off when link is not up?

> Remove the L2 poll too, after the PME_TURN_OFF message is sent out.
> Because the re-initialization would be done in dw_pcie_resume_noirq().
> 

As Krishna explained, host needs to wait until the endpoint acks the message
(just to give it some time to do cleanups). Then only the host can initiate
D3Cold. It matters when the device supports L2.

- Mani

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  .../pci/controller/dwc/pcie-designware-host.c | 20 ++++---------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index f86347452026..64c49adf81d2 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -917,7 +917,6 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
>  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  {
>  	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> -	u32 val;
>  	int ret = 0;
>  
>  	/*
> @@ -927,23 +926,12 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
>  		return 0;
>  
> -	/* Only send out PME_TURN_OFF when PCIE link is up */
> -	if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_ACT) {
> -		if (pci->pp.ops->pme_turn_off)
> -			pci->pp.ops->pme_turn_off(&pci->pp);
> -		else
> -			ret = dw_pcie_pme_turn_off(pci);
> -
> +	if (pci->pp.ops->pme_turn_off) {
> +		pci->pp.ops->pme_turn_off(&pci->pp);
> +	} else {
> +		ret = dw_pcie_pme_turn_off(pci);
>  		if (ret)
>  			return ret;
> -
> -		ret = read_poll_timeout(dw_pcie_get_ltssm, val, val == DW_PCIE_LTSSM_L2_IDLE,
> -					PCIE_PME_TO_L2_TIMEOUT_US/10,
> -					PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> -		if (ret) {
> -			dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
> -			return ret;
> -		}
>  	}
>  
>  	dw_pcie_stop_link(pci);
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
