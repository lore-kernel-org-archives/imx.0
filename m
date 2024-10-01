Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E051BF801
	for <imx@lists.linux.dev>; Tue,  1 Oct 2024 11:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727783769; cv=none; b=frNFrn8uIl6vM3c7DMU34xbLWFb2su0oviYSJ//Yu8qXTX7aWFcPh2+m6+rPWsfFCjOR/jPUr4tWrudIrLvDn/N9VS1k4KDJ2Tk6tShXX+CCX2ljDn/NmamzstI3ErLeePI+nQ0jztOYnunlrvlsxr12CVVOsFWVamOeJ9WUL4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727783769; c=relaxed/simple;
	bh=dCRCTpeBWVQaEGezuqoGfd4YJh6Ew8r8frfM+R+vKoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLJh8UHhhRst8HcsJpbP7eHaIlFgQVDxEqnK9kG8XU5dc8bDjBQIuJDg2UwFk7v6e5v/1zsbBh2cNCIuDCP2Upr6AL9ChmF/OGJvOvFQUXA8g+8O2UoBjwZ8QPjoHFVoBT3kXAqKE9LKeMZqsi1xlPT0BbOstpAjjJEoW8OmfAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rSS5CWvo; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rSS5CWvo"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5398cc2fcb7so3243278e87.1
        for <imx@lists.linux.dev>; Tue, 01 Oct 2024 04:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727783766; x=1728388566; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCRCTpeBWVQaEGezuqoGfd4YJh6Ew8r8frfM+R+vKoM=;
        b=rSS5CWvoOs9+4l1RBFZ+P3iJM4cKKaUuEpi0cnXanb2KJqJhG9QAqmZsdcv/Y/vdPZ
         vDnjGPGONzxkeg2h0PLA0OlntKBtDKNCp3kBHycVSheHQbFO0/WblzSVGaFh3/JXOJPf
         Foi3AVmxYoyawaHbztF2fZ8GhtA4GL26MO6fxXxJZzGlhyvt2Kb2T9p+Dq1Osal28fmL
         kqv7YeGRNGajg5C838JR5dPdAwkMC2nxdueXzO2yzIeU59SEH/409AEcuGEohj2azTOt
         ksC41H+69QpW28zXYN0P7UBTeVwvlD8le6KS2pNtz2LA5oTTlGuRJYU3JMPlua8RxfiD
         jdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727783766; x=1728388566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCRCTpeBWVQaEGezuqoGfd4YJh6Ew8r8frfM+R+vKoM=;
        b=NT8uj+tbrXow6GcKqVwHNlrJZdb6zr/DgmLfpKQak2AAlpo/8H/Xz1MiBIx/v8hqJR
         JBXTY4VKzrNU/nnXQS0Kg77hxYq7NxqrEAsPviXUawlvJ5vGF6RfVySQgYLkqeG9+vbj
         bOZe5ImtWUXFKT47dtPHCRh6WFDeIwsc/kpaGMifeZaruSgevOEirIE0qWOZPGKty5Iu
         HTHL+7naxz1i/q+amE20dyinMXVQRTxAiw88jbJghmyCW9gaSA0uyp/grzvDFvv8fc7H
         GOaFAGX8RJofnPMemT9oNgMT1o+twFFWEYV0vLw48kCRljdQaY7mBU4VndOVXvzcUuyu
         imvg==
X-Forwarded-Encrypted: i=1; AJvYcCXoQQ/q5iY0zSXdFOlLhaMwF47xrbcL9Jmg84KPGBx7EWsP7fJNERFJtHpgf+6/LvQD36Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbEgzVjrtfF5cJmuiPuFEECN5IxYQ3Kld9dEWyGqZWRPLzOn81
	MBG5h6bgWN0q39d9qgOeTFJyZVxolZ3vv66ZF/qdIwubbulMG2O84BfPXUsDZZ+7OHGKbmA+Yd8
	EAqHXR6ZqQQVDxcUIiOozwqfcchxyA7NbX4uJUg==
X-Google-Smtp-Source: AGHT+IF671nYta5t199R7sRxpHHBTnmwujkmlr3MRg6tqyu/Ngc90gmiXkly9+05ccmQF2xTgC3WFKRZUK/UcnVIUxg=
X-Received: by 2002:a05:6512:1087:b0:530:aa3f:7889 with SMTP id
 2adb3069b0e04-5389fc7ff3amr8180609e87.56.1727783765958; Tue, 01 Oct 2024
 04:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com> <CACRpkdYbOTXmap-vJy4JNZSaZnE=yzC35EPD2F=bD8gWdD8-GQ@mail.gmail.com>
In-Reply-To: <CACRpkdYbOTXmap-vJy4JNZSaZnE=yzC35EPD2F=bD8gWdD8-GQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 13:55:54 +0200
Message-ID: <CACRpkdbOUSS95SJxsZHmYfZtZNhDe_dy7OWZnsxe0WcExC1Wyw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ARM: imx: only enable pinctrl as needed
To: Esben Haabendal <esben@geanix.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 1:05=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Mon, May 6, 2024 at 12:24=E2=80=AFPM Esben Haabendal <esben@geanix.com=
> wrote:
>
> > As not all mach-imx platforms has support for run-time changes of pin
> > configurations (such as LS1021A), a more selective approach to enabling
> > pinctrl infrastructure makes sense, so that an e.g. an LS1021A only ker=
nel
> > could be built without pinctrl support.
> >
> > This is a very late follow up v1 3 years ago [1]. The situation seems t=
o be
> > unchanged since then, and I have tried to incorporate the requested
> > changes.
>
> What is the verdict from the i.MX pin control maintainers on this?
>
> I can merge this into the pin control tree for v6.11 but it'd be nice
> to get an ACK from the maintainers first.

I ran out of patience and Shawn ACKed patch 1/3 so patches
applied.

Yours,
Linus Walleij
