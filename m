Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8B82080D2
	for <imx@lists.linux.dev>; Sat, 25 Jan 2025 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737810698; cv=none; b=lal6puebLPEMsTg6MQmrvKGAsYRaVicvvBEH5eFTj1daPvHbcNdooJFQFsg7j3SOQFUknzJFg+RFOKfvLPNYB0VnLJO7CoCm/HYKzXi6p0WsCl7abe8xzJxlQAVrqj/+vYhkV5MaTFGNvSOwiKu3tCMZtU/hVwAuev3KRYwkOJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737810698; c=relaxed/simple;
	bh=a/mPoBkduWt7AZhC7tlzOK5+E8d9jn6bQf5Fqn4529Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRj0O63YABynJbc0JAmX+uMIUX3yFqWChAusbu7jv4KMJQ2ZsNV8MvwtGqOMVX+nTaGy6OixzUNmLu8XNlTUMOk4Nk8YgF4MJaOipeeqW7UKfot6qIN76y+6/pbHxwhnNbe9h1Gmgi7xAPlOmPeQ0a4Y1EtBX4Xqy/9jgmhREKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=UCuLlGbk; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UCuLlGbk"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e4a6b978283so6665181276.0
        for <imx@lists.linux.dev>; Sat, 25 Jan 2025 05:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737810696; x=1738415496; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9w/182ECZVPmRavMFGQ5pT+3mapjwFmkPCGbm41FWo=;
        b=UCuLlGbkiCWUDAUNDIDufJQNwoiOuU4pzdGC74RMynTjPGlgjPZnAC5DOPJCJCRbHG
         ZO1aMB9QFbpZ1LGKWESfpSYjSF8rjWiYdYv2hFik85uh5OP8Ju/jO0kfxvhTFp8rBnqV
         jU212ScFHW89eGVDng/72Of6jfdLR5vW39aPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737810696; x=1738415496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9w/182ECZVPmRavMFGQ5pT+3mapjwFmkPCGbm41FWo=;
        b=gAvKBP1n5pe+EwrPXiZQTpt+ospzPi6134Rt2a7xW9HP6ILW1B+r3SUck66qrwU65Y
         62iLikbYht6I264gF4DwdRCgMGgkSJLrfVCY6Spn4yDqzfAxPsCivrDk02jw66MqIl1h
         XRcpoCse5m6C7DJ99VkM6gbdLuO3i7HL9WTLMp7QrnDPhz7lkaccXvzMIMnafCb92LSt
         Bu8HCq0yiT01RlEKuJ2Apl/bSbQas2XmrqPKrEJ/9qVtgVNXmwxuj7LVlua5kAxScw1o
         fN3+eUDY6osSVakX1PURm1qhmS6KxJnou10dhkr0GAVmVNFBp8xh75N/isA25830aD2U
         HiXg==
X-Forwarded-Encrypted: i=1; AJvYcCVG4WWZWPYS6a4uNpA05vPqP1OMmDPwfczlNvOtYx/o0w5P8MLnBTI6gxDiHQ2/QQPeMAM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDP0cGsfXwXSFCggJaBlYP+SPhysGLjWGACWm/bVHQTR0eOTkL
	BvL0bxTLWU5ZVPGjd2F1bByk78Mwioz8qhhy9GGYlqafuNwUChzjwH4QVibJ8QPQ4zqOmLcCvlZ
	MWQ/dkKH28dmWw0RdA+wI0HaJxKhNYT13f1Z8hw==
X-Gm-Gg: ASbGncujQ5Mnyet96BJMa9/INWK8OEo/mfOCEW+MGyyKodh9pGLvU9iOwhoFO2k1DXt
	wC5NhGQXwvBaCYrF8zR90HbICnit87C/uwk8KG3moBWbwPdv+HDqH87GIajV/
X-Google-Smtp-Source: AGHT+IFVT+av7DVOjmbZvLFF9xaahV6NF4A2ll6W9sj4bZrkAo2BEsKYGC6Vyjk/Y1UoxEutVGm/TOioJhjYJCJ3h5c=
X-Received: by 2002:a05:690c:6612:b0:6ea:6644:ddf8 with SMTP id
 00721157ae682-6f75829ae26mr50723297b3.0.1737810696019; Sat, 25 Jan 2025
 05:11:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
 <e2de94ab-82ea-4d36-a9dc-75f6891d8927@kernel.org> <PAXPR04MB8459537D7D2A49221D0E890D88E32@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459537D7D2A49221D0E890D88E32@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 25 Jan 2025 14:11:25 +0100
X-Gm-Features: AWEUYZmjhh81tIBZTP5C0Ax6XsZDjPG7rmhj0pU30KKvTD1HwU7fFDBX6Eu8t4k
Message-ID: <CABGWkvoKV6dv1sHXJ1AZz7byp2ibh5uzLx9knF01HrcJLJyzCg@mail.gmail.com>
Subject: Re: [PATCH v9 00/23] Support spread spectrum clocking for i.MX8M PLLs
To: Peng Fan <peng.fan@nxp.com>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng and Abel,

On Sat, Jan 25, 2025 at 12:47=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: Re: [PATCH v9 00/23] Support spread spectrum clocking for
> > i.MX8M PLLs
> >
> > On 18/01/2025 13:39, Dario Binacchi wrote:
> > > The series adds support for spread spectrum clocking for
> > i.MX8M{M,N,P}
> > > PLLs (audio, video and DRAM). It has been tested for the video PLL on
> > > boards using i.MX8MN and i.MX8MP.
> > >
> > > Changes in v9:
> > > - Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
> > > - Fix building warning raised by the kernel test robot for patch
> > >   v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
> > > - Add patches for imx8m{m,p} platforms:
> > >   - 23/23 clk: imx8mm: support spread spectrum clock generation
> > >   - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
> > >   - 21/23 clk: imx8mp: support spread spectrum clock generation
> > >   - 20/23 clk: imx8mp: rename ccm_base to base
> > >   - 19/23 clk: imx: add support for i.MX8MP anatop clock driver
> > I responded in particular patch, but let's respond for formality to cov=
er
> > letter as well.
>
> Sorry to come into the binding part at so late stage. I just
> got a request for i.MX95 SCMI CLK a few days ago which is impossible
> for vendor specific properties.
>
> But I am not sure "assigned-clock-sscs" is welcomed by maintainers.
> Please also help to check whether this is usable for your patches
> to enable SSC for i.MX8M PLL.
>
> >
> > The bindings here might get obsolete already with work:
> > https://github.com/devicetree-org/dt-schema/pull/154
>
> Not intend to waste to your effort.
> I also replied in the PR to express my apologize.

Please let me know clearly how you intend to proceed with this
series in light of Peng's series and PR. My team and I, along
with my company, have been working on this series for three months
now. We do not intend to stop, but we are requesting feedback from
the maintainer on the quality of the work and guidance on how to
address the next steps.

Thanks and regards,
Dario

>
> Thanks,
> Peng.
>
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
