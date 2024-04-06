Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8BF15EA2
	for <imx@lists.linux.dev>; Sat,  6 Apr 2024 04:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712376098; cv=none; b=S/i3Xv6pAR67OcwW/daB7F7hih1Wo0PwWspQoBMbVgp/YaakQJtT/SmpLuE623vP2UkfoIWQYFK9aoiN7LJT+g5hvntv469id+j64z6RAzRlz9UTQOHvYvBGq33VgcCcZwviFl5Vy0MjdeM3jvgS0Iefsr4gCvtmpLFxz3q2bYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712376098; c=relaxed/simple;
	bh=iGIic5Vke/591CKh/3b9bJwpfTpW9Aa1DcmTqF5MS4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzfJw7EpjB64/bbyHhaMoJBsa5q5aHoq+8LApAp3QipU4WeUTItnP/Y0BrsDBFyP5grOBX1VwAFbqDq+NSbIjf9QldO0yF0XCtko6r7McPX4WVCG2Z8sIDnytj2qOsHLhEiWWs6VspZk325zjtOJe2YShqtF66lOER1OdH6uzDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zJRM3Nz/; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zJRM3Nz/"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e0f0398553so26050925ad.3
        for <imx@lists.linux.dev>; Fri, 05 Apr 2024 21:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712376097; x=1712980897; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FQjty2mOKA3aYPwrRydJz6nV5Fa5xbHN2C7CKYkz1ck=;
        b=zJRM3Nz/IGrMwahN8Ox/meHcyZ+9DCvULML3x2b6LtNbHmkFyeAM5fChUafu03eNtI
         GkDBW6nzMMT2KXvwzEQoQNO40Cy4HpoIxS0gSC4aRJb6XIWbcRU7neMhB62P2Yws297C
         qEnBYS1K31AAQUkfAi+sIIMb9x1gB5Wep4AvFXOo4ExYfWcytTKWvqeCJ2hjgzIdo2CQ
         TtOiDelYLcXrOwYQWzD0VevqlIw8Ir0ffciJtrgaFRJubLt3VOrXYTcxMYmBaljzw0lx
         1K1AFCDDJYS7mS5FHGn84k9Cba/vLMhWbzMPagz3ZSs0SRIyRaxfNOhEDpHmiu6/EWue
         3hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712376097; x=1712980897;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQjty2mOKA3aYPwrRydJz6nV5Fa5xbHN2C7CKYkz1ck=;
        b=vPhEiw1cHoOoembwpmLz2jkqSta+ehoU1MQ9eqhC3sxQ1HgDLUViacxaehj4qSCKj/
         BSlKMqbcjQrsY6pHdPc+SYSDZytRaqt35za1+3QP2d1Mt1qB6LO3QZg8NXZrKarVrYu9
         Zr4z9byG8YyODZji7O8TNm/JV0i15nciwg/pNTjtNRJIqxriGJ1RrbuxOWbjESNwUD+V
         5RevQr9eafpp8E/BPzwmF3FaHVx4Eiz89HRnf/eJ/3jESg/rBRKqo1H2a4+ygrupL7Oc
         RQGKCsRAbwq8vGIS/sB1Tfe1tl8VG5/W+bMoEOPdi07auOtfH4qps/US8MEcScGqmRp2
         rbSw==
X-Forwarded-Encrypted: i=1; AJvYcCXgJReLFVk6MrqsvIeUSCJUn9nLMQy7REb/oz9qtjomizblEX9YVwlgIGjpo332vG9JhyAVB7a/g98HIto33cIRh1DX
X-Gm-Message-State: AOJu0YzN5doXj5leYeSZ5nUeGIc0Q/5FOMw1dbtwtQcnDXPRqUuW4Mrc
	2/WWrLeTVnhB2b86Kl94tKOXEISh05Cb0IJBdr0EutPWP+3CnCFtcCjKnFOxlw==
X-Google-Smtp-Source: AGHT+IFMgTl1ymn76+dFZqiHTXRkv7EeNZvZAC0dcIAOHMClnGKLFdsS4H4hz0A/TXOMBMvrVgvVKQ==
X-Received: by 2002:a17:903:2990:b0:1e3:e081:e7f6 with SMTP id lm16-20020a170903299000b001e3e081e7f6mr2877plb.66.1712376096519;
        Fri, 05 Apr 2024 21:01:36 -0700 (PDT)
