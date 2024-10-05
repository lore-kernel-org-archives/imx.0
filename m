Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5477C6E6
	for <imx@lists.linux.dev>; Sat,  5 Oct 2024 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728118652; cv=none; b=S9AtAR0et29476muw7QhN8GpL9cQ6QlnZXJTI9tAQ+fDmAvwKAo7UqK7Cejc2smQxfikR1c/uVhowzaRSX7sAS4GB6u5Z09Us8Ho/993a9ec8pEpAx+mMK2537imRIEUZ3HlklsiVzWpqjiYYZMe7mis5wdzy78mkgMeAXK8Bm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728118652; c=relaxed/simple;
	bh=OObl/UyuFTAd1nMb6WKlWlyjc57t3qQdMV4ahGdPYiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDu3p4sPZm5H+1BHgWBbTH1r3BNTSksqTth1odNQg7YyUfRWGoCPQW9nYNM08GZLBIIEVRMrJguDGBdF6wDXpbQBhDrKyxiJq8takA0OVOOAdeygRPQ8aPXt7+UM3u5NluvA5mum4iLz0F3EWo0nbaqgGjWGcdf97cJE0Oj70x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GPfJdTtW; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GPfJdTtW"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e25e4023cafso2249167276.2
        for <imx@lists.linux.dev>; Sat, 05 Oct 2024 01:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1728118650; x=1728723450; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfgT2yflkbkyl0YVzv5lFdOMwbcuqZBZZgYThVVHyBM=;
        b=GPfJdTtWLvj0Lb0lswKSjPwZofAlP3wahh6SHo0cQyFvssUQBKPPvvdpziFQqCIde7
         BFrnO+uC+h/fh94YdANKd5cIfIJZk6xDOhflX0XJVHK1wADVlDY9XyfFDPwVmDRYa2R9
         fhdRzSenCj7XEC8wIn3fvbyymm9FvBetGgswU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728118650; x=1728723450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfgT2yflkbkyl0YVzv5lFdOMwbcuqZBZZgYThVVHyBM=;
        b=hZ6oiQf1Oxxbf/vQ6mKug7Gde6JiA2InyhkrbRrU96H62+SMM/XlXgZ74zeucbkB+3
         sKSaN5uhB2reMmKSBOwpOlNJI8JE5Ik1N3NVDfScPidBOdQj+C0bzBaojXbsYHsehrUF
         DOl4hz25hO1kYkF0GENkHxzuBA5VOqmsti4aE8H1VInUypWYmiSeZLKCspElZXBtJd3q
         LNskixibSWhOjlhTCV/xXB0dMjnV3BLFaeBt55KHe9NDg5iggiaDA4Al2Eal0w6PmrsZ
         87LuOm5kPSGhK+ARGugQyNjoZ5iE5wR71/gZLlQznNv1Z8VWshENRilkaVlbrgVnQWxk
         lLQw==
X-Forwarded-Encrypted: i=1; AJvYcCURN5qzwpdM+KbhicP07n0AqY5nIDkDMWHBWBV5jOP+97ILyEBzgZ2t6WcOKWshEU/YrRY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOW6W7p+A4QPkLgxjmLoU58Am1CITKtUArWl9CezRY0lneH4Si
	m2ihIYSYT1YBVL1B1QCZAHb81C8DDU0FE/ZRdCXkjXoZ1hxJVasEKwpDvT81imPxQU67Hrh7d4v
	1PKQVYf/D/i/tOL0G8InJq1UzCQcja8kZvPTJhw==
X-Google-Smtp-Source: AGHT+IHyPDWXx3rPyEtAvD2Z65J7MaAjnomS2UWEjzzTksih/UuIR2EN+kxrUyqv86Cb6CkAyA0Fg72wiOEqiF+4buA=
X-Received: by 2002:a05:6902:2e0a:b0:e28:75c6:6d55 with SMTP id
 3f1490d57ef6-e28936d4176mr4929636276.16.1728118649704; Sat, 05 Oct 2024
 01:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
 <20240928083804.1073942-2-dario.binacchi@amarulasolutions.com>
 <566859c1-a397-4465-987e-0682b07a703e@kernel.org> <CABGWkvqqg-PGAZTCz=MMLRx5F93jaN_=z8zJt1sDd3PHXd80PQ@mail.gmail.com>
 <6c3e6071-822f-4230-b76b-276330de07ef@kernel.org> <CABGWkvrU507BHoP94Y7fEyFr=chuuy3o=oBHtuWRvwTw3GnxXw@mail.gmail.com>
 <82db5037-bbd3-4005-bde9-02df1bf4c475@kernel.org>
