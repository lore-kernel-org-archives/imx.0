Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806342E8DEC
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771618894; cv=pass; b=dBwTTjNy7y59IMXKQVjlUHFjp1j6lbvLHZ8u322Sc4KMgLkfF9V3GLzrfvUZyxpVUVwIgwht+vqX1JdrMavHtGLO6Gu2rqWM+Q7hDGN4AYOd8jpijAST+4CJR02sG5tRZbl/NWgVqVb0hiKnWHBOPsLWSWAvXctHQmv0KLrXW24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771618894; c=relaxed/simple;
	bh=/MQjPz3AFp9hJYRg6RaO7nd5l2K1vMZNwkI3RJIJr/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6CxCu+W2wsI5z0oRhsWHNEffQXBqJ7mLsOlQIuG63kAPEBP/hom4jMwM1x7F/FlfjxWGAweUr7X3I5uZuotPGcepKscqdfDpErugTxcld5k+2DmZqNH8Cc8AiGS4yYVPmcHXnS9565Ck5IA5+5tS1q/YXypnw23DGNtHoxPMt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KORPC+rx; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KORPC+rx"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65c01595276so3747585a12.1
        for <imx@lists.linux.dev>; Fri, 20 Feb 2026 12:21:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771618891; cv=none;
        d=google.com; s=arc-20240605;
        b=X/2m6yHsoHAdsspzUk8HkmkjzY7mO04ovygB1vj8aDqOV4YSqEoSREUhH3X2bj+PLX
         DUYHrsV9/DpZUDDgh9gApVO/cAOu+Z9GrsFdHmNkADD4UTB4hgosbL1fS87rwDeAj9HV
         w8TNcchbtRSyBviEvZ/yjIyI8ieVWMKd579edMzqg6lJtCrh8/gh9H+Mw3arRVYrwm/P
         dNllhMmeldhLnQwX45eQ932C8oQLAmatdICqCfIZcP4ZAVtxP8GbZsL4QbTujw7eMGYV
         12NCAvw7IstZ7fGJGB9WrKWWlzCfyuCAetvT9hmo1XbHkGFIze2bMxFj+1++nB3rnYC4
         QGnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CWagENeZ05MKy23i76GqV0Kg7bzJ28L44P2dnAeTMoc=;
        fh=mJ3q03FR/Ba3GVWMhwHbuzpBCz5mhu5UdpIYEQb6c7Q=;
        b=guh/zSxFn8ojgeITI80DjfCXWBryHGrwn//ZwtoeE36DGX8O8qF8m/7jWG3YSXLbNq
         5v62OhxhLnYXeUGnsKHBeFs8EVkBnFxoqol54CATuF6rAxA8nuIFHLgy/BGOtMWoEx/J
         gjh+5rCndmtuR8ok8VOXoMpVfiAxJNnDc2jIDoHMlDHH5Rh18zugpKFcdW+ghIIclY8b
         usHTmgkoTHT//6Kw2ciSIZDewf7hjHFuffMD9vamhTtswI9UFnWFQDE9lRY5ohVYkQ91
         7dSW0ppgl6a8KT3J6Zb+Xn2nii1hH8JsPAA4KJOXM1gp9LE+lqqNOmU4+2DNrCAGhzYm
         UtPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771618891; x=1772223691; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWagENeZ05MKy23i76GqV0Kg7bzJ28L44P2dnAeTMoc=;
        b=KORPC+rxqP3qgozvR/7iuR51wVTJtdE6JgkdBfiRVFAEZ5zhzTPNiona9NrpL+Luir
         otrCnz0QCF77VoncViL7Uqj37anqKohzQQ89Z8oLdHf5oOww6vh32oXgNoW82hF99/j+
         DENU7JKjN+O92SUqaiInwloV6VS087U9udd+89aTqIsitRguTfdEwvuu6muns2Gn8M/V
         zaTlt1l5Op9uqZOTVBDOcHGvR35caDVTSIIji/SUuEMgRndJmwn49g3TS8Jas2Rml6BG
         eOusIodO3WBuYB2WMA2Hy9RvRbXuV4utEJAfwpBQItcgShSMxop1Fa68YKZr9evxe9QB
         z/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771618891; x=1772223691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CWagENeZ05MKy23i76GqV0Kg7bzJ28L44P2dnAeTMoc=;
        b=BOV2vvRBnmVgJGGP8AdoOXpU99hAJPSRk7NnkKxwcFjNG+lPLW8c4MlP9NZQT/1Pz4
         Y+El8XdDTIijPBdCceHvkEMbsdNZnNbrhk3/2J1LbrBfLYObnPiZwCu0jYoPYEV+kXmx
         wv13hnYDgXHEHlQIvHR6TkP6LQJEUNu4H9UJbtW7GDxffJShH7XfjLJlJFRxMDfKjH/b
         W3X3Ol/g5fktG8Lg6R6XyPl6eUs8XYsY3a+wsb8ElwthRGAviTBUOy4jCit2k/4HCYyP
         kyLj7KPE0hydfDokmuX/mKj34ZDgPcthvnFiu4hc2jbjjg5ES+T2zCcTMtY2HZcNHZfd
         i5wg==
