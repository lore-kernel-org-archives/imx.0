Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF9D18757F
	for <imx@lists.linux.dev>; Thu, 30 May 2024 17:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090589; cv=none; b=q2azJyjz81T0pqx4ffUKqnMqmlHrATarnLWIkBEdIEFmU2oHu1L3VyYw3swP3PJTAPHkA0sYNNJ4aqN+NXknbZn1sh7I+SwcE7nTpyhRVplLDuIyIaoB3jc19RTrK78wbnwrUnYboVbrAsbXk9Abg/OFqQ5xjDUzdvneinTsbJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090589; c=relaxed/simple;
	bh=8t2MOCm+Rs8GjZcqMV/EBJ7gbOAabr3rirhoVUSSxK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTykmKyWV+CmicWRPylYR3MMKLps0LHVfhbslb3JfFZD2/U5StN82VJSo2n4ozbDGt3dGfnCW9bPws/Ik2FitEIp5IOM5XgdU0b1FaQAbyYCTBHszao7bjpUOvmKzXuwc5qElEYT/efCLPZYB+tQe/4Ev79Q/yvn31KJ95nYeVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=pEMODe2K; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="pEMODe2K"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57a033c2e9fso1472416a12.2
        for <imx@lists.linux.dev>; Thu, 30 May 2024 10:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1717090585; x=1717695385; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+giz79CJG0jCLqzrbl/tvd652oA04/HxWrM79eY0LuU=;
        b=pEMODe2Kc9RQHoVvQ3mpZRBHQtf1+7kzDaswcq6Oa2WseRxZ1VYfcV5gh/doj9aF8I
         ZNK5wNIlu9gv9CB2KwBjLm+BEogTbB94apQEPq6lMCDUYI/ZjO1WFlLRpGcDeyElWPd/
         KwoZ1yR3mCc3gflIPgCUUwaQIMFzxoSTiY0xt7yZml5RlTUPz6feEbvYWWx2wPYN+w8V
         DSe7NUvo1fRMOpQv+bz5pEA16YgubYqy6Ll2kBNb5yij/P4WO7jg+qvhJ6KoQIRH9mwD
         3IbqcUpegMBz2ZaNjgfd3yT3sIGRm99Z43c9auUypYbZlx4xXOhI/AZOOVe6KTzMX6z7
         4PiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090585; x=1717695385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+giz79CJG0jCLqzrbl/tvd652oA04/HxWrM79eY0LuU=;
        b=fFfm5eS2QR47DdVjyOjWmqOB7XFFAT7pcyHqZAaArkfGe16mrR9Hfe4xSazOcxIhKQ
         /Bz9OwNJd+W5c3AaEvKEXLLPP9moF2+VKVjQgFei0QJiGR2jHpagT/LAL9WI1BckwVMv
         hml2esXI/H+gt1bVAa+pdAQMUvyysSVeOxPWl98wE+RbYaNfBAu6sBo3O9j0tPGuH6db
         qKtKtncxeYe1ViD0GYef4zhoqabNv5fl+l2hoyNolvM4KbkNOBWhy21u27x1twU84AyT
         mvocGTVvf4tQaV1Q+jaHnprZh19RBn65bYjdpYvoRYsYyDE+eTN3qHczu6/Rirj0K5YP
         d2Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXfMkJfhbQOaRiUHXew283GUqDPCPfxOASkOXVeAIphUUcuFCgUdnXTbs9jCUQ80weaGgxECeW+YQ/e2KhdJd5eqk75
X-Gm-Message-State: AOJu0YwJtvuGxpvVNQgnaa4NDIMQx2h0PBIsBLEK+DIMmsNDC4cfkP6C
	KU3nBxYJ87Iu/HVPHf5EMypcR7ud2KZunRM6PBQ2JgV+MTceBzMaX8wF1qd5ENDaara0T9Ku7z/
	lJE2ZS2wQO7eMyXQZJtkYffiOiFHjQ5MR4TvU2w==
