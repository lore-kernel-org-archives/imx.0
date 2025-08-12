Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048E02E7629
	for <imx@lists.linux.dev>; Tue, 12 Aug 2025 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754989625; cv=none; b=VfEmcHxNkLMZTMA38hv60nWWRvijfw0ztyoBWDHWHkIrSX+V1Up+svJShvjjBJ3yKSMd0EGhcttZkx4Wryr1OvpnbtyUdOC5OckdUQTtNVZpVYL/wkqdJCBbhb1JoZ0BAZHIdaUpZJ56jSCeBRHs2lasFrdr1Sdjel4hECp8hU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754989625; c=relaxed/simple;
	bh=aELAU0xO9WCQzlDQodYCe/e/6u4XRmODgZyX3/n+xdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gl04TMK2gUudM0zgefypnxR0cTUGE1quw/dTH8fv1Im27Lj5XFKgjb60FZ/HDEULzVuVLnvE3GXHCGkDhoS0qVMak/n1DLLMFepCN4zzTjdsCIaADOeHHt5upYeKWbS0ZVebGQ9MBGSDRfj+GhURlDQPOdarUuP5ik6VUFFplSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VR4L89CL; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VR4L89CL"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-af9a25f091fso700239666b.0
        for <imx@lists.linux.dev>; Tue, 12 Aug 2025 02:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754989622; x=1755594422; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aELAU0xO9WCQzlDQodYCe/e/6u4XRmODgZyX3/n+xdA=;
        b=VR4L89CLrAaBkvIwc98kRtz9mHsyqwd8smjAQpbRWdz6XhV7bWWkdSuyMyHCngEhZo
         uWjKK9XQpFDA4B4fCwhFiSa1P9uhpt3buOz0GGWUjKcHcGTbJs3VaqdZYKl+9Fc53Sp1
         1vKTGhqbFXelVIvXXcAeN4kYylTYGhsntFnLxxOy26Q67vD74PF7tkUQNskFTWOlQ1vk
         KEDw+JiL1mUq6nMUBSUdAeOfHpXZg83iolQWG9Z8n6cSs5rA4u3aMGR+wFZXBnE9yAR/
         GOOwc8wYdJihzfsuXsWzUt4BYRs+OyG+mJ8XjGDHW+DfiGSF0RKY34VlEQ082fgbewIE
         Nwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754989622; x=1755594422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aELAU0xO9WCQzlDQodYCe/e/6u4XRmODgZyX3/n+xdA=;
        b=AEVaqZ++hD26FhJltvQIJkRNN0iyx79PeeX4BWgf+e/XqIKxJKSgmJFEWVBCIAGPch
         4XedbIohNmu6NEAq3zi34iiPSBzNQqiHlIrBlL7R8BcZ2Bg3YgHW6dltP8tjTjLxwSCx
         8/KkAvwChgqCSRjh7drGjKPeRCBwJ0lxKuVjbefkwCHLkzNLGJHC6vB0vaynAnNQmv8O
         73P8+CFkIWV96lfArrNcgSl2OBIuoRCSXZeh2FjNeyFkUhH7CJR0IwL3mXoUKlKuCsyu
         4mHXwPTyN6OHxFyoe7zKi064oOUstb4iFKcuKZtJdVKqKQ9Nq+7iMQBdG4jp+4Xnh8Bd
         JTBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKbf00ZSMyG9Pw92ji8qvAlLuWYKp5uoqULIn5qWsqpIbkSzQyEKo9//fLSG6265RuH3E=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywps98XafHa+OjprhnGq3v1UVAixvL5uyoWtUVfYEFvi8CgIluc
	ori/tqx2Vebf0XonbEPMZR9TsyxE+qUZ7xr1ZK/3OV/M5KBJ8+J2A6OilAAVylw5zrIOisEmck0
	LEsYE8wQLbz4l9PQTQWYdcURI5X2UROk=
X-Gm-Gg: ASbGnctNIC6KAKs6Zc39tPOQVIJ+7XElxEoK8lpYNjh41UrQ92YLfaJPoV9o29y+feA
	hUVqM97RQY5Hant1jrUuoMpAUQjlkro2xaUIU1l7L+vuhdlAmuCd4Hl1SBJachcQvgAeOEmejBK
	wRGMfpONbG6q1QVuDsnXV3M/7Z9J2YgecViyY6N4O6JfLJpv3bGeOsugHfgzqZpFWyMCBpxkUFi
	zBtYg12fg==
X-Google-Smtp-Source: AGHT+IHwJkNNhHLywqfSPYJXYdJDdl65CBIyoMCDmR0B39XH1dI9WmEu3RjwIKF0CFgvYLwlX3o/8962BYxHWt6bfIM=
X-Received: by 2002:a17:907:787:b0:af9:45ad:2a3e with SMTP id
 a640c23a62f3a-afa1e10105dmr246353266b.44.1754989622099; Tue, 12 Aug 2025
 02:07:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250812-adc-v2-0-0260833f13b8@nxp.com> <20250812-adc-v2-1-0260833f13b8@nxp.com>
In-Reply-To: <20250812-adc-v2-1-0260833f13b8@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 Aug 2025 11:06:25 +0200
X-Gm-Features: Ac12FXyX_4FNVjRioSrZAzjWhbMWY63pybVPFgJ1OZyn5mocEBo4lC_tirfWAEc
Message-ID: <CAHp75VeYxLBwH10Z38Ez_TOu4B=1hW+TR+=2wFJHur65toCJUA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] iio: adc: imx93_adc: keep one style of the hex values
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, primoz.fiser@norik.com, linux-iio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:05=E2=80=AFAM Haibo Chen <haibo.chen@nxp.com> wr=
ote:
>
> Use capital letters consistently for hex values.

Suggested-by?
Reviewed-by: Andy Shevchenko <andy@kernel.org>


--=20
With Best Regards,
Andy Shevchenko
