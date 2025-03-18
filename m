Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637001EF380
	for <imx@lists.linux.dev>; Tue, 18 Mar 2025 07:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742283987; cv=none; b=nhAThHcEJeMa0I8XAw44c9ITUFaxQNnZ0e90AnPIjf6UL4JvSMVT0aUpZBqbQIUL2mMPMFWb6cIaldx6NWE8Z4xFXRlgqn+YhipklRLUQw72SoFEtOJaoED167CD3JddFS8/A4yXU4alucTvXPxBbbXa24HxubUJrJKh8RQPNzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742283987; c=relaxed/simple;
	bh=LvywzN1RBsv3mdA4STwvBcFAP/jhi6wX7UwEJ79LVdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agIFHS/+aRnnxnYM8wUgGJkxDlSONIEoXC8Y1sZ2jSiGjiO/MmPxy65c7zGvgtyLG78mCF2urd/+LLodaTnF+NvKv+2nakMpPpu5hLQ4Hu9j9LtQLm7pR0LUlXlCT6OaVV615mr5g2t1zeg5s+N1HYJv4wI/46ScqQkkShGyblM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ihZNOYQm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ihZNOYQm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2260c915749so27704185ad.3
        for <imx@lists.linux.dev>; Tue, 18 Mar 2025 00:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742283984; x=1742888784; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/5KVGOst+i3EqYlF+Sx7sAtMWBsKlTUEKDgYGkLY1j4=;
        b=ihZNOYQmxPZesa4GBYcu54O3AmGIlNDak2EvhTyU/khJS1MhkYQbvEnDF48b+NrZx+
         IvNO+cv2f+gnUSGwUdQDIaQcYiXwVzYXCyg1PgRvllFZYXZRd7E4I5PJt3sV/eqfVaPJ
         hJ+i9wVAbfI6R9eMR+2bIYvtVlvO4gG8XCnInIB0KCi7pRtVDPyxpb9R22/lgVNf6JWS
         E2Hht+nsjU9ITaSJUk756HRlGp6dBTMffvjQBqohmOiqa29AJohqcXQy5qy+8QS4Cqti
         eGuh0WGa1r3VyXljhTCFGI6Jqr/ohPbsZT03CG9qaChP5fjke9tSe29s/AsjzDLg8vZM
         UwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742283984; x=1742888784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5KVGOst+i3EqYlF+Sx7sAtMWBsKlTUEKDgYGkLY1j4=;
        b=C4/e4ZGRLhI/fWxK7NfutnjWIa+hDMLz8dXeSiJK04xjrnZ+fkEtfImq6HVR0TqayN
         21CpSntHVY1kuOFRzIV90j3V33lcNroFaO4FCcGN3iykYG5Q2aawnxpbYVDCg5TgXvLB
         bZNjElaOdwPHZodlXq9u/V9cSy1iLUQrjw0hp/oEy+TT1tzmF7QiiQGdMfz+6Nw1sPPv
         VB1INnlvX7uKMNl3dQm/9ok3CtYkq4jL5p/b6Uw9UyjfG5+LmuvFqysaifCLAzygh6dK
         qyxQixtNFpVlkEtYJ9nDH2sIcYhSlYoOtr4PbrAcJ0WEmxiRA3JZTs1MR49N1ISttrQp
         V97Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6KZYFK3vkd38mmfrDS4LfeEnlCSEqDrVgFVkgdXBxjToVKznLcez8dcD18e7fxmDbZyg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yza2N6DCFplBdQvssjV2Dpq6L8ckHBRzrxAu5K991AqFPGarPbB
	8Yb5/SRIRpa41bbYFDwZl57czxlo1s2BzJrEFe1UeOz7IUSKM82oSB3efOFu8g==
X-Gm-Gg: ASbGnctFl55bIPpjxRVsrDAr9x+z8GVCGESTMjPwm3NZ4f5kZSwyBh7rpNo8sgPOQGE
	iKRjYQyVZ/uJDDXojb+9EsGHRm0OvFQsK/MMGz9oQX8RRVs62gy3vIQ7lSR+H+3eOx5CPK0ZCRq
	GhVC41557xruJcFYahse34Ctb0GCJ6otiydMQUtSbR1z5W16ewFx/CVNv29jxyQUYrLE4FV5xs+
	FYbBw2YTm1vGzoqtaZSEt79S+Z29SGbBsvg7CbcHwriHQz/vxBG3j2qOcqp99eE8Ec63xpxsQ36
	kp15NAAh79goFn3WzQ0GwdmaMcqh3ff/3otIvLSX8l2qxYpjawI1WaooXncABgbxSN4=
