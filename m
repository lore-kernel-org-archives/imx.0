Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4156E311974
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 12:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780470; cv=none; b=gm1hXN00KH9Pc4pGg24615gStfM/E8XNcPTYa4QnJLrl32lpH+NCMnVZyqwtwybNsqs8X9JF/16KTrxxmHISKzuKDACHvoilYWut7YAYFViGto4mFXYXGCdXQviA4+KfJU46YNkl5xjz80i+L62QsZAhrYEG7uh5xWsJivhQuIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780470; c=relaxed/simple;
	bh=Kww3Z8XQpKUqnrzv3IhCXTW3D/QqhIcasmUvK1+uYck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lrFLIiC15LSTdjkSQtlI33Dy7wyc2WwgWre2kXAjLqMQo3L6cG0+UR+IhWHuG5vw6mThR1f/BV+JT2tAEoCjXoh5SnNhqbe4XB7+LrcGLEDi/WWD8WrDtoGhV5iXis2PlIMy/Vv3qMOKcay1i8ElUIk+9XeKM+oxPmNGcppHhBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eci/Br8h; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eci/Br8h"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6188b690517so1217353a12.1
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 05:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755780467; x=1756385267; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kww3Z8XQpKUqnrzv3IhCXTW3D/QqhIcasmUvK1+uYck=;
        b=Eci/Br8hYk6dj+Q4kxkBe3RHQJ66B2XbZl2jP2pYi9ziiTu57TPlG08OQxrsdguXxc
         lcdb9RIp88tDswaXEz81DAhmzUix9BYR6C1UdIpkZfH8C7sD5tWYwoKpR2KDl0PMlhAD
         fU9IWtR4Es+yy5lTKc8A1IZ9nWSTF0ThmR55+9MKts9Fwv8GM7zq++fuQOPlbNe0Qb3V
         fk+Vid0hXqk9vC7zbe8JQqCNPOgvpwD66+5WVTykeHan4MPEk34yt5cgadzUx7BefOEt
         z1+t2PDyophzqBz4NdmpO0i9DBU8CIQc6/4b5yxq+n3gfeh93W4BPP8H3zo8T2IeLnpr
         AW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755780467; x=1756385267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kww3Z8XQpKUqnrzv3IhCXTW3D/QqhIcasmUvK1+uYck=;
        b=p+urJjPU10fVDmPWGTRlsKS88k8waqg1Fk8UKQPDl/NE2Q+grKftvMTYCpMWk4tv2q
         jawlDLAIhSGGlYWLshtAg6nIRjb8VhOIYTOSRdLyQM5qzWJjv7ku3xSm1JjjiW1C1pYX
         iaQ9q4tM10EfTsh3PYq/pNUn8mCQJBIJn+aUknMdK8N4yNA1eaJAiv0/BjfMOazamznK
         S0yGGY7siNbKirSfHUMskkr2Qpbp3BbuJI2c5J94OhdERHW4/osKKimzjuVZIsswGtwF
         BhSNhgNtbhENrBxr5o2/hdRr6CnVm7rQ7KHUhZezSNnb0dzQOqIT4Qsae5tDAV5POSCU
         MVlg==
X-Forwarded-Encrypted: i=1; AJvYcCVBvh5lplZzAi3vrmclLU2mutjGBLTiQ/3yRkym/bF5+zhls3Cx8V1QKrzXMUzoYUcEVj0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPxPjtVBVqhlfocn36CCupHMt8dmVM2mjN/ZdJdxIoqWXW839h
	qD/OWf1T/7bhtS5+Ml7vq5qNkB8oz5LFJmm086CebQYuVCnpSuYHP1m2FeGx8qBg8lf9ZwxVLmc
	E3gFXxQ0NKxlwtMMAJ8Itn+GMuHX3qU4=
X-Gm-Gg: ASbGncs8hO/Y/MJEYQrvyVbxADfP3CyHCaeIg7iNoSWLjBssRuFUtOz4KsK1ovIfudH
	2BJ3iR2qOsYZBfKSrag17i457YrUsbMp7eRNxpqkc5Evd1cAyRLz2LVR6JIoqaRtzKrgcn1HODP
	y6ifSYlB76DZxU9eN/mjAAoDrgUWG3RR91SqKAJWVKbxOdWFYjMXj5SlUsCWx9+nNgC9Dytq99d
	iDZg9RLTA==
X-Google-Smtp-Source: AGHT+IEPEbjECYdBW0nd8xX8lWG/FeWz08nR/1JcSgRS+BCimYdArukTA+i3b9djOGPovIzmf+wskUZ5f9vMyM/jPZM=
X-Received: by 2002:a17:907:9711:b0:ae3:5e27:8e66 with SMTP id
 a640c23a62f3a-afe07a7efc8mr229517766b.27.1755780467264; Thu, 21 Aug 2025
 05:47:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250821080723.525379-1-zhao.xichao@vivo.com> <CAHp75VeDvK8cOr=rVGj_hVX5YzXM-UqrWRBgUrhiA1wzYn7C_w@mail.gmail.com>
 <CAKv63uvfHYATd7ZFweZ0LMfTLt-idHVgYJqOV8PvzaNeigbt9w@mail.gmail.com>
In-Reply-To: <CAKv63uvfHYATd7ZFweZ0LMfTLt-idHVgYJqOV8PvzaNeigbt9w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 21 Aug 2025 15:47:10 +0300
X-Gm-Features: Ac12FXyAa-NWG2kjb3jWIL5sg7tG4bcy5ylXKO82itEKrqXswF6DvDsUv85LdDQ
Message-ID: <CAHp75VdL9kV2fyi63zqPZnW4CaeYPmJ74tmGEgU=M7FSYBv0ww@mail.gmail.com>
Subject: Re: [PATCH 0/7] iio: Remove dev_err_probe() if error is -ENOMEM
To: Crt Mori <cmo@melexis.com>
Cc: Xichao Zhao <zhao.xichao@vivo.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andreas Klinger <ak@it-klinger.de>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marius Cristea <marius.cristea@microchip.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Gustavo Silva <gustavograzs@gmail.com>, 
	Tomasz Duszynski <tomasz.duszynski@octakon.com>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Per-Daniel Olsson <perdaniel.olsson@axis.com>, Waqar Hameed <waqar.hameed@axis.com>, 
	Yasin Lee <yasin.lee.x@gmail.com>, Julien Stephan <jstephan@baylibre.com>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 2:50=E2=80=AFPM Crt Mori <cmo@melexis.com> wrote:
>
> Sorry duplicate - as I commented on driver.

Yep, answered there.


--=20
With Best Regards,
Andy Shevchenko
