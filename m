Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0696B38D6A4
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 09:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432240; cv=pass; b=jUVepM7oqW8138HbO2Xa0rFFrgXckTXMy7C1n17kK1wcAQ7JRCvxrns1EisCE1llt6Pe1EvR7HWa5svS3Ci4Kynw47kj4cwX8JhXKQE8mMIZZS3FuC15Qw75g9nbrlJ90xy35KvSYN35MW6cmfsbzwPXUWF6qiF0O8Rc5VuvOBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432240; c=relaxed/simple;
	bh=aiSVuAMFyzPKAzJTJDYZxW4eA/pbkXu4TdDmr28NT8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y64+9q6SyIuYdJiTvs18XX3ygv7g1pbfJdS0vgXu8bOrWRdxd81vamHb00Jkg4PTrPyahBLT5Utj0lYTEVk2d00cUP/U/ss9n/m1bZRLSuCW51f1a8k8TlkIDy4YJlT/rv+es97MU/XyafsLG5APULeO7PbY1b0M1yvfmp/F4/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5rHw1oY; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5rHw1oY"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-669d7666d77so4877035a12.3
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 02:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774432234; cv=none;
        d=google.com; s=arc-20240605;
        b=iyuo8UDOKR0S52HrTyurF/3DqcCMOrEez4sHFWHcgCSIcEMdXTgd3PrwnMbAY8BV6W
         2QmPQhaOIVzmi4xTXhPXctVjjtUflZV5tBsWwfF1UkLCMJyujgrWP8EPxPVS/Mu0e9+z
         w0WUtyypg+lWZj4wzO+kG5sb+TuU4sHrHsS/8poZGJk1ASOeyd0Ic7k0pa+VUwIz009D
         8/HATZjMy06G5Qr3FmpYcpGNnwNKq8KAVla1VBTqiNVpBr8Dex3XCarFlhNSzJr324w1
         1ZFsCJq2y9npFDEB4+G1RS8SEIORbem3O1hLdd2AQHNENrMX/7wtqgjR1HynKY/7rlZ0
         U3mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VP0SehC+D3+hhDWyfoKCodtXephnp1PrBhw2LiSs1TA=;
        fh=2NMJTrXpIMYzDcwY/CQv1qpmMgmldwZpHwzGBHHCUnQ=;
        b=LZ1Az4mC0OjMmqlcGYly/SMS2PfdY/s9zxuXIlIZfWVuyTimgFFnAU6vBJOKQcV7Cc
         tT9M+Uoz0Amdgn/evZZXpZeZSq4QlY3OmwWTprFgK2ZyZ2Tmt4XihaGuQ3DSGwsUs/Ed
         w1wL+ImlzsANWg+S0sb86gnp5GTuY3dOmP0aixKzQOgIiuHF4NK+PM+1oWp7eRXRbsl8
         QAybXVtQj6gglWsljgIGeTLf6S7hGVAlL0W6pX47irLuqpJT7KVQ/Z4ry4z/Rzv1IMuk
         lCJUlMONm+WFpky6WV3VEvDX3vitCTXVudQbsidE3qt6ezEetVmsa5+endDMHyIw86f7
         g9Pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774432234; x=1775037034; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VP0SehC+D3+hhDWyfoKCodtXephnp1PrBhw2LiSs1TA=;
        b=J5rHw1oYThtXXZJVnWj3hApYOHrARn7ZF22xFzfabZQK8/ofK0Mmy0CMM26k0bLb9Y
         B5j+JmGwFGAOjpX4zlauAw2Ht1U82eyDVMFKYlTjZf4OWZIZoZ3PpihdtxKTN+Hc6hvC
         s4HEleqcTWxWn+n0yNqNEnkAZf7LX6hDGhvx7u7EsHXJC78iYC3gz2tvXh87dTtguc23
         QNIH2BZhCQuyRbQQAjyNTCQppEC4IxUWZj8UX6Z1VD4nf8MoEneHr1ekhNAV4V3wd5DG
         hCh70dpsYH3KUqrc0LXLuYKmkuhb5QkdLKE6CSICJvh9sGzc+MAX8ZWl4v3W0ZK2TPKV
         a0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432234; x=1775037034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VP0SehC+D3+hhDWyfoKCodtXephnp1PrBhw2LiSs1TA=;
        b=EcixsOw7ksqAUjsFb7pvNu2aiWLqRcpdy6tdJXgv9sEHB9Q/qB5WjhUm2WJABFtll7
         Jm2a9lDs8GoSsKe2mG63RrElPPL01xKqOKPzZ2abr6aKQaNzqVZcTnAD8w+9cyviN6ng
         GRa5eW2ZxkEJkGnZdKkfh2bjJFNxVqjBdT4Ii+SgG9CBmTQ5RIewFZ5b/lnrt54WJ84k
         huzYK9FoQHnar272XG5U0L4zA9mbLuWSuLzudmaPd6tOneQlqvheuOwiY9BI/VdW7Drl
         +EtMvKH8aJP3o5AS9msGyURYk7P70irnSLNyKElB0ujvPeFJeps9j9/l54UkrDH5PjBx
         137A==
