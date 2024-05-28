Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC15716F91D
	for <imx@lists.linux.dev>; Tue, 28 May 2024 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716913407; cv=none; b=qCUIpRVSfWZhgf+FzCB/6Gc9G3j1AX6qLRxN6d9fNeXYuA62A78EkA3xZHQ/dminngoxUAcb0j8vhvm7Wv78WvFNZXujid7xzwzuOmjfhrdPZkkGOImJaynD/kAfqcyXgNpB1d3Ql01WJ7g3tUW6KDdooNGfrqxBKH/zv+LMC0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716913407; c=relaxed/simple;
	bh=YrRYmM2iOnvVpCpxFTLguETPlid9A8LGNFldLjX9+z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KhgRoiSZGokpb2wHwFkKkkUcPnsAj+q5/VUx8aPBMua3x3WLCjoqmQSrOwHw/BxVQQ5vrbcln9KJ0SfVaeS426RWhMjPwiN1p6HoE4b1NAZuW117ZtitkroZbB37oRmft2mEWf6bgd3H3ADvfnIXDtBmgW26D8yJ5hYU8j85Nos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=XMQdrR5m; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="XMQdrR5m"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a626776cc50so120618066b.3
        for <imx@lists.linux.dev>; Tue, 28 May 2024 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1716913402; x=1717518202; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Icz1iULGDWOGvffjSkBVlf/NabTBEP831PPUjJFQD5c=;
        b=XMQdrR5mSFbxq0T3uQ8JOHSTtX3GjX4OotxT9EfBdTDblw2UmZ2bLk0d4k7JZbXYMM
         xmQT/O1OUJytd/dBvPSaa48x7CYsn4Ioio/077jeU24mOrrC79jPlHiI6BG36tM2OK9K
         jBxval6prnGpzW5R9rVAcww1MOMgoOgrTThxMBM9NTJU7Kmr3UshMC4dDf8C9dgUomKG
         DQYxQh9RJmR7FN+19j6yJFxo5cQYsler16QWDWekjjGUEOjwjdk2TSnI31MLhbhadgp8
         wSB7c7RHtN+LUN0Hi56Q+NLb5WkJGK83kawvZOdIT/jBAzZCVI5ZzB94CBzwBZ/XDn0I
         j8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716913402; x=1717518202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Icz1iULGDWOGvffjSkBVlf/NabTBEP831PPUjJFQD5c=;
        b=l9W7is2USrUCMlKmKltpymg5bwW1sMNP4WhpvKgeLyXRw1oFtsSmKj5z7yIAphmhXS
         VhDaDGalGNDJV+HhL0pzIcQiAJhD8X0hh8dyNiwJDxn/meH0afhMrKYGdiNUv9PIe6/i
         bHJAMR9v13Nn7UQTUlBf+MzUV+W20upzIDoAIpzHpsVRi1xMIUkKsDvELeZ8EI2CwUgG
         DuaWw+hulacoZHYWkHRQuy2ULe0M67LOc/y3JOKtEz56m4HLO3pQ05EY8fxuQNSmSMJU
         i7bnLC2egwtSRqE35SRbgEdYmcsYsx6qsYzBt3/dMVjVyVdc8zixuXE3hnsIQjcZzK7T
         IiMA==
X-Forwarded-Encrypted: i=1; AJvYcCWdsC7xHLb5Wbu0vGAW6JAzHdbYUQJj+TSIywo2mitFVejfi2Aiifk8e+5kwVkolSzSG5zj0yDj5nmcUImOFZGYPjyn
X-Gm-Message-State: AOJu0Yzu5LvmIDXqwQCFb+B/WjBQlVYqRjMYlrEbj0EGDc7VzOCsK3JX
	8NbajOMzvcHOAyzRlKDa6UGvf7wPb6F3nD+Xk/ggFbTqw3TNto3Z/WZ3e1h+ZshunHVYnUrgEDZ
	UYbRp98tprit+vzjAWvauq0SO+oJsCmjMa39uOQ==
