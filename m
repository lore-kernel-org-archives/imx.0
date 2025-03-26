Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF291D5ADD
	for <imx@lists.linux.dev>; Wed, 26 Mar 2025 23:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743033104; cv=none; b=ldEVq17t1mrX5igur3yqvm0JPfZdQv+uCxA1AK1o6hqTzasAfsHyUzbjuU+Pyf1CLdyHj3HZZmQLrdIOdpT9b0Ip9q8Xb+qBM/eTLw27qiz4MWHFjDEiBkV/iyyjJi4/35dnB4BuSiFSL6j76g23HATHU1Y8Vsn7wEcnodjTkHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743033104; c=relaxed/simple;
	bh=uA4AdssvpPqQ86j2mMIE0l6Ccwq4JMgcJayRJEXySK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uu+bPHj+ZQrsi+Aqma/eACW1mBp2FbojMhcRBSmMj8xbHR2y8eajhyJPPNp+74/FTaMAXKhWgLE5acjt29arzwGAv5Zj6HNM28e5qe6YYMXzADDE29NxQ8gi8AMs5iUCcWFPraFs0VRPVxIwibYOtxe3GmMbw77OiJeS9O6UCIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtTmX3h3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtTmX3h3"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54addb5a139so482211e87.0
        for <imx@lists.linux.dev>; Wed, 26 Mar 2025 16:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743033101; x=1743637901; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA4AdssvpPqQ86j2mMIE0l6Ccwq4JMgcJayRJEXySK0=;
        b=EtTmX3h3NDIZCpi2augAIelZBmR8gzQTy0qCqRUF1R3KQeDAuu+IvalQ3Wpz6q/xA6
         Lg4KABAA1XEM8Z4vfjMggpUtsf8qPo26gVeAVrdFeyCLZJF5/VL1aCD7zzFZ86aJYgUK
         7nf7fGSNjoZNb+/WrVLWkIMVt7oBK4jEWmTb0syervN+D69DNKT+NNs7iRD26a9mdiP/
         GW+ztqwOO7nyyU7va2yCHOzvNEf9aBxlzdlPW2OBtXMY9vVLJ0SBZ20XyW2IGx6G1s3/
         lW5o2G7icue/5/NYhlY8tA1qMNDRw/rDWQEhazWJUAi8NwJgeoN1pCLGyJRKA2ODzw0S
         8djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743033101; x=1743637901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uA4AdssvpPqQ86j2mMIE0l6Ccwq4JMgcJayRJEXySK0=;
        b=dju9XkcbGbP7syMpNJhkS2pP7UcJBIaRH6LxB3HLGH6+d4+3ijq9kKLlbk01y9tYXS
         h9cUEkHNEos7EeETNWU/vPzYeCqxflgU6V8VGyY8FHwtGxHTx0ix678cuJ3K3N0Ly7j3
         XjnsAfwCy7F6bSij8mE+yUBdCnLDwHzZfN/+YLM/nfXm2tqeMyECjAVU+dz5eV0p3RQd
         GfS3j905pqUkWrDktIVlTSB+QzJn67oDYzdlNjgDN2BRMv5SMj/N3SZVgGvk6fPU+NOi
         RI9++1guNXsGCdzoJobJ+Gn9Kr6m5lirU0HLYF+xZbQCqtNa3tXJhdCBXxf+ffB5cG/d
         DyFA==
X-Forwarded-Encrypted: i=1; AJvYcCU2Fh7S0MD4mRTXPMvYG6bimfQdhe3jWe9uT4VOlAPKjmOEq7ngYMmpNucGNUJ3KIqEV74=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJERIv3TGRRABnwkEhNLVV0NgMCL91TyoaR7EcgMVZzQTI8mSM
	pYll6pWEK89rD9RDWKnLeqLy1IzfOFeDZ7tm0Sbc/+ybOSvdScxYZcsKfDhBEBJePooQglkaSUT
	tQjjIhgr9VaG+t9/c3UosxZxDIys=
X-Gm-Gg: ASbGnctNF/1q9mmEOh/VFyQdDJskQTks/IclABl003i1sixR1IiNA2GPDT5vm3axhag
	+PSlh+6QVP9D/bGLBUZgQMmWJOYM+2nrKySM3qKON0f9rOTJ5jr2SeDHqacYkoS7VqPeZzDuKQb
	WSNMh2cR9pxzn/DleHyC1W6OxEs8MXRxs9fN4/I979QxV88L2FKzhUfP39Ng==
X-Google-Smtp-Source: AGHT+IFYELfgiO+wxoWio008fIXIKA1kkoHvCfFRSp46GuCuNDakMgDbEsBHq6K37MFmmLbGrQDsEYkZtP/RiQvI5A4=
X-Received: by 2002:a05:6512:108d:b0:549:8f4a:6ba7 with SMTP id
 2adb3069b0e04-54b012201fbmr462220e87.36.1743033100314; Wed, 26 Mar 2025
 16:51:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250326223841.193234-1-marex@denx.de> <20250326223841.193234-2-marex@denx.de>
In-Reply-To: <20250326223841.193234-2-marex@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 26 Mar 2025 20:51:29 -0300
X-Gm-Features: AQ5f1Jr4DbKXNs0s_yqnIidvZAgpTckMlWcRo8PQ0KBPDukXSJkiLvMa4vA1eSg
Message-ID: <CAOMZO5A0HKUNrYmdVrSZp6zcmVcdS0TRTiz_7py73c3b+ng3Bg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add initial support for
 i.MX 95 Verdin Evaluation Kit (EVK)
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Hiago De Franco <hiago.franco@toradex.com>, 
	Joao Goncalves <jpaulo.silvagoncalves@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Max Merchel <Max.Merchel@ew.tq-group.com>, Michael Walle <mwalle@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 7:39=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> Add initial support for i.MX 95 Verdin Evaluation Kit (EVK), which
> used to be the Titan EVK. Currently supported is lpuart1 as console,
> SDHC1/2/3 as storage, WM8904 Audio, USB3.0 and ENETC ethernet RGMII
> Gigabit port.
>
> Note that the SoM used in this EVK is a derivative SoM from Verdin
> line of SoMs, an actual i.MX95 Verdin SoM is under development.
>
> [1] https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx=
95-evaluation-kit
>
> Reviewed-by: Jo=C3=A3o Paulo Gon=C3=A7alves <joao.goncalves@toradex.com>
> Tested-by: Jo=C3=A3o Paulo Gon=C3=A7alves <joao.goncalves@toradex.com> # =
i.MX95 Verdin EVK
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
