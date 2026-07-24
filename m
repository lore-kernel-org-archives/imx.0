Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6591386C1E
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 07:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877886; cv=none; b=Ja9J5MQ9hkFXPTOBzqDfuy/8lMT6XzzUodvvDFFfPhpW8meZ5k2rtco7SBdRLgZ5Kvdnig4e1gS5x2yQJvXqs5LCLYE6rSkvT4qfoH6vFZD4FBRTE0p54a1io81T6WlzwBwMYwy8odv4ELVhA7ixQDlEVyBCLxkOybpMMBYWomk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877886; c=relaxed/simple;
	bh=jvCoVMrq482sRltMKIA0wngG+Be2zNs5wkXwHMhSAUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hoTEuZ5CtKpemGoZPH9dD8R309M3fBR7SbENP45HPt5TS2DMVURc3lg508nUhiRf+F96f/64thshhADQk/Dd66493nNsDx4K3eD+KE36RuntsP30HheLDiquoO3mvqNF/zQXklbdavhUDckUzb8WSbHEISMIMReLFLVPFXXFiCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHNyHY4h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHNyHY4h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BE51F00A3D
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 07:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784877883;
	bh=jvCoVMrq482sRltMKIA0wngG+Be2zNs5wkXwHMhSAUg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GHNyHY4hC7tojuzaxlZtjiFy+W2Qk8/5I2WoTb6mbQZ0xAjikAArouvFN+l07ZCvO
	 brE8FuPIw0Aru8OuXBQhtcU7m0cz7TR4lmGhST2Kj/RY757fAlXkXssOyVT0Q2LZKM
	 otyrVgqN0reooRcHojkIbP07aeS4c73hdiXMqtE2vvC+aeD1cPY9iuRysB3RmDitSB
	 r7yDUqn30oQH5yrPu8nyWihTTbvAkO7GpiNVLakd7G2jxkvtwdfe60LebsJVTIhOjt
	 ngEYp6fjbVTeuXYkUN03sB4L/YPIL704ulORfYx3eJgnygH3bJEvugSb1EwI+FNGCH
	 b4mgnvHXPHTpw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b29599b81cso130993e87.1
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 00:24:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqzi5Mu3OJy93XtAlJkhOg0gmF4NujZyXWgEvM4n7jr6VRYr9tdXXEZuUn7u669OsYLELE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzM/k2C/plkU4ti739ldpeExBHHoYL+TQ5IoMmGNJlBBeynOHvR
	KF23cbbuJG91xMS/tn/SsP9FFDioMWCcSdq28niIF46GGtkodhTc53GJIQPaimMXQUFfJBZ3a0T
	hamrMngG7LrigNxe/LufQQHg9wxe0+0A=
X-Received: by 2002:a05:6512:12ca:b0:5ae:aeeb:e902 with SMTP id
 2adb3069b0e04-5b2b2e4a6d1mr1388989e87.13.1784877882305; Fri, 24 Jul 2026
 00:24:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com> <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 09:24:28 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Cu=CKVdFTyrf7qfP--U-K==6Q-oMgerMfian_pwks=Q@mail.gmail.com>
X-Gm-Features: AUfX_mwgzz4U49kjYn2t0Q6F2gaYlikzFa7qviMieYEmwgYwO8V-etZipo96ywY
Message-ID: <CAD++jL=Cu=CKVdFTyrf7qfP--U-K==6Q-oMgerMfian_pwks=Q@mail.gmail.com>
Subject: Re: [PATCH v1 07/20] gpio: Add missing OF module annotations
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 9:25=E2=80=AFAM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:

> A driver module matching devices using an of device id table is supposed
> to declare that in the module's metadata. Add this information for
> several drivers that failed to declare these.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
