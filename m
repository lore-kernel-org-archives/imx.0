Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C89F1B4259;
	Tue, 21 Jan 2025 09:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737450263; cv=none; b=pVJJJBwgIQ2py42mopaLfFnSHjp83SOeQS0sSJ+/GxFqivCMWpFf3+4n//dyWMKsdiwrz0tQGgxpLBywlMfpV/NMGnjjIVueDVgcPKk1Rj95SVVXXPkbHk0p9rMmFxU8A+1XvTNzHxmNRhm2tA5NMQbx8OVBkBEb4jHdjhnH6j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737450263; c=relaxed/simple;
	bh=834LCvceUx526IEmw0ApuQZvBNYCCIxRzLlO39/DYQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UONsBzSnP02tWWsUJFmUZAhx2BJEgjN1faGPRu1JtG5opKolVwb4/aGFz1AlxtHllobd3qtn0u4wM3TcfUZzOh7JElAfy6PMk05T7XNJuA9LPzzWHSma1E2IiBy4T7UzMzJRzebgtTYbnRE8ZpAi9ROLnMtOwf/vjJLyJzjSBt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGKpB0dj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGKpB0dj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3280C4CEDF;
	Tue, 21 Jan 2025 09:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737450262;
	bh=834LCvceUx526IEmw0ApuQZvBNYCCIxRzLlO39/DYQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FGKpB0djZnPUbicSPAkZ7dNLNaZZr7Yhhp0DDXD6Sr5YIn+toCie5iW+Ob+NJ6mJj
	 y2OWAxJ1Kpk+OuyRbcAiqO5soJWT8iAJ3wJGk8fxYVPzu3rLC+iGEFOhrM7yhtd1gF
	 JQYuhW8prhTcIXuySzvxBsoohj8DyjjayCU46/O8cqWovekK6CQCBidsX2tzTsl/2l
	 YoXIO0g2YCn0GGO6J+WQW1hKwcMPlL+Z2FeWNrl1j0Uae00MXmFKFY7iDDcOWkWirx
	 pvnQb3MiW9PPLcfB14Kmd3+4Q2eZCy5ZjpP8Dw8pJECRdJIcIpMVKMKAbTyFrJdrzu
	 kRqHwb+nySa9A==
Date: Tue, 21 Jan 2025 10:04:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"joao.goncalves@toradex.com" <joao.goncalves@toradex.com>, "marex@denx.de" <marex@denx.de>, 
	"hvilleneuve@dimonoff.com" <hvilleneuve@dimonoff.com>, "hiago.franco@toradex.com" <hiago.franco@toradex.com>, 
	Peng Fan <peng.fan@nxp.com>, "frieder.schrempf@kontron.de" <frieder.schrempf@kontron.de>, 
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>, "m.othacehe@gmail.com" <m.othacehe@gmail.com>, 
	"mwalle@kernel.org" <mwalle@kernel.org>, "Max.Merchel@ew.tq-group.com" <Max.Merchel@ew.tq-group.com>, 
	"quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, 
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
	"arnd@arndb.de" <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Frank Li <frank.li@nxp.com>, Carlos Song <carlos.song@nxp.com>
Subject: Re: [EXT] Re: [PATCH v4 5/5] arm64: dts: imx93: Add labels for the
 references easier
Message-ID: <20250121-belligerent-elephant-of-courage-ed8caa@krzk-bin>
References: <20250121074017.2819285-1-joy.zou@nxp.com>
 <20250121074017.2819285-6-joy.zou@nxp.com>
 <870da365-bb18-47a7-ab78-62ce8a663559@kernel.org>
 <AS4PR04MB9386C8D1E2FF247C28D38BD0E1E62@AS4PR04MB9386.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AS4PR04MB9386C8D1E2FF247C28D38BD0E1E62@AS4PR04MB9386.eurprd04.prod.outlook.com>

On Tue, Jan 21, 2025 at 08:25:51AM +0000, Joy Zou wrote:
> > THERMAL_NO_LIMIT
> > > THERMAL_NO_LIMIT>, @@ -1334,7 +1334,7 @@ usbmisc2:
> > usbmisc@4c200200 {
> > >                       #index-cells = <1>;
> > >               };
> > >
> > > -             ddr-pmu@4e300dc0 {
> > > +             ddr_pmu: ddr-pmu@4e300dc0 {
> > 
> > Useless commit - there are no users.
> Thanks for your comments!
> Have used the labels in imx91.dtsi. The imx91.dtsi have included the imx93.dtsi.

That's patch 5/5 so I say: impossible.

Either you did not understand the commit or your patchset is
non-bisectable, so anyway that's wrong or fix your builds.

Best regards,
Krzysztof