X-Google-Smtp-Source: AGHT+IGfhHltMh6uxJiYUYZJIY3arEfGHNZl4L3jMAUX5mkMEtSLMBjHdCH6foV8SIu5pyn4zoFHWz0SJWajG0Ovtns=
X-Received: by 2002:a17:906:413:b0:a63:4e95:5639 with SMTP id
 a640c23a62f3a-a634e95579dmr120722966b.47.1716913402114; Tue, 28 May 2024
 09:23:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240522215043.3747651-1-tharvey@gateworks.com>
 <07250029-7cea-4a82-9e70-22e0e6f7fb37@linaro.org> <20240523-vividly-sequester-d85ac7bccbbd@spud>
 <CAJ+vNU3fQt=6t3a_QFU_3jb5mTVLGJiptPnGEmWvvXZYGEPOFQ@mail.gmail.com>
 <20240524-cavalier-outthink-51805f49c8fb@spud> <8007abef-38bb-4d7d-a453-00bb5e6bede5@linaro.org>
 <CAJ+vNU3Rh6f-HrFbBLxNXVP1PwsGh8OyGmmGJBv6+GRwZaTXgw@mail.gmail.com> <20240528155808.GA695520-robh@kernel.org>
In-Reply-To: <20240528155808.GA695520-robh@kernel.org>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 28 May 2024 09:23:10 -0700
Message-ID: <CAJ+vNU225kyG7+AmXU8MTDArj8_6ibD-DkogXg89YpWS57ai=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: rename gw7905 to gw75xx
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 8:58=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sat, May 25, 2024 at 12:58:18PM -0700, Tim Harvey wrote:
> > On Sat, May 25, 2024 at 11:34=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > >
> > > On 24/05/2024 20:40, Conor Dooley wrote:
> > > > On Thu, May 23, 2024 at 04:04:50PM -0700, Tim Harvey wrote:
> > > >> On Thu, May 23, 2024 at 7:47=E2=80=AFAM Conor Dooley <conor@kernel=
.org> wrote:
> > > >>>
> > > >>> On Thu, May 23, 2024 at 09:02:46AM +0200, Krzysztof Kozlowski wro=
te:
> > > >>>> On 22/05/2024 23:50, Tim Harvey wrote:
> > > >>>>> The GW7905 was renamed to GW7500 before production release.
> > > >>>>>
> > > >>>>> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > > >>>>> ---
> > > >>>>>  Documentation/devicetree/bindings/arm/fsl.yaml | 4 ++--
> > > >>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >>>>>
> > > >>>>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/D=
ocumentation/devicetree/bindings/arm/fsl.yaml
> > > >>>>> index 0027201e19f8..d8bc295079e3 100644
> > > >>>>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > > >>>>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > >>>>> @@ -920,8 +920,8 @@ properties:
> > > >>>>>                - fsl,imx8mm-ddr4-evk       # i.MX8MM DDR4 EVK B=
oard
> > > >>>>>                - fsl,imx8mm-evk            # i.MX8MM EVK Board
> > > >>>>>                - fsl,imx8mm-evkb           # i.MX8MM EVKB Board
> > > >>>>> +              - gateworks,imx8mm-gw75xx-0x # i.MX8MM Gateworks=
 Board
> > > >>>>
> > > >>>> That's not even equivalent. You 7500 !=3D 75xx.
> > > >>>>
> > > >>>
> > > >>>>>                - gateworks,imx8mm-gw7904
> > > >>>>> -              - gateworks,imx8mm-gw7905-0x # i.MX8MM Gateworks=
 Board
