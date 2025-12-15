Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0196E23D7D4
	for <imx@lists.linux.dev>; Mon, 15 Dec 2025 20:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765829472; cv=none; b=NVJUMKngyAz8JuHq8Gc9+zqfrs6eALqGuf31nO73xFlSfXdOoFv6Wm5i+DqfUF59roJVyO1kNVfV/kMMw1jhqqyvy91KUk9RDxZ4iCj/Q+k9d49LDBl8pkHka9EWOEHU0DRKOrrphiu8Ntp5iGdeC5fNTyXPIVX+C92uidxfnmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765829472; c=relaxed/simple;
	bh=bZS2d4r6+t0avva4udbs7u4lgZ+/m7V0Af/OnBnRGOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJyvnX1nrSmb+6cG0q/N9ngVblUrborUB8ZQB6sY49TBjsq+QqZl9QEDsLVRFi1vhohar/DjJX9nc+kVql/R74ls+f3yhfHNTKWZMuMySn6J3027V0+EmgqOC9hScqff54xHN635UAcnXKdXnHKtqgym/HkeQ3LrQoC/DS9A2uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2yF6tMi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2yF6tMi"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775ae77516so46598345e9.1
        for <imx@lists.linux.dev>; Mon, 15 Dec 2025 12:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765829468; x=1766434268; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NVHWp8cheEcClOBV4c/zxK94NkQEphirpcQRQ+Yuj0w=;
        b=C2yF6tMiQsKxYiUOvqvQiefL6jGaq1IO+Mz6WfB2U/ih8cc04OB4LvOdJz6qPMUmYL
         bgVrHHqpwTsnMzenjE7BVLOdaokMy17NCjeRaPeZcfkW3T2SJnh2X4RKAOEVl9jLyYFe
         Y7mtP9rpiw9GAWZA5WBhgTJ2UGgUs1bTFoY1Z7LNvX9kZ8jJbHN3EE1EB4VcRutfM2FX
         NESQYwYZNbz0B1p4DBDUddLF3gOTGFAEKoFYOBMb3VLnKwDJZ8myLsXx0fRzPLvnDi5p
         6CZe8xcXVve6GMiDGf8uCPRrq+/ey3gndagat2jPKeSdagqvNPkhnTyhmeBoS0zUgOxe
         WedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765829468; x=1766434268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVHWp8cheEcClOBV4c/zxK94NkQEphirpcQRQ+Yuj0w=;
        b=cY/WQIb/5AaK3R2iegl4+YOX9JqGhnDDld75ev7EAW/GopJWUJsmA0+yNb8K/VlX23
         5TE/HrODkM5FbhRozAsGPPhwObGGZdqKz13+D+hObuzQlc3/e0Vm4lAno7TNVYdULtIf
         tm3F/dEhFPZszj547nAzs+eyxsMGmHJbvsu0VmbEEvBxwylqclqrcYhc5itERbLT8gi5
         FDJnDhaZ/tyDn47kPxk6pZmHCvuvQ5YsqcSQMwBjRLt935cl6usv4Udb4MLYs68k7D6D
         KgtdgWbeUl4boHcd29lpH9P2qSHo3NNVEpITZWP6/o/HEbXnuasr2HzJ8H8RMGAxJpFV
         8PAg==
X-Forwarded-Encrypted: i=1; AJvYcCWUUdK/Hl9lIQyVKt8+GciUZzKAdx6ELARWWO7uu5wWaV5pVrlIslmk2zFefB2lYBcERHM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfcwOruYSdbaBY/gxp/20hBCKsELgb7ePujR7LuTNdojG9zZtM
	jpnOT7tXQPVUI/PB03PhbneyCtkEp/iR2892X18AEjdxR4NGFmjFIW19D0XDsEpTUec=
X-Gm-Gg: AY/fxX7ftL1T5MGq8gNBS2KXH6BPvTQaNNyg2bKU4tNeHsPwgMW9wcXSlI6fuhYdH9n
	90zJvLo4icC0Q3YVh/3oyJdCVKpnFxzE7LRkoxl3FD63RMNyGQuR/djvmMQrpV332R62cTst50N
	6VoWnLRlmwymy2CwX4O3HkX04q6SnEZVg+na+84uOmIVRfZebMCyXliIcwo6yXZ06kr8PalBcvz
	Oqf8xY74LK5AOAxhkj9AnN1920AktB5hUajNA7EEx9enhoGPLeCYG7whVIat1KXPlk11g3xuOhA
	W8KYrSKTxQTJPeCOBgfZAygINgKCOqXoIw4LNdt/lxS0QgCeeFxhkuYYlTKfv9j2lAhqHyrofr+
	2tx4RLaQ5ImBArTddpu3SeQr/HzwQJN/Pbh9Z2D5h1qA8c2HQs4R4z3rRmgSNJgbPgHwnxzugC4
	sf8HFsIJJMxMPZlEhY
