Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0D42ECD34
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 06:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770101797; cv=pass; b=Tl6mWP0nBOPbpWTZ2aGZ+5aVBMntzprbY8AuXwzCkRZNb97aWu0Whh8V1X4SqVOTR+TRjZYZw5UaJ8LWdc5Ik90ZhQbMye12LkjcxKeLCxqOYgBgRnXAO33zv1ZzuN4jr9gnq0+TndVg/W60tTlSPSHpNFeZtU9aPVhn5l9j/bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770101797; c=relaxed/simple;
	bh=P/Ggq90pDvb5xr5Ttkl63HqWY+uM9O4Zm1z7/pblo90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l8bTwL0XA2Ihv18QggCkltQkZu9rjndsTym3NBoe5eupTVdhs36wxZFqMxusEkvoVXDqkDaHDIE6/Wk+RciuXtp3JTevSUdg9AJjKyrTBT5/Laa0jaHAI4nit2qNtfQJypnipcwKUtlQf8j47ib0pRJU8Xd/7s2OV3pDiYb1/W8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CupYM0ic; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CupYM0ic"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b886fc047d5so992839166b.3
        for <imx@lists.linux.dev>; Mon, 02 Feb 2026 22:56:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770101794; cv=none;
        d=google.com; s=arc-20240605;
        b=j4gDXWLE1B2EUbXNOzUBtAO+AkdBv7d/7k0r3tZrWAM2MPEyvuRsgpUeMhUtMtnJp9
         MV07WabUoD0rUEw+KetYzeWrNH+9FlAFjvUja3bQHZw7VbrPSq2cd1rNAHfoNUo0klKn
         GwNPk71bcquYbz9SdW1+Ozp/PlaUSfhCs+qUzeFbjCUQqfohS4jqbDJJST6UJBa4xXLL
         hY31LsgkcloelegA1pBD+I/6W27MO0QdoJnZOs3Ev6JMgN2ZoEogzQwUp92XQoDZVtqk
         Z7+4Clg8fXROU+m2sl4EgrYriKimCr29hfW752gxjc7sYrBnrBDGgqPTPLYR/wkb7f2b
         LSzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hPfG7IVpjEneMOzN4kNdadNHZSe9In0bxUCOtJ3itiY=;
        fh=8xOQkW5TQ3Lf1AK1H8un5dMI3EkDWnOy5M5HIIH1Uac=;
        b=g4GsE8yF8b1AZV1xHp2c0J08Zzi7S1Nn2TEoIJ9XbNLY9gfXLqCynhY1MfU/D/yBZk
         AA8ltR3Ff2CQosrA+l0lpEKdQIgAoP5tkmseuh7nQbjruxB1XbsMXX42BrbePh+ecBDy
         NedETATkbehkUvlJB8/YQVyLWtNLzqbR5JtEvL/bRKJIfTbg/3VntvTW/KIIiItljl3j
         RRv1Ghbs9dfMb1G/s8ts3864ii40GsftwyHf8QS/2KyqarqdalviR2IHaZ3GLPa6OVoa
         eVKQG+ttez2NoGDFEiCf9o8QxzgwjgtyHLVu28ejD5LUzPZXW+bE65brC36zvVeEZn1M
         enBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770101794; x=1770706594; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hPfG7IVpjEneMOzN4kNdadNHZSe9In0bxUCOtJ3itiY=;
        b=CupYM0icpRZ9V513Vs8NLyCWQgESTnZoMqRhAvvhqbIMDCS9fukyvvwui4M/wclzIS
         7pqIcGRcCCxQi6YEtSpq+BPf7JiXdN/bJNw3xwSxHN0HQuHXNXt2176VcUWhcklodpmj
         QxUTQaMBpJq12bLuppcJXsuBJEM3BpdShEbt/Ukjvm+RXOQ2uoWambcBMrT/MUu/Al9n
         vaRFEIBP2t57W7pSvz9fq8kNngLYZG6ishOA+W+i9ardFH79lM5D3niRdm0QC0tYswIr
         9vo6Uwwt7qeJtDOBOSloGkrpli1zDPsQVASBU4o+i29LwSGNxumFhdSL9m+88yPKHCtz
         atfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770101794; x=1770706594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPfG7IVpjEneMOzN4kNdadNHZSe9In0bxUCOtJ3itiY=;
        b=IZXZXk+OOrSjoLUQGygXDui2mTkIgr3LMdfuPZ5z7QkIWZuyVISonLke9siGpe0oXm
         Gu0P6GYZ4fk+aAMmhvCT34bTztXnaNc1UvKgFjIxMpZvxXp/if5uZGKlAiMzlIPoMhBX
         aqJOVvlPBuN6k7K7VdqJf4EF0lGH/RfIbAUnSYb2zlufkppdsVpHq5gMUkVsolgqjtDc
         Jy8grBiYJtQHSUvqKgxcRiUt4+FDpOfyzcTP6VC2PkoarkYUChr4Ipxw9Zri0igKBAEq
         GZcMbo0VDV6eMPUiKSNaTC8kQDiQspBfmIm1wmBDRAdXa5EaaiJH0rUGwNgX4lKS8/wW
         OOzw==
