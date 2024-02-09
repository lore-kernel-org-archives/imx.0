Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E6969944
	for <imx@lists.linux.dev>; Fri,  9 Feb 2024 09:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707472380; cv=none; b=TPa6EvABybpzsIvs3f2XVbnpLycDunP6YHWfp3tSHjYci7/WaLu44miIm6X555v7BiaauQb2Xiv3ocAjTQ2/bQvrbBnUYYRKxX5bBkbvgPcgXwzat+ZIWUcJpe7KgbwsnV2yXwFr6XvRG42gQJQv0E+k9ZgzOieTXkELVUBfxZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707472380; c=relaxed/simple;
	bh=iVzoL3o7JUS146pZQBt+eZtE43hCFkiCYA9D9Tpn9lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHO5KDBJfSRwgSlNQcAkeLh+iydUIUH/MTak3hZ+1sH4CfmmuxvvXAMEKqJRIzQteZKYLpV5IwchjQK1ZAR7HLY290MCzT/IUbP8vsBkiiRErD9f2KXSSbs2VOi1g15P9SFS8+vqO94sWeVgTB4FPpDqNvxizGYohQ3blgN+tCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJJCD2gT; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJJCD2gT"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5112bd13a4fso2011708e87.0
        for <imx@lists.linux.dev>; Fri, 09 Feb 2024 01:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707472376; x=1708077176; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eiV2K5pZJw71dGzNyLKMSPjJLxHQRGdnK/KkiTE5WaY=;
        b=UJJCD2gTBJ6CPr9MggZ9OcToHu7t85ckd6AoZAHdqkqgvNdt00KFBN3/O+V34HYSRk
         VRwjY0t5Mf9RFDZY7XJvuIWq/0esCU+I3ylZWrs19V3ug+1mOCFbS3xA4d1XQMvoe7mO
         DQgfH1dHCJj5wzaMrviZEhbZe0dz1tEn3pmr5LG2wXqVP3gKnBcM90uM7l4JiJyH64SI
         KSi8t2mYnXyCpjo0hm+f5cdeKBFgkjA8J7/WajcSoXhp7N4HMYpuCJWVtVcH1668AWhE
         xXPHR3SD3Shn4EfjrxB6dh87Z7PyTA00pq19zh/AuYUpketMmtnJNGvQw58GDQK6PBv/
         ZFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707472376; x=1708077176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiV2K5pZJw71dGzNyLKMSPjJLxHQRGdnK/KkiTE5WaY=;
        b=O00NwJGjTfcGDN5QA61PD/Y8IKi9jff0pzH6giD38c7VskPZd2yFBcv4jTlVfw9A1y
         cz9Cmrgo6E61i6GPmZb9BWKJl6oSeJibHJ/uWtj/hxnWRjoVbg9uz872sFlFUNLDz1IG
         ImOz0VbZbSJChDCzaUhDdlaYG7hfES1hmLLJR8oBCabVg8w14w/0NemiPh7Jxplj3hMc
         NkiS59+Hq04LFHcW0PEJt8OGs3X//uTJBbZh6yCt3uFwubOS7QXU+GS0jTnjYovRPefy
         LMQ17HjMm7hp0GjFPPPbEhKrOqJ1guG32nZdCVCsqdh4o+UaEgoNWpz0cWjVD5Se1dGQ
         jjZw==
X-Forwarded-Encrypted: i=1; AJvYcCUTM84rKa+CjO0IQ9KRfstcEiGm5plKsI1FSprV/VQJD/N+4HE/PSXYlkGVsTfLMNC4XUmHtyyvagYppKFmXSoLLodA
X-Gm-Message-State: AOJu0YxgUB3dntF35RA1KI8do0VgCKkjHNIgFjzXEXYTo+l2ZS2eObFp
	72bKkJBV3E+cqwjwUQolRkFWRCrNyLdC5Rr9SK5f5aZ1dziNLXXl