X-Forwarded-Encrypted: i=1; AJvYcCXhi4ONmBD8pRHQ4/uy4u15PDhAzkPqu/sPca9gK/BVxJ2rbxmMdHlPvxTSztzUX/ehJFw=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt642cgs82ZY/uZo2ley+yCFUVLDF7fypfGFHLk9UuoBMbu2v/
	8h21DOnva6UH7/rDjgYYCffL11nHH8hWpBMHnPkA640v75de68TBQ7ZTefZeqiAT5MIO2Sn17F5
	Nw+9M982sKA7aAJ5GK1i4Lb4SiYkBKBTicvSc1MaKHQ==
X-Gm-Gg: AZuq6aI5k5zblJ+hXMUxUiw7gdN5iM/i/R4HPwfEOjPzHtgb0gzXukbivoiNvgbOlp0
	eiCqknx9YUoKlEyzI9xh3J8H6fpEKjZCkBkvcnNB25/W4GEMIRkiMYwSIifkoTb9XPRpDfljiBY
	VOCyVD2dByPgDDqBRo+j/JK2ojSH2wiGQSSwEnqmyRaACME3efDPQ7eAWW0F85BkNGPLh+FI8kb
	0JfYYcGuK+rOOPHxVhdWvlu9tVLrPiRanCc8C/PKv1GiD/czgwcZ3WlSlzd/RmxgZmN8ws+MNG3
	K/pcRUP6wnWxKPtrp/axRAygt+I4hL30Nr52yfc8Vg==
X-Received: by 2002:a05:6402:3547:b0:64b:83cb:d943 with SMTP id
 4fb4d7f45d1cf-65ea4ebf346mr552702a12.6.1771618890856; Fri, 20 Feb 2026
 12:21:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260212213656.662437-1-shenwei.wang@nxp.com> <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com> <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com> <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch> <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 20 Feb 2026 13:21:19 -0700
X-Gm-Features: AaiRm50Kkz1w5MRtvgIyG-wO2YfHNIXg4Tb2fsX628-LWgxPRUtWFjuasLWIuqk
Message-ID: <CANLsYkx0Wubx0FiV8ypEnHcstXc2shfEc+87Jn_p=RDe8ib1xg@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Feb 2026 at 11:57, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Friday, February 20, 2026 11:45 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Linus Walleij
> > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Co=
rbet
> > <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Anderss=
on
> > <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; F=
rank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO d=
river
> > > If there are concerns about specific design elements within the
> > > driver, I=E2=80=99m happy to address those, but redesigning the hardw=
are/firmware
> > interface is not something this series can solve.
> >
> > Then i think you are limited to using the out of tree driver.
> >
>
> Thanks for the feedback.
>
> To clarify: is Linux moving toward supporting only fully open hardware pl=
atforms? I=E2=80=99m
> not aware of any rule that prevents a company from upstreaming a driver t=
hat implements
> support for an existing hardware/firmware interface.
>
> Given that, I=E2=80=99d like to hear from the GPIO subsystem maintainers =
=E2=80=94 @Linus Walleij and
> @Bartosz Golaszewski =E2=80=94 on whether a driver that works with the cu=
rrent hardware/firmware
> design could still be acceptable for upstream inclusion. My understanding=
 is that upstream
> generally supports existing, real-world hardware as long as the driver me=
ets subsystem standards.
>

The HW can't be changed but firmware can.  It is not realistic to
think upstream can accommodate all the quirks happening in downstream
trees - this approach simply doesn't scale.

As if I wasn't clear enough already (along with many others), the
current implementation will not be merged upstream for reasons that
have been amply discussed.  You either comply with the comments we
provided or use the existing out of tree driver.

> Regards,
> Shenwei
>
> > Sorry.
> >
> >         Andrew
