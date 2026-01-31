Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39CC366042
	for <imx@lists.linux.dev>; Sat, 31 Jan 2026 18:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769882487; cv=pass; b=Vcp6PzlSHQGHY80Vqy6q29QGahun/uzA+ymKrjtBp2NJ3JKRVHgXmfxpQzd+rohFiVwFPVU2MeWKgthX0MMMPcep4Ak59m5e2PSf2x+db9DFsIDlUOJzi6hIMnxXlIFmV/NbLi8WAWy1xm4vDABlBwtnQRvIHDt2I/xxao89oNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769882487; c=relaxed/simple;
	bh=nyp82ApQeh091VtiCt4DbocbdHYePxEla0FvQh0eQCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tfUbV85xsNvKc8J2NFopfBN7RqJmn7lQvqYfq2r+UPwge5EtFsCIq9o31d/aBjlROjnidcYFaqCFOTiaIPLbylh2DyUmq9J2m1KaLgSqh6OvVo7ndkrvapMHMY15+dUzzvfYw3FHlX784PvUsFvwwAX7DJHbk0moWlnU6MqliHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wccu8nF0; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wccu8nF0"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c2af7d09533so2030967a12.1
        for <imx@lists.linux.dev>; Sat, 31 Jan 2026 10:01:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769882483; cv=none;
        d=google.com; s=arc-20240605;
        b=QduXlVpialSwtUGbaF4El1UCFGet3KeVBfgty8GJrv/45crOVMQIGausfZSarJezfZ
         LPOO+V1O1jkOYyFAhN//6UGHhOYwKIZWRgbarKgpRHf4QJ3qmyudlumLLZg/NNqcZ7Hp
         x556g566cJjeDB/69X+dypbW0MJDPhJybYhC+ziAEC0QWQ4CqE2nPHEfxaXsFGB2+I87
         9Bvzb+CmgNBAScmhYWPKWlQajSfypNzVsHlz+DDCPXCGDA8II4hEHcDYP6PR35SUIkIo
         3qVoPZi6+8NaTkwQgH2gQI9EeM1FuCFJjrIFUy9b8ooavE7HY3KmmSzPfq8xKxMGDMzG
         0THw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pCrEKDN74Yg1HcvVzMQvEOY6ZE2OP4wRbYz5bxWYTv4=;
        fh=B/jHA8YFqscQBggtfbqVB4yI9PXKtQSRNqUQbdhK84Y=;
        b=S+ujDnDDtN5nrNiQ5ognNm5lvOnTNnf4Jmp8605QHcUO5T3BUfNbyWSOnQgk7Jl9Eb
         TSm+nweXc45ry7CgNPJFgvxCQbQ1iyFBuptn46vWmx81CbbWBDatbU2qg68Z3dc1YqdA
         Ha9sSRJGY3fKDUy4cxvvqz+GVTR5eFsq7eiVFrRs0oVAyR9DY4dud4e5MKA554XF3e6U
         sNULk3QEO2OYc6DxgNt1180V2qMWCA+3eXON1HCxxqiiX83j8djmRMLSPZauZ2R1VVUP
         cCCJKcKdGbzaslW7IyR6hTfR35mt9e1/RCo37j0IFmTaq/NyesAwSIRlXyXjFGb5DyGW
         O28A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769882483; x=1770487283; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCrEKDN74Yg1HcvVzMQvEOY6ZE2OP4wRbYz5bxWYTv4=;
        b=Wccu8nF0mlbdBES1RdFNviT4+OQMr+oxT0/ZMGSugxUZ0tyJRdjGNkHMNVbpzfIPEX
         1u5QTgO+6S7wgU6tRSqKu1GfFmvwBC/gcPHUPrAm26zAhe7modeF6obREcYWn8AdvoD2
         xONt/CewV7nIaNLHBQDp/EKrUZB65kUSciz680lan1vFZTiJkQJR/j+D2Hh+1Cr5zO7Y
         n84lzqCvGEj8jRUdWyOL4wmeuz6l1CRSpO23pAF+vmkwN34cMgc7Q7PCWKD8JFwljesz
         ZV3409EqfXffPWl4VnajjlaWn1po9jBeew8l19cBhcDqIOamTct3F/VojCl7T8Mm++Wa
         66sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769882483; x=1770487283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pCrEKDN74Yg1HcvVzMQvEOY6ZE2OP4wRbYz5bxWYTv4=;
        b=G6w8+RiBHU1DQ5PmS4ya/46z6HuRy8OTakbWb/JfY7MOu/k4Si/NppUy5SGHi/W3VG
         5mIxTj4zCX3hWEVdRjXeLXZC1xj69A7mN5en6IWPOzFqJn8p8c3Wlne5FxRHCHg9/kZG
         HmLdyMQxoZtyDAEqEhIiVmyR21qhfQnfTIjgtsPfqh6fapH58vYLVKc1QXhkw+oE1fY1
         VAUln7yvoQzgs5Xid9Jwmkvrl8g/QF2JnGbKCQNH3yDqDhWqfi4A6xP1WItOT8DmNm1V
         9JlspvmkxNOdjqWD8jiOwtcb40vsd24AFx0WCwaIoFgYWWQ+B6Ckx3XlucLE+zZ0MfYF
         xbJw==
