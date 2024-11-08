Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45647194A64
	for <imx@lists.linux.dev>; Fri,  8 Nov 2024 08:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731052980; cv=none; b=iplad6DjtPCWIdg4GLVXcAhMcZhA45KsGs5uZIe52JFvdX5jzL9Kxdcva/vYnG88Kl7P2/c+400EBvP7WvVtBz0M5T64NXfqdOGb8CM8LswQrK8MxBWU7TYtH1vJUMm3ATCxmjbveTOy60HzBMBsEGW9gwfiKbScKv9Q8zGmzhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731052980; c=relaxed/simple;
	bh=dUTRSMTXrdg5Zyft5yF6+XKivEJnOQQBelPLhQbyq08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sd8g0HueW3wfUMhwwU0mg38uEUGG02jEP8Kw4XNiiiD6GYrVdNmPnyZ4Qvc/MnZd6tWnYVWCctKi0W9Nc0Hvta4JB15XOESkBYe6I1AbkLk41qe9YY32K53CJbY6YuXdagjVjYUY1yQwz7FuIkdpQw/YkGpaArPRgRi5gmY7Ur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rN9w70+g; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rN9w70+g"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so27642851fa.0
        for <imx@lists.linux.dev>; Fri, 08 Nov 2024 00:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731052975; x=1731657775; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUTRSMTXrdg5Zyft5yF6+XKivEJnOQQBelPLhQbyq08=;
        b=rN9w70+gWAG+CBK5D2ceG+2ouN5wmp7562OYv5BRTM0JTiFtRGfjDhocxgrJULd+MS
         z0EWzGlMU7WugbzgjO1+LNr966TNoLvpaV6nRN/F7TwVphVd2YaWFpaWyeWvNdERSAsp
         PDoJSN4BVhzcH9p6ovgNm5NqbL/l64EzYjXl0RD+qhtuj358D7NQv31FK2RihznRZoal
         ojqC1fD+mKH4ZAtM6X1BdEHZP1UpSSLU+4b8/LZJmpAPZAPiKAA+RkwDTxXJCbM8U9Qj
         d22Hd89QsC39emIEyTb17GsN+kyMx8GsoL9ci3WH16qANg/WuEmu6IwZZsgsZtc5xV/x
         6/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731052975; x=1731657775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUTRSMTXrdg5Zyft5yF6+XKivEJnOQQBelPLhQbyq08=;
        b=RPndqIH92Cb1VJnJzqjW9AC+V7kqCzebo7VY+E1f/IVK9ntkc75XTTooBMZcVn2y7x
         sHiqonDGmR8btIoilzrN6AP8AqYV0RUqkNV4JCO4ZqIPkXoeckdjgW+3tBcvSPsC5dN5
         gZcw8RnvUg8KQJAuxP/5PK/E1HZ3sGtD6UGSPFjxRGsYO19GVOFJ7fKJsDhjV2jwVeMr
         GfC+G+VcZVehjVuCVSfzlt90qzZUAuiZiTxXSYq31P3O1osjPa0OsmPHeZHo/ojUt2qH
         kt06JrhstMKvW8a3TYd2TJpKVTgMbVkcCO84lAgJu72n5msLaFxgWkK7prdu5PxcyAmz
         8GlA==
X-Forwarded-Encrypted: i=1; AJvYcCU3E6+SWPjBc4xTqfPIo6rJvLDE5h4F8JzTHTPzBgV9Cg8mKeJ8F2dcNIO1Tq7s2W1d3qg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKxycrAW8Zt55xIIA/ihOJmlbK996NUIonb139P9PDUUFHDGYN
	R2xOx4FdADNodAmZj7RVS2qUBCAW9hccbmqD61QOzO8KHuGyX2CBJIpskSd//DGPIrrPsL8DHFz
	fbFCeyn/l3p85Kij4E58FxfcjUnO+XwUjBaC9rA==
X-Google-Smtp-Source: AGHT+IHU/p5ucmbmja2ZUVCS8fngsFc6zkmCp3xSAKppUYK59btpa33qjaOf6+2FVOvM6vBZDak2yrRRRPxlKbfHz7A=
X-Received: by 2002:a2e:9b96:0:b0:2fb:3881:35d5 with SMTP id
 38308e7fff4ca-2ff202ac3ebmr11214621fa.35.1731052975268; Fri, 08 Nov 2024
 00:02:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241104194437.327430-1-robh@kernel.org>
In-Reply-To: <20241104194437.327430-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:02:44 +0100
Message-ID: <CACRpkdbiAKX-o3GYqVP5bz_o-GhbvgHLkSDM4ZMXgMMteaoKTg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use of_property_present() for non-boolean properties
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 8:44=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:

> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Makes perfect sense.
Patch applied!

Yours,
Linus Walleij
