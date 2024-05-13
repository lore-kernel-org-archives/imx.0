Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CC21487E1
	for <imx@lists.linux.dev>; Mon, 13 May 2024 12:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715604048; cv=none; b=jLQcDOHHSqaqGv3tIEQxn8xav+TYfdM2wpRFKERdSxA5WGgUB1Q2JhWJ39YqzJoIn1fVQmzJy97+GkJRyu8gnaN0TlNWe+bKcV24Ose2XakmF6tmV3CNBjRvNsQICWQHrDgwjpMqSbdsqf+uRg1SCIkZ9ToxDeTUga8EosPwJuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715604048; c=relaxed/simple;
	bh=w2F7IUkcAC7aB3Nq4XW5MR7FrwSIJSgwqZe0Qj/b/z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=stBSLG7SDZp0pE6PLIzCRPlu/CfogwY+5gldQv1Ami/J+Stdwbkza3MdG/kMQelXeHiOyWR0NDslfInqOaSF5/o+cE21DzCLuIPKMLPY2E5/FiNE2ukGkkvapHLCHMsIax+hAcmPXhneVeFDDbUE/42txBXzuf/8/g5+V4989K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLeHs0nI; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLeHs0nI"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2b338460546so2998887a91.1
        for <imx@lists.linux.dev>; Mon, 13 May 2024 05:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715604046; x=1716208846; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5k8gT3oHNPh1LBJEkswvOb6QJDXdUG4eOyHdkELqHRI=;
        b=aLeHs0nIbk43w5fmtjPOh3TK48l95rRglyi3jOf3T3GnC7EoOy9VB4bZ1sKRCUZa5t
         VC9sAAIte2q4ylN+EJaWwyupx9jX/u1KxUf1dAbHVd+p48BnS1IVj4M8H4zLo5R0GLWi
         uw7r5SCEFwuQ5gs0szCt+LlyVyJjlD9fFv6bguD8mw+JNYRtfxoqJx2vRlkp/CQaGw7f
         0dhFMn9LkWBansK6gN2ZgshXddP8llPf/RCoTjyE8OwX8mmah6uPIaEQ7r2krPsnKcd8
         RMV1jIMfuU0I4DLueaDo9GO5oukXlyHToPY62OiQaV70iP3IRgfBZWCBUsrnIo2+2wxc
         O3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715604046; x=1716208846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5k8gT3oHNPh1LBJEkswvOb6QJDXdUG4eOyHdkELqHRI=;
        b=mNi/i3nu/nqML6DV3yFahxtgJoCqpHK+l2v1e/l4QMxpIWeo69SSBe4NeR46sH3f+2
         0uCpdFB4yT3Kz2uHkm2mCTgKcdPy7AyXNHGdLqlTUfQSkQtZFhKeHrxmhWJk6DR6U8rx
         YOBdNe5OyVfkG38B/PKEc3GWuYmMD2Bd5JwNn5redR67gHs/TiWrRSSiSDziknHk5lJ+
         rbw3HRflAdMbKKKgaN+S+qSjgnUAPP+p1DUGuKGrU0ZDnr8hdTojSoqmWavSJ6q46kdp
         5l6yKO6nxU4VTaMYFtI45EsaoJ8VLJxfP/F7dM3DarEDKHiOyWDQE7+/D0/Wtt0eJzRt
         3stg==
X-Forwarded-Encrypted: i=1; AJvYcCWXllpZnbeul4siGt8VyvWsiKynhqwGL4RMW6/zoh7xs/blcC83OC5O/iZK0jK21hC3f3/MlcuvH8m1FnjtMg7JWVoa
X-Gm-Message-State: AOJu0Yz8M0uChcZb+Z3K9jftLnIPbLzUTk0vIo2rgx/fDCS+UzfJEfiU
	jGPoHTwmCGqSFtFNtnfVf241/ZT7ybGf88TM3DnsEBaiCw+JTZVXtsOu28XMyWd1KcjbmpaKJH9
	/NneNe41F/UaK6gWSjM4JPH5TWHw=
X-Google-Smtp-Source: AGHT+IFKvFGDNjWqsC37PG60kuZj37qvqWxTZdYiwXWhMF84+yxKE6jRgoEVdJx7ZcsxrhynwdD5U2PpnyKfQpChwU8=
X-Received: by 2002:a17:90b:1086:b0:2b2:7055:5a8b with SMTP id
 98e67ed59e1d1-2b6cc757f22mr450787a91.21.1715604045679; Mon, 13 May 2024
 05:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240510-imx-clk-v2-0-c998f315d29c@nxp.com> <20240510-imx-clk-v2-5-c998f315d29c@nxp.com>
In-Reply-To: <20240510-imx-clk-v2-5-c998f315d29c@nxp.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 13 May 2024 07:40:34 -0500
Message-ID: <CAHCN7xKXjuEBb1wTm0-r-j4iCnSYuq_f-AtPpOZG-h7DtSo4aQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/17] clk: imx: pll14xx: Add constraint for fvco frequency
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 4:14=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> The fvco frequency range is between 1600MHz and 3200MHz, without
> this constraint the fvco may out of range, the real output
> frequency is no accurate.
>
> Aslo correct the name for fvco and fout clock.
>
> Fixes: b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic rates")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Acked-by: Jacky Bai <ping.bai@nxp.com>
> Tested-by: Chancel Liu <chancel.liu@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/imx/clk-pll14xx.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.=
c
> index d63564dbb12c..55812bfb9ec2 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -131,7 +131,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll1=
4xx *pll, unsigned long rat
>  {
>         u32 pll_div_ctl0, pll_div_ctl1;
>         int mdiv, pdiv, sdiv, kdiv;
> -       long fout, rate_min, rate_max, dist, best =3D LONG_MAX;
> +       long fvco, fout, rate_min, rate_max, dist, best =3D LONG_MAX;
>         const struct imx_pll14xx_rate_table *tt;
>
>         /*
> @@ -144,6 +144,8 @@ static void imx_pll14xx_calc_settings(struct clk_pll1=
4xx *pll, unsigned long rat
>          *
>          * fvco =3D (m * 65536 + k) * prate / (p * 65536)
>          * fout =3D (m * 65536 + k) * prate / (p * 65536) / (1 << sdiv)
> +        *
> +        * e) 1600MHz <=3D fvco <=3D 3200MHz
>          */
>
>         /* First try if we can get the desired rate from one of the stati=
c entries */
> @@ -193,6 +195,10 @@ static void imx_pll14xx_calc_settings(struct clk_pll=
14xx *pll, unsigned long rat
>                         kdiv =3D pll1443x_calc_kdiv(mdiv, pdiv, sdiv, rat=
e, prate);
>                         fout =3D pll14xx_calc_rate(pll, mdiv, pdiv, sdiv,=
 kdiv, prate);
>
> +                       fvco =3D fout << sdiv;

The calculation of fvco here does not match the comment above where
fvco =3D (m * 65536 + k) * prate / (p * 65536)


> +
> +                       if (fvco < 1600000000 || fvco > 3200000000)
> +                               continue;
>                         /* best match */
>                         dist =3D abs((long)rate - (long)fout);
>                         if (dist < best) {
>
> --
> 2.37.1
>
>
