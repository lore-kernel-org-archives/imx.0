Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3761DE3D6
	for <imx@lists.linux.dev>; Fri, 22 Nov 2024 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732295420; cv=none; b=VBZLtcW5GkIBpTPoeD5kOK5Y2FKtmFskXTZXFoGqR7JIMe/70u9E9J11TSC1xSNLn+xTPRITxKn3zmfJMAgqhPKaTqtfej1ZBcnRvm6BEP3cuQrVrHdjQ9sEDppaCJ8dUAL1yosp2GVu+Q792EfzsxNXFDqdadL5vyTvCI9AW5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732295420; c=relaxed/simple;
	bh=G9cr1gHE3g36F9Cu85STAfJ/9tRuQumYU8/56wvDlXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FrRVtKrtA5Rn1Wiix4igKmtulmEhXNl+a2SXbo9yew0J0TE8AICUkU50x8H7IPeZouEEpOMgGLhs9FG4hH+3A/sYkUYAU0HZqV/oCW23eUzLAJcOeGOLGCJLaoQe32W3FKNxwcOntBqUmCUTHIaw0yhs4bazTjm5gOjOZMA7HFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aZ4wfjS9; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aZ4wfjS9"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-724e7d5d5b2so655994b3a.2
        for <imx@lists.linux.dev>; Fri, 22 Nov 2024 09:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732295418; x=1732900218; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/UzD8Qbmoty9y3UdrVjMc3lCWpv9Zoxn+WCwHClf78I=;
        b=aZ4wfjS9Z6kwVrEm3HRzREl+VL9tE44HHhVQz8Ym3oTK2MmJWeAw7ZsrU/T1MeIb+v
         UvEzqczAWt+t4tcgVfQfK9AU0Gsz0RKxiHDDRmp7T4wZgqPMBMMrW4LzvhSlhCN4IAKh
         hZ4A6LOi/UyWJpaat1CFwfB+SYGpHu6WnicJeEBFP2vAxtbnUeTNNnHeLz4zvW6lqJTL
         hs7olY/hwMxw3/svpVV5Hee/lAJZR6wSyUFO0p7mqufy4UUSKTACFfLBnAYEx67je9Ej
         3B1/sfTHNoKz6QYKpIEUpDnmrzoARZ1rPpE2vBUlFu3gC4hw0QQrPQyM0vuxX2ZrnY4I
         JlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732295418; x=1732900218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/UzD8Qbmoty9y3UdrVjMc3lCWpv9Zoxn+WCwHClf78I=;
        b=jo+cknzzbENaGj6uzd2+mVZT2kIs7ZC7aT7g2U69HBcu+jv1SoxlVNCrec+H68o7T5
         w4gEDQO52a+V2JERdDdEGzaeTv1pohdyE1oXyKBY9FJNUfcd4zrFhUmfYdbr+9gcdAh7
         Y5rbSP2SdHV4kZ5VsCrgXhIC6j8s8cMoH9T5DhYYZsmC/U028Zh5DHzNvpp7Zl78phpM
         qIt4exNq/KzkFU4c7bFupVfwS7v3lNJzS7izIfHvcrSFHwYytCWmoebIt2O1yFwxDoW/
         lOkM2i7/UNLiI5Shm4cboMjn5MnmbbELzNjUDZiBAKlxbc17+fxn/xTxD1nmfr2sgS0y
         /rbg==
X-Forwarded-Encrypted: i=1; AJvYcCVQbpTK7WfPfEtg7VVupIJtTjv8w58IkXuvLuFU6bHp29BI/pbQMiO9fd1RvXKljrkrNfQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/gyNGyXsnFYvFsI3vLau5cUxLKOjzJgGEgGsUgHwfhqW93uL2
	yqvARQ4dV4ol1iJGEZPEaaEGWMvopZFMyZj6Os+Sb0MO/Hfn/7vt4MJIColPUg==
X-Gm-Gg: ASbGncuR4yJH7WcYOmmBw5q9LFgnf5eseuzGjT64C7JblU8fSNOPeucvgjgGwGpYoME
	ds6ltOsMZhS+reaIP7rRrANA02hQogRpsdVy/kAtZErTLwWIP8vAqgxQjEzhSqSSIsBn+PxBzn4
	z0qT8jcbccWcqOOGDOcbPtAhnFnetymlKtAEta6G2xdseVoC9s5gW78lR3fU61OQFUEHQgQqZR7
	cQ9XZvsuTyp3VYFpFipSv5u1kLUqtkBU/DUi4FeCxYQkhGRl5YRyPiTXEfb