X-Forwarded-Encrypted: i=1; AJvYcCXRrN+HL5r7AvRaYhL93o35/KylrshBjXfJTjtOel5ZX8BdOElhqCdzmZikbXOsdSLMQ9E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwY+8IbWo7GiRmvkkAWlO0DcMEAjlRcC76lBiuYZehV1FNdCk5o
	8q/Xnsi6fbsBWMgOIcviFD1kNKMWATnCl5oH6wiAQS7dMkcPuJ1yvpltZ1nWupddGISGVvIGURl
	zr+0s6wAYsEKVCDCjF+1tOC5L/u2wYiKAlMIU5C0nAQ==
X-Gm-Gg: AZuq6aJ2x+8mvHpyWPXhLlxu/NpOm3lkWhaY5UtJQVdKjGixL6yVrjM9Ycv9I01zSQW
	0KliVC9lUzjCvZqXcdAHsDvsP6AvclBvYSRokE+/Ez/S14BKE40kNLFTu1KlQIfHJt71cLK0OM4
	E8z4+G8CvoaY7Z/LvtFof6Dw/uHl22cWbXyziD+R5glF0DlmRY8JtPmLSW2RbBALxjDQ630IojY
	csh9bMpu2di99RCvTa8/aJtjDp3AU4zEDySdrNqXUfJ4V5bpBBmCRulXJMo1/rUrfiCbj61jHiM
	fzsimlfTZsQHkL/wokA+RA==
X-Received: by 2002:a17:907:94d0:b0:b87:892:f43b with SMTP id
 a640c23a62f3a-b8dff68456emr931355166b.42.1770101794402; Mon, 02 Feb 2026
 22:56:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260202151050.1446165-1-vincent.guittot@linaro.org>
 <aYDiFpGT5hEDDFhV@lizhi-Precision-Tower-5810> <CAKfTPtDjad7aowTQ3UJPi5Qqgzf3q8J=kASa-t3YM4zfjUv3-w@mail.gmail.com>
 <aYD+/iTSF8ikTLIY@lizhi-Precision-Tower-5810>
In-Reply-To: <aYD+/iTSF8ikTLIY@lizhi-Precision-Tower-5810>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 3 Feb 2026 07:56:23 +0100
X-Gm-Features: AZwV_Qg5Kwi9KHew4ku1K5fA0TmRsp-hVv0jTdHdOIruFI5le9h55MG348VMg14
Message-ID: <CAKfTPtDcKw0qc3o70AT9_n2omejNrh9fnkwS5NWKQpqjaCnBdg@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: s32g: Fix ports parsing
To: Frank Li <Frank.li@nxp.com>
Cc: ciprianmarian.costea@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Feb 2026 at 20:46, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Feb 02, 2026 at 08:23:30PM +0100, Vincent Guittot wrote:
> > On Mon, 2 Feb 2026 at 18:42, Frank Li <Frank.li@nxp.com> wrote:
> > >
> > > On Mon, Feb 02, 2026 at 04:10:50PM +0100, Vincent Guittot wrote:
> > > > No error return is missing after the loop resulting in removing the
> > > > ports from the list.
> > > >
> > > > Fixes: 5cbc7d3e316e ("PCI: s32g: Add NXP S32G PCIe controller driver (RC)")
> > > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > > ---
> > > >
> > > > Change since v1:
> > > > - handle correctly the case when there is no child port
> > > >
> > > >  drivers/pci/controller/dwc/pcie-nxp-s32g.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > > index 47745749f75c..b3ec38099fa3 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > > @@ -282,12 +282,12 @@ static int s32g_pcie_parse_ports(struct device *dev, struct s32g_pcie *s32g_pp)
> > > >
> > > >               ret = s32g_pcie_parse_port(s32g_pp, of_port);
> > > >               if (ret)
> > > > -                     goto err_port;
> > > > +                     break;
> > > >       }
> > > >
> > > > -err_port:
> > > > -     list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
> > > > -             list_del(&port->list);
> > >
> > > break and goto is logical equal here. So only need below if (ret).
> >
> > Yes it's similar that why I removed it, the goto becomes useless and
> > make code less readable
>
> But don't suggest change in this fixes patch, which should focus on the
> key part.

It's not a suggested change, it's the fix. err_port is now wrong
because it's the path for all cases.

>
> Frank
>
> >
> > >
> > > Frank
> > >
> > > > +     if (ret)
> > > > +             list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
> > > > +                     list_del(&port->list);
> > > >
> > > >       return ret;
> > > >  }
> > > > --
> > > > 2.43.0
> > > >
