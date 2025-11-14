Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E426E6E6
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763113570; cv=none; b=g6HfgXuLUjRXQ2mCTipEa+ioHum3IVRFt9kJfcQaZraQqVYWncwYz/ApqRlDdtuPkQk+nFz7FyaZW8bDTWAkZCNwB1HhvQwM8Ddl3smArXzq8C78Wph01kKfVWEwH5RbH/5PzkJyZpI/Fx94D/ZV85B2mdHc+W7m/UEyxVFYnrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763113570; c=relaxed/simple;
	bh=ajCREfT/hcJRDBbyJOi3jQMEdUT2txP4PezLHt7RVuM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qK/W3qUyRuLb/RsCyFN3mtdLCkjWbC8e8HZ4FI5W/73HmtwGoISsELOXH2uYOua5jsqDteXWI05dm62mfsHqQ0h5VQ53wqjZF+NQqZ/xfkLEXv8fCm1apWCSSOHquKAMRF9KoxjNtBmIezVJPM0lCqvLtMmVrEYn82N2OcKnHNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Foti5xnp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Foti5xnp"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477770019e4so20808875e9.3
        for <imx@lists.linux.dev>; Fri, 14 Nov 2025 01:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763113566; x=1763718366; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5bwqEJshLQG2pK67j+3WEK74xje3ZFwPQhZbDPgILsA=;
        b=Foti5xnpc+p64/chcrG6XUu4CLOyo33u1vPGQlTlDuj/WD2P1Jxu2CFNPk+8m/WVgt
         d4RhfoR9ixGmyeDRVV4ZXkyoNjKlOyABuZsy75dDzdb6RwulpZeCKAZttVlGnHkxSgHS
         MCAZ5hDlJoM0s9u6dFVFNk5G8SOCn0BL6NXtQkjnvv0jt5N8qqn4PVzvPcugs8Arua38
         58iT1jEbOMmiPdwRewQgBqXjwfaz3v25d1UOLUJW3WoQzTa1E20sRlNCpsLdooGIvkyg
         SkB2s4ZamB6qhAJY06BILZ8XrzHurpeQTD0U+Tx+UwMyB6c69PaW5MvcGM1FN/yFkCM1
         unxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763113566; x=1763718366;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5bwqEJshLQG2pK67j+3WEK74xje3ZFwPQhZbDPgILsA=;
        b=iVEqyWk/c3Fopt2fXE4r47X0aFRiAA5M+iTjbJSAyg+679EpJUrlAZDDWoxm85ZwnR
         Ngvf49MZl3oq7iWTTVE6Tl/SYIzx+wi5Q/6GTdK4GM+nD8rUsPfpx8VxtXMvrIFMgSWC
         Jsis198Eg2CML0yMZqMDM6U40Aqk311WcYKj769a6TuTmgSaqG7UbGCrvZlNURTa6Hoo
         UEH7Bi481s3rn+TjAG0YBrpNVVBBUMJHGUt9EdRHmADJG/ZMM5mx1fUmwOrZ3Z/N95XC
         QxZCMyuJ0g9EvNyUtw4ZmZndYTGmNWDvdRu8IAUBJ+Eg1h82rO8NFX8FnCWtVXpXZr/i
         nZ0w==
X-Forwarded-Encrypted: i=1; AJvYcCWs1JNKUUdCSCpMcmG7v8hY6fVAuslxeOAoXMwIh4GBgdsJo9vNaouXfa4fXvONjl8mlMc=@lists.linux.dev
X-Gm-Message-State: AOJu0YynB23UYc6MBDnrfmBILto3STY2vRz6lXqTtEn/l1N9ABWakpih
	E+MwQ4ebwkdAiqZMDZwEhv2LHUveBfrgC9i5WmvD2QtMktJG0FZbOzvN
X-Gm-Gg: ASbGncuMEnnTwxsAYEtUcGZqrkqkkJRBq2ss2jBhKmXMW/tfsJEpfjMj9IeRvfgncYB
	9gUGvjvxpihSXUm3v8Xgu4OLveP/dcPKg2S2wMhY3Csr9RNJ5jduCH5I6c0pJNf20u2triPSX3g
	FtCQtIT4FZbbclyk0hngd5RsPCilaeQKhzGizWT9sLVjUFJMucL1dWtunM4bcEUY4QzYMHp+lzm
	7mKjRe0IGT5SkIdaSd6tpgn72kU8CTEqVhyH2pCHeFyjS/Iy2hhpaKkr/vF5i1CO8h5A9Hg3lng
	kmXHrOURIEVdMYPRaum3nas6l7bxs2lo+YBkNIjGGlQ8wgNJe79A44eSIIA07cZe6U2ZpvUEggI
	7FFO+T0bWFE6zCdCjm1KZE6Dzwdt54Rq0aQ00eVWl3hAGlZeZO1FPnxsqt9yX7TEj5vsrbe1VTB
	SsHgoZ1NElxogB85R98jo=
