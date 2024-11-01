Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440CC19C546
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 11:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730462183; cv=none; b=NmssAPsgmNcYaTisdqHrfev4RwicHCKO5CkYl85ocUVEcqCmegLrZdGmM9o5At2+MtmueX4Wzrsp7r4Km8VqMqVx3Kl2k7gnu6L7moJirFVWZOFIlBBy4gVIOTTvY6OFg9bW9CZHFfZ1EqQw3xHG8IWV8tuIsr0rDpvfG9AHJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730462183; c=relaxed/simple;
	bh=1Uojm1GMg7+SmttJF2ZuBBVhB5ST+uLPitvJ1/9BMXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IAwitK/xSf+7z2B50unX4v6LogVQ9WFVFzeq8fMcGU56Efqa29w3dFod+n2GTkPz4wjnO9XA++g6lf/R7UzlBzEioIJKkwAf83z6eGBtZ13lNBIvjnuZhqRRs+o4PlsqS8gI1qLDPanJVYoU366EB5pEL34RX34TRoSoSMbjJ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BuVj/afN; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BuVj/afN"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb443746b8so16410971fa.0
        for <imx@lists.linux.dev>; Fri, 01 Nov 2024 04:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730462178; x=1731066978; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PR7nhijIFPqEwqWUXxfWpQdSj2cyoar1EyPI7jC4FfI=;
        b=BuVj/afNFMXbgZYke6EegmTi5tPL+xF+gnEqaxD2NtOQBjf6ModDA48PT7Y019GV2i
         YVgvmsA0/joBwixCTaewlkidIAQ+5Q7rJLrTjL6qmZWFiBTsw2Vqmrxwa5Nd05CLERGo
         tsZUyxyp9lMKeG1o/UyaJELWhpyPKh25eU3uIGomzZpyUJnepouH4ABXNekpsBVNaCsg
         db3c1QL+OfhNkdCiaX3MwDJBiFM9bB76bIGD6ev/qMwbvWjThBCwheYT+VKCLHWHLSvF
         2Aj6yF3E9IgLfGXp/z09PJjA9/RHRpH2LARmhhzvOTv5FV10m1v1qsCVTGAPwpqUJoGx
         1NSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730462178; x=1731066978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PR7nhijIFPqEwqWUXxfWpQdSj2cyoar1EyPI7jC4FfI=;
        b=wNMnK0gLB07fOzVC6tehHb+bYy2h169KFgunqL0gZIftOZPvIw6K4CQkTlf+Zq/v2B
         K+GALG7elWsTD9QkJlrLxsAgFIXlwbVUmiETgt+5zd91qV762X+AJ2zVrpUoY/+AjA4G
         zwnlnX66laP7vNbr394F3Prqy/hqTmu7UNHHj6SIMQVfviDs1fu7mrHX8Mq28wU2lWfq
         22aZrDiHcMgoCYhoCD0v8fu3uE+x3pmlcKAgRyPu8Aj646TOTU9xFcQyH+Z0Vmhupkwf
         5//cpPPMCGCTCeANYpiPCNBEgFToa3RnTFXvTNtj8AoDb8K2VfXXnDx6WhA32QAzaixW
         TZDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqEl7JilzHjEpRjumsORFal8FLJiZhlHmk6r8ZvgINw97F7Nadr9m4Oc6A6qKu+0WDtbk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmCAZstJPrIYBZUmjMjSr9JomODZwBB4NlG5V2lF3+46KAK9r8
	LcKaGYyIDIM85sqf3ny2KC8I9yZp01sfpHWVWNJYf2+mqCrTtPheBaHwOgodQ0lPaF5NnRgZvtN
	oqH0rBbIWYxZd1z4jB3EhkY2IFSE14aMCnwlxtg==
X-Google-Smtp-Source: AGHT+IG201tjRpH4xAJy3js1MXvAZgMS+IPv3AAVo1TZLrpjjIYjlw9AiqUvvc+CIbPttUv3zlvfcUINXBzKPHjno0Q=
X-Received: by 2002:a05:651c:211a:b0:2fc:9550:d658 with SMTP id
 38308e7fff4ca-2fcbe004950mr124110461fa.24.1730462178345; Fri, 01 Nov 2024
 04:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Nov 2024 12:56:07 +0100
Message-ID: <CACRpkdbFQ6f6xg906ZREOgDifSWwfFWdxCqDxcLALZdYg6PWWQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] gpio: siul2-s32g2: add initial GPIO driver
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 9:06=E2=80=AFAM Andrei Stefanescu
<andrei.stefanescu@oss.nxp.com> wrote:

> Andrei Stefanescu (7):
>   dt-bindings: mfd: add support for the NXP SIUL2 module
>   mfd: nxp-siul2: add support for NXP SIUL2
>   arm64: dts: s32g: make pinctrl part of mfd node
>   pinctrl: s32: convert the driver into an mfd cell
>   pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
>   pinctrl: s32cc: add driver for GPIO functionality
>   MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD driver

How do you want to merge this?

Can the MFD and pinctrl parts be merged separately, or shall
it all go into MFD or all into pinctrl?

I can certainly merge it if Lee ACKs the MFD patch.

Yours,
Linus Walleij
