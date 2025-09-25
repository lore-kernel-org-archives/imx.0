Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43951125A0
	for <imx@lists.linux.dev>; Thu, 25 Sep 2025 17:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758820576; cv=none; b=B55+hPL3xsZG7vCIP2FL+hxYeeLR67IfAPmVmmD0Zqto3D+xrtVIkTqqj+fZ5SQ4Lp4YLEnchotq/3zdMkFcAh5Mn/8x2SmxA4pPgtUX0H5ipSYIVLqxzvKiKJE0aGBS7djauYZw49zRQ8UW4NRjWrfr2YvbnUBZNsEf2fUXTuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758820576; c=relaxed/simple;
	bh=Zv82gIXaLAAzi9Py9v1c5XK2EiDFpXVZ/NJKU+kigKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEG5QMxlrFgkANLCY/xzNS9/Wy8rtysMCOY5OIlypgue7q//SIbuEqG9S2xv0zaLXJyM3AyFdFK1aHtql+fJe5u4bx1+C1NaualZ4IefviAx3OLaBeIlgtQyyizMDMUsQKtTlsczO/90XdZRk0vmQPkTkiyuVOcDOHd0pePLYLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uIgLsGGB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uIgLsGGB"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6228de280a4so2301824a12.2
        for <imx@lists.linux.dev>; Thu, 25 Sep 2025 10:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758820573; x=1759425373; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gfSUBmjDQGS07XOuZOfB4dv6p+6TOkn4sFnsfwrItDc=;
        b=uIgLsGGBOeWikgE9173/1Wn7gRdS7mpRUYybWvy8+rKlADoFDLrTIPWFI+FZKTfeCf
         Ss9IzX3GObpkvfipa3M8NMIv9xK4FA0x1+4mLPROkagqXU7DeK5PXbmkLwkS3Z1CdEcx
         YWTlGuKOTFlPRc/8EzNQimcrL5pOMPSn76m/4962fzxk0VLwg97JYzoUm8jZKPv6NmNG
         xlpViY1GbrVXlNIcnWNeU9vPbGpPqwSA49VYV3XnfLrEDwhINdG4Rncj0QUYUhu+B1Xa
         v1/rFVGsAedMisPQSpXpcKu9xSqAWacH2l2UMbu07ch5k473SB/u8H6Fa7bLDGQbDuqv
         AjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758820573; x=1759425373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfSUBmjDQGS07XOuZOfB4dv6p+6TOkn4sFnsfwrItDc=;
        b=CZTMyK14Nk0bnbJkItVt3uFWi+iRjphSY4x4W63V+6b84SZbp2qBa3lnUFVzqtUhWj
         n1JDSKDyzQjMBAtFjaaH+55RixhoY0wB+O1zgEIPFwB3J4z01n2oI4Marcs88T1d11SF
         VdElqlwlB1zD1hu6QRzw3grEiLCatINGFU8E6gd7sw+ykVs+jO0CwjzzUQaP0ovSVJ0V
         uJ1XWvL9elfaCpT/PVp5VbHOv6PXfKmDmp3+XfQJ/yIYW9xUMzrfiJhJAtdE7yCXj/0X
         fUJ+XDGO38+8ZHDCdvgS0odqVCdDD6vsNIV2zBiDq2ZsSVQATXsZhGCtN/Tlia/5pP9e
         uEQg==
X-Forwarded-Encrypted: i=1; AJvYcCVfQJjdcxmjprR3GyQjaWsgM3XNFQQXbfq7fVZlIeu7hslRVb52ZeegEetUjWqGWQHJNxE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWi/41p4MhI6EZNsn2VW1itBtZoXGSL+K84FX1FKk3kGeSaKIU
	f7r4BquhCY8GEOEMByAm1IZs3ZxFGEgwf4EWFhvN/iPpJ5MB/eM3UJhTqHO4pmM010FlAevpFKI
	q+fOofDpv1KZ0peZLlGZ6D+8X9vfg4fIafXtDGphPyQ==
X-Gm-Gg: ASbGncuSVSYNSghtfmToNu2F86wrauhKPlvuwjHZ9yui2qjNBq2BjpwlxSM1noM3Sru
	5o8ayohmDPC+u7Pvw5dJ8N7MhJxjR55nyehUB5XrqgDmhQmBZDqUWMeBXAM4TgexZDY224/s1Rr
	vBTQQ2F9DFHht/DGzT3maajgQpbHvmZG7nL8TjEpRZnj7oXAF9+1HTb6rlr2Ik8XPgB5c1Rp3Dq
	l0LVnx0oIEfYFg6uHyQLMwZRyTxfzd2pS21
X-Google-Smtp-Source: AGHT+IGDhhdx+YuZcr8I4Tult1/nPYdF84/cpZUAmbh+gOazNWoxtTztWVZU1nAmJ8EOHh1jeTaA57QtgllGSnlOLdQ=
X-Received: by 2002:aa7:d441:0:b0:62f:68c3:57d0 with SMTP id
 4fb4d7f45d1cf-6349f9cbc18mr2542494a12.4.1758820572615; Thu, 25 Sep 2025
 10:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-4-vincent.guittot@linaro.org> <aM2L0C4SsGTzLQwi@lizhi-Precision-Tower-5810>
In-Reply-To: <aM2L0C4SsGTzLQwi@lizhi-Precision-Tower-5810>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 25 Sep 2025 19:16:01 +0200
X-Gm-Features: AS18NWCvFPXEZU7r1XpqWeh25XNcMYT0B_gX-68ydY8oAsZKJCM-yUYMplLol9w
Message-ID: <CAKfTPtC4TS-PwMa7-BSV6qS=YjnFczwj42USqJ8=YX3X0cdTxA@mail.gmail.com>
Subject: Re: [PATCH 3/3 v2] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
To: Frank Li <Frank.li@nxp.com>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Sept 2025 at 18:59, Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Sep 19, 2025 at 05:58:21PM +0200, Vincent Guittot wrote:
> > Add the s32g PCIe driver under the ARM/NXP S32G ARCHITECTURE entry.
>
> I think common ARCH maintainer part should only include core port of SOC.
>
> PCI driver should be sperated entry.

I can make a dedicated entry for s32g PCI


>
> see PCI DRIVER FOR IMX6
>
> Frank
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  MAINTAINERS | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index cd7ff55b5d32..fa45862cb1ea 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3084,12 +3084,16 @@ R:    Chester Lin <chester62515@gmail.com>
> >  R:   Matthias Brugger <mbrugger@suse.com>
> >  R:   Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> >  R:   NXP S32 Linux Team <s32@nxp.com>
> > +L:   imx@lists.linux.dev
> >  L:   linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:   Maintained
> > +F:   Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
> >  F:   Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> >  F:   arch/arm64/boot/dts/freescale/s32g*.dts*
> > +F:   drivers/pci/controller/dwc/pci-s32g*
> >  F:   drivers/pinctrl/nxp/
> >  F:   drivers/rtc/rtc-s32g.c
> > +F:   include/linux/pcie/nxp-s32g-pcie-phy-submode.h
> >
> >  ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
> >  M:   Jan Petrous <jan.petrous@oss.nxp.com>
> > --
> > 2.43.0
> >