Received: from thinkpad ([103.28.246.231])
        by smtp.gmail.com with ESMTPSA id u8-20020a1709026e0800b001e0e5722788sm2483112plk.17.2024.04.05.21.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 21:01:36 -0700 (PDT)
Date: Sat, 6 Apr 2024 09:31:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/5] PCI: dwc: Add common send PME_Turn_Off message
 method
Message-ID: <20240406040131.GC2678@thinkpad>
References: <20240319-pme_msg-v5-0-af9ffe57f432@nxp.com>
 <20240319-pme_msg-v5-5-af9ffe57f432@nxp.com>
 <20240405062426.GB2953@thinkpad>
 <ZhALNGyNTAzN86GF@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZhALNGyNTAzN86GF@lizhi-Precision-Tower-5810>

On Fri, Apr 05, 2024 at 10:31:16AM -0400, Frank Li wrote:
> On Fri, Apr 05, 2024 at 11:54:26AM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Mar 19, 2024 at 12:07:15PM -0400, Frank Li wrote:
> > 
> > PCI: dwc: Add generic MSG TLP support for sending PME_Turn_Off during system suspend
> > 
> > > Reserve space at end of first IORESOURCE_MEM window as message TLP MMIO
> > > window. This space's size is 'region_align'.
> > > 
> > > Set outbound ATU map memory write to send PCI message. So one MMIO write
> > > can trigger a PCI message, such as PME_Turn_Off.
> > > 
> > > Add common dwc_pme_turn_off() function.
> > > 
> > > Call dwc_pme_turn_off() to send out PME_Turn_Off message in general
> > > dw_pcie_suspend_noirq() if there are not platform callback pme_turn_off()
> > > exist.
> > > 
> > 
> > How about:
> > 
> > "Instead of relying on the vendor specific implementations to send the
> > PME_Turn_Off message, let's introduce a generic way of sending the message using
> > the MSG TLP.
> > 
> > This is achieved by reserving a region for MSG TLP of size 'pci->region_align',
> > at the end of the first IORESOURCE_MEM window of the host bridge. And then
> > sending the PME_Turn_Off message during system suspend with the help of iATU.
> > 
> > It should be noted that this generic implementation is optional for the glue
> > drivers and can be overridden by a custom 'pme_turn_off' callback."
> > 
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-designware-host.c | 94 ++++++++++++++++++++++-
> > >  drivers/pci/controller/dwc/pcie-designware.h      |  3 +
> > >  2 files changed, 93 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > index 267687ab33cbc..d5723fce7a894 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > @@ -393,6 +393,31 @@ static int dw_pcie_msi_host_init(struct dw_pcie_rp *pp)
> > >  	return 0;
> > >  }
> > >  
> > > +static void dw_pcie_host_request_msg_tlp_res(struct dw_pcie_rp *pp)
> > > +{
> > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > +	struct resource_entry *win;
> > > +	struct resource *res;
> > > +
> > > +	win = resource_list_first_type(&pp->bridge->windows, IORESOURCE_MEM);
> > > +	if (win) {
> > > +		res = devm_kzalloc(pci->dev, sizeof(*res), GFP_KERNEL);
> > > +		if (!res)
> > > +			return;
> > > +
> > > +		/* Reserve last region_align block as message TLP space */
> > > +		res->start = win->res->end - pci->region_align + 1;
> > > +		res->end = win->res->end;
> > 
> > Don't you need to adjust the host bridge window size and end address?
> 
> Needn't. request_resource will reserve it from bridge window. Like malloc,
> if you malloc to get a region of memory, which will never get by malloc
> again utill you call free.
> 

Hmm, will that modify the window->res->end address and size?

> > 
> > > +		res->name = "msg";
> > > +		res->flags = win->res->flags | IORESOURCE_BUSY;
> > > +
> > 
> > Shouldn't this resource be added back to the host bridge?
> 
> No, this resource will reserver for msg only for whole bridge life cycle.
> Genenally alloc resource only happen at PCI devices probe. All pci space
> will be fixed after system probe.
> 

I don't think so. This resource still belongs to the host bridge, so we should
add it back.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
