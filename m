Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8628239E94
	for <imx@lists.linux.dev>; Fri,  9 May 2025 18:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814953; cv=none; b=Yz0vSKsER0W+V4GPuFi5vZHe3B1aMVtgajUemZQzlOPgpncqKMyEVH9WT/sMrry0rhV68ELrz6DFZ9H4WIinLD8F6tmXY9jw3ls7MhmKvy/FyMzV0bjMLA/ZSC3yROlTQ9ySd0k0xWHIkonvnzxrYcCwEqORYSqMHdmhd58uul0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814953; c=relaxed/simple;
	bh=o0HnRWUOJEFTR1JyaXMLNHbxjezz3ONJkGCb3fLH4P8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LprRCT/IOxI+ZHmLhfvT/6l4FWsdxv9CZIxVXbcgobBMjknNG31kR4P9L/yD0TezIS/Bcbc8quXGwipzK5psOfZoyvFmt3sw2VALFN0AzzfXro5hXcrDq71LHwm1oQrXpP0vhE3y6QUUcjZeRxVH9NrgwGKw3dfZNIZ/BAzYQQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=h+Zz7A1+; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="h+Zz7A1+"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-703cd93820fso23157237b3.2
        for <imx@lists.linux.dev>; Fri, 09 May 2025 11:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746814950; x=1747419750; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVdGvQl7I4jzamIx+mGrMWIjkTZGB9PGkkLFZVwWjA4=;
        b=h+Zz7A1+5NRSG6UGjMCNn9Gt8qMJYvpjOtgTKhHLtglieZwVhItLSnhpeQ0cqVfvao
         VJMEud5eWbtNjG79+tR2tGgVlWfS1iMAdOlP7uyOaCHMMmbz63w2iSOipxeCBaCwpirJ
         /CFnSo+pEetmO9GnW4tfrgjWrHOvzGXk6T7aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746814950; x=1747419750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVdGvQl7I4jzamIx+mGrMWIjkTZGB9PGkkLFZVwWjA4=;
        b=aadYgkSeGVTn8yik4b/ra4BeETbZJYKiYRH69OSlYAFXn0kEfSrbmd5V9YfPij1BCV
         hUHR3xReWY+dMNplgiNX9nWPAiIjOF2kpSE+Bc6JdFeMHSpd6CW46WCdXgUde5OHlyk0
         4j1D3ZwueKON6N3KaeOUdZ9QY52W1gbI0a/lyr7c3Iytvw8N2VtxTul+uJYc1b83OZVs
         6KVF2a2PKdZA+Ox2aFpXudvpY1AoKlQanAVo61ekixm3rZ+oTuF2M1+opfzI9aro4KjZ
         j5h/dEQ+LYMsfoX7fNED5o/x5Fb/Y7+FoSkR3nETTGxPfzA+fw38OMSuhOWW8b9mxVeY
         oQ6w==
X-Forwarded-Encrypted: i=1; AJvYcCWFeg/T13FZjVDaeHoOTH5YXEMnq0QV9eIYb9T2lFKomGzc2UILrNa+PE3Wwnmz50AnGrw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPBh7pmr8ocJXO3ltnzpqLwClE++YCddY1oPK2U/+Vv1HbWxY2
	tpka6UjYb/Wnb7HIvh0XJiPGgGNLr1zWl4Y77VdCy7z7KbDNwISI58y4YB+nZQf+5sUgYc0lt/P
	QiP9kOcjgq97Ee95L762b6vRG0P4lmnGG3j7Kmg==
X-Gm-Gg: ASbGncsqvPHR019Fk2ZlcUnW1soR3EMIzmP9PrvbRtKTUb5xbDCdTgyN4Foda2twkU7
	4dsohQ3zEX2b/lCs/Rfgod6oqZwUY7E6BRkAVEHoU4Y1beRaTcxRULVC5UFzSyhk22UOnQJ8c7A
	Hlm5szQJ64nDK+wHiW4uiISJqRrYiY
X-Google-Smtp-Source: AGHT+IFhuGu6cPIv6shqVcKb5yMcaEsKd2xMo/nKwn74VQkFfSO8SSLUGFFj0iY8SWc7yPYKJguYvy3CEdCdcbkRiBw=
X-Received: by 2002:a05:690c:7007:b0:708:ab81:ec26 with SMTP id
 00721157ae682-70a3fb75af8mr60732477b3.33.1746814949659; Fri, 09 May 2025
 11:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <20250424062154.2999219-17-dario.binacchi@amarulasolutions.com> <20250509162546.GA3704130-robh@kernel.org>