X-Google-Smtp-Source: AGHT+IHkRzAfsj6AV5nFtVc0uRgnhec7BneScP04Ft7o+QBqpDeEz/4O/PlmlO1S7CmcKMtPYmhr2w==
X-Received: by 2002:ac2:5611:0:b0:511:3bce:9157 with SMTP id v17-20020ac25611000000b005113bce9157mr211091lfd.9.1707472376208;
        Fri, 09 Feb 2024 01:52:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX4Nlogw9/inrehVzw1A/MaI06NEnGBb2Wd+Ej1VNkQrwDQRJkb8zsZaHSsNJdSa8t2W5F54hkpFTcu9nSQhbEuSPWrQZrj7zYM0O8HeB7ZuwOLpHKG8rRr4a8bZpzio4QDjoF5FTNtaoP86eTNMcXCLJc/UMwhb9QtpgXgBRhI8DcHZKNY+z0H2OIu1YuWCvn9PRSIZsJw4PKuAbcLvqHBzXOoOOx/yjnxOxJkm6fvQ7D+1QOnm7quvabMZoK0QGKEA+BkOQHf++ld6Clb/f+tDJyq3Uey3uqVytSMj4ryOmXP+mDFmJnlxsVV8qSRB2FQHSYQO26F6YeRIpdQHKLDOi4wRVqqhc0MJWkRgh1bRCY2B/CILpe+6KYx1aw/3pVvGCAidwUry1IKmJzAdna5ovfx8ThVhrHPE/cOXgi3DW7lyjjXPEpEr0sWQRkasJ07Se4B/+1jHoOZr1o=
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id q28-20020ac246fc000000b0051134f1cf5fsm237130lfo.271.2024.02.09.01.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 01:52:55 -0800 (PST)
Date: Fri, 9 Feb 2024 12:52:52 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/6] dt-bindings: PCI: dwc: Add 'msg' register region
Message-ID: <gl7zmzkezr6k4txrrgqyikspfah3vmgwwz2e3j5kwb2iarpkxv@3ofwrhtxl2sz>
References: <20240202-pme_msg-v3-0-ff2af57a02ad@nxp.com>
 <20240202-pme_msg-v3-5-ff2af57a02ad@nxp.com>
 <eg7wrjp5ebz43g37fvebr44nwkoh4rptbtyu76nalbmgbbnqke@4zugpgwesyqd>
 <20240205183048.GA3818249-robh@kernel.org>
 <ZcEzYdZKotBJlR5i@lizhi-Precision-Tower-5810>
 <ZcK2/tmLG9O7CBEH@lizhi-Precision-Tower-5810>
 <luk5hswq4wnk5p7axml73qih35hio3y3pfnklctbn6rwres62s@mumnvygjh5ch>
 <ZcOpehO3rzCfAwXf@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZcOpehO3rzCfAwXf@lizhi-Precision-Tower-5810>

