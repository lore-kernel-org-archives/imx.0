Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BAE253F06
	for <imx@lists.linux.dev>; Wed, 21 May 2025 10:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823552; cv=none; b=pIH/VdIyotDmglxCzAC00J6Bvmx2bOXpm2aDgy9pYkT5l6rFg2tbUN1WBX3EQykm7UvALrCvQ3NE86NibXjndpCR+qTHmuNB/+riiMEb7gPP8VCg2r3BT5+evu4W590aghlt6RZZZNZzXFLqw0tdek1+DUxP7TuEBaOoZfOIipU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823552; c=relaxed/simple;
	bh=TzN8oeMuskKQU6CcpR7ilKeJfIloLruNAKAnwByhXCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwiMXk6R//JHiPJC8i1J627DG0vKgaD0+m+w1uypjof/IckJFMo8Vc4HIk0Oep8ZK1/cUTpleTePNUdiS7coIQGsa+L6EufO7IqSFZ9zB3GNhWcKfJszAfiNq9cJwkf+1BWfWU2mZZi9FNN/knYUybEXO4LQVVoY//wZMvvoRKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MrRhveDw; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MrRhveDw"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70a57a8ffc3so62571327b3.0
        for <imx@lists.linux.dev>; Wed, 21 May 2025 03:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747823550; x=1748428350; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrx4aRxpWMNpz3kBZx0QvAIs12jvmJX0PVdxD7GtL1U=;
        b=MrRhveDwCQJBwetUPE1Sh29di5mz250jErRSatAXzQfWXry7/N4X0wc9+0oYJS4YqC
         +B0Vzdd+oqaIzyPteZDRrSRV0TF+YX6yMBVukeGE/jbuVZxI0LhsVeziAtgl4zDTQ8eU
         mbIATUCN2JadaIs+kIh0o2zq94zwOlvH5LNNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747823550; x=1748428350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrx4aRxpWMNpz3kBZx0QvAIs12jvmJX0PVdxD7GtL1U=;
        b=XcSe3KpD5bNfNfGXV4HgdmbLJ9H/U50vR5paNy35p2b0y9DWUIGAlfxta2SWCVfAUx
         X7NDh/fjjOJPuJrW2myRf7m5mPY2tVqZ0AUBBWbVykig5/syQoCyWAGIcmyXuD0xUSy2
         +NAfzeMtxwOuraF4TeFubvAJRVBBDpHfPKYqXVVsJzkpb9kL3O9g6JE9HFHBL3s0oNUm
         OLTiMKOWWwMVWnzIvgO7UslZnUU6kAttPwAiv+ajVnNZxpfpRdPz0Rcaw946eHlXHdPL
         cmPWOvq+BWjks5RXFRXAnzSQRlUA0HKEbqpSnMwwN21dzIJje4sYZ9Q6+1818qCDGrkR
         yusg==
X-Forwarded-Encrypted: i=1; AJvYcCXOQMy+D2VlIuhCDLshlhVEkzC1YPMo3ZLzRX/9M28Rb52w3h4Pfuo7fXTUrq2UnDe718o=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGPaoBg59UPkxihUbESzdweZ217PcF9s/rMFlvhmzCFjO8oAvN
	b7HBaopycQmk36+UHJAiEUFf1Lx3m/g38c1aUJBcCPhwaLaxysCYeRzlQgFhyvsxyplcbF2NPTZ
	icGly5cm8R1wsgKmBgw4T8K2NOKuD6cMyJcrvkJ1PJA==
X-Gm-Gg: ASbGncsojJImuY7/Bc1vfNEh4i3Bv5cAVwGIf4zV6DU2o5krE2ZPhpDAMLUAru1+5F9
	JHd6jbKj8wlR8DDgvX0oIydaec8BQRFcPPh3MLeZebk1ePfU7wqEhOdrGUGI/Oy2rLwZR/lOTYa
	OmPwHpicuLUtV9AQ/+gkKEMnLRfJZuxYMt8ggE1rL5r5GGCoHFDsHrPyvvmiYkU14jjw==
X-Google-Smtp-Source: AGHT+IFFal7PqjGJ+LGmx5bNYrc9004KFk4ruAZ0EqygehsuQ0KzsT99Pyli2tqxvHiA6hWSh10r4+jSoSJ6zf3teYw=
X-Received: by 2002:a05:690c:ed4:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-70caaf78e03mr301107987b3.15.1747823549692; Wed, 21 May 2025
 03:32:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
 <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com> <20250521-quizzical-tidy-worm-1fe67d-mkl@pengutronix.de>
In-Reply-To: <20250521-quizzical-tidy-worm-1fe67d-mkl@pengutronix.de>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 21 May 2025 12:32:19 +0200
X-Gm-Features: AX0GCFtZ6hwSbA_J2rTqW8QnXowGlyqASP2_EDudgcpET604dgwM5KYsyW3Eszo
Message-ID: <CABGWkvrmuhaF4iHqHRkrNrrHb2gUNDBJKCT-jZ8ZuwZGRvm7Lw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-amarula@amarulasolutions.com, Sascha Hauer <s.hauer@pengutronix.de>, 
	imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com, 
	Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Marc,

On Wed, May 21, 2025 at 11:35=E2=80=AFAM Marc Kleine-Budde <mkl@pengutronix=
.de> wrote:
>
> On 21.05.2025 11:28:22, Dario Binacchi wrote:
> > The board includes the following resources:
> >  - 256 Mbytes NAND Flash
> >  - 256 Mbytes SRAM
> >  - LCD-TFT controller
> >  - CAN
>
> [...]
>
> > +&can0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&can0_pins_a>;
> > +     xceiver-supply =3D <&reg_3v3>;
>
> Since v6.15-rc1 (d80bfde3c57a ("can: flexcan: add transceiver
> capabilities")), the flexcan driver supports CAN transceivers via the
> phy framework, see drivers/phy/phy-can-transceiver.c. Can you make use
> of it?

The board uses the SN65HVD233 transceiver, which is not listed among those
supported by drivers/phy/phy-can-transceiver.c. So I can't use the PHY
framework.
Do you agree?
Or am I missing something?

Thanks and regards,
Dario

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