X-Google-Smtp-Source: AGHT+IFzTdgd8HuBCRpheWEKJMhw6vXCy8KxXaScp0+GwrnVXW68cCuyCfDLEuzw7wX+ZV30A2XRQg==
X-Received: by 2002:a05:600c:46c4:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-47a8f9046fcmr137755605e9.20.1765829468100;
        Mon, 15 Dec 2025 12:11:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4ace61sm200864155e9.7.2025.12.15.12.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 12:11:07 -0800 (PST)
Date: Mon, 15 Dec 2025 23:11:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, linaro-s32@linaro.org
Subject: Re: [PATCH v2 0/4] s32g: Use a syscon for GPR
Message-ID: <aUBrV2_Iv4oTPkC4@stanley.mountain>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
 <aUAvwRmIZBC0W6ql@lizhi-Precision-Tower-5810>
 <aUBUkuLf7NHtLSl1@stanley.mountain>
 <aUBha2/xiZsIF/o5@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUBha2/xiZsIF/o5@lizhi-Precision-Tower-5810>

On Mon, Dec 15, 2025 at 02:28:43PM -0500, Frank Li wrote:
> On Mon, Dec 15, 2025 at 09:33:54PM +0300, Dan Carpenter wrote:
> > On Mon, Dec 15, 2025 at 10:56:49AM -0500, Frank Li wrote:
> > > On Mon, Dec 15, 2025 at 05:41:43PM +0300, Dan Carpenter wrote:
> > > > The s32g devices have a GPR register region which holds a number of
> > > > miscellaneous registers.  Currently only the stmmac/dwmac-s32.c uses
> > > > anything from there and we just add a line to the device tree to
> > > > access that GMAC_0_CTRL_STS register:
> > > >
> > > >                         reg = <0x4033c000 0x2000>, /* gmac IP */
> > > >                               <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> > > >
> > > > We still have to maintain backwards compatibility to this format,
> > > > of course, but it would be better to access these through a syscon.
> > > > First of all, putting all the registers together is more organized
> > > > and shows how the hardware actually is implemented.  Secondly, in
> > > > some versions of this chipset those registers can only be accessed
> > > > via SCMI, if the registers aren't grouped together each driver will
> > > > have to create a whole lot of if then statements to access it via
> > > > IOMEM or via SCMI,
> > >
> > > Does SCMI work as regmap? syscon look likes simple, but missed abstract
> > > in overall.
> > >
> >
> > The SCMI part of this is pretty complicated and needs discussion.  It
> > might be that it requires a vendor extension.  Right now, the out of
> > tree code uses a nvmem vendor extension but that probably won't get
> > merged upstream.
> >
> > But in theory, it's fairly simple, you can write a regmap driver and
> > register it as a syscon and everything that was accessing nxp,phy-sel
> > accesses the same register but over SCMI.
> 
> nxp,phy-sel is not standard API. Driver access raw register value. such
> as write 1 to offset 0x100.
> 
> After change to SCMI, which may mapped to difference command. Even change
> to other SOC, value and offset also need be changed. It is not standilzed
> as what you expected.

We're writing to an offset in a syscon.  Right now the device tree
says that the syscon is an MMIO syscon.  But for SCMI devices we
would point the phandle to a custom syscon.  The phandle and the offset
would stay the same, but how the syscon is implemented would change.

> 
> >
> > > You still use regmap by use MMIO. /* GMAC_0_CTRL_STS */
> > >
> > > regmap = devm_regmap_init_mmio(dev, sts_offset, &regmap_config);
> > >
> >
> > You can use have an MMIO syscon, or you can create a custom driver
> > and register it as a syscon using of_syscon_register_regmap().
> 
> My means is that it is not necessary to create nxp,phy-sel, especially
> there already have <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> 

Right now the out of tree dwmac-s32cc.c driver does something like
this:

    89          if (gmac->use_nvmem) {
    90                  ret = write_nvmem_cell(gmac->dev, "gmac_phy_intf_sel", intf_sel);
    91                  if (ret)
    92                          return ret;
    93          } else {
    94                  writel(intf_sel, gmac->ctrl_sts);
    95          }

Which is quite complicated, but with a syscon, then it's just:

	regmap_write(gmac->sts_regmap, gmac->sts_offset, S32_PHY_INTF_SEL_RGMII);

Even without SCMI, the hardware has all these registers grouped together
it just feels cleaner to group them together in the device tree as well.

regards,
dan carpenter

