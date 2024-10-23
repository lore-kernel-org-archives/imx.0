Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC5D15B554
	for <imx@lists.linux.dev>; Wed, 23 Oct 2024 08:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729673861; cv=none; b=aScPUdTuGEq8skxOtw5MQMeScIDm+MpIuUOdEZqhkpJWrcu/nEMX/CAlKb5mUCrT4xQjV4g1FaLjCpOqNDCXgg/wISZfDVio7pB9R3pE70gbz/aJ82oi06Nt8Eydy2+PsoWAs0Ue04Ij3r3WnEk5jfE01rXfnNufgBVXldi1OmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729673861; c=relaxed/simple;
	bh=tG5KoFqMrLg2nJ/Z3m61lsXkPfmBrOrMETX9XND/ZBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRv8ngYpOXQRbFJBkOTLUiomDKicChLR8Qr5DyYhrn/DgkSGvIJ4H52Ig58gXJzLYcQJ26SOvsQlNM2ivm8KfnU0SjnJVHbDctWHYp6Z8lkbSwZl3zMXbgNwNAj1GgUGMHQ8/8IA5744sXzNZAs+3FdCcLYpe/973GOsNVCfO8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDAUjLwf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDAUjLwf"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4316cce103dso53706395e9.3
        for <imx@lists.linux.dev>; Wed, 23 Oct 2024 01:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729673858; x=1730278658; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aLUSAgzR8iNF4zHWrGUoMvbcLFgR1RnPlcZ1Cg/hAis=;
        b=gDAUjLwfaLLWuqbNDbP+vwl5A8vXQUlqi+5gZB/qgbbnf1r7xGuFN8iOma0zh5rKob
         hT4ts3LKTm2yEKxjKqiGipkn7qnuHuz9uHAgbrjAqu4oxLlGYKyEVCaUbTFt3DiYrCCm
         o/ve++DQUylTrc+QZwqad6Se1rAh9FjhQqMtbn64DlygnrHQmJQyIctGgPNns2g9Wq9P
         nTCNotYNSUZmYWNn2Zfx7T7BKAXCu+VK3ESNBNnntUkq9fitlJpj6biLYOPiAmxHQ8hb
         AXM9Cwk9zgOKXbRSY9/CbBELwDepSb2xCpt3QuZyXYekZze2oCjfjUgpdh5Nzx1aNek3
         oBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729673858; x=1730278658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLUSAgzR8iNF4zHWrGUoMvbcLFgR1RnPlcZ1Cg/hAis=;
        b=tQtbc3ZULD+PPnA8RoH5aJ/q34MT8R3531I2iZicb3GBSQsJ0BFjv1eZEBjdU9gSmQ
         3vsoDTHWpRNaNvkrUqvLQ9d9F7fTzm3sDrPLZFUi460FCQoI8zMbPQi1b3U+Kkg9AH5X
         sA4521nZMc87d04Scdd7GGEwbLJikxv2bzuQxjwEAvlPcpCGZnF2obUBLJ8lrxcky6MW
         DD5W7DMmNFe/2Qq5Cuv3Nzk7QnF32qIddKfAAQUAjrZDc86GkJIGdakBkNHK99NyJVFu
         FgGiskno9AaW/kqXalGoSPBn2rSVQyAsC4Lpv25ImA09y5SgGiZ7qEaYl77awGDt10qv
         gQaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhgmcv6kE8+xprLOd0GBycGW/KmKCYEUupGNWjN00d9o9/BXtzc6p/zcMO82ZPRKnAWho=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMF0MSHgKIKS7dIhlPuln5xhTnfrK16dVzpWurjE++7+kYmNnr
	kc8g7bw/7Wsx3Gg6tifipTH7jvwioZCVdgcGdt84FEh4akVw1iau
