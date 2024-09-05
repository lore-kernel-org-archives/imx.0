Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C490F3E49E
	for <imx@lists.linux.dev>; Thu,  5 Sep 2024 03:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725505442; cv=none; b=AK9tTTU/HUyaYuNjqGo43K3gPSKGnqLC0O/Q/jFKteDSvijwaa6j6e9wReY01xb20MxvtEbn6peCREYR7FmlC2ts+IlzUs+uuf6LhiuINWRMkP+lfyaOVAkFoi0PBj1gBYNo6ypjHuQm9z1oC4eO2f5I01DZ8DR9w/owAIphxTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725505442; c=relaxed/simple;
	bh=/11NuV3J13AVBCNEHJBd61OCL7273nbkmFMzpmsJ/3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FC3OY8dQCHt7e2QqZ0qKDtxCSBIzcdYGf8qK5PSvLzcRxP4hNMW7g4LhI/tf1TtoEBlFBs4skZdOQHDCNf9djvX3eStm1ttYn4XseEPgVPPLy53qFNFgrCHOb8wZOnEcwU24gwP48hPuPQMu4JWeBpo5QO3lBiqEYWolcTMIB78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdsMhOp5; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdsMhOp5"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f4f2868783so2507571fa.2
        for <imx@lists.linux.dev>; Wed, 04 Sep 2024 20:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725505439; x=1726110239; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/11NuV3J13AVBCNEHJBd61OCL7273nbkmFMzpmsJ/3M=;
        b=XdsMhOp5ebwkaCbBYGUKpZvnY3RMyGZulA4kKyUv8DpO5Np2Or5h9fR3DzJweEaXj9
         iY82oLTLpUVThzdh1wiOWjD6f34S7oXTekcsZlvTOvr0+/ZuZXyZuVshwjB5u7lCmytO
         Lob02jzJh+fKcV/L9nmtAQmX4vNb7bGHvFKZulMHYDnNn0UYYUtPwz64ZwOmcnzuVYLs
         WubshPDVNWmXCHRO2BHGrU4IFyxosTsz8d94Le4v9gKy0L5Lr1xkFnC8UqoI8wXEEoMd
         iTrtOZdFjHXZsBZ738Yr7ZHjLq5gLdy+fvFvxqaJA8kgGU7vT18lGeIBUWV6+SZU93NT
         Y4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725505439; x=1726110239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/11NuV3J13AVBCNEHJBd61OCL7273nbkmFMzpmsJ/3M=;
        b=nLcbIvfnxCTtdw3U+zG9ByVrp9Klwx7sB1kTqDTciG6sEU7iszKj+VvDHpFXepCona
         /TW+FjIy7AnhdArK1v10mEBhyczjszcdYXLHyn2pmrLQzVDLze7M2KNFusmwVWzX5OpZ
         7xlJL6Mxlzyz5zznTDkQBOApf51hgl4pI0+ZKlEFMMEx9ulgcuue/9m9Fc9kJ2cRVsMD
         hGcxAnsOOCurPm0csrjM+Esyn7itfqh1PRWy+WhvAtiZCBlnbRKVF9CJchxt4tLB+qMz
         YgBu+uFoDRQK4q7W73mKMCVQR/JFUP4okZAq4ENJtqjrcz0jcRvBR2nDohAt3cCAQHC3
         LACQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJf0wdLXzz/BAJRovvY+dV79Hoo7kANfcvbmNSbqrYFi9VjpEYz8gYZ3JdZKnZs6UD7x4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpOBIR/hAnnD1rMuyYrl9lvRP2uDw8awqMdinCQE/tuEej9nov
	SPyLPD0hfkJ8uVFSUV2UXxE/9sfNmmQ6pwmFIDgIqrHd7jNkSqXOOrPOhi2d6fBXj+DNRGyg3jm
	zX3HKZtc4H3QGBDZpRTV1lBEJQXI=
X-Google-Smtp-Source: AGHT+IFKoW5NyQxeBL8rXaoBWYykLj0w4swcnGUHWTlZ90Pbf5D/BbEifa8Bhjzs4iwGhbX2BuMSl4V40wWz0QQoSEY=
X-Received: by 2002:a05:651c:198c:b0:2f3:d560:ed9f with SMTP id
 38308e7fff4ca-2f61e025823mr141143101fa.5.1725505438583; Wed, 04 Sep 2024
 20:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905012617.1864997-1-haibo.chen@nxp.com> <20240905012617.1864997-3-haibo.chen@nxp.com>
 <CAOMZO5ALKfz-w3taJBwCLu+pAnrcGaa-9=EtLH6FFJWBkq=t2g@mail.gmail.com> <DU0PR04MB9496D185069B3F9D3422BDAE909D2@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB9496D185069B3F9D3422BDAE909D2@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 5 Sep 2024 00:03:46 -0300
Message-ID: <CAOMZO5CCP9urCFixBtF17DaQ2mpno43mprj8hXP70R3-1MvU5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] spi: fspi: add support for imx8ulp
To: Bough Chen <haibo.chen@nxp.com>
Cc: Han Xu <han.xu@nxp.com>, "yogeshgaur.83@gmail.com" <yogeshgaur.83@gmail.com>, 
	"broonie@kernel.org" <broonie@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"singh.kuldeep87k@gmail.com" <singh.kuldeep87k@gmail.com>, "hs@denx.de" <hs@denx.de>, 
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 10:49=E2=80=AFPM Bough Chen <haibo.chen@nxp.com> wro=
te:

> Hi Fabio,
>
> I only add the .lut_num here, do not touch .lettle_endian here, and I add=
 another 8ulp in the follow line, but format patch show in this way. Anythi=
ng I can do to adjust how to format patch?

Now that I look at the original code, I see that imx8dl already has
little_endian =3D true.

Sorry for the noise.