X-Google-Smtp-Source: AGHT+IHbO1ffXw5PEt2FSPHxjhTEkqIJgxX8wMuh16h/NSE/pfx6O7fFre+ZbekU3cA5AwkNUDHizBQMCtTiSDL0q1g=
X-Received: by 2002:a17:906:29d5:b0:a63:555d:db01 with SMTP id
 a640c23a62f3a-a65e8e50e20mr273797466b.30.1717090585365; Thu, 30 May 2024
 10:36:25 -0700 (PDT)
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
 <CAJ+vNU3Rh6f-HrFbBLxNXVP1PwsGh8OyGmmGJBv6+GRwZaTXgw@mail.gmail.com>
 <20240528155808.GA695520-robh@kernel.org> <CAJ+vNU225kyG7+AmXU8MTDArj8_6ibD-DkogXg89YpWS57ai=g@mail.gmail.com>
 <20240530-powwow-outpour-ca48b1f22a3e@spud>
In-Reply-To: <20240530-powwow-outpour-ca48b1f22a3e@spud>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 30 May 2024 10:36:13 -0700
Message-ID: <CAJ+vNU1Vu9oM1W8RhBo1H+ddHUovmJGSPhmmW0aaTEfYgVoerQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: rename gw7905 to gw75xx
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 9:54=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, May 28, 2024 at 09:23:10AM -0700, Tim Harvey wrote:
> > On Tue, May 28, 2024 at 8:58=E2=80=AFAM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Sat, May 25, 2024 at 12:58:18PM -0700, Tim Harvey wrote:
> > > > On Sat, May 25, 2024 at 11:34=E2=80=AFAM Krzysztof Kozlowski
> > > > <krzysztof.kozlowski@linaro.org> wrote:
> > > > >
> > > > > On 24/05/2024 20:40, Conor Dooley wrote:
> > > > > > On Thu, May 23, 2024 at 04:04:50PM -0700, Tim Harvey wrote:
> > > > > >> On Thu, May 23, 2024 at 7:47=E2=80=AFAM Conor Dooley <conor@ke=
rnel.org> wrote:
> > > > > >>>
> > > > > >>> On Thu, May 23, 2024 at 09:02:46AM +0200, Krzysztof Kozlowski=
 wrote:
> > > > > >>>> On 22/05/2024 23:50, Tim Harvey wrote:
> > > > > >>>>> The GW7905 was renamed to GW7500 before production release.
> > > > > >>>>>
> > > > > >>>>> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > > > > >>>>> ---
> > > > > >>>>>  Documentation/devicetree/bindings/arm/fsl.yaml | 4 ++--
> > > > > >>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > >>>>>
> > > > > >>>>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml=
 b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > > > >>>>> index 0027201e19f8..d8bc295079e3 100644
> > > > > >>>>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > > > > >>>>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > > > >>>>> @@ -920,8 +920,8 @@ properties:
> > > > > >>>>>                - fsl,imx8mm-ddr4-evk       # i.MX8MM DDR4 E=
VK Board
> > > > > >>>>>                - fsl,imx8mm-evk            # i.MX8MM EVK Bo=
ard
> > > > > >>>>>                - fsl,imx8mm-evkb           # i.MX8MM EVKB B=
oard
> > > > > >>>>> +              - gateworks,imx8mm-gw75xx-0x # i.MX8MM Gatew=
orks Board
> > > > > >>>>
> > > > > >>>> That's not even equivalent. You 7500 !=3D 75xx.
> > > > > >>>>
> > > > > >>>
> > > > > >>>>>                - gateworks,imx8mm-gw7904
> > > > > >>>>> -              - gateworks,imx8mm-gw7905-0x # i.MX8MM Gatew=
orks Board
> > > > > >>>>
> > > > > >>>> Compatibles do not change. It's just a string. Fixed string.
> > > > > >>>
> > > > > >>> I think there's justification here for removing it, per the c=
ommit
> > > > > >>> message, the rename happened before the device was available =
to
> > > > > >>> customers.
> > > > > >>> Additionally, I think we can give people that upstream things=
 before they're
> > > > > >>> publicly available a bit of slack, otherwise we're just disco=
uraging
> > > > > >>> people from upstreaming early.
> > > > > >>
> > > > > >> Hi Conor,
> > > > > >>
> > > > > >> Thanks for understanding - that's exactly what happened. I'm i=
n the
> > > > > >> habit of submitting patches early and often and it's no fun wh=
en
> > > > > >> something like a silly product name gets changed and breaks al=
l the
> > > > > >> hard work.
> > > > > >>
> > > > > >> The board model number is stored in an EEPROM at manufacturing=
 time