In-Reply-To: <20250509162546.GA3704130-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 9 May 2025 20:22:18 +0200
X-Gm-Features: AX0GCFudXK-0LsSuEXf0ommGdIrbGEzxESxhBMaUX-8mIu528WIhNrRmopexvqM
Message-ID: <CABGWkvq4a73hvCWG-P_+arc3R-pnr5NVfcGPDTGEoW1doPt2qg@mail.gmail.com>
Subject: Re: [PATCH v12 16/19] dt-bindings: clock: imx8m-clock: add PLLs
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 6:25=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Apr 24, 2025 at 08:21:46AM +0200, Dario Binacchi wrote:
> > Though adding the PLLs to clocks and clock-names properties will break
> > the ABI, it is required to accurately describe the hardware. Indeed,
> > the Clock Control Module (CCM) receives clocks from the PLLs and
> > oscillators and generates clocks for on-chip peripherals.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > ---
> >
> > (no changes since v11)
> >
> > Changes in v11:
> > - Fix conflict while rebasing on master
> >
> > Changes in v7:
> > - Add 'Reviewed-by' tag of Krzysztof Kozlowski
> >
> > Changes in v6:
> > - New
> >
> >  .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
> >  1 file changed, 21 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b=
/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > index 4fec55832702..e83f08abd44c 100644
> > --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > @@ -29,12 +29,12 @@ properties:
> >      maxItems: 2
> >
> >    clocks:
> > -    minItems: 6
> > -    maxItems: 7
> > +    minItems: 7
>
> Increasing the minimum entries looks like an ABI break to me. The .dts
> files not being in linux-next confirms that (from 0 warnings in
> mainline):
>
> arch/arm64/boot/dts/freescale:859:50
>     122  clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_3=
2k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too shor=
t
>     120  clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_3=
2k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too shor=
t
>      61  clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a req=
uired property
>      61  clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is =
a required property
>      60  clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a req=
uired property
>      60  clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is =
a required property
>      36  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36],=
 [37], [38], [39], [40]] is too short
>      36  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25],=
 [26], [27], [28], [29]] is too short
>      32  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35],=
 [36], [37], [38], [39]] is too short
>      28  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23],=
 [24], [25], [26], [27]] is too short
>      26  clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_3=
2k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too shor=
t
>      17  clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a req=
uired property
>      17  clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is =
a required property
>      14  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45],=
 [46], [47], [48], [49]] is too short
>      14  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24],=
 [25], [26], [27], [28]] is too short
>      13  clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a req=
uired property
>      13  clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is =
a required property
>      12  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27],=
 [28], [29], [30], [31]] is too short
>      10  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[38], [39],=
 [40], [41], [42], [43]] is too short
>       8  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[22], [23],=
 [24], [25], [26], [27]] is too short
>       8  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[20], [21],=
 [22], [23], [24], [25]] is too short
>       8  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[34], [35],=
 [36], [37], [38], [39]] is too short
>       8  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[28], [29],=
 [30], [31], [32], [33]] is too short
>       8  bcrmf@1 (brcm,bcm4329-fmac): $nodename:0: 'bcrmf@1' does not mat=
ch '^wifi(@.*)?$'
>       6  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[41], [42],=
 [43], [44], [45], [46]] is too short
>       6  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[24], [25],=
 [26], [27], [28], [29]] is too short
>       4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[43], [44],=
 [45], [46], [47], [48]] is too short
>       4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[40], [41],=
 [42], [43], [44], [45]] is too short
>       4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[36], [37],=
 [38], [39], [40], [41]] is too short
>       4  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[35], [36],=
 [37], [38], [39], [40]] is too short
>
> Please fix the binding or drop what's been applied so far.

Abel and Shawn are already aware of the issue:

https://lore.kernel.org/all/CABGWkvqfyH=3Ddcuw6EDZaFVVebj8SZhJF0P944+mmzL5Y=
K3-Pug@mail.gmail.com/

Thanks and regards,
Dario

>
> Rob
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
