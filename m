Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75D420DD4D
	for <imx@lists.linux.dev>; Mon,  7 Apr 2025 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043021; cv=none; b=RgnZvxH4z35nnMRb/+H4uh1V6lnOQS4vRoK3T91qa3mbSLh7oMVkyCI/XFcqZMFkCKCMgfwtlaTcl2g13G6I0drxyj0h/h9lkAKgv6TwoGppXoMdSD18EvJdVR86xcHlEUJn+u/AQ1FK1UttiVndJrpBCyvzZaKDzLcRGO55AA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043021; c=relaxed/simple;
	bh=xK3zdpugWS3t3I7XRyKqSkoBwBn9VFb6ajzBDZzEiQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbL5DSIHc+trtIXThj6AUiKMDTyhcy180cLv85LCDdBIPKPnoc35wFfxmEwc7m6ZTn6aexv7ML3xqBrFlGJqEhkWR5Q0hrONVl9NjzYqI6EAdICl1ROaIosiVSwleE0C5ZcmB0/E/2JqIfrlSdJq3RIy+ciab35nirLNv1PfzPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tYNtJr11; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tYNtJr11"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6f74b78df93so55914627b3.0
        for <imx@lists.linux.dev>; Mon, 07 Apr 2025 09:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744043019; x=1744647819; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdLI4xLdMKIk5+aH2ShC4YXmxar43nmBcEhmGz0osts=;
        b=tYNtJr11xsIPMgLCiobDug2hQge3FKQp/JDa+vC2uwp9+29BIcgoS3jEdMTIJZo4l5
         dfPGeW9yu7+g5wlER0zsu9Nm8f1wfI/Sing4c1RCbEpgUqMIXAxbfK59Z5iQmYQvnQkI
         w6dHPBI6a3p0JAAejIg4xxfSIQu9DeuuhluN7m1Amc9tgNt16xPTmNSkKvg0a5ks9qVV
         kikYF3ZReULHsG8d9nMaqz08lbK6aqbE3oVqrdONaLRLRCdTlrZvUWs1NpSREvpMVofz
         JXsvdTPtucKrFToFF/M9BpaiigFdX/4amkwGjQPzMUaBN2SogcmeQX7NRGtQjY5We/4K
         3K0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744043019; x=1744647819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdLI4xLdMKIk5+aH2ShC4YXmxar43nmBcEhmGz0osts=;
        b=DYXv0YMLfBrbptAnLRs6qa+MxxZVFur59zEA/HFFA38lEh+OKIBmK4Uhe2ZVGlfGsn
         LVYXgi+4SgMk6ysBW+QvwhFxKFYdpBSLSlFxzeg26gDPst6/4G5Swa+fV9tmo2OdQOod
         aL4f/D6t8IBifktIZTvC1DAW5fZPNlUcUuhhtl9Y3yX3qhDTug86U4UiuZtK/nD6U42A
         AddZagi97Cb+ch9pDOT6JPdFmv7y2MPoJOeHFHvQUtWPg0NABZn6LwNdi3+btZiJBmAt
         nwPIb51iW4Grj3Hl5TMLza+ZDox55oaYbERS2jBJciuHypXsJYry2iWyyZPD3Bt7X0CK
         7foQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUM5DQqMbxrMUgGTIeOVPPY/OCYTrf/VtZZSYDhSyUgkhM0EUcBLpuMZr+Sma6CtwV3A8=@lists.linux.dev
X-Gm-Message-State: AOJu0YztEgixuaVEKDMyYnWFaFGGPsYgUA3Kfnq8Ru19GclRzwv+2rq1
	xdvikdrohk9F228N/sOTnh9xmTm3Taa1ybHHrHkX9V9nr4O3IPOFBOnx6MgaPOicdlhAadDcmRQ
	3d7q23vOzJREEsITTX91qQ7rw5HMS85d2R+6i5Q==
X-Gm-Gg: ASbGncuuVBHdmLTEFK/bYMhXmXwgx/1v29AgExbUxrb+8S79nVqHsuuSXt3sfB9GzMA
	nvi5Hjp9bMRmwo7HlzKprblk7m6a2TIEPut4VL8T8lRZnEekLXtJHSdTEZoseE3NG1sgRaVPQc+
	xL0LvjESVGEOsLSkYY7MjO1C/1J9o=
X-Google-Smtp-Source: AGHT+IEvCyoULSP8GtunUj7XByE2xLEZApny/EX5BI9r2HNnS7M/lF2l9CVPZCF8J2YyYgCczjPfSOPcnUbnSfgNgFc=
X-Received: by 2002:a05:690c:6481:b0:702:627c:94ec with SMTP id
 00721157ae682-703e3357786mr243332367b3.35.1744043018812; Mon, 07 Apr 2025
 09:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org> <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
 <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com>
In-Reply-To: <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:23:02 +0200
X-Gm-Features: ATxdqUG4iYRDoX1uSepWjxp_lc67AACZn0NdIUwL4_627lSdYio0uG7PYHZfOMA
Message-ID: <CAPDyKFoHQdHED0hHUR7VKin0XG6SVnYXuvPjB=Xe+1o2hpiPJA@mail.gmail.com>
Subject: Re: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains constraints
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Apr 2025 at 15:09, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Apr 4, 2025 at 5:37=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.or=
g> wrote:
> >
> > On Fri, 4 Apr 2025 at 05:06, Rob Herring (Arm) <robh@kernel.org> wrote:
> > >
> > > The "power-domains" and "power-domains-names" properties are missing =
any
> > > constraints. Add the constraints and drop the generic descriptions.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/arm/cpus.yaml | 8 ++------
> > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Docume=
ntation/devicetree/bindings/arm/cpus.yaml
> > > index 6f74ebfd38df..5bd5822db8af 100644
> > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > @@ -313,19 +313,15 @@ properties:
> > >      maxItems: 1
> > >
> > >    power-domains:
> > > -    description:
> > > -      List of phandles and PM domain specifiers, as defined by bindi=
ngs of the
> > > -      PM domain provider (see also ../power_domain.txt).
> > > +    maxItems: 1
> >
> > There are more than one in some cases. The most is probably three, I th=
ink.
>
> Unless I missed it, testing says otherwise. What would the names be if
> more than 1 entry?

"psci", "perf", "cpr", etc

The "psci" is always for CPU power management, the other is for CPU
performance scaling (which may be more than one power-domain in some
cases).

I would suggest changing this to "maxItems: 3". That should be
sufficient I think.

Kind regards
Uffe
