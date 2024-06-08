Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCAA14A08A
	for <imx@lists.linux.dev>; Sat,  8 Jun 2024 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717839373; cv=none; b=J0IZobiyPQ8vp1Vgs4q+zG4IiIYc1fmXOfsdJ2dPVbwTqAX45BlaFsSI81leOX/mG0Jyg5OkEDA2k9CqoxglLC/es6b2WM+sojtjWn1PEepnoYHAkgYhcsrPMWXqxd++ASwYVSzSEkisL8BVlyIMCEsfAg1yLtBglyMdIMmmY2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717839373; c=relaxed/simple;
	bh=goessyviepfEIsM+UYb23K12749lSjnF+XUyQxOU2mM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4M6I8opCF34bi2C98ferQ2zOf9Tozx8hIoLLkRXR+eqzYU5XmEhLgaffv7eLlJqmXPw25enDCkImauRvoAaFMp9LcMVsJt4GdWjMp8aS6QK0JWQiI62HEhvSyzoC0F0Tc2A7P+nKPRCy0aWvnONQq/K+7WGmXxGGmapYCpwTXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RdQpCMiT; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RdQpCMiT"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52c82101407so225863e87.3
        for <imx@lists.linux.dev>; Sat, 08 Jun 2024 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717839370; x=1718444170; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dLK4U/zsCgC7lAJ6QInCaQAz49ZR7dRJlM+3CmdQqs=;
        b=RdQpCMiTQMc7u2w13wMl70boeU6MuysfXgbG29TzbjC7n4ubgbXtFa4RZnh5Og0aTl
         +y4qT5cAOYDvYzqedPHI2S3MqbOCIrkz+GKXkbhjJurpVSO7dHUeHJWG+u0A9fSg8U/v
         84ZNnBgEKMPJu6tIZmozR5WzCYTmsDmWaaR3nSrzRNxn+5fnWXSuqN15TD2ZmicHHjY4
         gEbngOqjqPz+hNh/oHh3Hf91hfYwjnY3rLnE5ukr5Qhb5GEl8aMBrTQcuVxt7/SoPHyq
         U5mO3fYgWBP+AdnUcqMX9D0gwRMl90hBGtc93+xzHuowKSdPDwg2Ul8jzUC0Sy7I3IyF
         f/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717839370; x=1718444170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dLK4U/zsCgC7lAJ6QInCaQAz49ZR7dRJlM+3CmdQqs=;
        b=tr1mPbKILxyOxDpYR+BsVcVdqARC7OhaLOQF3pykaINfFRMyM7MlXX/5dVO8TIqc4T
         M7rqS0u3SwEiIW6MAJ4E3YtJnk7lYc9wd1skQEBL0tsA7PPhBNnNhspefdPI7hooDTqL
         tyuAeap4BJPz1uqnt83xCi8xT8z7Js+N3ZbCDvySrAqyVXsbVtbhmEwfSdIYu52iwxQ8
         PkpGTNZl2f8uFPzOTMvw3P4iBuCgQrsgUCxIwn09HacEIM6sLQj4f23CHT59UsaOSfVb
         Q07M7sey40YVTrE7lgT+AWyeAo8eyjw+25H3sOkHXZ04OBb3G1CPd6Omt4RWMh1gZ+b/
         r2Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUcxAumDYecs+DiiVdJq7sibjNj5QoRqs9gnItbd9bSV7FTmXp26LfU2UA0w/OF4fP9rJsoWaL58+JHPH7CJjB1brxv
X-Gm-Message-State: AOJu0YxldINiz5arZLSnchfnFTd0EfnHhdxXEK/c1SuP8snikZRtyUhh
	oaXept9KYFu/RpoHy1EcnEjPKbalkJFb5y0UHb0IrqbydpcoBve9uhgjBPt2K+S7quT90D5auaV
	hqq0NOReVxGubZKOzk0rrgk9eXZAyo2dh12KGb+eRUKZWmVNP
X-Google-Smtp-Source: AGHT+IHQgvOPpFVLcueg1yGWLP/6phLPjHs6Xt7bTzroWwvjjr4VCzhEG3OUd5INH7kP5xDdZm4xJs34PsQfTymwxSU=
X-Received: by 2002:a05:6512:401f:b0:522:2ada:c02e with SMTP id
 2adb3069b0e04-52bb9fc6017mr4575709e87.53.1717839370326; Sat, 08 Jun 2024
 02:36:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
In-Reply-To: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 8 Jun 2024 11:35:59 +0200
Message-ID: <CACRpkdbpL=HUXj0hFAo+JNki_RA9aix2sW1cg13g9=89d93PZw@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 8:17=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

>  There was a v6 that use generic properties, but at a late stage, NXP
>  internals decides to switch to fsl,pins property to align with other
>  i.MXs. Since new properties, drivers rewrite, I start this patchset
>  from v1 with a new patch title. A RFC patch for binding was posted,
>  since Rob said he is fine, so post this patchset out.
>
>  Whether v6 or this patchset, patch 2 is a must and was not changed from
>  v6.
>
>  The pinctrl stuff has been pending for quite sometime, I would be
>  apprecaited if any quick comments.
>
> v6:
>  https://lore.kernel.org/all/20240513-pinctrl-scmi-oem-v3-v6-0-904975c99c=
c4@nxp.com/
> RFC:
>  https://lore.kernel.org/all/20240520194942.GA1374705-robh@kernel.org/

Patches applied.

Yours,
Linus Walleij