X-Google-Smtp-Source: AGHT+IH/jWTFHh9aKpcCWJvmgpXyHpzOKiaHuKZDq/cY0kpC+Nuc21cAjdAdX+5mcEWPkyyHNGr6Gw==
X-Received: by 2002:a05:600c:474a:b0:46e:2801:84aa with SMTP id 5b1f17b1804b1-4778fe003ecmr21077485e9.0.1763113565466;
        Fri, 14 Nov 2025 01:46:05 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e45677sm143331965e9.8.2025.11.14.01.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 01:46:05 -0800 (PST)
Message-ID: <34af5576a5e779a279975dd9fb8be7c2b233f661.camel@gmail.com>
Subject: Re: [PATCH] pwm: adp5585: correct mismatched pwm chip info
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, 
	ziniu.wang_1@nxp.com
Cc: laurent.pinchart@ideasonboard.com, nuno.sa@analog.com, lee@kernel.org, 
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Date: Fri, 14 Nov 2025 09:46:43 +0000
In-Reply-To: <jqsmjigr65kqhlk3buybrcurllqxlad6zkkuwo3tea5uqopqzl@ldwbjsndltpk>
References: <20251114065308.2074893-1-ziniu.wang_1@nxp.com>
	 <jqsmjigr65kqhlk3buybrcurllqxlad6zkkuwo3tea5uqopqzl@ldwbjsndltpk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2025-11-14 at 10:30 +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> On Fri, Nov 14, 2025 at 02:53:08PM +0800, ziniu.wang_1@nxp.com=C2=A0wrote=
:
> > From: Luke Wang <ziniu.wang_1@nxp.com>
> >=20
> > The register addresses of ADP5585 and ADP5589 are reversed.
>=20
> My German feeling for the English language suggests:
> s/reversed/swapped/.
>=20
> > Fixes: 75024f97e82e ("pwm: adp5585: add support for adp5589")
> >=20
> > Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> > ---
> > =C2=A0drivers/pwm/pwm-adp5585.c | 4 ++--
> > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/pwm/pwm-adp5585.c b/drivers/pwm/pwm-adp5585.c
> > index dc2860979e24..806f8d79b0d7 100644
> > --- a/drivers/pwm/pwm-adp5585.c
> > +++ b/drivers/pwm/pwm-adp5585.c
> > @@ -190,13 +190,13 @@ static int adp5585_pwm_probe(struct platform_devi=
ce *pdev)
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > -static const struct adp5585_pwm_chip adp5589_pwm_chip_info =3D {
> > +static const struct adp5585_pwm_chip adp5585_pwm_chip_info =3D {
> > =C2=A0	.pwm_cfg =3D ADP5585_PWM_CFG,
> > =C2=A0	.pwm_offt_low =3D ADP5585_PWM_OFFT_LOW,
> > =C2=A0	.pwm_ont_low =3D ADP5585_PWM_ONT_LOW,
> > =C2=A0};
> > =C2=A0
> > -static const struct adp5585_pwm_chip adp5585_pwm_chip_info =3D {
> > +static const struct adp5585_pwm_chip adp5589_pwm_chip_info =3D {
> > =C2=A0	.pwm_cfg =3D ADP5589_PWM_CFG,
> > =C2=A0	.pwm_offt_low =3D ADP5589_PWM_OFFT_LOW,
> > =C2=A0	.pwm_ont_low =3D ADP5589_PWM_ONT_LOW,
>=20
> I wonder how that didn't pop up during development of 75024f97e82e. I
> would expect that the driver doesn't work correctly in a very obvious
> way without this change?! I tend to want to send this to Linus before
> 6.18, but the question makes me wonder if I'm correct with that
> urgency. Any insights?

Yeah, this one I kind of asked for Liu to test it (as I was not testing the=
 PWM bits)
and he did tested it [2]. But it was v2 and that series had some more itera=
tions. So
I suspect that I messed up along the way and the last version of the series=
 was not
tested (for the PWM bits).

[2]: https://lore.kernel.org/linux-gpio/3efb68e2-7091-47e1-81a2-39930da5a42=
7@nxp.com/
- Nuno S=C3=A1
=20
>=20
> Best regards
> Uwe
