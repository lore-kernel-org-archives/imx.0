Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A08145B18
	for <imx@lists.linux.dev>; Wed, 20 Nov 2024 20:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732133865; cv=none; b=Qmn//OTW9LbUe1Ye3z3PTc1GbA6PSYTfsQQ9EUQZ3+C03fHsacDhDisSPyfcN5j/nWQmSS0sZMpP6yweKE4WBUImFHDndRS1vL11UN/HcZVy/8DF6ku+14qq+TQwzE/ehdRECuGmhoTcUsnAl37aoIA4tKlI6SFQJN4GAjcVxxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732133865; c=relaxed/simple;
	bh=Lp/j/XhOkxDLRMMPTwF8OpPOjnhfQr56k3rd3++lfG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3SBu/TwDaael0wdyEkz4MXsZ/FhdXch8u2AU3/wXJ7mFYIDJZBX/FWZgM3/PClNd6P0FiiNDGAIeZbVJb//tA7YM4RZIL0UyeUxBs1yq7X3KY4ph/cuM3N59FIdwrzjU3aZW4NTet4pCK2i80RIVLNT4PT8ezkS0hsDJNR8AYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YdhqGpyY; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YdhqGpyY"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e38158560d4so96429276.2
        for <imx@lists.linux.dev>; Wed, 20 Nov 2024 12:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1732133862; x=1732738662; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMa9FYKJpapUBH2UPjLfcSTTq3ILiaq7oyOfIRPv2aQ=;
        b=YdhqGpyYymSE8QNSmr52W+CtxXSyWiEzXPfJrhfscXMT0CLmuPv6N2+09nqWf4gerJ
         QugHIyZvjcvskC8jLOO9LyTX/fYmPY1Xly5YFANOPBbInT+ZQgLa4CszRUt/+q5g3XEO
         JZCLABvIQxwXTGwRQNjOtzmNK9jI2wAA7xkeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732133862; x=1732738662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMa9FYKJpapUBH2UPjLfcSTTq3ILiaq7oyOfIRPv2aQ=;
        b=ofw+hxHIPyz11LMzIZPmWoHp3X0H7zvqGuB4wEpB7EXmtLyu8h33mPZNOK+YJYfCMU
         kfIr2WZE3OAr3hVMZ4LrFHFC6H6rQYvNPbGrFc+kNaQQ6ZJ14aoMEg3LrbCF9jOgHrkd
         uEwUYEJFag2Q5A1Zf41QEamNyXdohWRUKgKjFUGCQ0ADXANEZyHHOzL0vc2/+yI8juDP
         tPh0pjo609AD/Hayo5M1bA7EJIi+VstjQbUXrNIAIpCGTIbUQs7I1zi1DTMAv8SogJTo
         7XF88m3IFrDekk7+JCcRtWBAefUDiSvm3onyVxwDueWy4V28KiYkJaVBVvZDudENcFYd
         1PZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAKao8O33cQyop5AINGYxZPYnQBMMTmTnjnYZNq9c05KvxPNILpemh2LhdcyWx1EF1jgw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx13WxHgikXEW43BCBUzG/GUgmpR29f03zAIETa79QY+pYjqWow
	/4iH7986PZRKm//MvD/VP+D1AzHvS/ard9krP4SIlbFgO66E2aELk65hsFoG1o4J8TQAevo4UMa
	j+lMJc50AspW2WHFTkiw2wMG6zUhOkDl1Sxbn8Q==
X-Google-Smtp-Source: AGHT+IF0g3Ptb5CLxq4yJba6jhB+UOLyiwDyEyI0UH4grlCm4nU7An8bN0jBRYmxFsEclY7z1nInn74Y3LLHHdjtUkY=
X-Received: by 2002:a05:6902:2507:b0:e29:1b94:ef67 with SMTP id
 3f1490d57ef6-e38cb57ec60mr4226122276.19.1732133861150; Wed, 20 Nov 2024
 12:17:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
 <20241106090549.3684963-2-dario.binacchi@amarulasolutions.com>
 <4bix7me5vaoyhcuffyp4btajmhy7no6ltczoesopaz2fqupyaw@fensx4nn472u>
 <b7c1499b-8337-421c-9734-6e518d678ff8@kernel.org> <CABGWkvrYJL9=zrPSFuEAgKO+9gDHD6RmCJM6Br6Le_eh578ETQ@mail.gmail.com>
 <54dd6ae6-b992-451e-b1c6-8a1968955f4a@kernel.org> <PAXPR04MB8459BE3474EFD4FCC28E0E82885D2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <8c310eca-d695-418c-82cb-a89351d83887@kernel.org> <PAXPR04MB8459B6F8D5C623D19CCF6B39885E2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <bc02327b-dea8-48c9-b036-4a0eda0c4cb9@kernel.org> <9f6b243b-0642-41db-85ed-d020bfa3e6e2@kernel.org>
 <PAXPR04MB845978F4D3C6E887E0DE8D5488582@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <d137cc7e-9b78-4cfb-ac50-023d1ea4c82b@kernel.org> <PAXPR04MB8459695A42922E52FCC9295488212@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459695A42922E52FCC9295488212@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 20 Nov 2024 21:17:30 +0100
Message-ID: <CABGWkvrrXb7v_k=ZWoYj8sXSPPK4_2qh-98QJ8WqWAuR3RAdyA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock: support spread
 spectrum clocking