X-Forwarded-Encrypted: i=1; AJvYcCUxLBUu/Eyc0NUznOgpOCwG9UlyK/b9UCAZYRFXMgMuPF3NnTHgPjRlvHJGOwhHlKOReDs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4vsgkHsjj7as4c6BO6uTdmKGQDkc2kesNWYMgFE9qNHyvPgug
	WXNT6gDVnEdGZGw9XPM8YrhzFyAy1883tMbX1X1LGJ3R71J0vCcfrb/3EdkqMWIet+8ehzknFei
	o3+VmVmzbEuF5hhy4RDreczw5J7DvSwg=
X-Gm-Gg: ATEYQzxAYkPtwn6ypmjmNqhhqqfaLvzO0vKLen0ihcFrqz4nhAO+AFNslRh6z70S8IM
	5FDoCizT67KjOOxx86wWJCgmB+s/+jsNUmOo7b+Q/1JavvfWF017ubprw+ekFfvabQuEJmnujT+
	iZ7dBtU2Ab5q7e/SfnEKDDI7pLhDEExiHe1QphJD5U3GbG0W5DdJ5bhwKlJCNzRzAqiXU5xLzIl
	AxjhXLkYlganZRW+oLxcTregK/rPMtQyIwG3UZ1IkCToCDhjt/EfXQ3R3Hc7HDSG6WmgxfqZ/rI
	dXDkXx7T
X-Received: by 2002:a17:907:72c7:b0:b96:f6f1:e7af with SMTP id
 a640c23a62f3a-b9b0ea7e884mr143299166b.9.1774432233910; Wed, 25 Mar 2026
 02:50:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260310091054.2029912-1-egbostina@gmail.com> <acKyJTkqq-bV_3jZ@lizhi-Precision-Tower-5810>
In-Reply-To: <acKyJTkqq-bV_3jZ@lizhi-Precision-Tower-5810>
From: Eddie <egbostina@gmail.com>
Date: Wed, 25 Mar 2026 11:50:22 +0200
X-Gm-Features: AQROBzD-kPMMH1jFoji7rnPnjGOGNLf_VyIguCX0e1QYp30ObYBIhsUdhFbiTf0
Message-ID: <CAEFOc61tNbF+cE0waQpfvuSe7enJkDk_yzcGXZ_-D1Kvj_5G-w@mail.gmail.com>
Subject: Re: [RFC PATCH] arm64: dts: imx8mp-edm-g-wb: Use 0 for reserved bit
To: Frank Li <Frank.li@nxp.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

>> Change 0x41 to 0x40 to leave the reserved bit cleared, as
>> recommended by the reference manual.
>
> Any impact if set bit 0 to 1?
>


I have not tested this on hardware with the bit cleared, so
I cannot confirm functional impact for sure, but according to
section 8.2.4.238 of the iMX8MP reference manual, bit 0 of
SW_PAD_CTL_PAD_SAI1_RXD6 is reserved with a reset value of 0.
The only defined fields are PE (bit 8), HYS (bit 7),
PUE (bit 6), ODE (bit 5), FSEL (bit 4), and DSE (bits 2:1).

Both 0x41 and 0x40 should result in identical pad behavior.
Leaving it set probably risks undefined behavior in future
revisions of the silicon.


>> This also allows for
>> easier conversion to symbolic macros.
>
> Can you send this patch also?

Yes, I will send a followup patch soon.

Thanks for the review.

Eduard

=C3=8En mar., 24 mar. 2026 la 17:48, Frank Li <Frank.li@nxp.com> a scris:
>
> On Tue, Mar 10, 2026 at 09:10:53AM +0000, Eduard Bostina wrote:
>
> Remove RFC.
>
> > The i.MX8MP Reference Manual documents bit 0 of the
> > IOMUXC_SW_PAD_CTL_PAD registers as reserved. The hd3ss3220
> > IRQ pin (SAI1_RXD6/GPIO4_IO08) currently uses pad config
> > value 0x41 which sets this reserved bit.
> >
> > Change 0x41 to 0x40 to leave the reserved bit cleared, as
> > recommended by the reference manual.
>
> Any impact if set bit 0 to 1?
>
> > This also allows for
> > easier conversion to symbolic macros.
>
> Can you send this patch also?
>
> Frank
> >
> > Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts b/arch/a=
rm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
> > index 242fa930b..a78401d11 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
> > @@ -345,7 +345,7 @@ MX8MP_IOMUXC_SAI1_TXD5__GPIO4_IO17                0=
x16 /* DSI_VDDEN */
> >
> >       pinctrl_hd3ss3220_irq: hd3ss3220-irqgrp {
> >               fsl,pins =3D <
> > -                     MX8MP_IOMUXC_SAI1_RXD6__GPIO4_IO08              0=
x41 /* GPIO_P253 */
> > +                     MX8MP_IOMUXC_SAI1_RXD6__GPIO4_IO08              0=
x40 /* GPIO_P253 */
> >               >;
> >       };
> >
> > --
> > 2.43.0
> >