X-Google-Smtp-Source: AGHT+IGk7Wbvv+p+ljwVovByJjOFoHfppHTP1+cVpoZmuorSMChPEuewTXvxnqB++I9G1ZambQYJAA==
X-Received: by 2002:a05:6a00:2309:b0:736:41ec:aaad with SMTP id d2e1a72fcca58-73722382f9bmr19932531b3a.14.1742283984406;
        Tue, 18 Mar 2025 00:46:24 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b3de4sm9153147b3a.179.2025.03.18.00.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 00:46:23 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:16:18 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.li@nxp.com>,
	Hongxing Zhu <hongxing.zhu@nxp.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] PCI: imx6: Use domain number replace the hardcodes
Message-ID: <20250318074618.tqbnr7nv665fk25n@thinkpad>
References: <b425a7c7a7d6508daf23fe7046864a498029a7ac.camel@pengutronix.de>
 <20250313160648.GA736867@bhelgaas>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313160648.GA736867@bhelgaas>

On Thu, Mar 13, 2025 at 11:06:48AM -0500, Bjorn Helgaas wrote:
> On Thu, Mar 13, 2025 at 09:54:25AM +0100, Lucas Stach wrote:
> > Am Mittwoch, dem 12.03.2025 um 10:22 -0400 schrieb Frank Li:
> > > On Wed, Mar 12, 2025 at 09:28:02AM +0100, Lucas Stach wrote:
> > > > Am Mittwoch, dem 12.03.2025 um 04:05 +0000 schrieb Hongxing Zhu:
> > > > > > -----Original Message-----
> > > > > > From: Bjorn Helgaas <helgaas@kernel.org>
> > > > > > Sent: 2025年3月11日 23:55
> > > > > > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > > > > > Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > > > > > shawnguo@kernel.org; l.stach@pengutronix.de; lpieralisi@kernel.org;
> > > > > > kw@linux.com; manivannan.sadhasivam@linaro.org; bhelgaas@google.com;
> > > > > > s.hauer@pengutronix.de; festevam@gmail.com; devicetree@vger.kernel.org;
> > > > > > linux-pci@vger.kernel.org; imx@lists.linux.dev; kernel@pengutronix.de;
> > > > > > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > > > > > Subject: Re: [PATCH v1 2/2] PCI: imx6: Use domain number replace the
> > > > > > hardcodes
> > > > > > 
> > > > > > On Tue, Mar 11, 2025 at 01:11:04AM +0000, Hongxing Zhu wrote:
> > > > > > > > -----Original Message-----
> > > > > > > > From: Bjorn Helgaas <helgaas@kernel.org>
> > > > > > > > Sent: 2025年3月10日 23:11
> > > > > > > > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > > > > > > > Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > > > > > > > shawnguo@kernel.org; l.stach@pengutronix.de; lpieralisi@kernel.org;
> > > > > > > > kw@linux.com; manivannan.sadhasivam@linaro.org;
> > > > > > bhelgaas@google.com;
> > > > > > > > s.hauer@pengutronix.de; festevam@gmail.com;
> > > > > > > > devicetree@vger.kernel.org; linux-pci@vger.kernel.org;
> > > > > > > > imx@lists.linux.dev; kernel@pengutronix.de;
> > > > > > > > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > > > > > > > Subject: Re: [PATCH v1 2/2] PCI: imx6: Use domain number replace the
> > > > > > > > hardcodes
> > > > > > > > 
> > > > > > > > On Wed, Feb 26, 2025 at 10:42:56AM +0800, Richard Zhu wrote:
> > > > > > > > > Use the domain number replace the hardcodes to uniquely identify
> > > > > > > > > different controller on i.MX8MQ platforms. No function changes.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/pci/controller/dwc/pci-imx6.c | 14 ++++++--------
> > > > > > > > >  1 file changed, 6 insertions(+), 8 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > > > > > > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > > > > > > > index 90ace941090f..ab9ebb783593 100644
> > > > > > > > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > > > > > > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > > > > > > > @@ -41,7 +41,6 @@
> > > > > > > > >  #define IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE	BIT(11)
> > > > > > > > >  #define IMX8MQ_GPR_PCIE_VREG_BYPASS		BIT(12)
> > > > > > > > >  #define IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE	GENMASK(11,
> > > > > > 8)
> > > > > > > > > -#define IMX8MQ_PCIE2_BASE_ADDR			0x33c00000
> > > > > > > > > 
> > > > > > > > >  #define IMX95_PCIE_PHY_GEN_CTRL			0x0
> > > > > > > > >  #define IMX95_PCIE_REF_USE_PAD			BIT(17)
> > > > > > > > > @@ -1474,7 +1473,6 @@ static int imx_pcie_probe(struct
> > > > > > > > > platform_device
> > > > > > > > *pdev)
> > > > > > > > >  	struct dw_pcie *pci;
> > > > > > > > >  	struct imx_pcie *imx_pcie;
> > > > > > > > >  	struct device_node *np;
> > > > > > > > > -	struct resource *dbi_base;
> > > > > > > > >  	struct device_node *node = dev->of_node;
> > > > > > > > >  	int i, ret, req_cnt;
> > > > > > > > >  	u16 val;
> > > > > > > > > @@ -1515,10 +1513,6 @@ static int imx_pcie_probe(struct
> > > > > > > > platform_device *pdev)
> > > > > > > > >  			return PTR_ERR(imx_pcie->phy_base);
> > > > > > > > >  	}
> > > > > > > > > 
> > > > > > > > > -	pci->dbi_base = devm_platform_get_and_ioremap_resource(pdev,
> > > > > > 0,
> > > > > > > > &dbi_base);
> > > > > > > > > -	if (IS_ERR(pci->dbi_base))
> > > > > > > > > -		return PTR_ERR(pci->dbi_base);
> > > > > > > > 
> > > > > > > > This makes me wonder.
> > > > > > > > 
> > > > > > > > IIUC this means that previously we set controller_id to
> > > > > > > > 1 if the first item in devicetree "reg" was 0x33c00000,
> > > > > > > > and now we will set controller_id to 1 if the devicetree
> > > > > > > > "linux,pci-domain" property is 1.  This is good, but I
> > > > > > > > think this new dependency on the correct
> > > > > > > > "linux,pci-domain" in devicetree should be mentioned in
> > > > > > > > the commit log.
> > > > > > > > 
> > > > > > > > My bigger worry is that we no longer set pci->dbi_base
> > > > > > > > at all.  I see that the only use of pci->dbi_base in
> > > > > > > > pci-imx6.c was to determine the controller_id, but this
> > > > > > > > is a DWC-based driver, and the DWC core certainly uses
> > > > > > > > pci->dbi_base.  Are we sure that none of those DWC core
> > > > > > > > paths are important to pci-imx6.c?
> > > > > > >
> > > > > > > Thanks for your concerns.  Don't worry about the
> > > > > > > assignment of pci->dbi_base.  If pci-imx6.c driver doesn't
> > > > > > > set it. DWC core driver would set it when
> > > > > > >  dw_pcie_get_resources() is invoked.
> > > > > > 
> > > > > > Great, thanks!  Maybe we can amend the commit log to mention
> > > > > > that and the new "linux,pci-domain" dependency.
> > > > >
> > > > > How about the following updates of the commit log?
> > > > > 
> > > > > Use the domain number replace the hardcodes to uniquely
> > > > > identify different controller on i.MX8MQ platforms. No
> > > > > function changes.  Please make sure the " linux,pci-domain" is
> > > > > set for i.MX8MQ correctly, since  the controller id is relied
> > > > > on it totally.
> > > > > 
> > > > This breaks running a new kernel on an old DT without the
> > > > linux,pci-domain property, which I'm absolutely no fan of. We
> > > > tried really hard to keep this way around working in the i.MX
> > > > world.
> > > 
> > > 8MQ already add linux,pci-domain since Jan, 2021
> > > 
> > > commit c0b70f05c87f3b09b391027c6f056d0facf331ef
> > > Author: Peng Fan <peng.fan@nxp.com>
> > > Date:   Fri Jan 15 11:26:57 2021 +0800
> > > 
> > > Only missed is pcie-ep side, which have not been used at all boards dts
> > > file in upstream.
> > 
> > I wasn't aware of this. 2021 is quite a while ago, so I suspect that
> > nobody is going to run a new kernel with a DT this old. I retract my
> > objection.
> 
> Sounds good, thanks, Lucas.  We really do want to avoid breaking old
> DTs, so I appreciate your highlighting of it.  Even if we believe none
> of them will break, I think it's worth mentioning the
> 'linux,pci-domain' dependency and the commit that added it to the
> .dtsi in the commit log.
> 

If there is a dependency, then it should be added to the binding. Only that will
ensure that the DTs will have the dependent property present.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
