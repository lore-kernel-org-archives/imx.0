Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD432040A9
	for <imx@lists.linux.dev>; Fri, 21 Feb 2025 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740133013; cv=none; b=hCkUfbe00BCBFVq71hTomi57Ny4t84sCaB1oIuEcbc8Mo3M4tJn6rmY9Rn6A+xEyxErgls5r9dB1T0bR+uI9VuzrOq4BQZSxv4MZAR4t0KYxmauV+w2W5RQI2foyNrRQf6Nlljk0WMRv8X2kd4SrKPo2NP2eQePQTXOPz0aG5f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740133013; c=relaxed/simple;
	bh=UTINVZMTqQKEFsNcbRAVygzNBAPGaLoYvIEdFjkNc58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKmRVdDT+vkfxR98eqh8INIJhZmLK31FYu1XHH3sz/sybSTvCAk45emRHy3s4MBu+TvSyIspqTa6he7nrvIOCIht8hhPC/XAINpJfWqmQEanntxxKoLrZ0Tzl+pMk4YiBpflxK27x+QDnarvcSOWErvyjNN+rGhpetzCRquMbJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dzU6e6dB; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dzU6e6dB"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-543cc81ddebso2266735e87.1
        for <imx@lists.linux.dev>; Fri, 21 Feb 2025 02:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740133010; x=1740737810; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTINVZMTqQKEFsNcbRAVygzNBAPGaLoYvIEdFjkNc58=;
        b=dzU6e6dBjED/HViTWH1pFAfeEpwWV2vhvMaNeIOB6qy9NGB0Gvde1Y8GnacNbRwOL+
         9h9fZFx0hPHFp40MWvk44L4AHOAZ2YFVH2c/L4O+tYVhFFFdOkVfJsel3YE8ZPD+32nj
         RQun8OBkJt8C+xXa7k3uEfWvAmOLtQKm2xL12SeOkAZb2s5BnMICQip9osjm8EUPnkxN
         JjL4zvr5yJU7AXarQ7e092NTyyo3WYAvhZkrmmoaSjFWDUnewMK5mlGfzeFVZIFu+7Ms
         MnVjWi1gVtH9/mShvN3oSFXjF9Te7cPbwZLTgRSQwuV965GNmVYZAzHXiE1dfatPQ0Xo
         ztGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740133010; x=1740737810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTINVZMTqQKEFsNcbRAVygzNBAPGaLoYvIEdFjkNc58=;
        b=PlzRUUH3FEJOKY3VDg375h1JvH5FI3xIgWKcZFnxxsj0lUzNosRX41uI5/AMPz/DCn
         dLyTMLIysIZtvIEvk871roICcbdMhOIDI9Ja44us5iW4oLBDowPlh4vpnBscwoTSj6cW
         0qjFUgRFuFXU9ODsHdJo41z1FPEZcwugLX3KXTE1pJEM/LElOD9tng16Zu/Y/5On+Bft
         1LmGS11ae06YeqYkZGZ2zQIYhduMDL8hT6qw/XzWR07c+0nJZG2kv1DXABJMBlYSi1oU
         IA8bAvh1mW3/y5V+pToo1UhEoTv865EWxD8VJGdYsneHAsC/DshTxnv8QIoW6hGdYzeI
         YTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH3OZa1Dm3EvZA/UIbyuE9o4/OTo7mgKYX1aUXXtP/plyG9C5p7/Qt/QVaRsGGq2sANso=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzwp9jIr0JJWnbxFiKz7MHM02KDX/xJp2I3e63wUYzsijXnBxmo
	D07B5Z3aTKubPX6aBrEV0DgjDQW4SglChTmG/o2Ux4LtSNf2c/dqVXXUFVCCFOk1kv1BKlg6Ijh
	wuhsGLkfnUKYzFH4+oQFAjDhcZ3agDii+2NTO2A==
X-Gm-Gg: ASbGncvr+68BtkPeXmnzowo9tpR9dA8eiKnfWUm2TO3f/cBVWMIHq1AQnFvPq4MIiKJ
	SFulXKv67Sz+K40ukQWLE7076Au9hs2+b8jhPGoBbuO8zqFf+bGF9j0VLHWQhrqHvBpQcRBxIzr
	Eefu1mYpau9cpaSrYXSht5SWleTeM60vnXe/9pfKs=
X-Google-Smtp-Source: AGHT+IE/gCc1zLKC2/FilcQfdgIA0T+E5scTEtijMf0nqtHAyEpZfuAyp4sTq0UHdySyk7VSMerkvASxHmIm3yoQBtg=
X-Received: by 2002:a05:6512:6cd:b0:545:16f0:6ca2 with SMTP id
 2adb3069b0e04-54838f59c59mr770995e87.42.1740133009861; Fri, 21 Feb 2025
 02:16:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
 <20250219-vf610-mmio-v3-2-588b64f0b689@linaro.org> <DU0PR04MB949620686274212D9E6F074190C72@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB949620686274212D9E6F074190C72@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Feb 2025 11:16:37 +0100
X-Gm-Features: AWEUYZlJoEMlrwzsFjs-mxx4Wt9euGaU3C9izJ8NvcmysPIXr5T6ol2ihAVtTwY
Message-ID: <CAMRc=MeGUGssqNhUCeprEXUf57pmeyw_zc8wtZG3iLqXrxQ_7g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: vf610: Switch to gpio-mmio
To: Bough Chen <haibo.chen@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Johan Korsnes <johan.korsnes@remarkable.no>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 4:58=E2=80=AFAM Bough Chen <haibo.chen@nxp.com> wro=
te:
>
> > -----Original Message-----
> > From: Linus Walleij <linus.walleij@linaro.org>
> > Sent: 2025=E5=B9=B42=E6=9C=8820=E6=97=A5 5:05
> > To: Johan Korsnes <johan.korsnes@remarkable.no>; Bough Chen
> > <haibo.chen@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>;
> > imx@lists.linux.dev
> > Cc: linux-gpio@vger.kernel.org; Linus Walleij <linus.walleij@linaro.org=
>
> > Subject: [PATCH v3 2/2] gpio: vf610: Switch to gpio-mmio
> >
> > After adding a pinctrl flag to gpio-mmio we can use it for driving gpio=
-vf610.
> >
> > The existing code has the same semantics and the generic gpio-mmio, inc=
luding
> > reading from the data out register when the direction is set to input, =
and it can
> > also handle the absence of the direction register better than the curre=
nt driver:
> > we get the direction from the shadow direction registers in gpio-mmio i=
nstead.
> >
> > Since gpio-mmio has an internal spinlock we can drop the direction-prot=
ecting
> > spinlock from the driver.
> >
>
> I test on imx8ulp-evk and imx943-evk board, gpio works fine. GPIO interru=
pt also works well.
>
> Reviewed-and-tested-by: Haibo Chen <haibo.chen@nxp.com>
>

Please don't do this, b4 doesn't pick up things like that. Leave
separate tags for reviews and tests.

Bart
