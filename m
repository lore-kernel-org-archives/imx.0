Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A71372045
	for <imx@lists.linux.dev>; Tue, 12 May 2026 12:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588646; cv=pass; b=QsiXLnJ4errIBfi5x2c0CZKH4YZTdSB80CFwcESyaLvTwoMDOJvP77YfzBeq6G6TPONSmuaUPw9KzmQ2KYJZHuAjJ5NsZ3C4+Xj4fEvVl9q2/tYhil0IkwaBL7K4kJqfCwmHA4bIFwcrx6333Ml0pN1czagtt5g57Ekd7NHL+cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588646; c=relaxed/simple;
	bh=cdz0xEOAawKit8K9bAUZtblyQ/JOZkBeEj8dOx9FdF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=devvzmTXBNM8fzPZdJALs8m91bjFXantVXsftmPgAAEk8YlSKNnxeurvxer01kWEZBt75JjURQD/lK090tDePFUAS1qlN+3lGGeqx5STcH4rQiAGZHwgxv24VDM3YtASAH496KdUXQxJR5wbcN/GJ4XZ0B2r+Pr5cW4dA+IZ1wM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7QiSV66; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7QiSV66"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39380e79936so67103461fa.2
        for <imx@lists.linux.dev>; Tue, 12 May 2026 05:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778588640; cv=none;
        d=google.com; s=arc-20240605;
        b=caOma8smHL4dUZcLqWZbXYjEazqMaHsoyRzXes+UGCCIZXDYogXV/0d36djiBmIF4J
         9Xzx+fZhpVZOFbIDMEwP4cr+mFP/Zo9nhkxANQLhKEy11b3FzFKmxh+7gFSpuuEX5UVE
         l5y/5m4OgRudBMCzv49v9H9dmGf8AY1BCFpOZmYY2Tl40hHRatgaYit3a23FmYams8NV
         R7U9dHVpYoAV089qDexqqRSvZ8okg2nSnSu+kG7r8BwDx0nLCGcT6Tz/K5R9ha8zzMGQ
         mw9jdIz63/I1QjxdzEChfp1uujMOfQRfcuGW7psm3WVc2oxb4cbJ1xFM9NvwdYereHjK
         0+tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZNiNSCnuGRYY15l9t3kR4oZkdq97BMSAIqkVYXGT2lI=;
        fh=0kYaXnhpH6dPZDkPhxhAJ2ZqYlwgqoRxn1RwASyYZx0=;
        b=JV3kdHS6tpIPXlvf2O6CacMbi1Z+uhybPBgjkk+mqV4DZ37IxjedmPJNiesCMKwldg
         J7bbh7V3+zpQa5e++rR3aNhs3hTJph13TREedeqM0PUL4F4k5k8wXAFbdNHsqJcR10qT
         XxlrRYNtILxkVm2YLBcrY5UvAk5ZmBRd6/DGDeSzjH8KjWTUwkEXcycVowoYJcxd/hr1
         HraNPmylCze95JACF1Gxnxc29iqx+9f1IRrMMIuh2BfMpV5MXKBaw+cynxz2jSNeMo5l
         8FvsLOkjMNJ1oyO0LKir8zQJW9LsxtqCSvBP+lTTDGQpoZldowQY02iQUYLLwFKcvZPn
         nT0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778588640; x=1779193440; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNiNSCnuGRYY15l9t3kR4oZkdq97BMSAIqkVYXGT2lI=;
        b=r7QiSV66mt7s0Kz/VTDzapCL/9CUCSdKk+KIfIOP1tL2sovLzZU93RU+yfwMVUJPtk
         RFJEJcTCuOuSeL9V+Ehv6ZiKdQGiZjDISJ9kLEE5mEooJPQ9T9zVbO9/1jYPgSpOx158
         W0VNLJhTAdO4LEJvlRi5DDWdMByoquPrhpQ8CRbdgjVB8ZBN098YUelhdIEC6ly0Ra5z
         V974GQef8pzQAGH96TJr+jiK80BDVs3jrN2KFAmH59BuAFh6RmJl2j1bEdHJZ1lu9UvQ
         HEWBu8LiwgzV85MMA3UPSkYmOcyqJze1N3cnbBhAqwrxn4thdwfp80wN48xePWGWpJVu
         4kXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588640; x=1779193440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZNiNSCnuGRYY15l9t3kR4oZkdq97BMSAIqkVYXGT2lI=;
        b=H9RUiBAuwgzjMQFSq+VzFrAF/FVE4EVV3k/38YO95D0ngcl+AuwvytRVL1o84fw5aV
         8N0WI0M9zE+wWQTxcaOC37pI7c22VWtsyibjlosOkb9BB4iemfG6xvkEXr59CZbZ7fPZ
         3xJk0fVdW1mcVYy+0Fh39PjMuzvx4ePsCwOw1yn0pE9smCEJTPeqc7cF9bAVTJNNDN4l
         bsyDBZsRyC7rhuDaVUrUlPepNYvxma0i+EyyVcS9ngfPACwNW3tPVCSGv6DBbKqb1DCv
         CR+ura/grgoChlxwHKsv72Lbit7WQn8Z2WH61ksOBjMgRuoic1gH4QsPTsSKJB+PgC0z
         ZzYA==
