Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB215215F6C
	for <imx@lists.linux.dev>; Thu,  7 Nov 2024 16:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730997066; cv=none; b=Skh4XRwPX/ohjGo+XHAwbGui+2xQxWJWnxcTvJ3ClcJS4zu9Ty/EkRmyXqvRO69tJjuIEenDtqFc2OYmddHXkmOLN1OHH80+M7GwL/rsEL7KxWA3Yu8tg7L8zelJd822EZiPY0m7t1hc9o3oUeEnx12fniknns+uh8i0x9kMMiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730997066; c=relaxed/simple;
	bh=t3GKQ93gnY+IQZ99F1ny/61LvAa2Wpx/BVP9oL9INX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNLX7Gp74XveQaIVLjp+A5s3MtnUJHkStMbYSkUsUbWH/AXtWHcubuf7w6nT0H1ACuf7xXMA8mYH5MaLFtWrVPVJ5ItXBnRTut+D3WSX/C2qCVarrKE5hU1qMofHmMN2PzTf6mTSnvaVlzLmr0tuENZhG8l3lJ62IH/HeaJJISw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HFbMlsHX; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HFbMlsHX"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d47b38336so811542f8f.3
        for <imx@lists.linux.dev>; Thu, 07 Nov 2024 08:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730997061; x=1731601861; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eGn2f45tYzpwIDupkR6z6PhyeqcvE77Fm8hNIVc/RIg=;
        b=HFbMlsHXmNh0NdsnkpWOjxqkEbLP2hg2fYA/JufuLbUXJndPAJiAKGsGY1741maHYt
         SxSoUns2TNkCrb8XUPFO6j5jq3HdZvNxsEYBI3xoCpIsum403BqVatZiygiCkGxj22M1
         LvqbksXSgwZqJackGoUor1ukIQB3jhNb/UHL0Hlw3sU6CwbIYoEr5lc7IRfS5kTff0jp
         el1VsQFUBoixpvEg5r5aEH35gjW5qkSD41y9gTas0ZbFgfRiMr1TsLPTZYZbyqTq4ny+
         I/npXpDCIf9fRHuWtfqAZxKHWF8uF3gJ5f0zCeWhZqPnyS5RWqS/6enFkawbPRoM39ZN
         pQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730997061; x=1731601861;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGn2f45tYzpwIDupkR6z6PhyeqcvE77Fm8hNIVc/RIg=;
        b=vNqjEAL+ke41Wcy/tMr25+0P1axfquuT95epf05lnICFJPNq8VzmTAMPvt29JWy8e7
         DY382d6Y2PVbmFXQNKaYlRhdCxHKbGqVR4DTOeG63bH4eLKNBtDLgQlbMiErw7lMYZmC
         DoTGjXT5nV7A18PNbXz18WO6RdzZKasSKe8HMoPOpg1qJewrWt5Tgg1k3O80TOl37WVj
         RxuvtT6VakrfNRkgi9WF6H48zWkU93Y30kyCfjWxdqPA4M500tPpA2MC4VtuKP/+n/JI
         MtfPQslrcinmmB+FHsG+MYnS/VvKego5mkwhCmZ1cv405TZzlBefkmFZ16lmCVm/jFmw
         kk5A==
X-Forwarded-Encrypted: i=1; AJvYcCWP6su5vm8xvDyab+zCj4Ce3uh6aS5+TdCK4E7ULCKhI+Mb38uKYJbTEjhaZg9WA6dNIZI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOj/UtL29Hdvy7p0QpqT9cuNcCm4xTHRlLTKHRr7lxnZ4ehG9y
	v2HqJ9R741MPPTeH5M9wWeadK7XuI8zGUr+a7gh/UTCc30/WeOtvw0A8YMXtPg==
X-Google-Smtp-Source: AGHT+IFn8hMMlS1vuzDlBFPgri4GJhUAcCDVni34CQZgGkvMHUH9vsy1be+oNOc80rBebleeE6GosQ==
X-Received: by 2002:adf:f784:0:b0:37d:4aa5:eae5 with SMTP id ffacd0b85a97d-38061221e2cmr29305957f8f.55.1730997061238;
        Thu, 07 Nov 2024 08:31:01 -0800 (PST)
