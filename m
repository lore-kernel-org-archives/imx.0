Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D364B34545
	for <imx@lists.linux.dev>; Sat, 23 Nov 2024 19:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732391253; cv=none; b=LmWzDyCYuTjqD4H+7pisAeQrjwCaYjv1wc94pSInqUnPpt7+FNiasU+SjNvkc5Ioii/m9JYfGWsklzR2ZoVjZ+IPWtzVB4bK6eh1zDo8eV9UeqtkwmDdV4GY2t7wr4+6QuTDOt34B5ussaeXrUmiHZ2Tix9yiXqEDfEmCpwoUMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732391253; c=relaxed/simple;
	bh=aZA3trjlfivLV4xAqz8KmDMOR/afSd2+Nsdl23oV524=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R/sdgBxcACXOQrc/P1jCUoNCeakIZISpX+dXcuUS5EoGmlQpd7ywh74ifVS3e0APzGXNkRn98/frccg/89pWUBdgmtJ/cVxK0d6l8gDUc1mm9iGNPlA/9ux4JTgEmEt6s8WrylGOiJHWCIrGWYLrhJCSZOpOb/CGN2xC+epk+s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEAFcN+K; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEAFcN+K"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7f71f2b136eso2639571a12.1
        for <imx@lists.linux.dev>; Sat, 23 Nov 2024 11:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732391251; x=1732996051; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIisu+SInmO8aU5o7J4/R5vnmz4PGenJ0iDGtFRy0GM=;
        b=kEAFcN+KvbyzS+YByNN7AzyS8Zk0im+ZXdZ+DPslamk+z2/afPi1sTmD2mL24Z/n7x
         Kp7ZL4bkc5up15w5uZA2QYG1Oru/oNs6gXzIgehueSXXktn800doYT7JVQGM4HIIHF0H
         WQ4C+C8xi+onq+v6BruIoKgMFY7S0O8g20r/WrsOr0FR6/Tj3+pAXxz3+z3Ueq+Duv7U
         mBFKCYRXBkZ6GVlrQMOzBvkdop+LPWnFbRXtUBC1vL1IoqQEAc2HvzBnofpaPn0KV5h3
         lTS+n0TPXgOdA7mmGXNXIAyyfsKAh6DGl/FDXCGr+TmMLt6O+T4pV8XeC3oCWTuNEgSJ
         a1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732391251; x=1732996051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIisu+SInmO8aU5o7J4/R5vnmz4PGenJ0iDGtFRy0GM=;
        b=UUCgvIutevkSs8WvWTjQ4mgF9osaHANeoO0loc70VT5sZuIgPZILQkIoEF9Plot6Ow
         UoOEM4+JYxS7UxvVaFdSrn4blgEbq16cJh61VLIpk3l2Us0v34wP2lUD5oNfvrCj5vJy
         9kaOjngTUE1RDF8SrmG0ruIrthhDpw2D4WPAEaiv+dmejlmQzwvFvdTCMmedmjQWWt+j
         xkmkj1ApA/cGysymJ+wST5mOSPmnJaPrhQYDSeVrijbl3MTBD7ATRntyaN5YCYGmkiWA
         RTCndAI6p1DMBgU5NSe2VJfRJdajbiXEoNBQ6UPBLdoGWJ0jSARsDENVck4us0xyTTap
         EUyw==
X-Forwarded-Encrypted: i=1; AJvYcCUvgLLqGPMGiG78+AO/ZrByDYEl/YoQynQlDt7e7sgCey4vuUXmt/p142wEABm3v962fQs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBZfCjZ83OKZbrxve4GCmPSKTU/xoLQOKays7ymTvlWBeU2laL
	sLo4WAknVnMo+6iJlodi2REW0XdqXRwnqyeE1WyTcQH1fIu+tf3FIQGLSWpsvZnKdWlNchG1nep
	Yv0IuzvNNb+dItPbdAkzXgtFUWfg=
X-Gm-Gg: ASbGnctLwKaibUTdOHxDtPDHOXrUo63Asfu73RV8ilLIM1Fn23yEQxw+csp5fBvnxfb
	yIEiXn1NG1enizi034YAM3J/03+dolW8=
X-Google-Smtp-Source: AGHT+IER882hxWGxdnLbHc4WL+b6BKZBCKwOSHKs1j9B4N3y0JbmongRgfkv5XWs473nMaR5UvS6LxycIeafIw7+oY8=
X-Received: by 2002:a17:902:ea09:b0:20b:b93f:300a with SMTP id
 d9443c01a7336-2129f72fe53mr91133915ad.7.1732391250925; Sat, 23 Nov 2024
 11:47:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241114065759.3341908-1-victor.liu@nxp.com> <20241114065759.3341908-3-victor.liu@nxp.com>
 <df6ebdde-65f8-4aad-93c7-b1df695bd2ef@denx.de> <AM7PR04MB7046546A882A8D48E135D84698272@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <8a4fd234-4c7b-4a04-990d-3222aaa5172d@denx.de> <AM7PR04MB7046E282FD702ACE5E288F8998202@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <83be0a27-6b6c-4ba6-b9dc-f914a10abace@denx.de> <AM7PR04MB7046587167BF790549B8560F98212@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <c5ab63da-21ec-4c0d-8ecc-3745943d806f@denx.de> <AM7PR04MB7046D404841394382324DE7198232@AM7PR04MB7046.eurprd04.prod.outlook.com>
