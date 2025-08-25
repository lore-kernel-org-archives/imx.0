Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692302C21E8
	for <imx@lists.linux.dev>; Mon, 25 Aug 2025 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756113241; cv=none; b=L+RDpFFTZaXSz8Vkem7uwi0Wb3OJxzQGPm1PGF84Tc3p2VnWg1xEE3cPIAfvUboJh+IgC2to23sn4x4mxbQWClgODE+fd6urpUr6HJkzzhYxB/2+i9eVfvTLs5RoHKnQYRdRb8f262Kpk8MleAxyBCROOHOq1cIeFRZRqhnNaIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756113241; c=relaxed/simple;
	bh=XOAv6hQX72JTJoOiv3v9g2pt29fiKlNO0ZbSfNVbdcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sc5IF5t964fh78JNuu8j95ua3Pv3zQwNVXW7zHQFPTzWs3S/QSH9h3EajeJJulKdF/Hjd8SWjh7gm21aXfw2pqbu7nt+nFWFdN7BhKqQ4r2N7NXL6Qp9g0GGJ5yKoixWchMUzXlNLYutjdS0FaW+TNf8mDRovpDJZP45jDt3pCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=osAxdmY2; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="osAxdmY2"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-335360f9b6aso35331641fa.0
        for <imx@lists.linux.dev>; Mon, 25 Aug 2025 02:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756113238; x=1756718038; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cP0weFM2+mVOhYEbkmdk331UXDeERciVJHGW33WlzMM=;
        b=osAxdmY2moYaz5+i/de25Pel0uclZGLW1q7QGvYksI2JxBBsrudDE94ETD/0DtDM5U
         nfIAPsdEopyNZiIHTLVZJm0JXQbd11lPTFQwbrix4DC7V02/nZeEDkOQsEWVVQO3jIKE
         NnQDK8j2roMB3oTMEkOCuHgC4LdgrcwErPovbleh9AXeGFjilH9/PByta3z5s9pH/eIx
         XDPa3NiJ/5wpe7x8nfyaYXhaHBFfTdA8l1KunkofoUSOyqDQSRXpRn9NaymcFZn9Eh5I
         8Cb4h+I1Vq4wFCByZrWYtSFqSfp0e/WIovpoG10Hs9pWVEj3MVs0yB9bUd81BHuQnDNw
         2xRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756113238; x=1756718038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cP0weFM2+mVOhYEbkmdk331UXDeERciVJHGW33WlzMM=;
        b=gZbTLx2JYlzoNCFgwGops7Mcju5gq/xbwlod53rxOViMK9t0a9p4o4choVAGFrTq8D
         AXbrCAkcPwx/TA0PHz7afGMlG/tbH6hD+da4EaQxJQaMjbEd5YzqdUnUhQh7Q0x4xKlu
         fPzgnLCCM7dnD+RjlP12BxjcFqXVWgb8xB4aMGqOMUbbbVDdRfPEzgrWjt6x1rALWyGM
         vBsrRBbeiPNjfUlYOztUIOmFlQnOTFYjlGEqCeCExtRsro4QxJ8TM669JAHbzUJ5y7HT
         LjaZQzW1DS1u3wywgQiCmiKM4Vr0ODTwsftHOwX1rvLrNwS/ZBo1quJvnGdsCsuW3riV
         BxAA==
X-Forwarded-Encrypted: i=1; AJvYcCVSONDH70Il7ovIm2u4bsqt5e19jqvbNYyhs4w/Pbc/DC8haS1x1udoid0dObVqdb59YtY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxxWro/UKDCjxwmzXuRsy55mYe/dKOUVUO3Wf9Elgb72JYLkg8
	5QNPloLmpEH98nLtEAROfT94h7HNDwSezyRJb8lZxz6Jm0cbRM/1fXcRwo6dMxcHHjfERkBGqv6
	Z2lnCtmGm0ZhiiwhficmE7xWp9ODtuEHewrY/z38rOg==
X-Gm-Gg: ASbGnct7/qsMcwVy32+SOv094dIBfBSsjmqiRRYCpbQTBzS6IEoy2ilhFu0VYrScn23
	QHBQG+8XSzeosRTIpekvdK7VKh2qDqn0iCSS3EfkkpztTmPwaE9NQ6Lu5Dr4a/0Qrb2yZoVxqON
	khQaaGaPVLKoVLRCGOP4IdopS5/c2rR4ZCBO5m13uwO8eRNJiUEJ75Tqta6aLZn91o30dv95YuK
	aRnmh8h1YhSkrJDZg==
X-Google-Smtp-Source: AGHT+IHKuGX2jcjK7CW2YUAF7pKBQi7lJi+f3JtU7wjskayoF+TL/YdXsZFZxfIG1onC6ArpMYTltcHn/C0yATQLfLE=
X-Received: by 2002:a05:651c:2141:b0:336:5d7d:f034 with SMTP id
 38308e7fff4ca-3365d7df730mr16346691fa.1.1756113237446; Mon, 25 Aug 2025
 02:13:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250820164946.3782702-1-Frank.Li@nxp.com>
In-Reply-To: <20250820164946.3782702-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Aug 2025 11:13:46 +0200
X-Gm-Features: Ac12FXxQ7gXxoDsxZV2IH90hiejwNDEjwFXUKgIGdSa3W_TRCsJ2jdxesORaDrc
Message-ID: <CACRpkdYCWymgFYenTbw5TzH+De103pwf35Bq_WjCkCPJ999Xng@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: gpio: Move fsl,mxs-pinctrl.txt into gpio-mxs.yaml
To: Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 6:50=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Move mxs-pinctrl part into gpio-mxs.yaml and add pinctrl examples to fix
> below CHECK_DTB warning:
>
> arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: pinctrl@80018000 (fsl,imx28-pinc=
trl):
>    'auart0-2pins@0', 'auart0@0',  ... 'usb1@1' do not match any of the re=
gexes: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

(...)
>  .../devicetree/bindings/gpio/gpio-mxs.yaml    |  80 ++++++++++-
>  .../bindings/pinctrl/fsl,mxs-pinctrl.txt      | 127 ------------------

GPIO bindings mostly affected, so I think Bartosz want to apply
this one. (Else tell me!)

Yours,
Linus Walleij