On Wed, Feb 07, 2024 at 11:02:02AM -0500, Frank Li wrote:
> On Wed, Feb 07, 2024 at 03:37:30PM +0300, Serge Semin wrote:
> > On Tue, Feb 06, 2024 at 05:47:26PM -0500, Frank Li wrote:
> > > On Mon, Feb 05, 2024 at 02:13:37PM -0500, Frank Li wrote:
> > > > On Mon, Feb 05, 2024 at 06:30:48PM +0000, Rob Herring wrote:
> > > > > On Sat, Feb 03, 2024 at 01:44:31AM +0300, Serge Semin wrote:
> > > > > > On Fri, Feb 02, 2024 at 10:11:27AM -0500, Frank Li wrote:
> > > > > > > Add an outbound iATU-capable memory-region which will be used to send PCIe
> > > > > > > message (such as PME_Turn_Off) to peripheral. So all platforms can use
> > > > > > > common method to send out PME_Turn_Off message by using one outbound iATU.
> > > > > > > 
> > > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > > ---
> > > > > > >  Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 4 ++++
> > > > > > >  1 file changed, 4 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> > > > > > > index 022055edbf9e6..25a5420a9ce1e 100644
> > > > > > > --- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> > > > > > > @@ -101,6 +101,10 @@ properties:
> > > > > > 
> > > > > > >              Outbound iATU-capable memory-region which will be used to access
> > > > > > >              the peripheral PCIe devices configuration space.
> > > > > > >            const: config
> > > > > > > +        - description:
> > > > > > > +            Outbound iATU-capable memory-region which will be used to send
> > > > > > > +            PCIe message (such as PME_Turn_Off) to peripheral.
> > > > > > > +          const: msg
> > > > > > 
> > > > > > Note there is a good chance Rob won't like this change. AFAIR he
> > > > > > already expressed a concern regarding having the "config" reg-name
> > > > > > describing a memory space within the outbound iATU memory which is
> > > > > > normally defined by the "ranges" property. Adding a new reg-entry with
> > > > > > similar semantics I guess won't receive warm welcome.
> > > > > 
> > > > > I do think it is a bit questionable. Ideally, the driver could 
> > > > > just configure this on its own. However, since we don't describe all of 
> > > > > the CPU address space (that's input to the iATU) already, that's not 
> > > > > going to be possible. I suppose we could fix that, but then config space 
> > > > > would have to be handled differently too.
> > > > 
> > > > Sorry, I have not understand what your means. Do you means, you want
> > > > a "cpu-space", for example, 0x8000000 - 0x9000000 for all ATU. 
> > > > 
> > > > Then allocated some space to 'config', 'io', 'memory' and this 'msg'.
> > > 
> > > @rob:
> > > 
> > >     So far, I think "msg" is feasilbe solution. Or give me some little
> > > detail direction?
> > 
> > Found the Rob' note about the iATU-space chunks utilized in the reg
> > property:
> > https://lore.kernel.org/linux-pci/CAL_JsqLp7QVgxrAZkW=z38iB7SV5VeWH1O6s+DVCm9p338Czdw@mail.gmail.com/
> > 
> > So basically Rob meant back then that
> > either originally we should have defined a new reg-name like "atu-out"
> > with the entire outbound iATU CPU-space specified and unpin the
> > regions like "config"/"ecam"/"msg"/etc from there in the driver
> > or, well, stick to the chunking further. The later path was chosen
> > after the patch with the "ecam" reg-name was accepted (see the link
> > above).
> > 
> > Really ECAM/config space access, custom TLP messages, legacy interrupt
> > TLPs, etc are all application-specific features. Each of them is
> > implemented based on a bit specific but basically the same outbound
> > iATU engine setup. Thus from the "DT is a hardware description" point
> > of view it would have been enough to describe the entire outbound iATU
> > CPU address space and then let the software do the space
> > reconfiguration in runtime based on it' application needs.
> 
> There are "addr_space" in EP mode, which useful map out outbound iatu
> region. We can reuse this name.
> 
> To keep compatiblity, cut hole from 'config' and 'ranges'. If there are
> not 'config', we can alloc a 1M(default) from top for 'config', then, 4K
> (default) for msg, 64K( for IO if not IO region in 'ranges'), left is
> mem region. We can config each region size by module parameter or drvdata.
> 
> So we can deprecate 'config', even 'ranges'

Not sure I fully understand what you mean. In anyway the "config" reg
name is highly utilized by the DW PCIe IP-core instances. We can't
deprecate it that easily. At least the backwards compatibility must be
preserved. Moreover "addr_space" is also just a single value reg which
won't solve a problem with the disjoint DW PCIe outbound iATU memory
regions.

The "ranges" property is a part of the DT specification.  The
PCI-specific way of the property-based mapping is de-facto a standard
too. So this can't be deprecated.

> 
> > 
> > * Rob, correct me if am wrong.
> > 
> > On the other hand it's possible to have more than one disjoint CPU
> > address region handled by the outbound iATU (especially if there is no
> > AXI-bridge enabled, see XALI - application transmit client interfaces
> > in HW manual). Thus having a single reg-property might get to be
> > inapplicable in some cases. Thinking about that got me to an idea.
> > What about just extending the PCIe "ranges" property flags
> > (IORESOURCE_TYPE_BITS) with the new ones in this case indicating the
> > TLP Msg mapping? Thus we can avoid creating app-specific reg-names and
> > use the flag to define a custom memory range for the TLP messages
> > generation. At some point it can be also utilized for the config-space
> > mapping. What do you think?
> 

> IORESOURCE_TYPE_BITS is 1f, Only 5bit. If extend IORESOURCE_TYPE_BITS, 
> all IORESOURCE_* bit need move. And it is actual MEMORY regain. 

No. The lowest four bits aren't flags but the actual value. They are
retrieved from the PCI-specific memory ranges mapping:
https://elinux.org/Device_Tree_Usage#PCI_Address_Translation
https://elixir.bootlin.com/linux/latest/source/arch/sparc/kernel/of_device_64.c#L141
https://elixir.bootlin.com/linux/latest/source/arch/sparc/kernel/of_device_32.c#L78
Currently only first four out of _sixteen_ values have been defined so
far. So we can freely use some of the free values for custom TLPs,
etc. Note the config-space is already defined by the ranges property
having the 0x0 space code (see the first link above), but it isn't
currently supported by the PCI subsystem. So at least that option can
be considered as a ready-to-implement replacement for the "config"
reg-name.

> 
> Or we can use IORESOURCE_BITS (0xff)
> 
> /* PCI ROM control bits (IORESOURCE_BITS) */
> #define IORESOURCE_ROM_ENABLE		(1<<0)	/* ROM is enabled, same as PCI_ROM_ADDRESS_ENABLE */
> #define IORESOURCE_ROM_SHADOW		(1<<1)	/* Use RAM image, not ROM BAR */
> 
> /* PCI control bits.  Shares IORESOURCE_BITS with above PCI ROM.  */
> #define IORESOURCE_PCI_FIXED		(1<<4)	/* Do not move resource */
> #define IORESOURCE_PCI_EA_BEI		(1<<5)	/* BAR Equivalent Indicator */
> 
> we can add
> 
> IORESOURCE_PRIV_WINDOWS			(1<<6)
> 
> I think previous method was more extendable. How do you think?

IMO extending the PCIe "ranges" property semantics looks more
promising, more flexible and more portable across various PCIe
controllers. But the most importantly is what Rob and Bjorn think
about that, not me.

-Serge(y)

> 
> > 
> > -Serge(y)
> > 
> > > 
> > > Frank
> > > 
> > > > 
> > > > Frank
> > > > 
> > > > > 
> > > > > Rob