X-Google-Smtp-Source: AGHT+IFhkHFpnMZr8la1VYcuF0W+7+f2Rn4vQXVtJPwZJjxsaVWz/9HVDlk2KLntNTCSy/h+ZKFIgg==
X-Received: by 2002:a05:600c:5492:b0:431:562a:54be with SMTP id 5b1f17b1804b1-43184201b33mr18440165e9.9.1729673857370;
        Wed, 23 Oct 2024 01:57:37 -0700 (PDT)
Received: from eichest-laptop (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bde181sm10241755e9.11.2024.10.23.01.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:57:36 -0700 (PDT)
Date: Wed, 23 Oct 2024 10:57:35 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	francesco.dolcini@toradex.com, Frank.li@nxp.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v3] PCI: imx6: Add suspend/resume support for i.MX6QDL
Message-ID: <Zxi6f3S5p8Pnto-S@eichest-laptop>
References: <20241021124922.5361-1-eichest@gmail.com>
 <20241022155349.GA880566@bhelgaas>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022155349.GA880566@bhelgaas>

On Tue, Oct 22, 2024 at 10:53:49AM -0500, Bjorn Helgaas wrote:
> On Mon, Oct 21, 2024 at 02:49:13PM +0200, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > The suspend/resume support is broken on the i.MX6QDL platform. This
> > patch resets the link upon resuming to recover functionality. It shares
> > most of the sequences with other i.MX devices but does not touch the
> > critical registers, which might break PCIe. This patch addresses the
> > same issue as the following downstream commit:
> > https://github.com/nxp-imx/linux-imx/commit/4e92355e1f79d225ea842511fcfd42b343b32995
> > In comparison this patch will also reset the device if possible because
> > the downstream patch alone would still make the ath10k driver crash.
> > Without this patch suspend/resume will not work if a PCIe device is
> > connected. The kernel will hang on resume and print an error:
> > ath10k_pci 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
> > 8<--- cut here ---
> > Unhandled fault: imprecise external abort (0x1406) at 0x0106f944
> 
> https://chris.beams.io/posts/git-commit/
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/maintainer-tip.rst?id=v6.11#n134
> 
> Add blank lines between paragraphs.  Drop the "8<--- cut here" thing.

Thanks for the feedback, I will fix this in the next version.
> 
> What does "reset the link" mean?  Please use the same terminology as
> the PCIe spec when possible.

I will try to come up with a better description in the next version. I
think this sentence doesn't make sense anymore.

