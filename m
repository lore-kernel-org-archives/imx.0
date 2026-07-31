Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D6335893
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 00:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785456987; cv=pass; b=cMBxM+6+gqr5nLFSjRCLoq6ahyu0KxartWMZDXIX4KdLmIHwuVC9xSVKezK+BZxdn6zemQ1I4jRdSjD19OLgML9H2gwi0b3MGeFqFQI+tzShTqHPFZIwhlI1y/WJwKuIN1bkQ5LCqyP5JRkmhg+nDYxZABZyJ34O1hpicQ9zkS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785456987; c=relaxed/simple;
	bh=m+RIhUcUiECWtowX4NFUhGF+iwm2nJjbh5MJg56QYC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVHJW6uWGDRl0FMiW/NlDRXdShp58vraVq7sJvULhSzHweDnL39nBGn7HwDwwL7mKgdTPlRkzWE2oEFm0rFSb41GiDmoXueBLL904MF7I+jZ6YAed+JAYBS2TgdSyggl1IuonEi88v72h9nN+0D+OqFH79uw+2aW3jMrdC17wFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pu9f68re; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pu9f68re"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so656966a12.2
        for <imx@lists.linux.dev>; Thu, 30 Jul 2026 17:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785456984; cv=none;
        d=google.com; s=arc-20260327;
        b=jHyrT2n/skbpni3sZbbpEFt/GGvlnnjPmvSRp2njRWsiS73zjSCFrAkkg++CrqyzGw
         UNVFomNZjHhGjlxSXcJnC6zyTGXkvccr4xLUoZl+G8BR0LJEP3KEgW1+Q6crEbej5bTC
         AhRfQBKF64IoUdo2yZ9CSt5LCxWqgSFLthN67LHnW+ndibW9uzVggjHZdziYjM8yxdWI
         yxEsFg5ql3bMqSbh4nSCvgRIDy6WHdApZDcc0Clo7OHyzKgErb6Kd/2N43N6R76oAS62
         2rKp+M2DH5Gyc2GY3cD6MFjZ1JHzrrNRXi531zKvRkXiAfUoYhC2eIMA9D135zivoKZ+
         4h9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pSNaYSg9MrVtvi1xOd7cDCxl8yZ1wT4RNsxmp0nYhxA=;
        fh=k5YnQc76NHJ1/OqObVTqtgI6Lrn9o9EvhdbzPnbWzaQ=;
        b=EDHI9QFQLA9GNizRcGqmQozB75siW3PYuPk7UjvlrZy9u1eFKpGn/ezS6XldFrvThJ
         D5dsf35OXBe0HEYj7iVVNMBfbQx0LM3AVH0KW1/gsM1G3b9MRNkS55WfIB+94Q19K9Ua
         LdJQvbGILjxKy/fvg2umKBjzRcFB/J2rdxK8WJPb/Nev+ZM+tpvJtmJ4rqf3+PwHI82p
         BGUi+xRan8bT8y5Zk+JaNJ4KO91JDXHCHLhT3jM6U4+0QoyNUleH+NzdBQVJaLA5wp6V
         lDbZ3Op1Lk+hPaFGNRu0pDLTwh6rcFAjdmX7/diyusqxchIp7PaGlZXt/4q2Yld01IZ5
         hGRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785456984; x=1786061784; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pSNaYSg9MrVtvi1xOd7cDCxl8yZ1wT4RNsxmp0nYhxA=;
        b=Pu9f68re40R60cxVdxulOtj6ItPHkAXUar3biBJQd4BJu8nOzDNzCRisezEWyDLNTo
         RlJgErWFkAeKIjLzPgn82wqrRK3fYD+qj0cg2G0goXi3f/8kJ59T+vCO0EOLoTTDuYvb
         Gn+4jX7EYJza4EDlN4Ox2vpOOkU+xbdvcGx/y4aXf7GAZecvjGo4htcIlZj/7rrID7dZ
         aieZBcB06lG9/48871Mp6KtMX5GynQtxp0u0xd8PsMPQuWeYf8u9AQE22/cKgk7v1rLn
         2eFiMx39Wq2k07zR5NKQa7YYyghnHorHQJnQtBAEUK84mNewseb8souiGbHoLOc4KJj5
         0XTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785456984; x=1786061784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSNaYSg9MrVtvi1xOd7cDCxl8yZ1wT4RNsxmp0nYhxA=;
        b=A6qkXuGbhql2Y3Tjqg4z92RgoCE9RpswPzmVFI4jjpVee+UPr+rWx+N5C8BsUZK5Mn
         9tL5wWTknfOBdZHbtuE872fGkEBy2MlowmxC8spa/RzkxFs79pHhoUIhv0nJ2YZT4hx4
         KnSrG11oaAYVW0kvPsl0NF0erZZ48FhZ9gOCinYcZ0mf3W8LiyflTox1XmyJap8EfFrg
         7M3K0qkXLHXViQ61f6JNEtPEfA9yNxUEd8JZ15dSPDwE2Y4iA+vQ8Q7rTZkrxyaR5bsK
         xO/aY7eSxhyBR0slS+H8r4J18M3iCB9P7MFGG6FT+wnhWrUoQcvjs6p/c3KpZQuLaQqF
         Hjfw==