X-Forwarded-Encrypted: i=1; AFNElJ9syvtDM4LfqmKGdHzJPy9U9sB9Sq6ULo8PMg6PVIs98QANWLPAVA3BJ19xOmogZPC+qeo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7WPHXe9M4tGFn1yEnGfGtgEelAkNKHqFintOvXUn0yH7QCXPA
	euWpzbkGEjTRUt8T1Zp6sydzO40PJmYWFa8ua+yM9ewkVmfWjWQAGYc/zFdcY5F6S6Y7QK+AFxm
	mLbj2ljjoLlvKFLQeV6IvVCANu7cPUO4=
X-Gm-Gg: Acq92OF/QmyXMsZYp6hActc8MBPN9fX0hlynHFmS5hl5kveAEORS5o4is94KtSppt6M
	BRKrVQXmnkjGpP7aq6X2j8chWQYDTTR3UH2W0Tz1kJhKgI2GiaKkTfqWl6nJvK4vFUdInvaFtbh
	JfKZE/HWrBMHyRHiG72zuD5tQrXC6p3SiBlmvOlxLUH/MIGZEYqbr/rDOsdnM5890qJaLJzVhoC
	6VXSh1sgBWICuCKtgU0ETPfegy7CFkav69If1kk+kG44tD2VIhzGuDgQF4c3gWPZH6kpnrzwqf4
	x3815Qkoc2/mnh4lZ4l9Tbn2OpQL0Bz+9C2Wzf5IuxrbkKkg/t+rMGwvAwkpPDsNwPxHW7O0
X-Received: by 2002:a05:651c:35c6:b0:393:903c:225b with SMTP id
 38308e7fff4ca-3943cc32a2emr8953951fa.31.1778588640195; Tue, 12 May 2026
 05:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
 <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com> <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch>
In-Reply-To: <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 May 2026 09:23:48 -0300
X-Gm-Features: AVHnY4Igm0-o-ifd6S-hgKzaiMJz5oaJeDrrGsoCgjz255blF80xw9vHPNmBKaA
Message-ID: <CAOMZO5Dm8FgzOfyp=6ZuDc=528FiqCPVYF07PjMGVP0Paye6vg@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: imx6qdl-sabrelite: add mdio phy address 0
To: Andrew Lunn <andrew@lunn.ch>, Gary Bisson <bisson.gary@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding Gary.

On Mon, May 11, 2026 at 7:15=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, May 11, 2026 at 05:04:56PM -0400, Frank Li wrote:
> > According to IEEE 802.3 Clause 22.2.4.5.5 PHYAD (PHY Address), A PHY th=
at
> > is connected to the station management entity via the mechanical interf=
ace
> > defined in 22.6 shall always respond to transactions addressed to PHY
> > Address zero <00000>.
>
> Did you read 22.6? I've not seen a mechanical interface as defined in
> 22.6 for at least 20 years, maybe 30 years.
>
> That cause does not apply in this context.
>
> > -             ethphy: ethernet-phy {
> > +             ethphy: ethernet-phy@0 {
> >                       compatible =3D "ethernet-phy-ieee802.3-c22";
> > +                     reg =3D <0>;
>
> This could very well break this board. Without a reg value, the core
> will find the first PHY on the bus, at whatever address it is at. If
> you hard code 0, the PHY must be at 0, otherwise it will not be found.

On this board, U-Boot checks for the Ethernet PHY at addresses 4, 5, 6, and=
 7:

https://github.com/u-boot/u-boot/blob/master/board/boundary/nitrogen6x/nitr=
ogen6x.c#L287-L296

In this case, shouldn't U-Boot fix up the Ethernet PHY address accordingly?

Something like mx6cuboxi does:

https://github.com/u-boot/u-boot/blob/master/board/solidrun/mx6cuboxi/mx6cu=
boxi.c#L414-L446
