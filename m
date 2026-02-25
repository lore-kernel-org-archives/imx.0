Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D702D6E74
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 06:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772000802; cv=pass; b=pDISd0A8rbi5qwTakbVP0wK50h9+BTa9QeIfxJW1DbVAx8gGB3d6lVYiDHVSZW5jghlTBfsBO+T3zKMwHs8O5vR9HjfFR8HMoP4z0cC9IQd8lcceKbPEjWJ34PZCDSf74x/ME3/tRVm/hGw/7TRTQMwSPfl9uEsoDAzRqOy3ssA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772000802; c=relaxed/simple;
	bh=ttXxcT2T1ac4ybDNKi/zCbOjFd8n1xxTG9AWyRDJaYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sQh1BbiUShj3BLYKTXBpfyDtt0UHvq4tXQrN93wrazZ4P4rcYuVw03RnG3uszaDuoNLVZ03cO1leTe+h4KFiJNpuYxOIMIZYDBrzZ4wBE4WeD+1bu6oT4XApBOFX8gS4AIHSB6eF6Ed8S1S7ENbaNUwAMAtckMQCVN9/MQnLUeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEd3loQ7; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEd3loQ7"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2aaf9191da3so40872605ad.2
        for <imx@lists.linux.dev>; Tue, 24 Feb 2026 22:26:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772000801; cv=none;
        d=google.com; s=arc-20240605;
        b=bhr6esmt3H3SjPvJFvte2ypdqbyFd2xo0N75kqv6lOonF0o6J7LlKph9DZlim7gP9T
         Pxm/nFS/hFwAt4bIv5+4wzrTC27kaIkTJfCaoklXWGSFKypMKCer70Kyc0yTY612/fQm
         gbN5cPjeTS/WcvffCm2aBxe9Cf8qlvuiFCWTrFXcw4rbpjTaPwWkJLppPbHCU5KbLMId
         kxdD+DuZfyjtAA968ovvlmpjNiAHPPboNg9muHrcM6cbBXJDBs33fv2ERvhuikv7hXqx
         ZiLNEHaRoPLDE7Hxzjv2UW+8OIkWONPpBYbOfSIZz5zcBqZTq4UuaTK77ZTeci+4gs9N
         OgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=74IdwuXc21OGgUiiss6XTtfN5U3py4VIK4AnmFhKGeQ=;
        fh=rn74faBdjScominPe+7yP0w/QLhnJ4IJPL5d36crcvc=;
        b=J1U6xSqWGLw+Yr91y2jCBlM1QgGY+bE0445nF6d+tn6yzG7BRjkpMfvawiacVpN1eI
         8pnCW+JaN7GTh0bOGFiTZ9Q523IfSGfK5ms0HoBtaGA0ea538XNGyXwSzhvoKu5jYRpr
         uFD0WJWq23PrMfqYBWzqwIRcXNb//O/QC3wjgDtEiky+pbDQbBEUkOtn0HoZrMWkL7Dy
         f0tw9Em0X5m7UqAt7XhJwnAm+d4QEqROFXKQWu62VSIWQ4DERbdJrZ8QJgV6a+Ax6lFa
         j65PSMT2ok+fK32SyWS35NuXweGN+1hovpUrVE3p3nhWGeGN1bmG4tdj6SKcSORFvOM+
         7QLQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772000801; x=1772605601; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74IdwuXc21OGgUiiss6XTtfN5U3py4VIK4AnmFhKGeQ=;
        b=AEd3loQ7nw5dy/Sad0dqfsTE6pGX3r+zeeknY0O7NKE+V4jq6xOsQjObTSMlg8HBXz
         zRPafKV4xbj1MKHrdUQ/hY3pyJL85lxOryD0dzgZEXk3Cu/PifufvlPv+807TvmTZfj4
         JkhXu9b7zhqlOVFw24b8m14Y1fxCV44ULivpTu/WU7pRUHmOMMaVxgDYriaPLGf4E11f
         1lHQH8lRo+8mP8mVPIn+vHrapoOWKfWe9yPqzhL8FR7SbmZbcEsGhalh1JKYvmmedpuO
         7e3pt5gVn6jM0wuQD+5ZvctOS03fovIOdi8UvxjE3y0uFTtztIkx45xOGYU13GjowN/8
         Gigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772000801; x=1772605601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=74IdwuXc21OGgUiiss6XTtfN5U3py4VIK4AnmFhKGeQ=;
        b=j2zi1KfRPjwi4lMVDSN+rSNLnpMXVNIjFg87AIdZpp6IC9trE2IjM9oMk8TuPtpy9Y
         p80ywqDyHR8GnFb1y9owH0owoQ4WQH0YzdBr3ySAmbgk8K2gxC2Bkh+FO8X6Khij+1nV
         E6fGPZbvWhSGEhiF3f72rKn/Gpa3ts/4DVJuqztLeo5obcb72nFyA8z/NYryyNqZPJem
         rG6TfUkkn3OIhn/Lb7HrsoLRqbdPMgENCf9Xpdb7+4ZN8YLIwkMy70rYVZbQMVvm4r2o
         4YuusrnrytG8vhwiSYgoD5i2wcj1VkdhxvSVyMoi1CRUb2q2sG05O/3/fyPasCB0ojQ/
         nZ4w==