X-Forwarded-Encrypted: i=1; AJvYcCVRAdgzq4W5cmzOehy9o8Kb6QXzMTF9Bgs5A44p5UiraG7RdjdAs3LQXpacSmykBuNPQAA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJAwcb61Jy96kkZd88y7+NrxU+y/aMN3z/FJ7Tgcej2wvxW7RL
	6m+YaX0gPGl+YG4POEHLfepioBZtkumClW8qjiuo56rVVcEO4Yr8CNOFnjDM9CJtd/mfvFXfUNm
	xx9jPHMpBwkC7+dxIOvCXg8tCzy5Saeo=
X-Gm-Gg: AZuq6aKNNYS6m4yoNkCqAc1oX8CLELpMObWbL+EQzUVoRR8CVMrT5wbmhHYkiyJHFTS
	cuVKJhDvoCPZpMhuXqwG3DNjhFsKJbtK6ACinyPzY++NNsCuorzg0mg5ExdtWYXs4J1dGiaCcuV
	lS7MiQy6MKu9+uG8IF8yaM81NTOi9PhkH/yVTcF4R7RhoNVNnuRHWBCzJtRLTpE7kFtoXBYoNH6
	9bDvAmcyrNTDYcwHkJQ1qPYTRUe7t6US0YWyUxH0kO5+WvmkmPIT6BNkS2mG1HCi5TO
X-Received: by 2002:a05:6a20:728a:b0:35d:d477:a7fa with SMTP id
 adf61e73a8af0-392e0052a6bmr6468927637.23.1769882483020; Sat, 31 Jan 2026
 10:01:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
 <20260131-clk-imx6q-v2-1-70471ddc99e0@gmail.com> <aX4q+W3Sjx5SRHrC@lizhi-Precision-Tower-5810>
In-Reply-To: <aX4q+W3Sjx5SRHrC@lizhi-Precision-Tower-5810>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 1 Feb 2026 02:01:11 +0800
X-Gm-Features: AZwV_QhLWLb-FDStR9zG6fjnRX1upvQjUilJNBF9vy-1P4S-LT2FD_90PT_gXlw
Message-ID: <CAN4SLj0D2PV9vFW4=dAF3ypAtA8JvhJpEut8Aumsx4JaMSEsiw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Akshay Bhat <akshay.bhat@timesys.com>, 
	Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 1, 2026 at 12:17=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Sat, Jan 31, 2026 at 04:11:34PM +0800, Felix Gu wrote:
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
> If ret is err, clkspec will not touched. So clkspec.np keep old value,
> of_node_put(clkspec.np) will put twice for previous np.
>
> So need add if (ret) check here. Or use difference variable clkspec with
> init 0.
Thanks, I will fix it in v3.

>
> Frank
>
> > +     of_node_put(clkspec.np);
> >       if (clkspec.args[0] !=3D IMX6QDL_CLK_PLL6)
> >               return true;
> >
> >
> > --
> > 2.43.0
> >

Best regards,
Felix Gu