> The downstream commit log ("WARNING: this is not the official
> workaround; user should take own risk to use it") doesn't exactly
> inspire confidence.
> 
> It sounds like this resets *endpoints*?  That sounds scary and
> unexpected in suspend/resume.

Yes, I completely agree with you, but NXP has never come up with an
"official" workaround. Our problem is that with the current
implementation, suspend/resume is completely broken when a PCIe device
is connected. With this proposed patch we at least have a working device
after resume. Even for the other i.MX devices, the driver resets the
endpoints in the resume function (imx_pcie_resume_noir ->
imx_pcie_host_init -> imx_pcie_assert_core_reset), we just do that now
for the i.MX6QDL as well. If it is more appropriate to call
imx_pcie_assert_core_reset in resume as we do for the other devices,
that would be fine with me as well. I was thinking that if we need to
reset the device anyway, we could put it into reset on suspend, as this
might save some extra power.

> 
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > ---
> > Changes in v3:
> > - Added a new flag to the driver data to indicate that the suspend/resume
> >   is broken on the i.MX6QDL platform. (Frank)
> > - Fix comments to be more relevant (Mani)
> > - Use imx_pcie_assert_core_reset in suspend (Mani)
> > 
> >  drivers/pci/controller/dwc/pci-imx6.c | 57 +++++++++++++++++++++------
> >  1 file changed, 46 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> > index 808d1f1054173..09e3b15f0908a 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -82,6 +82,11 @@ enum imx_pcie_variants {
> >  #define IMX_PCIE_FLAG_HAS_SERDES		BIT(6)
> >  #define IMX_PCIE_FLAG_SUPPORT_64BIT		BIT(7)
> >  #define IMX_PCIE_FLAG_CPU_ADDR_FIXUP		BIT(8)
> > +/**
> > + * Because of ERR005723 (PCIe does not support L2 power down) we need to
> > + * workaround suspend resume on some devices which are affected by this errata.
> > + */
> > +#define IMX_PCIE_FLAG_BROKEN_SUSPEND		BIT(9)
> >  
> >  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
> >  
> > @@ -1237,9 +1242,19 @@ static int imx_pcie_suspend_noirq(struct device *dev)
> >  		return 0;
> >  
> >  	imx_pcie_msi_save_restore(imx_pcie, true);
> > -	imx_pcie_pm_turnoff(imx_pcie);
> > -	imx_pcie_stop_link(imx_pcie->pci);
> > -	imx_pcie_host_exit(pp);
> > +	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
> > +		/**
> 
> Single asterisks above, here, and below.

Thanks, I will fix this in the next version.

> > +		 * The minimum for a workaround would be to set PERST# and to
> > +		 * set the PCIE_TEST_PD flag. However, we can also disable the
> > +		 * clock which saves some power.
> > +		 */
> > +		imx_pcie_assert_core_reset(imx_pcie);
> > +		imx_pcie->drvdata->enable_ref_clk(imx_pcie, false);
> > +	} else {
> > +		imx_pcie_pm_turnoff(imx_pcie);
> > +		imx_pcie_stop_link(imx_pcie->pci);
> > +		imx_pcie_host_exit(pp);
> > +	}
> >  
> >  	return 0;
> >  }
> > @@ -1253,14 +1268,32 @@ static int imx_pcie_resume_noirq(struct device *dev)
> >  	if (!(imx_pcie->drvdata->flags & IMX_PCIE_FLAG_SUPPORTS_SUSPEND))
> >  		return 0;
> >  
> > -	ret = imx_pcie_host_init(pp);
> > -	if (ret)
> > -		return ret;
> > -	imx_pcie_msi_save_restore(imx_pcie, false);
> > -	dw_pcie_setup_rc(pp);
> > +	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
> > +		ret = imx_pcie->drvdata->enable_ref_clk(imx_pcie, true);
> > +		if (ret)
> > +			return ret;
> > +		ret = imx_pcie_deassert_core_reset(imx_pcie);
> > +		if (ret)
> > +			return ret;
> > +		/**
> > +		 * Using PCIE_TEST_PD seems to disable msi and powers down the
> > +		 * root complex. This is why we have to setup the rc again and
> > +		 * why we have to restore the msi register.
> 
> s/msi/MSI/

Thanks, I will fix this in the next version.

> 
> > +		 */
> > +		ret = dw_pcie_setup_rc(&imx_pcie->pci->pp);
> > +		if (ret)
> > +			return ret;
> > +		imx_pcie_msi_save_restore(imx_pcie, false);
> > +	} else {
> > +		ret = imx_pcie_host_init(pp);
> > +		if (ret)
> > +			return ret;
> > +		imx_pcie_msi_save_restore(imx_pcie, false);
> > +		dw_pcie_setup_rc(pp);
> >  
> > -	if (imx_pcie->link_is_up)
> > -		imx_pcie_start_link(imx_pcie->pci);
> > +		if (imx_pcie->link_is_up)
> > +			imx_pcie_start_link(imx_pcie->pci);
> > +	}
> >  
> >  	return 0;
> >  }
> > @@ -1485,7 +1518,9 @@ static const struct imx_pcie_drvdata drvdata[] = {
> >  	[IMX6Q] = {
> >  		.variant = IMX6Q,
> >  		.flags = IMX_PCIE_FLAG_IMX_PHY |
> > -			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE,
> > +			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE |
> > +			 IMX_PCIE_FLAG_BROKEN_SUSPEND |
> > +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
> >  		.dbi_length = 0x200,
> >  		.gpr = "fsl,imx6q-iomuxc-gpr",
> >  		.clk_names = imx6q_clks,

Regards,
Stefan
