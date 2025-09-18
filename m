Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305CE2BEC2E
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758198643; cv=none; b=a7YkBciJQ+8umm0SHLzhspPt/hKaCztNFZYH2gamW4LlzBgryA0XiN/s9OTEBr1JAlbypdbIyfzhAgPWLBkkRofnfhld6iJXLgNCQrfttvhUL3Ksabs0nZzB6gQJ8rmap+t/qVt6FUSxsPBdG7KIwand/fMwSNrlmVh9UXA6jMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758198643; c=relaxed/simple;
	bh=hFnQmhtB5FdUouz9wOMjSFsEfEpZDGlWnR0IKMEjviw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKqE4+SDdft2ZzVcJMSte1ZVucHUIgxslfDi7305j6/55LB/c0xR7f/timS1TFS5FX/bIQbFm+NpoJFB2N49CoHVQma/q85ooupi8yKY8k3cIKIsco5xPhLxrSH2KuTE+3g8repAx61Mv6qy/P4SpLuS2mboqJmvVaOwyZ8ZCsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dc22leEN; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dc22leEN"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so909303b3a.0
        for <imx@lists.linux.dev>; Thu, 18 Sep 2025 05:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758198641; x=1758803441; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ja6LsTNawGy4pmDnATZPCfzTVrsSk5wN9q0e+DceoU8=;
        b=Dc22leENbf2BBD/RMevBz510/zu5gQxl/SIgq+4LxQOiH34Ccc9NN17EwLHRdNxaUr
         hw3cnPsR53Iv0WvCIDoQnZtoBHfSqZRhsfx15Gk0V8yNHrKlmNo5Si5ScMVu2LThrWnY
         fSUPrWF66Y1spmyyrTcBz3R1ELY9bWdU60oakhrlLuK8usSE5rx2d6xGK8is2rjEDwB3
         cEyOQoB7qb3CzyCfz/7mbYi+tq+jdl4n7Ejn7z0Ox0iDwUUFu64MFPVrZ8UeU4AQvCgv
         1p8EM+uZtk2LW/x2Ptbrg/R+L69DdNLXcRX60BG2m2sqTF9iBiJrgEFpOjINCkejDBHa
         fzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758198641; x=1758803441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ja6LsTNawGy4pmDnATZPCfzTVrsSk5wN9q0e+DceoU8=;
        b=iZh5XuCC4NZBQblHYTvMOyccbsSwlPiOXr3z5/hQKeyWpeeOT6BmHPkfxtZMR7742k
         KlF/iqcjzK3PY9tx1dMQMKMRnOdaIb9459jCDO0yM8iwhZDXWYXcGN39wdDvM/YvnUpX
         ei3aIeZWAdQA4idqvfbEPoLdlz6n5Rr6x/16IfngHm05MaGUwg9h6p2xf5PXbnZQV7VP
         MyDShfibQXLXCZcmY+eVE4K7WlNcqPbmBOE+LOJiiJ0P3CHfBHyijgIkKMCoE0qX1VgG
         fd4FUEBljUZDmIUksjDq5uQwsbihiAv7Het2aUin5ksNvZaOoIvf6bQEAUN/KsxzpcDN
         GBlA==
X-Forwarded-Encrypted: i=1; AJvYcCW2o5boEahJnGu+b5zKuYr0U1pJ221dLGSycHtPP6QKOhWukGVZkp36jUHDaGXv2VkFRog=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNZHEkeH36fI+aI8MY+REbvBPpVqe8cx3dyRW2FhWCHAz9IgcO
	XWjMilS027RxRlh+l9oxn/XQjW+akNU772GWJMARIRTe5dJGRrJ7vDVA6A1uuIHTzGTvr+ISiW8
	vUrFKMXGeIG1pTuyqhV+0Ms+an+JORpg=
X-Gm-Gg: ASbGnctLVgsklDpcHCN73f5tMKZ22tMTl6465Pmi8RYEhE5Huygvdw8uI+qCYYVLNfy
	2lNJl0X33IkwwH0VbZ/kq2BlCdfjFxUdua14xi3pmPdLPF71KWuWcLvdxqCwEql9VbyxBcxNAYJ
	O5R7aiDTmM/qGnnYYQseR2MxXj/7HH/Fr3D5eLS3dg8npV+kjvtPNxwg4bcf/0iR0kHrqfhhnsQ
	nUMgZ0GcmMqflc03EtBX4oKVLSiHv0HQdq4nMzbMYjUvaXdngLZfBajsAM30WZZ7g==
X-Google-Smtp-Source: AGHT+IHfxVH6u3MLt6Uuih0vzSbpLygF4jPPQ9s8yqLw/oxh8/QW2NTZ+3Q+TitB6KAglFx0XO0/v8MormCOdtkYPDY=
X-Received: by 2002:a17:902:d4c1:b0:266:702a:616b with SMTP id
 d9443c01a7336-2681228a5cbmr84479475ad.18.1758198641200; Thu, 18 Sep 2025
 05:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com> <20250918-imx_rproc_c2-v1-1-deec8183185f@nxp.com>
In-Reply-To: <20250918-imx_rproc_c2-v1-1-deec8183185f@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Sep 2025 15:32:58 +0300
X-Gm-Features: AS18NWDb4GfzMHKRtymYoCSSIMdUKa-LQpWcaz1XI-CRyqhVc2xtdOdWO6gJCWo
Message-ID: <CAEnQRZB2ZkcRirj1SZkfbsPHyyGr5PfnCDfv+ZuMu_Mj6XKBEQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] remoteproc: imx_rproc: Simplify clock enable logic
 using dcfg flags
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 2:51=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> Simplify the clock enable logic by removing the dedicated
> imx_rproc_clk_enable() function and integrate the clock handling directly
> into the probe function to simplify the code.
>
> Add a new IMX_RPROC_NEED_CLKS flag in dcfg to indicate whether clock
> management is required for a given SoC. Update probe logic to conditional=
ly
> enable clocks based on the new flag.
>

<snip>

> -               return dev_err_probe(dev, ret, "failed to enable clks\n")=
;
> +       /* Remote core is under control of Linux or clock is not managed =
by firmware */

I see that you negate the comment from imx_rproc_clk_enable but with
the negation
OR becomes AND.

So, the comment should be:

/* Handle clocks when remote core is under control of Linux AND the
clocks are not managed by remote side  FW */

Also, do we really need this flag?
Shouldn't we just make a decision based on the fact that clk is in the
device tree or not?

> +       if (dcfg->flags & IMX_RPROC_NEED_CLKS) {
> +               priv->clk =3D devm_clk_get_enabled(dev, NULL);
> +               if (IS_ERR(priv->clk))
> +                       return dev_err_probe(dev, PTR_ERR(priv->clk), "Fa=
iled to enable clock\n");