> > > > > >> and that EEPROM model is used to build a dt name. So instead o=
f GW7905
> > > > > >> which would be a one-off custom design it was decided to chang=
e the
> > > > > >> product to a GW75xx. The difference between GW7500 and GW75xx =
is
> > > > > >> because we subload components on boards between GW7500/GW7501/=
GW7502
> > > > > >> etc but the dt is the same.
> > > > > >>
> > > > > >> If there is resistance to a patch that renames it then I guess=
 I'll
> > > > > >> have to submit a patch that removes the obsolete board, then a=
dds back
> > > > > >> the same board under a different name. Shall I do that?
> > > > > >
> > > > > > I think this patch is fine - other than the inconsistency that =
Krzysztof
> > > > > > pointed out between the "renamed to gw7500" and the "gw75xx" in=
 the new
> > > > > > compatible.
> > > > >
> > > > > I am not a fan of renaming compatibles because of marketing chang=
e,
> > > > > because compatible does not have to reflect the marketing name, b=
ut
> > > > > there was already precedent from Qualcomm which I did not nak, so=
 fine
> > > > > here as well. Double wildcard 75xx is however a bit worrying.
> > > > >
> > > >
> > > > Hi Krzysztof,
> > > >
> > > > Thanks for understanding. The double-wildcard is again a marketing
> > > > tool. All GW75** use the same device-tree by design. The boot firmw=
are
> > > > that chooses the device-tree understands this and for a GW7521 for
> > > > example would look for gw7521 first, gw752x next, gw75xx last.
>
> When it is doing this matching, does it actually apply a wildcard, or
> does it look for "x"? IOW, if your eeprom said "gw7521" and there were
> no devicetrees matching "gw7521" but there was one with "gw7500" would
> it match?

I attempt to explain the algorithm used in the comment of the U-Boot
code used by U-Boot to both choose the DTB it uses as well as the
bootscript to choose the DTB used for Linux when booting Linux:
https://elixir.bootlin.com/u-boot/latest/source/board/gateworks/venice/eepr=
om.c#L164