X-Forwarded-Encrypted: i=1; AHgh+RqG24ppQifK/gtZiCHvg5My6ZsYsXZhru2LZEPHTU7iEnog9wH/XbxgJv+2bZ1tNcRUwDI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5cOFKm2M+gk9QytUAEosgTQwJVJ/J+9parr16pJ5/ydBA1aeY
	F0nzu+NbjiDVccIafDRUvZeZ5CJFIufrhn8oXKP/weXV4L/Bo+CU8z3/KmPAHlOZTFoqlQcuYnL
	N2pgSua5/NtCqjs0/YBQn82fGAzg9PU4=
X-Gm-Gg: AR+sD11PJQ6qvrvUvyzedRcFJOiV5IjMNkGk1CdJePEqQXYpyu66N6S/r5+vZWm/ioB
	uaPBzeMyOWPxvFQKmtHk9/A17Fa3bEhAxogAlDskpTJwggq7PeWsv/dK2oj0qGAkxzoYZ+xIrni
	8PBh7ffddThxcP6v0vxs4MKFCzHTHaEn6Evp06iONmf+5loiy7QkCqSihs9mqNNKvBQYQivPJ64
	5jLoULH3z4S7XttECXHBpvUDcuuD0mfNQvXvobSrZBB7QzaV0+AGsDJsgXr7CqxHcl1IdBZi6qB
	xs0ZP08uKmR8AOydTxVUqnEfvXEBEBwczSosutdfycH8vqQ28hE02tNY//Tbnwisy6u+U06RUGp
	QcrcmZwbaw6xHB9VV9Nax0jSbExanUeIPeWdDH4FNV9DD/5uF93xNI3LtAfBpZV30Vp6OKnN+IP
	I7/Uy/mVwv5nTTa+Qhyt9IadeWN6ueQ0mmOdYP5HZXf8rAFMZJfTNB/y8=
X-Received: by 2002:a05:6402:5006:b0:6a0:6a8c:b2d9 with SMTP id
 4fb4d7f45d1cf-6a07b839c2bmr2250071a12.41.1785456984117; Thu, 30 Jul 2026
 17:16:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729012320.616174-1-rosenp@gmail.com> <amucohB5GoaocIC4@SMW015318>
In-Reply-To: <amucohB5GoaocIC4@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 30 Jul 2026 17:16:11 -0700
X-Gm-Features: AUfX_mweI0EuKIZYjIYzXFTotTDrv9cdQVunI3TADKyMhjIisH5R3DLrFlpQURw
Message-ID: <CAKxU2N9_wJt3qQ4rmGX89dmSpMKa-7zOuzDwrnxYbXrBNZ1nQg@mail.gmail.com>
Subject: Re: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 11:49=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Tue, Jul 28, 2026 at 06:23:20PM -0700, Rosen Penev wrote:
> > We need to tear down the irq before edac_mc_free() to avoid a use after
> > free on teardown as request_irq uses mci as dev_id.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/edac/fsl_ddr_edac.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> > index f4cc89b26954..f1ddd1f47f2a 100644
> > --- a/drivers/edac/fsl_ddr_edac.c
> > +++ b/drivers/edac/fsl_ddr_edac.c
> > @@ -601,7 +601,7 @@ int fsl_mc_err_probe(struct platform_device *op)
> >
> >               /* register interrupts */
> >               pdata->irq =3D platform_get_irq(op, 0);
> > -             res =3D devm_request_irq(&op->dev, pdata->irq,
> > +             res =3D request_irq(pdata->irq,
> >                                      fsl_mc_isr,
> >                                      IRQF_SHARED,
> >                                      "[EDAC] MC err", mci);
> > @@ -639,6 +639,7 @@ void fsl_mc_err_remove(struct platform_device *op)
> >
> >       if (edac_op_state =3D=3D EDAC_OPSTATE_INT) {
> >               ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
> > +             free_irq(pdata->irq, mci);
>
> here already disable hardware irq. Just call
> synchronize_irq() to make sure pending irq handled.
AI disagrees with this suggestion:

The reviewer's suggestion to just call synchronize_irq() instead of
free_irq() is problematic for two reasons:
1. Shared IRQ: The handler is registered with IRQF_SHARED. Disabling
the DDR controller's local IRQ output (ddr_out32(..., 0)) prevents
this device from asserting the IRQ line, but other devices sharing the
same IRQ line can still trigger it. Without free_irq, the handler
remains in the shared action list and can be called with a dangling
mci pointer after edac_mc_free() =E2=80=94 the very UAF this patch aims to
fix.
2. free_irq already synchronizes: free_irq() internally calls
synchronize_irq() after removing the action from the descriptor. An
explicit synchronize_irq() before free_irq() would be redundant.
>
> Frank
>
> >       }
> >
> >       ddr_out32(pdata, FSL_MC_ERR_DISABLE,
> > --
> > 2.55.0
> >
> >
