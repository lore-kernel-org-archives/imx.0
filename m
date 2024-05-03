Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E62314F9DB
	for <imx@lists.linux.dev>; Fri,  3 May 2024 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714730052; cv=none; b=feHWP2b0HwaAZpzdxwePwI0r1nmgh6pVfD1BKu4ZtYfA+afQGGq9cQMTv02nWv+svKezvWg2brrsKYdqMIWMApVpwxXxkewTbschr4ERhWXWWYjXHGjn0NWeNrIJX2lnAIln9meBXPNgmOHIhux5Pi7v/3R+pTG6JyyrqOpumd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714730052; c=relaxed/simple;
	bh=oO6o2rpfHPOdGQjocbJm7nYQ52Uy5WZClOTnFXN9Xxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAlZzDCwS6nO1eHm496d4jg59hE8dGgs+QN0sydNJisJyqRsg+eo3oMqJS5U0AFi6fqxcEFkT1W5NIDh1PsO8P/XjS52TzXrqBjKt0ohKJ855qaDt5bPOg08rqHtPrdZCc1rLudWE5L57HxWMHi5MHDcIZqWUrtVtFjAklZDHn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReSqoVHp; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReSqoVHp"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2b3e2d3d05cso268327a91.3
        for <imx@lists.linux.dev>; Fri, 03 May 2024 02:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714730051; x=1715334851; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPOCU02o4FkaTy8IAzYtzHqtONKNgZRbMXSkFgP/UHc=;
        b=ReSqoVHpCP04lbF9sZNR5ZHXbIJhy2wwm6J1Ovb13DHDtwxm3f3jiF7XUJ6eZ/2gVw
         6boA+3UlcjyR85A3/+t1qzeGBY8vKjGGI5iN4JzCJfTXfuPeB+0YrDDlEgweXVI04abS
         mPPNsM8cmNWl48o9aMP663Kxa4R/upFBzQwYdYW4Tbf1qU9HtN0TdhUQaBJB9VTcdOTK
         ggdGle3H7AZzZBN93kdfFda6jQzBvhh9ReWVHMu2/zUrlQWAyf+0lJbizUYEZ4//NcZk
         A+fSi9a4LzN2+X6XzZzj6MUSbFuMZHWSallVxiMw9J5L72oqKcadIJ610JAkuN6yIXu8
         HwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714730051; x=1715334851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPOCU02o4FkaTy8IAzYtzHqtONKNgZRbMXSkFgP/UHc=;
        b=rn4cdsqpUNaN2YUaEh6+CWW/zHw1WTk5tyi8Aca/IdrtMbSCQmpEVwJga0YjhYN899
         bd9086Ggq+vBY7MBAf88qM3rPrQCCHl2gjGhHy7x9q5mFApmCHLzLZrGgw5E3DQq4kMT
         S0MhnWMCfw0RLOUmvx+6fV032isOxGQ/0O4q54RSP01l40PntpgsIT7fPHxR10nexeee
         cHOHH2Bwx7nwFKFtrMXu1370wiGmiRRyZw3fkjU68X8xcUSL6XYREqX90hlfaGfp5ap7
         WWUsVyeMy2ylqNniJSwwJvfOmbgTOM/oKlaQJz1w3hJPen/usy91m1h9uzj40nIIJoMz
         a6dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmedDFpG/oKOyZEmJwADYMdjSnfaWni0UdEBztgYzpCvKCQ8+FkTerFIi+ac3eO50sIrXAya5gwyfzT7S8QAOHlyHs
X-Gm-Message-State: AOJu0YxFDbuag06VxxLtYvWZZPdXYnmGSRQ/tgtC7XY67SuFSKpNQvX7
	hbc7stMMhdANSzA4f9Cu+7l2GFzYutV0af1dofrh2Kjj4jdqZ3xRSNIeJ3Y3js9oTNNJ+pnEYxM
	T41t2dVIUqrXZO9x8DE3lsumPyXI=
X-Google-Smtp-Source: AGHT+IEgM4iEd4jMMm+EgDh0hlCsdUSzQF59auS/YHpn16luP+NkPzAahk8j/ytqswvKTeU0s2kUrOhGLUSUYfIcevQ=
X-Received: by 2002:a17:90a:f195:b0:2b2:760d:9507 with SMTP id
 bv21-20020a17090af19500b002b2760d9507mr2255240pjb.0.1714730050781; Fri, 03
 May 2024 02:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240503-imx95-dts-v3-v4-0-535ddc2bde73@nxp.com> <20240503-imx95-dts-v3-v4-3-535ddc2bde73@nxp.com>
In-Reply-To: <20240503-imx95-dts-v3-v4-3-535ddc2bde73@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 3 May 2024 06:53:58 -0300
Message-ID: <CAOMZO5D9i8LG7-4X6D+oHfZrJj+QoKa0DTusMX-H32227_s_4Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: freescale: add i.MX95 19x19 EVK
 minimal board dts
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Thu, May 2, 2024 at 10:29=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> +       aliases {
> +               gpio0 =3D &gpio1;
> +               gpio1 =3D &gpio2;
> +               gpio2 =3D &gpio3;
> +               gpio3 =3D &gpio4;
> +               gpio4 =3D &gpio5;
> +               i2c0 =3D &lpi2c1;
> +               i2c1 =3D &lpi2c2;
> +               i2c2 =3D &lpi2c3;
> +               i2c3 =3D &lpi2c4;
> +               i2c4 =3D &lpi2c5;
> +               i2c5 =3D &lpi2c6;
> +               i2c6 =3D &lpi2c7;
> +               i2c7 =3D &lpi2c8;
> +               mmc0 =3D &usdhc1;
> +               mmc1 =3D &usdhc2;
> +               mmc2 =3D &usdhc3;
> +               serial0 =3D &lpuart1;
> +               serial1 =3D &lpuart2;
> +               serial2 =3D &lpuart3;
> +               serial3 =3D &lpuart4;
> +               serial4 =3D &lpuart5;
> +               serial5 =3D &lpuart6;
> +               serial6 =3D &lpuart7;
> +               serial7 =3D &lpuart8;
> +       };

This looks like an excessive aliases list.
Can't you just have serial0, mmc0, and mmc1 instead?

> +       reg_1p8v: regulator-1p8v {
> +               compatible =3D "regulator-fixed";
> +               regulator-max-microvolt =3D <1800000>;
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-name =3D "+V1.8_SW";
> +       };
> +
> +       reg_3p3v: regulator-3p3v {
> +               compatible =3D "regulator-fixed";
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-name =3D "+V3.3_SW";
> +       };
> +
> +       reg_vref_1v8: regulator-adc-vref {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vref_1v8";
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +       };

These regulators are not used anywhere.

Please add them when they have consumers for them.
