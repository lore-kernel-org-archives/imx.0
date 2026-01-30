Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E71219E819
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 18:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769796069; cv=pass; b=DAwr29DWIIULtJnnzECzK8gto23LmT/FRiJrttqrf8Xd5pAg5D5KYEc6JKiFiacoP3ZJjquUHLDfULNkE1gsNpOMqAHvZZolNaI3Qo2siT4rgtdTV6vXpst1k2qZIjWSstheIbdVtLcodOYOCv94Gn7Q94jnu3GmUiG6jXzzmtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769796069; c=relaxed/simple;
	bh=sZBs6sKL1pODHnxTgxYuaLKrqindO+otYGGQxY797Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PKL40rZMRmr3ZMzDRjf9rEks6xzmnAIIWSFmsKxNY4Wkq0vA+bthI5nr9B/+z4xB9I4iZ4U/eBKNhjoweYvopqIElNub+ZJpnoSs9I4+2BxX+diQUmlyB+SwrxYY26ysMFWkjlHlnVGDi9+gbEl70DrRH7xYhEHX7kw4ZsNmFp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8tzpVea; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8tzpVea"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a2ea96930cso17722405ad.2
        for <imx@lists.linux.dev>; Fri, 30 Jan 2026 10:01:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769796067; cv=none;
        d=google.com; s=arc-20240605;
        b=K9shEo+2Co8cp1xM0FsDzPYDZYugP8ITrVA5KksBF+e2aasMiXxqs4kpYGzzCinGTk
         u3au9qW1nQkNkgYnzbkxo/7VttlTbuo5MuvfVgJRBQ+RU9JQ8+Rh+W0VSn8534kRgvLz
         gPRko+q2uQWWOO+AP2I/VWsw4XFBPnXghEgFcroBkXxp7jkEn5Uj4ui9NYOpirf4ZX/p
         8KONJ5INjD/GZ5y/4udQmtF8R6uvCfJTiHPag2ld8YFzYEIsyF+I9WGrxzqWgHpMUhJ8
         mrWc2p495nJxSsxEYQLrzDyWO51KBqSfOSVhy8V/sHicFPjzOU04PRYJDJtno3aY/R5J
         N88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zRzLxy/Thum6f98qlHk0+tRPBb+9BLG/RuelqcCBlLY=;
        fh=PArTgJpFUHbo6MB2aYtPgcQy+YjLCo5LJOvcU29eiaA=;
        b=LJW+2Z54kYQZMUNlMlAnapd/5LfIILX9QFZRx1MkoOisL2gexMX2oN2s+a+Y//7HnN
         TyTwB3mvt2VyRirIHQIc4DvUkQ+mjxB47cmDIpywb8+rth7jibrNdF/5vIpC6P1ba3GQ
         RA+mznvugM4zyI5LFjvrAeoMzvpbMlVu7kjMZdFRWe/uQDzjc6Zvh7GrjLSnfN/TgCta
         j0grcE+4vwpGKyhkp0Z0WLKf8Mnq4pDGnbtMO3SrT86IZV8HVjpsiq5dST6Nbvw0e28f
         ALiWWlR1MAgbf0vFWGBZmRBEGEONF/D/c76tnNyyCXFsnQ0ZtGs32b+A/EGwJAcPpqUj
         HecQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769796067; x=1770400867; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRzLxy/Thum6f98qlHk0+tRPBb+9BLG/RuelqcCBlLY=;
        b=J8tzpVeaDaCRHlD8StQkmee04JhYPoUrbEa6Tq5ekFvDf/EWa0aVS+5OHyx3wctJCm
         wqhKQsKiZwrc2aq67caTNEgD/a12GlpkOunXa4MInnYAtkVNAvrQZnEv04fvk0j9COF8
         0xFb4yyOke5c3UqeXRPnbjHzmhLrJJWOb7VMA0blwP91HuupWY7DldG0eANxtc1lViXW
         JIca24CSV9XMArz7K0Lw7JX7B7frBhBauIYUuDc8TicwXp2Xn3lrqPaR/5V48/+Ibbas
         35umpX9O48XrJAJ5QqzOLO7zcN8lztKdCsCBUjVme/M6rVkebPEsyklKH6Po8dRisquZ
         qmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769796067; x=1770400867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zRzLxy/Thum6f98qlHk0+tRPBb+9BLG/RuelqcCBlLY=;
        b=f6BqhcLwgEwlBspPeAaD6xqn4hvlkhjGY6N4DvNiuzQqo2NZMiMoZB4r32AOXX60bj
         so104pJ9d4EkuPkVQoDhG1wiexV+e4eHHNl9ZUJ7BgaD6VauW44Y7xuTRYbM6EYCnWmx
         VZzyjhYrHaKgMy76OGYBlWjoD4djsrehyhTFkc3bWHxr7/HvKlbIsPz3ZcECz2CO9Ixb
         GfsSNIEMOmVjaxzgF6nHxEY+Koxm2dBYVPfKT4djM4XGU967jGvWvyEbf53gqROcBm0O
         yzJs4JVdW99VAZ8WDIqFdxCuuF3Yll3sAbBOHrg3S+YBKtJBlrNMSmrmGTFPXYEkssJJ
         w8tA==