Consider a GW7001-F.1 SOM married to a GW7201-G.2 Baseboard (the
letter at len-2 is the PCB revision and the number is a BOM revision
and those are the full model strings in the EEPROM's of the boards):
fdt_file1=3Dimx8mm-venice-gw72xx-0x-g2f1.dtb
fdt_file2=3Dimx8mm-venice-gw72xx-0x-g2f.dtb
fdt_file3=3Dimx8mm-venice-gw72xx-0x-gf.dtb
fdt_file4=3Dimx8mm-venice-gw72xx-0x.dtb

The script that loads the fdt for booting Linux looks for fdt_file1
first, then fdt_file2, etc etc so that if needed a 'more specific' dtb
could exist with base-board and som-revision fixups. However to answer
your question the algorithm already assumes that baseboards have 2
digits worth of don't care and match specifically an 'x' for that.
Including the SOM and Baseboard PCB revision and BOM revision was a
safeguard that has never been needed so in practice we always just end
up with the last most generic dtb above which is the case of
'imx8mm-venice-gw72xx-0x.dtb' case means a 'gw72xx' baseboard married
to a 'gw700x' SOM. The 'gw70' is removed from the dtb name as all
Venice SOM's start are GW70**.

So in my mind the dt for the baseboard above is called
'imx8mm-venice-gw72xx' where 'xx' is part of the name but does have
implied meaning. It certainly helps our customers know that the last
two digits of a baseboard are don't-cares.

This is nothing new... I did this for the imx6 based Gateworks Ventana
boards as well most of which have been upstream since Linux 4.x:
$ ls -1 arch/arm/boot/dts/nxp/imx/imx6*gw*.dts
arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dts
arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dts
arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dts
arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dts
arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dts
arch/arm/boot/dts/nxp/imx/imx6dl-gw552x.dts
arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dts
arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dts
arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dts
arch/arm/boot/dts/nxp/imx/imx6dl-gw5904.dts
arch/arm/boot/dts/nxp/imx/imx6dl-gw5907.dts
arch/arm/boot/dts/nxp/imx/imx6dl-gw5910.dts
arch/arm/boot/dts/nxp/imx/imx6dl-gw5912.dts
arch/arm/boot/dts/nxp/imx/imx6dl-gw5913.dts
arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dts
arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dts
arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dts
arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dts
arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dts
arch/arm/boot/dts/nxp/imx/imx6q-gw552x.dts
arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dts
arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dts
arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dts
arch/arm/boot/dts/nxp/imx/imx6q-gw5904.dts
arch/arm/boot/dts/nxp/imx/imx6q-gw5907.dts
arch/arm/boot/dts/nxp/imx/imx6q-gw5910.dts
arch/arm/boot/dts/nxp/imx/imx6q-gw5912.dts
arch/arm/boot/dts/nxp/imx/imx6q-gw5913.dts

$ git grep gw,imx6q-gw5 Documentation/devicetree/bindings/arm/fsl.yaml
Documentation/devicetree/bindings/arm/fsl.yaml:              - gw,imx6q-gw5=
1xx
Documentation/devicetree/bindings/arm/fsl.yaml:              - gw,imx6q-gw5=
2xx
Documentation/devicetree/bindings/arm/fsl.yaml:              - gw,imx6q-gw5=
3xx
Documentation/devicetree/bindings/arm/fsl.yaml:              - gw,imx6q-gw5=
400-a
Documentation/devicetree/bindings/arm/fsl.yaml:              - gw,imx6q-gw5=
4xx
Documentation/devicetree/bindings/arm/fsl.yaml:              - gw,imx6q-gw5=
51x
Documentation/devicetree/bindings/arm/fsl.yaml:              - gw,imx6q-gw5=
52x
Documentation/devicetree/bindings/arm/fsl.yaml:              - gw,imx6q-gw5=
53x
Documentation/devicetree/bindings/arm/fsl.yaml:              - gw,imx6q-gw5=
60x
Documentation/devicetree/bindings/arm/fsl.yaml:              - gw,imx6q-gw5=
903
Documentation/devicetree/bindings/arm/fsl.yaml:              - gw,imx6q-gw5=
904
Documentation/devicetree/bindings/arm/fsl.yaml:              - gw,imx6q-gw5=
907
Documentation/devicetree/bindings/arm/fsl.yaml:              - gw,imx6q-gw5=
910
Documentation/devicetree/bindings/arm/fsl.yaml:              - gw,imx6q-gw5=
912
Documentation/devicetree/bindings/arm/fsl.yaml:              - gw,imx6q-gw5=
913

So the formula we use here at Gateworks is the first number is the
product family (5=3Dimx6q/dl ventana, 7=3Dimx8m/n/p venice), the next
digit (or digits) is the baseboard and if the 9xx model numbers are
1-off designs that will never have variations.

So here is what currently exists for the Venice family:
$ git grep gw,imx8 Documentation/devicetree/bindings/arm/fsl.yaml
Documentation/devicetree/bindings/arm/fsl.yaml:              -
gw,imx8mm-gw71xx-0x       # i.MX8MM Gateworks Development Kit
Documentation/devicetree/bindings/arm/fsl.yaml:              -
gw,imx8mm-gw72xx-0x       # i.MX8MM Gateworks Development Kit
Documentation/devicetree/bindings/arm/fsl.yaml:              -
gw,imx8mm-gw73xx-0x       # i.MX8MM Gateworks Development Kit
Documentation/devicetree/bindings/arm/fsl.yaml:              -
gw,imx8mm-gw7901          # i.MX8MM Gateworks Board
Documentation/devicetree/bindings/arm/fsl.yaml:              -
gw,imx8mm-gw7902          # i.MX8MM Gateworks Board
Documentation/devicetree/bindings/arm/fsl.yaml:              -
gw,imx8mm-gw7903          # i.MX8MM Gateworks Board
Documentation/devicetree/bindings/arm/fsl.yaml:              -
gw,imx8mn-gw7902          # i.MX8MM Gateworks Board
$ git grep gateworks,imx8 Documentation/devicetree/bindings/arm/fsl.yaml
Documentation/devicetree/bindings/arm/fsl.yaml:              -
gateworks,imx8mm-gw7904
Documentation/devicetree/bindings/arm/fsl.yaml:              -
gateworks,imx8mm-gw7905-0x # i.MX8MM Gateworks Board
Documentation/devicetree/bindings/arm/fsl.yaml:              -
gateworks,imx8mp-gw71xx-2x # i.MX8MP Gateworks Board
Documentation/devicetree/bindings/arm/fsl.yaml:              -
gateworks,imx8mp-gw72xx-2x # i.MX8MP Gateworks Board
Documentation/devicetree/bindings/arm/fsl.yaml:              -
gateworks,imx8mp-gw73xx-2x # i.MX8MP Gateworks Board
Documentation/devicetree/bindings/arm/fsl.yaml:              -
gateworks,imx8mp-gw74xx   # i.MX8MP Gateworks Board
Documentation/devicetree/bindings/arm/fsl.yaml:              -
gateworks,imx8mp-gw7905-2x # i.MX8MP Gateworks Board

All that I'm trying to do is correct the fact that during the point I
had boards in the lab and created the device-tree and the point at
which we shipped the boards it was decided that the GW7905 should not
just be a 1-off board and that we wanted to make it a more widely
available baseboard with room for changes thus it was renamed from
GW7905 to GW7500 with expected GW7501, GW7502, GW7503 revisions
coming.

My whole point here is that in reference to the product naming scheme
I'm not doing anything different than what has been accepted before.
We have our reasons for naming this board combination
'gateworks,imx8mp-gw75xx-2x' instead of the original name
'gateworks,imx8mp-gw7905-2x'. Isn't the whole point that this is a
vendor defined string? I get that it is a string that should not
change but this name change was made before product was shipped so it
seems fair to make the change. If gateworks changed the company name
we would not be allowed to 'change' the existing strings but could
create a new one and start using it (perfect example was when someone
(not us!) decided the vendor name abbreviation of 'gw' should be
replaced with 'gateworks'.

I could stick with the idea that 'gateworks,imx8mp-gw7905-2x' is set
in stone and leave it there and just create a new
'gateworks,imx8mp-gw75xx-2x' but I hate to just duplicate the actual
dts files as that is just a waste and the reason for the 2nd patch of
this series.

Looking for guidance...

Best Regards,

Tim

>
> > > You haven't documented the other 2 though.
> > >
> > > How do "all GW75** use the same device-tree", but then there are 3
> > > possible DTs for just 1 board?
> > >
> > > Selecting a DT is not a unique problem. We don't need unique
> > > solutions. There's the QCom board-id proposal[1] and OS provided DT[2=
]
> > > which are addressing similar issues.
> > >
> >
> > Hi Rob,
> >
> > I'm not sure those links are really able to address all needs. I see
> > some similarity with the concept of a board-id taking the place of the
> > don't-cares used in our names but not the concept of marrying a
> > baseboard to a SOM with the two different boards creating a named
> > combination (both which may have some don't cares). The Gateworks
> > Venice product family of boards (imx8m{m,n,p}-gw7***-*x) boards have
> > been in the kernel for quite some time now as has been the U-Boot code
> > that determines the device tree using a baseboard model number
> > combined with a SOM model number.
> >
> > A baseboard with an model of GW7301 (programmed into an EERPOM at mfg
> > time) gets coupled with a SOM with the model of GW7000 and this uses a
> > device-tree of gw73xx-0x (prepended by the SoC name of imx8mm, imx8mn,
> > imx8mp). The don't care's here and the naming convention has been
> > chosen by us, the board manufacturer, leaving enough significant
> > digits for component subloads that was desired at the time. So a
> > GW7300 and a GW7301 are the same schematic, they just have some
> > different loading options.
>
> By "loading options" do you mean "we changed the supplier for the 12v
> barrel jack" rather than something that is actually visible to an OS?
>
> > I really don't understand the issue here. A board was originally named
> > gw7905 when I brought up the prototype in the lab and created its
> > device-tree but between then and when it shipped it got moved to the
> > more generic 'family' of gw75xx baseboards which get coupled with a
> > SOM. I already have a gw71xx, gw72xx, gw73xx out there for years that
> > function this way.
> >
> > Device trees describe hardware using a name... the name changed :(
> >
> > Quite simply there are no boards out there with a GW7905 in the EEPROM
> > that need to be supported... they all have a GW7500 programmed in them
> > (and some may in the future have a GW7501, GW7502, etc).
> >
> > Is the problem here the fact that I use don't-cares in the names or
> > the fact that a name changed?
>
> IMO, getting hung up on the name changing before a released product is
> rather silly, but straightening out what exactly your selection method
> is worthwhile.
>
> Thanks,
> Conor.
