Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD1D149C4B
	for <imx@lists.linux.dev>; Fri, 26 Apr 2024 15:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714147197; cv=none; b=T4Tcptjm5M2El1DCd+wLF0PdxtNekP+rpKzWUr1Qu+L+4tXZmo4cZWGJuQ5p7k2/WM3HXP3VZjWLXt9ieg82S7qvxsR25ZI/v/qxH1HOBkoHHd0vjXQuRJRdo3pIE5Duth/SpAo7eIVYlLKZ/f6FYGE0IbiMYTfmWBEd6fMzhTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714147197; c=relaxed/simple;
	bh=u50beQV18hEyI5LxaEHKX9vkm/X/4BQOF74VimhDrcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rQszmqCIi5yjN9Kq0Tkkrw/c3HsUUziAedqRlJsgOxqs0cleOWZ+komjQZDmASPA2YCWleAHVJLvKm/HivcT7GvvjsaCeihA/jkJbgIntTZh5WtefAsy/LhDt9XOdbmxRyewFoNOwLuZXZpkudqvDcDSQfHY4IYSLpLiK7tPW3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iCL9for4; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iCL9for4"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5709cb80b03so2614259a12.2
        for <imx@lists.linux.dev>; Fri, 26 Apr 2024 08:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1714147190; x=1714751990; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRgG3X0s6uXL5fPpg4hJDh3wuxhTgN8x+QviafboKYY=;
        b=iCL9for4rbA/u0w6N/bbjbcAgXoQAX/vbnpTZiHSSEqaaMe3Kio0Xq4DXlX8PCPc+O
         88pqxOK0sQHBAnoUqyg622R5YVWUGStTJ9T5y42p0Gpi6tzBYoajExBztsiQ+0cYobix
         SMdXT3SYhhF1AH143RVmwN78MVqR5n6Kze9g4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714147190; x=1714751990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRgG3X0s6uXL5fPpg4hJDh3wuxhTgN8x+QviafboKYY=;
        b=ri2/qQgofOP0PLtTmfmfao6H0oAi51iyYNrWfplYuXJ5Uq6L9luvQZKwkvWP7kmagD
         h3pOe83JP3BuBvIL0D8NnBXE80HyeH3o09QqgeTdUWthw7nrIR3nQsc1CSxhkn8jN/x6
         M6qpUBonna/+jnvGcUApFdGFpdwF3TSEKkrBpnvfGx7+F8PR07rvP2mW04JNKsn6QyCT
         /FjxsIog91NeLwIY3p3Qzt/l6zrEDkbCfNYEnNWAl1Qv/dyBWgqu70EbiehR8PjroAo4
         z5hXzrUzL+o2JWgv3nvDisXfCTUILNUJue+5jtJL3+Lnt9VFE+3ZXYmTVtAB11rPub2a
         u6Lg==
X-Forwarded-Encrypted: i=1; AJvYcCW4RugESrkt1+LqaxbPSqmE4015R1xqXSNP+736nT8HJHMHCp0j7U/XuuArQewwIBzq6hVLmhhGtJpGcOGXU2VGxdoV
X-Gm-Message-State: AOJu0YxhVbv0x7zFaJSHJOV0ajxBLKsU04hNK+PbFz0I33qRkgGZsXpT
	3jEE27Mtj9UVeoWA4xZ9NarocZfQzRgSz70F+xYAGSPWZzzrlVKFtOhvaD2jZgqpdCLaG2v3Iko
	tBBzEbRgc1J4jyn+Zh1Vkr3mN4tks+vBGAOtdAQ==
X-Google-Smtp-Source: AGHT+IG0yQxJ1lDKJPK5e25bpzn4mkXQ33Oq7j0E0rzaS+j9wS81xPfcHpvsxVMz77H2/j25/AKFpVyXxhihRRm8etA=
X-Received: by 2002:a50:8e5e:0:b0:572:33c6:bfd3 with SMTP id
 30-20020a508e5e000000b0057233c6bfd3mr2088058edx.36.1714147190045; Fri, 26 Apr
 2024 08:59:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240426152730.9806-1-fabio.aiuto@engicam.com>
 <20240426152730.9806-4-fabio.aiuto@engicam.com> <CAOMZO5D=Ens3f-FnjEf8SDSTCChdzKW3m7LH+t6y6qUtWsSRZg@mail.gmail.com>
In-Reply-To: <CAOMZO5D=Ens3f-FnjEf8SDSTCChdzKW3m7LH+t6y6qUtWsSRZg@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 26 Apr 2024 17:59:39 +0200
Message-ID: <CAOf5uwkB7Z7FUt5K8CP3sEoCEahE=ipuXX4MRZYNgDw6eMuEfg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: imx93: Add Engicam i.Core MX93 EDIMM
 2.0 Starter Kit
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Aiuto <fabio.aiuto@engicam.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Matteo Lisi <matteo.lisi@engicam.com>, Mirko Ardinghi <mirko.ardinghi@engicam.com>, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Apr 26, 2024 at 5:56=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Fabio,
>
> On Fri, Apr 26, 2024 at 12:31=E2=80=AFPM Fabio Aiuto <fabio.aiuto@engicam=
.com> wrote:
>
> > +&usdhc3 { /* WiFi */
> > +       #address-cells =3D <1>;
> > +       #size-cells =3D <0>;
> > +       pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> > +       pinctrl-0 =3D <&pinctrl_usdhc3>;
> > +       pinctrl-1 =3D <&pinctrl_usdhc3>;
> > +       pinctrl-2 =3D <&pinctrl_usdhc3>;
> > +       mmc-pwrseq =3D <&usdhc3_pwrseq>;
> > +       bus-width =3D <4>;
> > +       no-1-8-v;
> > +       non-removable;
> > +       max-frequency =3D <25000000>;
>
> Is this 25MHz limitation correct?

This make the wifi a bit slow ;). You should be able to go to ~50Mhz at
3.3v. BTW the other mux
are not needed "state_100mhz", "state_200mhz";

Sorry both Fabio, I did not see before

Michael


Michael




--
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