X-Forwarded-Encrypted: i=1; AJvYcCUQab6OsWUsyDdSRMd9UfV1tbfdEjFfNH/ZhnYLLOaLPwCsBSxn0t8El0D4Zy+uYm5Hl28=@lists.linux.dev
X-Gm-Message-State: AOJu0YzizA7Kg7YYQDaRv/Yg7/j7PIKD6p5RIDITNdhDxy4DrZouKezd
	YC0z/xc3RqHObWOs9mHB20Bn7XLkx5lIu7BYKJam3jO7MRhYlCq5X+HzV9j2DA4l2qZcmNx714o
	glEN3TSzG289FaGGQ6Bqawnvc6C9qYaU=
X-Gm-Gg: AZuq6aI+Kjjg+QsunoDerZPxAL0rL0BJHI1msK2iASySXOzCHTnnfXnTsL/TMJX+HbY
	Yt00GwVHjgdof/fITYeMAtQ2C6zOa+ybO9RkF6ez/hrFHUJJqRBQJ0+CWKh+yobDRzwT6M0BGAt
	p5QjhYLQua+Gj1O3W2xeWOHd03EhSz0OIbOHerO/efu1HhnaNZAzGKm4dASSDXFgX61SMFQ8/Od
	NUKyyZPeINHpyhcahv7kPyPLrYRFw0HjS2h/GYBbe5LZOGpAHu7Ux+Ej1V/Z0UdI//4ipH1oqaU
	eB0=
X-Received: by 2002:a17:902:e810:b0:2a8:7814:47cc with SMTP id
 d9443c01a7336-2a8d96a2ba4mr35674015ad.16.1769796067106; Fri, 30 Jan 2026
 10:01:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130-clk-imx6q-v1-1-2fa4da5dab85@gmail.com> <aXzsRreLzaCB6cVd@lizhi-Precision-Tower-5810>
In-Reply-To: <aXzsRreLzaCB6cVd@lizhi-Precision-Tower-5810>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 31 Jan 2026 02:00:54 +0800
X-Gm-Features: AZwV_QiFOzZg6P87AjjQNpa0BC_INIoNGOBqDMXaJiczCeTxYqTXqtMAmTPol2g
Message-ID: <CAN4SLj3-0NH232gauZs1+HpL2A0oE-QTh8L8BYgjKAwNVFYi0w@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 1:37=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Jan 30, 2026 at 11:56:28PM +0800, Felix Gu wrote:
> > The function pll6_bypassed() calls of_parse_phandle_with_args()
> > but never calls of_node_put() to release the reference, causing
> > a memory leak.
> >
> > Fix this by adding proper cleanup calls on all exit paths.
> >
> > Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> >  drivers/clk/imx/clk-imx6q.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> > index bf4c1d9c9928..1d8e8f0891a3 100644
> > --- a/drivers/clk/imx/clk-imx6q.c
> > +++ b/drivers/clk/imx/clk-imx6q.c
> > @@ -238,8 +238,11 @@ static bool pll6_bypassed(struct device_node *node=
)
> >                       return false;
> >
> >               if (clkspec.np =3D=3D node &&
> > -                 clkspec.args[0] =3D=3D IMX6QDL_PLL6_BYPASS)
> > +                 clkspec.args[0] =3D=3D IMX6QDL_PLL6_BYPASS) {
> > +                     of_node_put(clkspec.np);
> >                       break;
> > +             }
> > +             of_node_put(clkspec.np);
>
>
> I think you put of_node_put() before if branch
I didn't put of_node_put() before if branch is clksepc.np is used in
the if branch.
It maybe not good to use it after calling of_node_put().
>
> rc =3D of_parse_phandle_with_args()
> if (rc < 0)
>         ...
> of_node_put(clkspec.np);
>
>
> There are more places call of_parse_phandle_with_args() without of_node_p=
ut().
Thanks, I missed that, I will fix it in V2.

Best regards,
Felix Gu
>
>
> >       }
> >
> >       /* PLL6 bypass is not part of the assigned clock list */
> > @@ -249,6 +252,7 @@ static bool pll6_bypassed(struct device_node *node)
> >       ret =3D of_parse_phandle_with_args(node, "assigned-clock-parents"=
,
> >                                        "#clock-cells", index, &clkspec)=
;
> >
>
> this one miss check ret;
>
> Frank
> > +     of_node_put(clkspec.np);
> >       if (clkspec.args[0] !=3D IMX6QDL_CLK_PLL6)
> >               return true;
> >
> >
> > ---
> > base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
> > change-id: 20260130-clk-imx6q-9c4b8835fc26
> >
> > Best regards,
> > --
> > Felix Gu <ustc.gu@gmail.com>
> >