Received: from thinkpad ([89.101.241.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda13780sm2103038f8f.109.2024.11.07.08.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 08:31:00 -0800 (PST)
Date: Thu, 7 Nov 2024 16:30:59 +0000
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, jingoohan1@gmail.com,
	bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, imx@lists.linux.dev, kernel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] PCI: dwc: Clean up some unnecessary codes in
 dw_pcie_suspend_noirq()
Message-ID: <20241107163059.q64qebgwzn377fwb@thinkpad>
References: <20241107084455.3623576-1-hongxing.zhu@nxp.com>
 <20241107111334.n23ebkbs3uhxivvm@thinkpad>
 <ZyzmBQlt5WJ+D9xM@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZyzmBQlt5WJ+D9xM@lizhi-Precision-Tower-5810>

On Thu, Nov 07, 2024 at 11:08:37AM -0500, Frank Li wrote:
> On Thu, Nov 07, 2024 at 11:13:34AM +0000, Manivannan Sadhasivam wrote:
> > On Thu, Nov 07, 2024 at 04:44:55PM +0800, Richard Zhu wrote:
> > > Before sending PME_TURN_OFF, don't test the LTSSM stat. Since it's safe
> > > to send PME_TURN_OFF message regardless of whether the link is up or
> > > down. So, there would be no need to test the LTSSM stat before sending
> > > PME_TURN_OFF message.
> > >
> >
> > What is the incentive to send PME_Turn_Off when link is not up?
> 
> see Bjorn's comments in https://lore.kernel.org/imx/20241106222933.GA1543549@bhelgaas/
> 

Thanks for the pointer. Let me reply there itsef.

- Mani

> "But I don't think you responded to the race question.  What happens
> here?
> 
>   if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_ACT) {
>     --> link goes down here <--
>     pci->pp.ops->pme_turn_off(&pci->pp);
> 
> You decide the LTSSM is active and the link is up.  Then the link goes
> down.  Then you send PME_Turn_off.  Now what?
> 
> If it's safe to try to send PME_Turn_off regardless of whether the
> link is up or down, there would be no need to test the LTSSM state."
> 
> I think it may happen if EP device HOT remove/reset after if check.
> 
> Frank
> >
> > > Remove the L2 poll too, after the PME_TURN_OFF message is sent out.
> > > Because the re-initialization would be done in dw_pcie_resume_noirq().
> > >
> >
> > As Krishna explained, host needs to wait until the endpoint acks the message
> > (just to give it some time to do cleanups). Then only the host can initiate
> > D3Cold. It matters when the device supports L2.
> >
> > - Mani
> >
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > ---
> > >  .../pci/controller/dwc/pcie-designware-host.c | 20 ++++---------------
> > >  1 file changed, 4 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > index f86347452026..64c49adf81d2 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > @@ -917,7 +917,6 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
> > >  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
> > >  {
> > >  	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> > > -	u32 val;
> > >  	int ret = 0;
> > >
> > >  	/*
> > > @@ -927,23 +926,12 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
> > >  	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
> > >  		return 0;
> > >
> > > -	/* Only send out PME_TURN_OFF when PCIE link is up */
> > > -	if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_ACT) {
> > > -		if (pci->pp.ops->pme_turn_off)
> > > -			pci->pp.ops->pme_turn_off(&pci->pp);
> > > -		else
> > > -			ret = dw_pcie_pme_turn_off(pci);
> > > -
> > > +	if (pci->pp.ops->pme_turn_off) {
> > > +		pci->pp.ops->pme_turn_off(&pci->pp);
> > > +	} else {
> > > +		ret = dw_pcie_pme_turn_off(pci);
> > >  		if (ret)
> > >  			return ret;
> > > -
> > > -		ret = read_poll_timeout(dw_pcie_get_ltssm, val, val == DW_PCIE_LTSSM_L2_IDLE,
> > > -					PCIE_PME_TO_L2_TIMEOUT_US/10,
> > > -					PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> > > -		if (ret) {
> > > -			dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
> > > -			return ret;
> > > -		}
> > >  	}
> > >
> > >  	dw_pcie_stop_link(pci);
> > > --
> > > 2.37.1
> > >
> >
> > --
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