X-Forwarded-Encrypted: i=1; AJvYcCWTlGCDf3UNjiKqfrqK5l8k9WyQoK1BcayKDmAKgTQjIidvYOcIRwAJ3hFJ4GMhO3QPxLw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy71t5ihcUcQMjr3MPhAz73G6Fg3MRQN0RKUsIO34W1Lf10ZMyH
	hdY5xqYVBUYFJb6wEAua3XzEy+CaljLBCuXZSCj+LcQW4vXwm2UPMg2k2/SJ6P9E60kFbBfT1oQ
	31V6UZjm+4oDkLPvnTvNtXGDCVsitr6Y=
X-Gm-Gg: ATEYQzytFv57f4x8dKWYKAVtKrmcXZORrkb2Af8DV37DHjLQBXGpLgi63B5DaAP0Z0g
	7ADznlf7PR7T2ZyAvGnarsADRaEs4oHBlvNEkIWsshY2FrQ49qVAPX/F1IvrU2I9wPrpULORdG+
	Db25YluLrFevjY/fRfRrxx0tKmRc/njmNBM7AIYggyypirYrk2NMXenT4i0Qjh9pgPnfvCa7qOD
	o9IYdexJRo1KQcmQ/YAkcfWGksB1UzIrZZjQ4jI1ySlec3t4LWkfSdB8stuEdqwAGkl5JpO11QF
	Rdr9Gzk=
X-Received: by 2002:a17:902:e746:b0:2ad:ae4e:bb6a with SMTP id
 d9443c01a7336-2adae4ebd03mr38828325ad.24.1772000801097; Tue, 24 Feb 2026
 22:26:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260224094527.169215-1-shengjiu.wang@nxp.com>
 <20260224094527.169215-3-shengjiu.wang@nxp.com> <CAOMZO5DW5Yo3A3kPOe+NdQNwTATzzWguCGBDyK2UFjCrHtwFeg@mail.gmail.com>
In-Reply-To: <CAOMZO5DW5Yo3A3kPOe+NdQNwTATzzWguCGBDyK2UFjCrHtwFeg@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 25 Feb 2026 14:26:29 +0800
X-Gm-Features: AaiRm53sttei49Mx1DQyMYFyac4_nAUg2Jcjs65LfbJ3vj7sOi1Zd0RL6CnHQbk
Message-ID: <CAA+D8AMRdCu0h=ctdwYdavGquSe5+XGXyHY3JPSmznhAsX1S=w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: add support for NXP i.MX8MP audio board
 (version 2)
To: Fabio Estevam <festevam@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, daniel.baluta@nxp.com, 
	dario.binacchi@amarulasolutions.com, alexander.stein@ew.tq-group.com, 
	Markus.Niebel@tq-group.com, matthias.schiffer@tq-group.com, y.moog@phytec.de, 
	josua@solid-run.com, francesco.dolcini@toradex.com, primoz.fiser@norik.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 6:27=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> On Tue, Feb 24, 2026 at 6:44=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.=
com> wrote:
>
> > +&ecspi2 {
> > +       #address-cells =3D <1>;
> > +       #size-cells =3D <0>;
> > +       cs-gpios =3D <&gpio5 13 GPIO_ACTIVE_LOW>;
> > +       pinctrl-0 =3D <&pinctrl_ecspi2 &pinctrl_ecspi2_cs>;
> > +       pinctrl-names =3D "default";
> > +       status =3D "okay";
> > +
> > +       spidev1: spi@0 {
> > +               compatible =3D "rohm,dh2228fv";
>
> I bet you don't have such a device populated on this board.

Yes, you are right,  it is used internally for test purposes.
I will remove it.

Best regards
Shengjiu Wang

>
