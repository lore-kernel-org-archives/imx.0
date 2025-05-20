Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB0224DFE4
	for <imx@lists.linux.dev>; Tue, 20 May 2025 22:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778960; cv=none; b=Z7U0EHeHBmiNdxL6iuhJVyCA5fBBRps8HctOLBIlJfaOCluPFJp5t6Jv80W0kTYiZbNZEDn96In0LmBbOY6Ev6oFbTGywgDMWyTfnhsDcOWePfGbQ3Gj7+aCLYHGXTSpPznVxcl60sz7dwMkDzxtH4+4lhMH5Q7iEE9AbmIBIII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778960; c=relaxed/simple;
	bh=ratdE9jXoB0SJ0Y0w3wsjguEzkshW/vmeLVeCaT31+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ivbjg9V+wKt92tSi3QB+tPKnGNUnwWnZp9WScGK3Sxv4D8usxZWXMYRfe2wIRx7da9fwMdnSothtTnQIoCgNlykaky9xKSAqYPmYMX1pBulRFijEWCfIxp3kVCvd2p6KLdSF6d0k+BKi3K3yUkL/o/UBRe74gstNsbpwrCde4fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yJ2B9Ms2; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yJ2B9Ms2"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3280b1a25b1so40134291fa.3
        for <imx@lists.linux.dev>; Tue, 20 May 2025 15:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778957; x=1748383757; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ratdE9jXoB0SJ0Y0w3wsjguEzkshW/vmeLVeCaT31+I=;
        b=yJ2B9Ms2jwE10T/UFGrxGQ2vZkJBza9MTV6cuxr/jrD9uYwAkSpXkJxu70L7A6zzJH
         CdWlRyInHpAIppMOZyrgt1jfdYgbLBFapgifw3lsgFFQGhXx5FiZqhVso10EEobylCTN
         9W5EBZpcwHStftV/YJEvZZtbtKodd+5SAd4T5KF9bE+14PcLgdGVaoW7z+oAjcCRj9xx
         FHmlHKP36hFwToGUyYHlm+hhAMdeMfRLW5oml7L6ZJ1SMTrO3JpJIew91sCqIRsQTTG7
         /McIOlFJbJboFXynfDfQpbzNPNVfqgtpJVoawd82kxr2mb68wP7+SIadO/t4cDJgODyb
         kNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778957; x=1748383757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ratdE9jXoB0SJ0Y0w3wsjguEzkshW/vmeLVeCaT31+I=;
        b=Xm7qARgLi8iavd5wj716cNnqdWUKd9G6vgfmTf8aMa+zmUW594bj9M+bFaIx0405yu
         pPPzzPw5dNoGpQ3zzjykUbh0lpP1011RcrM+IijKQCHJkDZ1g2TV5vfzbus8Aj32g9Fo
         tNgYCeu1EgIud9mRiIM+t8Pild9R4AhR3r9LLLZvQntIgHsZy6B9NoNEUb1huPEZR9xU
         Ulxxwxy8d4rmj1R5CLmoPcIZsKkdsiirxG5E1QtRo9vMYkxgZl48Lbd7Lb85W+OLdpoC
         9i7YxLHdeYKJFAvYwQBB+QJx4avox6NhHeYNnQuuQ4VPSlHwPFVbZhUxTAATTQJ5eV27
         wrIA==
X-Forwarded-Encrypted: i=1; AJvYcCXWqHbool8BC/7OfdH3CCw1gUiwQ4A6GZty0/DLEW44g9Q4Ue6omJujnsL/cn8EUtzOPRw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNcTNQSPh+Oi/+SX9iq2aiZkGERW6PZzS6mJSu1UA/VHbXmART
	stbOdeC1NIvp41rqZaB6xMVJ6TxOc39r0HnlerAKKn8Hkmtuvjhl7uG22W2eJRooNtvGAzaaq0v
	OPfxQnfbYPoIg2J5+bFeYTup44m09OQXEKYoWbExWYA==
X-Gm-Gg: ASbGncu13Sx7hXVzg6qQvjsHmP2JUM87QJb8Mzc5j2Oo9GbwBw19Jq0o8wpGyROqyB+
	THVveP55T6zTO2RKFQ8L8umBtNp4qYnnQpM7Sqt5fqur7/YLra0RVdLlkYglN7R2nO2LFVo67LU
	Rs70C6VyuePf+/z1k3PyXfvcR+zBulVtXhq/MN6ADzevw=
X-Google-Smtp-Source: AGHT+IHDDQJhnWX2kmTO5v1Pk0nimoh123FoAZWbqbQl+FUgai9VCQfwTjo/Tn4PNUMetJyi+2gPAW5SomZT1SLUvWQ=
X-Received: by 2002:a2e:8a87:0:b0:30b:d05a:c103 with SMTP id
 38308e7fff4ca-328077a2e75mr64717311fa.29.1747778957098; Tue, 20 May 2025
 15:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
In-Reply-To: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:09:05 +0200
X-Gm-Features: AX0GCFuwZ5Uj2GFu8v9SUCd9XbxxK9oH9Hmv5mkp9JeCnQEfeHNWxb9r3Wl8bto
Message-ID: <CACRpkda6D_OayG2DDFG6+sQ5vyYCrTojHs2H1ZVUMw4rpbuC9g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add 'ngpios' and 'gpio-reserved-ranges' for
 vf610-gpio driver
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, peng.fan@nxp.com, wahrenst@gmx.net, 
	conor@kernel.org, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 5:44=E2=80=AFAM Haibo Chen <haibo.chen@nxp.com> wro=
te:

> Not all GPIO ports have 32 pads, so add 'ngpios' property to specify
> the number. This can save some memory when alloc bitmap for GPIO,
> besides GPIO tools like gpioinfo will show the correct information.
>
> Some GPIO ports even more special, e.g. GPIO7 on imx94, it only support
> IO0~IO9 and IO16~IO27, so add 'gpio-reserved-ranges' property.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
