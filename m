Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B8D34EF04
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 10:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857353; cv=none; b=tkopdSvZqd+cg+9xdjh7jAu/nd0aBk69vbTHDdlVBmdzzS5AmFqNTbSTA89Ed6dEI0PbhKlP6qb6BDyiVYw1nSw2FaUNsKRu6MpO3LPtaHY6pqkB2TFTUGaqB2mEuiQh32TrDqjNZTXUwlyuukiV5UYud5vALDzcAjaC9OuJv5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857353; c=relaxed/simple;
	bh=b5cTARWnCH0O+wzlNreNZEZCG3YtR/z+aB364cLgDRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXpSN1BccXnNugPZxQutCevDQwv5lgW9ZTnCtz0IaL7bmUxVjvKkM9mS3oR3QiiDVjmU/yIS3FJHdvEYd4D+aOdHgBR5NMf0la9ZjSeJn/McuQD1Q7yFxkwqd8Z/NlI4tELSpMCWqbknnEujCD/yZJ9fJsWgSaLpf4WRofP6aDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UL7VzKkU; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UL7VzKkU"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37a33b06028so35208951fa.2
        for <imx@lists.linux.dev>; Tue, 11 Nov 2025 02:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857349; x=1763462149; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5cTARWnCH0O+wzlNreNZEZCG3YtR/z+aB364cLgDRc=;
        b=UL7VzKkUgIwRhJEQgk0bcuIVelo/yK98zG05eUoJoB/JVx5tdi3y76dW9i9qY+9E8K
         zyNw+hoWjBl0c8VJJaSRuBCa47WZ8xeddy3pFpvdB94kENy3LXboytoXY3OcQ6uBnkAA
         HlcMrYTPYwte3WwHE4PjfC2H1At++psFiab9fh1sUB4hdNmBMGDsMMpm/Vz7Gwkep7zz
         vv4ndV5HHlbAaxnfD5K53aRxutLJjohhOp29wDOiWsaEpeCLGjm05dCFEneRTeVYyhza
         rUZoxkVNWSvFxYeQsI5ybG1/9NCQUCvhGcewgjKijNU4lLJxwsHGDDYMHfzdW1nGUfHp
         hxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857349; x=1763462149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b5cTARWnCH0O+wzlNreNZEZCG3YtR/z+aB364cLgDRc=;
        b=M2UzCI2O3ZaBwQriFihn1dvd2BohE/lkgrnZFIkvHQBR6nnWy5lzdn5HNpo/yM8rtI
         /2XMDZvWgm54N8ZMo10oRCDXa9Kfdw3Ywu10oFxYECo+5rImHWR1W8+At5svzq9iPLlH
         2UwtQJmRsiuKU2H89kdPHRrWWGfG3nHwapemGBrUuBrjYKNR4gD9EXWHmR9jlNfUAAis
         YgaRh9kR5Uzv23SvUESGMjcZx/45LBUIEfDFpQgQwZQh/p5miHiWKfbVLLVsNUsH4A6x
         KwbEz/eItpl/9DScUhIU4ZF8X9WnnwDak6XIYf4KqsoWBALbhSWoRMcg7IyvIoy9uhVr
         qSyA==
X-Forwarded-Encrypted: i=1; AJvYcCUkdmL9NYNeniAdTHam76/6HhOT3BND5nBTwCD2CYCE9iqem/onBHGo3+9I/bD0tph6jqI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWY2rQaB0gROdz46AZms3SQy/FIvMjoMRKqiigW/g085ELId1d
	wXO3I73ZOEeAsdY4emFx/PSiQvVeypp/Wpvok63Mm8SiUhFgH6HoBH8Ng26ZbqhrogqdiKsDbT0
	r0Kv2rXxlbLeMVT8NPDSYU1wa0TAqVVwCcBc/LX1Sbg==
X-Gm-Gg: ASbGnctdPuwlp/sG1Nq3YeGAGykM0dw+OeqV6uRFvbpyz+CDLTYCEb+wGRga/7YF0gr
	RKe+aplGcj009CzVDq24DYBZwQORFgt2tZpfyKF+6mMOWsJmP3NvC9cCCSIFTmst4FGuc6eaIF5
	4j9qlVWrQvxoeuIYwpnDbVvElc7dH0TcJddA1nuDtCJKcwadlSrGDe/QzCBmyxcavWOYytVuJNB
	VORpgUuXT/mkY54Y5ZfRMFAXDEvKB8ZDOtxgfea4hQZmPHyBqQGimtBxwHWlNr3PJRKcw8=
X-Google-Smtp-Source: AGHT+IHiG+EjsNieo0IH9vKGvPYVnnnJhmFUXHoDPqz54BHP96ylxBdjlT/JInKjKxLz/khK4ncylVpRxXU4D16MeYo=
X-Received: by 2002:a2e:95d2:0:b0:37a:2f0b:ef24 with SMTP id
 38308e7fff4ca-37a7b1995e0mr22288641fa.16.1762857349004; Tue, 11 Nov 2025
 02:35:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251104203315.85706-1-shenwei.wang@nxp.com> <20251104203315.85706-4-shenwei.wang@nxp.com>
In-Reply-To: <20251104203315.85706-4-shenwei.wang@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:35:37 +0100
X-Gm-Features: AWmQ_bnM-SUasW3cn2Gm4EW3aePYZpGnjIZZVnW89VcDCfJSgNXVTHUcuXdKqUo
Message-ID: <CACRpkdZR2C=+ssYOKnF=hyOqTakGjVxzp5_qz=3-uYRpzaZgNQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
To: Shenwei Wang <shenwei.wang@nxp.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shenwei,

thanks for your patch!

Also, a big thanks for working on improving the standardization of rpmsg
so we can get some order here. This is very important work.

On Tue, Nov 4, 2025 at 9:34=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:

> +- **Major**: Major version number.
> +
> +- **Minor**: Minor version number.

I'm not contesting these if they come from similar fields in other rpmsg
devices.

What I'm thinking is that the driver will eventually have to quirk around
bugs in the responding rpmsg CPU, and there will be bugs. This can end
up with this situation:

major,minor =3D (1,2) NXP implementation, no bug
major,minor =3D (1,2) Sharp implementation, no bug
major,minor =3D (1,2) Sony implementation, ooops this has a bug

What is the driver going to do here to work around that bug?

The scheme kind of suppose that all vendors use the same codebase
and they don't.

I would rather have:

**Vendor**: Vendor ID number (such as the PCI or USB ID)

**Version**: Vendor-specific version number (such as SW release)

This will make it possible to identify buggy firmware and apply
quirks.

My apologies if the rpmsg community has already thought about
this.

Bjorns input would be appreciated!

Yours,
Linus Walleij
