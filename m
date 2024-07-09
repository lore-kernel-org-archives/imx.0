Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A62B12CDB6
	for <imx@lists.linux.dev>; Tue,  9 Jul 2024 03:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720495270; cv=none; b=gxHYvJppJUVT/Xm854P05Nis+6DRF8UIJ+fwoy6g9rE4pZQGBYEorW2+3PjD1UNUnuqAWdAV2cOi3Qq6GOSp232MCcg4s0KkP0g076lgXrl3iOUxgtTAZkKoVBJgBGUQPMeFzoqmMvGyQ55jnrF3CoyHZk/37rvNrI9lcQJSsYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720495270; c=relaxed/simple;
	bh=ao0yuvoGESK5ztONeHNNgZ2DK/RhVIQhcs2Jo2M4dqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SuozC8WikE3NQIMum0+S5xfaJM6HFs0+yp0NQFrmqFypyfkPRP7pI8hvAJ13Evu6aajFekUO8CPRM+b6fwdgqNhmWKGUAM4d+1Gl4yTiFbfm4+/UCDVOim5bW/y5SNiBfZg8j2HIgs7zzCFq8a8I534HAmyDiWa67tkuotI2xO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEExKQ8y; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEExKQ8y"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3811d62a668so17523485ab.3
        for <imx@lists.linux.dev>; Mon, 08 Jul 2024 20:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720495268; x=1721100068; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5x3hUylQoog2uNJJGGlDPCeKvEn4xMplYTvm1tLAKE=;
        b=ZEExKQ8y2aSeIDeNN8pniDpGe74mFT3W5e5vna9BeLYgnamoF5wW/BXLCCTPohx2pE
         3qdYmKBfu6+fpdPiCuOv+5LmIE1HSzwkC2wGJQkUy1+Amnff2X2fmTXZDDIo5BRLpatk
         2RZrYci5A6kjo1TFu/GbhjVjAUPwc867ZWIS0TqMIfqcZddiaEmrL9GjuBQq6BONBk+3
         6MdXR0RXdqWD11xcL1he8xPstAuBhiVIXyDGlIUlWN7oDKTILEAlpcpst1Z9MrKoOB6h
         HylInuYEVNaSin4Rx9Ed9wZ18Y6umjuu2gTyXNU7vap3R7bIhMByZi31D/A7hjL3HvHH
         OrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720495268; x=1721100068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5x3hUylQoog2uNJJGGlDPCeKvEn4xMplYTvm1tLAKE=;
        b=hWd9uyyRw2GGYqkYATcoyyUL3KMbYTn6Ma4cbNBh5IMDFMkhclb7A+e5Rvkh2+YfQo
         PvxMuESatFhsOEyTtHGf/bsUFFwLUHkZsmCRyIA/t4bghutjn/MUY+z2zbCRJRJdfbym
         8cMa+mWCn9RaYC/R0RrO5TVelNxepvvrAfz0ujEm5XhGsNm2huxsOxuGdOxGMMCYqgG2
         MsAnpkjVwomddONFRvXZWBfUQu++MTD1Yrb6va+KbJjKLAYryVYcP6RbOjdLY49UGluk
         Hp6JLqBYbptdn9tbx850TtYgxOH8eOpwn8ONi1vvfk1c00rtxVKHMGYE4A5QrBQhBFTp
         V6Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUxjtbFdCNJp66gzhJeakoOLeVKCMIzBvfX5zHSlo2w5tiXBm799s/c8unBZ2mpe8IYGORp/GSeidVH0dBZSoBxzp84
X-Gm-Message-State: AOJu0YxtjFgDlPwjETOrAIL2Rt1UeXP2mNnK37MTzkgzJJCF8FD8WdOq
	dxw+HiCGaGfROY9+dobbtju0mtIR9DeRGF3Yy41ucYxIsuw49hQZgDkBpLPdAN6vL9SvNcPOl0p
	POW9z0OuOlZ+H9VDby2ZgpjAhslQ=
X-Google-Smtp-Source: AGHT+IEDeHIw0M3dms9M1TQ7pOStsM6niLKah4sS4MXdNOsgiHYC/fBdJqkh52w8HlhM4gaopahy21Ep/QLxviGgtOo=
X-Received: by 2002:a05:6e02:18cd:b0:379:4564:1228 with SMTP id
 e9e14a558f8ab-38a598b3998mr15380945ab.30.1720495267594; Mon, 08 Jul 2024
 20:21:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1719996771-11220-1-git-send-email-shengjiu.wang@nxp.com> <232c2342061b17b9f750c4ad52b0766e.sboyd@kernel.org>
In-Reply-To: <232c2342061b17b9f750c4ad52b0766e.sboyd@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 9 Jul 2024 11:20:56 +0800
Message-ID: <CAA+D8APumdP97QQHObF6NEw6jwDJRb+0R=aAjqftrX1wR170Yw@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: imx8: Add .name for "acm_aud_clk0_sel" and "acm_aud_clk1_sel"
To: Stephen Boyd <sboyd@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org, festevam@gmail.com, 
	imx@lists.linux.dev, kernel@pengutronix.de, mturquette@baylibre.com, 
	peng.fan@nxp.com, s.hauer@pengutronix.de, shawnguo@kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 6:45=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wrot=
e:
>
> Quoting Shengjiu Wang (2024-07-03 01:52:51)
> > "acm_aud_clk0_sel" and "acm_aud_clk1_sel" are registered by this ACM
> > driver, but they are the parent clocks for other clocks, in order to
> > use assigned-clock-parents in device tree, they need to have the
> > global name.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/clk/imx/clk-imx8-acm.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-=
acm.c
> > index 1bdb480cc96c..a1affcf6daff 100644
> > --- a/drivers/clk/imx/clk-imx8-acm.c
> > +++ b/drivers/clk/imx/clk-imx8-acm.c
> > @@ -114,8 +114,8 @@ static const struct clk_parent_data imx8qm_mclk_out=
_sels[] =3D {
> >  static const struct clk_parent_data imx8qm_mclk_sels[] =3D {
> >         { .fw_name =3D "aud_pll_div_clk0_lpcg_clk" },
> >         { .fw_name =3D "aud_pll_div_clk1_lpcg_clk" },
> > -       { .fw_name =3D "acm_aud_clk0_sel" },
> > -       { .fw_name =3D "acm_aud_clk1_sel" },
> > +       { .fw_name =3D "acm_aud_clk0_sel", .name =3D "acm_aud_clk0_sel"=
 },
> > +       { .fw_name =3D "acm_aud_clk1_sel", .name =3D "acm_aud_clk1_sel"=
 },
>
> This doesn't make any sense. Why are we adding fallback names?  Is
> "acm_aud_clk0_sel" not part of the DT binding for this clk controller?

It is not part of DT binding for this clk controller.  it is registered by =
this
clk controller itself.  As it is a parent clock, so my understanding
is that we need to add a fallback name,  or change "fw_name" to "name",
please correct me if I am wrong.

Best regards
Shengjiu Wang
