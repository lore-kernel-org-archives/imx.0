Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ACD284B50
	for <imx@lists.linux.dev>; Wed, 28 May 2025 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435764; cv=none; b=R7uKIYFLyGbbqAf/qfp3KSfKmNN0cHhQgNMdghhDv9pFkoWN9Q7jBeqED5SuHD7k0EHLQ2MWZBN5K/2AkgnfbykCzrRNRLYKVSX1D9MsgmaJWuXgR/wGmMx35e2BiTol4DyVO42zgEYM967zmrn3UCmKO+F47xukKJSLhADObJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435764; c=relaxed/simple;
	bh=ZhZaCx9zTAfydyiSk7i4+D3+796XUnIpYm5sDEhibbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsMCFwru/hW1VB2iKylYKKGVTk+NPtS/FNYzpJDyKp1MmnBKwIDf6KgVtL4y3Sug40sGRnojcxskqf7ZfTB6CfOtsfy6wEPOJQ1+bUBWxfOBJQ1upe9EVpxtAMJHMfj3I91bp6amUxfFZKkjWoLBBs7t2YrUlR3Y+V80vhWwAPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=j9ZUE/Dc; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="j9ZUE/Dc"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e7b4ba530feso3348035276.1
        for <imx@lists.linux.dev>; Wed, 28 May 2025 05:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748435762; x=1749040562; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y2nJxgpLq/4ajBXNTSM9IN0ALNLXkV13ENJ/HewBaA=;
        b=j9ZUE/DcIuUfVVRFiZhyecZni3EsFYIesnaaz709NihdamwhEuW3jRvKPhcepUQAoE
         7lyOpA0FTj3ZdCW6LlYiX98yMTidwCQr7E8qRx47obUWKiFYUe/TqtareOQp42Qrqd6r
         gKR6Aaw7aMQpqWWt/65+yjbBuaALGkwT7lqms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748435762; x=1749040562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Y2nJxgpLq/4ajBXNTSM9IN0ALNLXkV13ENJ/HewBaA=;
        b=jFsErBKgoIwdsUO9UBnH3wzlWoJSiLVzyPJRhv/GqvzOQkvL5bCdi572iN6sLSuXx2
         uyOt/1YS65TpZtDw4jdwThwxXT1NtguFfA6WvBliJfJii/X6fscm64bKCBaOgIu32keI
         YZ8z8C/JyNcpx7r+u0odM2RWS/bLfopkX+Dfd8ARJRtfcgxPI1OH/e2gqqvOlez+m3MH
         Fy0bTV0jhjJaA/KtlbAE7RFW69A+/ARm8ciO9gG7uu9WhFXVgLOxz55d9SsR50nJTECW
         u/qZIh2RIoY0aLDJbhweOXG8X3T7M3ZLvvmpQc81Lz3ScNmoI2Qpvu+UlBh4GFL+HxJt
         o3eA==
X-Forwarded-Encrypted: i=1; AJvYcCVdCBh2iOzloKf1qufx8uTfjye+1FWUQqrNJo6D0cJIyvsJqtcoFO3qeJ070vosfyTY+sM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxO1XWv+wzChEVu9hGSQetLF8pB5AQEmoiN/XxVCq8abHxHg1q9
	Es/9v49GEgH3m4uTYlDaVWlOajDhnfELh5a2SsvKW8JB2PU1+E4kph228VkSVy8ZbgvZ76gt5/K
	/Med7UYjMXUsp7PA5WP5YwrMjxvv2eXT5c4/vaOdScA==
X-Gm-Gg: ASbGncvfh0TtfzHAlioIzJliEZ/WFAItTJ/DGm+wsX2/i5HgwN0LCrdYRFxDEk278qa
	crofIypvvY3t8S4/WgnNm841YswCwxg44tmuqGN0Uxj4oAOcC6PY2LqNPyuWjmxu9b6bS3Hmq1r
	J1+BPLzBnFXZE4NsyVAiuKmI1LblOtVxXtygyLtl7OUc1IKAB3/M/OTv8q3zjJRjKWig==
X-Google-Smtp-Source: AGHT+IHBh35vbTwgJCVmI6qYBeU0Sp2Wx1M+Pq2Rp63W3aCe0f9Vwlcw2TxiYl89UFgJ0Ni/gNn9cRNUEGm7TvbhuTg=
X-Received: by 2002:a05:6902:20c8:b0:e7d:8a63:1a2a with SMTP id
 3f1490d57ef6-e7d919b04c6mr18500419276.25.1748435762006; Wed, 28 May 2025
 05:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
 <20250528121306.1464830-5-dario.binacchi@amarulasolutions.com> <20250528-toucanet-of-utter-conversion-2bb1c7-mkl@pengutronix.de>
In-Reply-To: <20250528-toucanet-of-utter-conversion-2bb1c7-mkl@pengutronix.de>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 28 May 2025 14:35:49 +0200
X-Gm-Features: AX0GCFsWpbnRJlmj0FdLliCaul8VD_OZHEgOqPPNi4PhesFCouLSLcxJegiNFSU
Message-ID: <CABGWkvqAy+-mjhXFKc9dkeJnZKLKuC23=Dmn3axJx_1+5fLWSw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: mxs: support i.MX28 Amarula rmm board
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-amarula@amarulasolutions.com, Sascha Hauer <s.hauer@pengutronix.de>, 
	imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com, 
	Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 2:21=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
>
> On 28.05.2025 14:11:41, Dario Binacchi wrote:
> > The board includes the following resources:
> >  - 256 Mbytes NAND Flash
> >  - 128 Mbytes DRAM DDR2
> >  - CAN
> >  - USB 2.0 high-speed/full-speed
> >  - Ethernet MAC
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> [...]
>
> > +     reg_3v3: regulator-3v3 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "3v3";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-always-on;
> > +     };
>
> [...]
>
> > +&can0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&can0_pins_a>;
> > +     xceiver-supply =3D <&reg_3v3>;
>
> The xceiver-supply "reg_3v3" is an always fixed regulator, that doesn't
> switch a GPIO, so IMHO, you can remove it. Saves a bit of runtime mem.

Yes, you're right.
Removed and verified.
It works.

Thanks and regards,
Dario

>
> > +     status =3D "okay";
> > +};
>
> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |



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