In-Reply-To: <AM7PR04MB7046D404841394382324DE7198232@AM7PR04MB7046.eurprd04.prod.outlook.com>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 23 Nov 2024 13:47:19 -0600
Message-ID: <CAHCN7xJsTo=yRxkqPwvt5hX0UTFvF+gBVOqcjrR2jSq4jKzV3g@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp
 pixel clock reconfigure parent rate"
To: Ying Liu <victor.liu@nxp.com>
Cc: Marek Vasut <marex@denx.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"will@kernel.org" <will@kernel.org>, "abelvesa@kernel.org" <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>, 
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	"quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, 
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, 
	"nfraprado@collabora.com" <nfraprado@collabora.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 9:39=E2=80=AFPM Ying Liu <victor.liu@nxp.com> wrote=
:
>
> On 11/22/24, Marek Vasut wrote:
> > On 11/20/24 7:38 AM, Ying Liu wrote:
> >
> > [...]
> >
> > >>> If the DP monitors support typical video modes like 1080p60 with
> > >>> 148.5MHz pixel clock rate, I assume these typical video modes work
> > >>> still ok with this patch at least.  Please help confirm this, since=
 if the
> > >>> alternative solution(*) doesn't stand, we would know those video
> > >>> modes still work ok with my solution(fixed PLL rate).
> > >>
> > >> They do not work with the fixed PLL setting.
> > >
> > > Why?  Did you assign a sensible fixed PLL rate in DT?
> >
> > Whatever was in imx8mp.dtsi does not really work for all the panels.
> > Please keep in mind that the use case I have does not include only
> > 1920x1080 "standard" panels, but also other resolutions.
>
> It looks like you are still sticking to the idea of supporting all potent=
ially
> valid video modes by trying to find an "alternative" solution, while
> neglecting that the solution *could be* never working.
>
> >
> > > Can you please compare clk_summary output for the failing cases
> > > before and after this patch is applied? I assume that if you use
> > > the fixed PLL rate same to the rate which works before this patch is
> > > applied, the typical video modes still just work after this patch is
> > > applied.
> >
> > I'm afraid I do not need to support only typical video modes, but also
> > the other "atypical" modes.
>
> If the "alternative" solution doesn't work, we'll end up using the "fixed
> PLL rate" solution.  It that case, some video modes would be filtered
> out as a sacrifice.
>
> >
> > [...]
> >
> > >> One really nasty way I can think of is -- use find_node_by_compatibl=
e(),
> > >> look up all the relevant DT nodes, parse their clock properties, and
> > >> check whether they all point to the Video PLL or not.
> > >
> > > That's nasty.  It looks even more nasty when considering the fact tha=
t
> > > i.MX93 LCDIF is also driven by imx-lcdif DRM while only i.MX8MP LCDIF
> > > needs the nasty check, because i.MX93 SoC embeds only one LCDIF.
> >
> > The check can be skipped based on compatible string.
> >
> > I agree it is nasty, but it is a start. Are there better ideas ?
>
> No good idea from me.
>
> >
> > >> Maybe the clock subsystem has a better way, like list "neighbor"
> > >> consumers of some specific parent clock or something like that.
> > >
> > > What will imx-lcdif DRM look like by using this way? Get the ancestor=
 PLL
> > > clock of pixel clock(media_disp{1,2}_pix_root_clk), list all child cl=
ocks
> > > (media_disp1_pix and/or media_disp2_pix + other possible clocks) of t=
he
> > > PLL clock in a string array and find media_disp1_pix + media_disp2_pi=
x
> > > in it?
> > >
> > > Doesn't look nice, either.
> >
> > One other option came to my mind -- place a virtual clock between the
> > Video PLL and consumers (LCDIF1/2/LDB), and then have the virtual clock
> > driver do the clock rate negotiation in some .round_rate callback. That
> > is also nasty, but it is another idea. If there is a clock specifically
> > implemented to negotiate best upstream clock rate for all of its
> > consumers, and it is aware of the consumer behavior details and
> > requirements, maybe that could work ?
>
> A mighty virtual clock?  I'm not sure if that would work or not.

From a power-consumption perspective, it seems to me like running the
clocks at the lowest value instead of setting a really high rate which
divides down would save power.

adam
>
> >
> > >> [...]
> > >>
> > >>>> Can something like (*) above be implemented instead, so both Share=
d
> > >> and
> > >>>> separate PLLs would be supported ? That should solve both of our u=
se
> > >>>> cases, right ?
> > >>>
> > >>> I don't see any clear way to implement something like(*).
> > >>>
> > >>> Take the 3 i.MX8MP LCDIFs as one graphic card driven by one imx-lcd=
if
> > >>> DRM instance?  Would it be too intrusive?
> > >>
> > >> Yes, and I think unnecessary, one can simply traverse and parse the =
DT
> > >> to determine the clock assignment?
> > >
> > > Yes, people can traverse and parse DT, but it's nasty.
> > >
> > > In addition, one may argue that now that CLK_SET_RATE_PARENT flag
> > > is set for the pixel clocks, all potential video modes read from EDID
> > > should be supported when only either LVDS display pipeline or MIPI DS=
I
> > > display pipeline is active in the shared PLL case.  This requires one
> > > single DRM instance to detect single or dual active display pipelines
> > > dynamically, hence this single DRM instance becomes necessary.
> >
> > Would single virtual clock which do the frequency negotiation between
> > multiple DRM consumers work too ?
>
> Not sure if it would work or not, but I'm sure that one single DRM instan=
ce
> means atomic check/commit for the display pipelines as a whole, hence
> awareness of active display pipeline number in an atomic way.
>
> >
> > I do not have much to add to the points below.
>
> Regards,
> Liu Ying