In-Reply-To: <82db5037-bbd3-4005-bde9-02df1bf4c475@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 5 Oct 2024 10:57:18 +0200
Message-ID: <CABGWkvqXZ+YAvo-AtUy+Ftdu0xxXKuhOwcSTwO5Fv6D3yzttNg@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clock: imx8m-anatop: support spread
 spectrum clocking
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 12:46=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 01/10/2024 08:29, Dario Binacchi wrote:
> > On Mon, Sep 30, 2024 at 8:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 29/09/2024 22:00, Dario Binacchi wrote:
> >>>>
> >>>>
> >>>>> +  properties:
> >>>>> +    compatible:
> >>>>> +      contains:
> >>>>> +        enum:
> >>>>> +          - fsl,imx8mm-anatop
> >>>>> +
> >>>>> +then:
> >>>>> +  properties:
> >>>>> +    fsl,ssc-clocks:
> >>>>
> >>>> Nope. Properties must be defined in top-level.
> >>>>
> >>>>> +      $ref: /schemas/types.yaml#/definitions/phandle-array
> >>>>> +      description:
> >>>>> +        The phandles to the PLLs with spread spectrum clock genera=
tion
> >>>>> +        hardware capability.
> >>>>
> >>>> These should be clocks.
> >>>
> >>> Sorry, but I can't understand what you're asking me.
> >>> Could you kindly explain it to me in more detail?
> >>
> >> You added new property instead of using existing one for this purpose:
> >> 'clocks'.
> >
> >>
> >>
> >>
> >> Best regards,
> >> Krzysztof
> >>
> >
> > I added this new property specifically for managing spread-spectrum.
> > Indeed, not all clocks/PLLs
> > managed by the node/peripheral support spread-spectrum, and the added
> > properties specify
> > parameters for enabling and tuning SSC for each individual PLL based
> > on the index of each list.
> > If I were to use the 'clocks' property and add a clock to this list
> > that does not support SSC, IMHO
> > the pairings would be less clear.
>
> You duplicate property with argument "pairings shall match". Well, I am
> not happy with the duplication. Clocks have specific order, thus it is
> explicit which one needs tuning. Your other properties can match them as
> well, just index from clocks is offset...

Just to check if I understood correctly what you are suggesting before
submitting version 3 of the patch.
Something, for example, like:

clocks =3D <&clk, IMX8MP_AUDIO_PLL1>,  <&clk, IMX8MP_AUDIO_PLL2>, <&clk
IMX8MP_VIDEO_PLL1>;
fsl,ssc-modfreq-hz =3D <0, 3517>, <2, 6818>;

Where the spread spectrum is enabled only for AUDIO_PLL1 and VIDEO_PLL1 and
not for IMX8MP_AUDIO_PLL2.

Is this what you meant?

Thanks and regards,
Dario

>
>
> >
> > AFAIK the confusion arises from the fact that this node, which is a
> > clock controller, was used only
> > to export its base address, but perhaps it should have also exported
> > its clocks, which the other
> > clock controller does, as shown in:
> > Documentation/devicetree/bindings/clock/imx8m-clock.yaml.
>
> You use it as clocks, so I don't understand this comment.
>
> > If I consider its 'compatible' entries:
> > - 'fsl,imx8mm-ccm' -> drivers/clk/imx/clk-imx8mm.c
> > - 'fsl,imx8mn-ccm' -> drivers/clk/imx/clk-imx8mn.c
> > - 'fsl,imx8mp-ccm' -> drivers/clk/imx/clk-imx8mp.c
> > the probe function, triggered by fsl,imx8m{m,n,p}-ccm (and not
> > fsl,imx8m{m,n,p}-anatop),
> > retrieves the anatop node solely to get its base address, also
> > registering its clocks, which
> > I would have expected to be registered by another driver, specifically
> > the one for anatop:
> >
> > static int imx8mn_clocks_probe(struct platform_device *pdev)
> > {
> > struct device *dev =3D &pdev->dev;
> > struct device_node *np =3D dev->of_node;
> > void __iomem *base;
> > struct imx_pll14xx_ssc pll1443x_ssc;
> > int ret;
> >
> > clk_hw_data =3D devm_kzalloc(dev, struct_size(clk_hw_data, hws,
> >                            IMX8MN_CLK_END), GFP_KERNEL);
> > if (WARN_ON(!clk_hw_data))
> >     return -ENOMEM;
> >
> > clk_hw_data->num =3D IMX8MN_CLK_END;
> > hws =3D clk_hw_data->hws;
> >
> > hws[IMX8MN_CLK_DUMMY] =3D imx_clk_hw_fixed("dummy", 0);
> > hws[IMX8MN_CLK_24M] =3D imx_get_clk_hw_by_name(np, "osc_24m");
> > hws[IMX8MN_CLK_32K] =3D imx_get_clk_hw_by_name(np, "osc_32k");
> > hws[IMX8MN_CLK_EXT1] =3D imx_get_clk_hw_by_name(np, "clk_ext1");
> > hws[IMX8MN_CLK_EXT2] =3D imx_get_clk_hw_by_name(np, "clk_ext2");
> > hws[IMX8MN_CLK_EXT3] =3D imx_get_clk_hw_by_name(np, "clk_ext3");
> > hws[IMX8MN_CLK_EXT4] =3D imx_get_clk_hw_by_name(np, "clk_ext4");
> >
> > np =3D of_find_compatible_node(NULL, NULL, "fsl,imx8mn-anatop");
> > base =3D devm_of_iomap(dev, np, 0, NULL);
> > of_node_put(np);
> > if (WARN_ON(IS_ERR(base))) {
> >     ret =3D PTR_ERR(base);
> >     goto unregister_hws;
> > }
> >
> > hws[IMX8MN_AUDIO_PLL1_REF_SEL] =3D imx_clk_hw_mux("audio_pll1_ref_sel",
> > base + 0x0, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
> > hws[IMX8MN_AUDIO_PLL2_REF_SEL] =3D imx_clk_hw_mux("audio_pll2_ref_sel",
> > base + 0x14, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
> > hws[IMX8MN_VIDEO_PLL_REF_SEL] =3D imx_clk_hw_mux("video_pll_ref_sel",
> > base + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
>
> Sorry, I am not going to dwell into drivers code. We talk here about
> bindings and new properties.
>
> Best regards,
> Krzysztof
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