X-Google-Smtp-Source: AGHT+IEwjs4uHZtrKVZd87ooqlW4TAiWtY5jzSaWXJxP5mRGV9M6kvrK8gtdD6fzbjrc4NKONPYTYQ==
X-Received: by 2002:a17:902:cec9:b0:212:23e5:6202 with SMTP id d9443c01a7336-2129f67b3f6mr39737875ad.6.1732295417733;
        Fri, 22 Nov 2024 09:10:17 -0800 (PST)
Received: from thinkpad ([49.207.202.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de531b82sm1911272b3a.102.2024.11.22.09.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 09:10:17 -0800 (PST)
Date: Fri, 22 Nov 2024 22:40:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 03/10] PCI: imx6: Fetch dbi2 and iATU base addesses
 from DT
Message-ID: <20241122171010.ze6iyxmgaq7g7yr6@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-4-hongxing.zhu@nxp.com>
 <20241115064106.iwrorgimt6yenalx@thinkpad>
 <AS8PR04MB86766F6553A36E75A2B1F6C78C272@AS8PR04MB8676.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB86766F6553A36E75A2B1F6C78C272@AS8PR04MB8676.eurprd04.prod.outlook.com>

On Mon, Nov 18, 2024 at 02:59:35AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: 2024年11月15日 14:41
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: l.stach@pengutronix.de; bhelgaas@google.com; lpieralisi@kernel.org;
> > kw@linux.com; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > shawnguo@kernel.org; Frank Li <frank.li@nxp.com>;
> > s.hauer@pengutronix.de; festevam@gmail.com; imx@lists.linux.dev;
> > kernel@pengutronix.de; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v6 03/10] PCI: imx6: Fetch dbi2 and iATU base addesses
> > from DT
> > 
> > On Fri, Nov 01, 2024 at 03:06:03PM +0800, Richard Zhu wrote:
> > > Since dbi2 and atu regs are added for i.MX8M PCIes. Fetch the dbi2 and
> > > iATU base addresses from DT directly, and remove the useless codes.
> > >
> > 
> > It'd be useful to mention where the base addresses were extraced. Like by
> > the DWC common driver.
> You're right. How about change them to the below one?
> The dw_pcie_get_resources() function of DWC core codes can fetch the dbi2 and
>  iATU base addresses from DT directly, and remove the useless codes here.

"Since dw_pcie_get_resources() gets the dbi2 and iATU base addresses from DT,
remove the code from imx6 driver that does the same."

- Mani

> 
> > 
> > > Upsteam dts's have not enabled EP function. So no function broken for
> > > old upsteam's dtb.
> > >
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > 
> > Reviewed-by: Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org>
> > 
> > - Mani
> > 
> > > ---
> > >  drivers/pci/controller/dwc/pci-imx6.c | 20 --------------------
> > >  1 file changed, 20 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > index bc8567677a67..462decd1d589 100644
> > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > @@ -1115,7 +1115,6 @@ static int imx_add_pcie_ep(struct imx_pcie
> > *imx_pcie,
> > >  			   struct platform_device *pdev)
> > >  {
> > >  	int ret;
> > > -	unsigned int pcie_dbi2_offset;
> > >  	struct dw_pcie_ep *ep;
> > >  	struct dw_pcie *pci = imx_pcie->pci;
> > >  	struct dw_pcie_rp *pp = &pci->pp;
> > > @@ -1125,25 +1124,6 @@ static int imx_add_pcie_ep(struct imx_pcie
> > *imx_pcie,
> > >  	ep = &pci->ep;
> > >  	ep->ops = &pcie_ep_ops;
> > >
> > > -	switch (imx_pcie->drvdata->variant) {
> > > -	case IMX8MQ_EP:
> > > -	case IMX8MM_EP:
> > > -	case IMX8MP_EP:
> > > -		pcie_dbi2_offset = SZ_1M;
> > > -		break;
> > > -	default:
> > > -		pcie_dbi2_offset = SZ_4K;
> > > -		break;
> > > -	}
> > > -
> > > -	pci->dbi_base2 = pci->dbi_base + pcie_dbi2_offset;
> > > -
> > > -	/*
> > > -	 * FIXME: Ideally, dbi2 base address should come from DT. But since only
> > IMX95 is defining
> > > -	 * "dbi2" in DT, "dbi_base2" is set to NULL here for that platform alone
> > so that the DWC
> > > -	 * core code can fetch that from DT. But once all platform DTs were fixed,
> > this and the
> > > -	 * above "dbi_base2" setting should be removed.
> > > -	 */
> > >  	if (device_property_match_string(dev, "reg-names", "dbi2") >= 0)
> > >  		pci->dbi_base2 = NULL;
> 
> The check and the NULL assignment of "pci->dbi_base2" should be removed too
>  refer to FIXME listed above. Would updated in v7 later, Sorry about that.
> 
> Best Regards
> Richard Zhu
> > >
> > > --
> > > 2.37.1
> > >
> > 
> > --
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