To: Peng Fan <peng.fan@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>, Abel Vesa <abelvesa@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 11:11=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: Re: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock: support
> > spread spectrum clocking
> >
> > On 11/11/2024 02:49, Peng Fan wrote:
> > >>> I don't understand now even more. Or I understand even less now.
> > >> Why
> > >>> binding references its own clocks via phandle? This makes no sense
> > >> at
> > >>> all, except of course assigned clocks, but that's because we have
> > >>> one property for multiple cases.
> > >>
> > >> And BTW if that was the point then the example is confusing
> > because
> > >> the &clk phandle is not the device node in the example but it should=
.
> > >> Neither description says which device's clocks are these.
> > >>
> > >> This is expressed very poorly in the binding, look:
> > >> "Phandles of the PLL" - it clearly suggests some other clocks, not
> > >> its own, that's so obvious I did not even think of asking. Patchset
> > >> goes slow also because of poor explanation, lack of diagrams and
> > >> expecting me to remember your clock hierarchy.
> > >
> > >
> > > Dario may improve the patchset in new version. But let me just try to
> > > explain a bit more about the hardware logic, I hope this could give
> > > you some knowledge on i.MX clock and we could get some
> > suggestions on
> > > next:
> > >
> > >
> > > OSC will generate 24MHz clock to Anatop module.
> > > Anatop module takes 24MHz as input and produces various PLLs.
> > > Clock Control Module(CCM) takes PLLs as input, and outputs the final
> > > clocks to various IPs, saying video IPs.
> > >
> > > The Anatop module could produce PLLs with spread spectrum
> > enabled.
> > > The Clock Control module just divides the freq and output the end IPs=
.
> > > The end IPs cares about spread spectrum for high quality clock, the
> > > Clock Control modules does not care. Now back to binding,
> >
> > All above makes sense. The previous message:
> > "Because in current design, ccm is taken as producer of
> > CLK_IMX8M_VIDEO_PLL, not consumer. "
> >
> > confused me a lot because it suggests that these PLLs are provided by
> > CCM. It turns out not... so the answer is like I said long time ago: yo=
u
> > must take these clocks as inputs and this is done via clocks property.
> > Not fsl,clocks or fsc,i-want-more-properties-clocks.
> >
> > >
> > > There is a imx8m-anatop binding fsl,imx8m-anatop.yaml for anatop
> > and a
> > > imx8m-clock.yaml binding for clock control module.
> > >
> > > I think the patchset is to enable spread spectrum of a PLL globally,
> > > not for a specific device saying video IP here. So the patchset put
> > > the properties under the clock control module.
> >
> > I understand. This looks however as misrepresentation. If you do not
> > have the video IP block enabled, why would you configure spread
> > spectrum? IOW, spread spectrum as you described is needed for the
> > final IP block and this final IP block should configure it. Properties
> > belong there.
>
> Multiple IPs use same PLLs as source and share same pll settings,
> it is better to configure Spread Spectrum(SS) at clock producer side,
> I think.

I agree with you, and based on what has been discussed and understood
so far, the correct place to add the properties for spread spectrum seems
to be the CCM node.
So, is it correct to think of a CCM node like this?

clk: clock-controller@30380000 {
    compatible =3D "fsl,imx8mn-ccm";
    reg =3D <0x30380000 0x10000>;
    interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
                       <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
     #clock-cells =3D <1>;

     clocks =3D <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
                   <&clk_ext3>, <&clk_ext4>,
                   <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
                   <&anatop IMX8MN_ANATOP_AUDIO_PLL2>,
                   <&anatop IMX8MN_ANATOP_DRAM_PLL>,
                   <&anatop IMX8MN_ANATOP_VIDEO_PLL>,
     clock-names =3D "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
                              "clk_ext3", "clk_ext4", "pll_audio1",
"pll_audio2",
                              "pll_dram", "pll_video";
   ...
};

And if I want to set the spread spectrum for audio1 and video PLLs,
should I apply the
following configurations?

&clk {
    fsl,ssc-modfreq-hz =3D <0>, <0>, <0>, <0>,
                                      <0>, <0>,
                                      <6800>,
                                      <0>,
                                      <0>,
                                      <8000>;
    fsl,ssc-modrate-percent =3D <0>, <0>, <0>, <0>,
                                      <0>, <0>,
                                      <3>,
                                      <0>,
                                      <0>,
                                      <5>;
    fsl,ssc-modmethod =3D "", "", "",
                                       "", "",
                                       "down-spread",
                                       "",
                                       "",
                                      "center-spread";
};

>
> Dario,
>
> Without talking about dt-bindings, another approach to enable SS
> is to enable SS for Video/Audio PLLs using driver parameters,
> and the parameter that needs for the PLLs could be passed
> from module parameter, such as clk_imx8mm.audio_ss_xx=3D.
>
> Then you no need bindings.

As far as I know, I think it=E2=80=99s better to proceed with the dt-bindin=
gs approach.

Thanks and regards,
Dario

>
> Regards,
> Peng.
>
> >
> > It's kind of similar for some OPP/performance/bandwidth requests.
> > Even more similar to clock frequencies. Which device requests to
> > configure given clock frequencies? Final consumer, not clock controller=
.
> >
> >
> > >
> > > For example, there are VPU_JPEG, VPU_DECODE, both will use video
> > PLL
> > > with high quality. So the clock producer just produce PLLs with
> > Spread
> > > Spectrum(SS) enabled, and put the SS properties under CCM or
> > anatop
> > > node, not video IP nodes.
> > >
> > >
> > > We could have a talk on IRC if Dario, Abel and you are available to
> > > discuss on this topic.
> >
> >
> >
> > Best regards,
> > Krzysztof



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