> > > >>>>
> > > >>>> Compatibles do not change. It's just a string. Fixed string.
> > > >>>
> > > >>> I think there's justification here for removing it, per the commi=
t
> > > >>> message, the rename happened before the device was available to
> > > >>> customers.
> > > >>> Additionally, I think we can give people that upstream things bef=
ore they're
> > > >>> publicly available a bit of slack, otherwise we're just discourag=
ing
> > > >>> people from upstreaming early.
> > > >>
> > > >> Hi Conor,
> > > >>
> > > >> Thanks for understanding - that's exactly what happened. I'm in th=
e
> > > >> habit of submitting patches early and often and it's no fun when
> > > >> something like a silly product name gets changed and breaks all th=
e
> > > >> hard work.
> > > >>
> > > >> The board model number is stored in an EEPROM at manufacturing tim=
e
> > > >> and that EEPROM model is used to build a dt name. So instead of GW=
7905
> > > >> which would be a one-off custom design it was decided to change th=
e
> > > >> product to a GW75xx. The difference between GW7500 and GW75xx is
> > > >> because we subload components on boards between GW7500/GW7501/GW75=
02
> > > >> etc but the dt is the same.
> > > >>
> > > >> If there is resistance to a patch that renames it then I guess I'l=
l
> > > >> have to submit a patch that removes the obsolete board, then adds =
back
> > > >> the same board under a different name. Shall I do that?
> > > >
> > > > I think this patch is fine - other than the inconsistency that Krzy=
sztof
> > > > pointed out between the "renamed to gw7500" and the "gw75xx" in the=
 new
> > > > compatible.
> > >
> > > I am not a fan of renaming compatibles because of marketing change,
> > > because compatible does not have to reflect the marketing name, but
> > > there was already precedent from Qualcomm which I did not nak, so fin=
e
> > > here as well. Double wildcard 75xx is however a bit worrying.
> > >
> >
> > Hi Krzysztof,
> >
> > Thanks for understanding. The double-wildcard is again a marketing
> > tool. All GW75** use the same device-tree by design. The boot firmware
> > that chooses the device-tree understands this and for a GW7521 for
> > example would look for gw7521 first, gw752x next, gw75xx last.
>
> You haven't documented the other 2 though.
>
> How do "all GW75** use the same device-tree", but then there are 3
> possible DTs for just 1 board?
>
> Selecting a DT is not a unique problem. We don't need unique
> solutions. There's the QCom board-id proposal[1] and OS provided DT[2]
> which are addressing similar issues.
>

Hi Rob,

I'm not sure those links are really able to address all needs. I see
some similarity with the concept of a board-id taking the place of the
don't-cares used in our names but not the concept of marrying a
baseboard to a SOM with the two different boards creating a named
combination (both which may have some don't cares). The Gateworks
Venice product family of boards (imx8m{m,n,p}-gw7***-*x) boards have
been in the kernel for quite some time now as has been the U-Boot code
that determines the device tree using a baseboard model number
combined with a SOM model number.

A baseboard with an model of GW7301 (programmed into an EERPOM at mfg
time) gets coupled with a SOM with the model of GW7000 and this uses a
device-tree of gw73xx-0x (prepended by the SoC name of imx8mm, imx8mn,
imx8mp). The don't care's here and the naming convention has been
chosen by us, the board manufacturer, leaving enough significant
digits for component subloads that was desired at the time. So a
GW7300 and a GW7301 are the same schematic, they just have some
different loading options.

I really don't understand the issue here. A board was originally named
gw7905 when I brought up the prototype in the lab and created its
device-tree but between then and when it shipped it got moved to the
more generic 'family' of gw75xx baseboards which get coupled with a
SOM. I already have a gw71xx, gw72xx, gw73xx out there for years that
function this way.

Device trees describe hardware using a name... the name changed :(

Quite simply there are no boards out there with a GW7905 in the EEPROM
that need to be supported... they all have a GW7500 programmed in them
(and some may in the future have a GW7501, GW7502, etc).

Is the problem here the fact that I use don't-cares in the names or
the fact that a name changed?

Best Regards,

Tim

> Rob
>
> [1] https://lore.kernel.org/all/20240521-board-ids-v3-0-e6c71d05f4d2@quic=
inc.com/
> [2] https://lists.linaro.org/archives/list/boot-architecture@lists.linaro=
.org/thread/DZCZSOCRH5BN7YOXEL2OQKSDIY7DCW2M/
