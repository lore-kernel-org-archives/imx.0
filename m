Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3E91EDA2C
	for <imx@lists.linux.dev>; Fri,  2 Jan 2026 14:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767365534; cv=none; b=fVsns8iymqCI9wLcaa7Rex5ROJRAVPkmgtYjhsGJCd9mUfWvF5+G859rKmOl0kdCwXDvLotyiY3YfdPvHGQJ/cFPhd+YrUBYzld4lRCF/spu1IlmtCs7tiZZy68x6bqgcLynNXDdghfdqwmxSTSbFJLO14De3csKbX5ad9jDvGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767365534; c=relaxed/simple;
	bh=JOKW02zFEcJa6YcyzFzBvqiMDmz8XBC84K/tcR6sPXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKJJakJaAaQBEhN8IOw4OUQ0ISkFUSTGEt2zIYimHmqTTm2H5ZHUSdEByxzBVJ0vZ0TVAJZdYyFl23dIFQOlC39tWgxetEg1f9ZfZTSIosiAOTfpMo8unWqNvv8Aok1HD7CqFuTdi5LAUt08HIRyEm4MEXXScgfKqPb8pMkDdhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k41eLEzD; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k41eLEzD"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37a3340391cso98150971fa.3
        for <imx@lists.linux.dev>; Fri, 02 Jan 2026 06:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767365530; x=1767970330; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOKW02zFEcJa6YcyzFzBvqiMDmz8XBC84K/tcR6sPXA=;
        b=k41eLEzDZXcgilYhJLMaDoJprO8GT/JpeQ84ofSNBKw7uQJaw3jdMEum8R0vtDtBJT
         xg/CvBoUzu1G6s/jrdaZHHSpbHa5FYhJCvWf+AHJxNMpBnupKyykUK+UQj6BojEkXr/w
         0G2dY/z82+6iJKm71hx6N7x6tdNf+0hwHQuGxnnvTTxhPKdVWY4i67t8eh+A7+EE8blA
         jwUw319aYCzlF1sWbNGhWfQDcD6uDml+s3qI4rIEyyyYBosG7DPcBj52m7JLo5LiiULD
         5Oe6DftN7cMS3K6d90QGn+f9PRdFAl2xryjsk5L/k4oiGvQ33CdCvin/LqUmuhJz9hnL
         jHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767365530; x=1767970330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JOKW02zFEcJa6YcyzFzBvqiMDmz8XBC84K/tcR6sPXA=;
        b=aPGyF+MLI/OHccU2bVygOEDrdKZAf43b303zmL1qCoKcwL6EZfsXB8UzjrTdC0jTsx
         AE/RqONhPh+DtzVdJJCZqAF1rTeazl2GEBCpJjhFmNTbMkcdlxiyeiIQ9T4uvHrYRIUy
         o/vt8JSs0Y41aCjqS6r9EbQkYuM2ZoGE/QGy87ajQaAD6yayeyz3z09IMHdv2XjycihL
         fceubZ7wRJS4Z1cogFXylbMkQIYl9ass37wri56KDaFJ6BQu5baI8FsWTbnqp/J5Xs1Q
         CN0XZpUOADAwruEfHvAShm2dPxeQsiMNaIs32yiBTAi1FXEGHLfrvSZJBkQWG5eFgVmT
         QEbw==
X-Forwarded-Encrypted: i=1; AJvYcCUZulXxc1XS+5eQF2zsRj3zth3tq7nwujTaAIfgWJN3Lc+5UcMK4/9HPicBTIshQrYe4MY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6/FpjMjDQf40aCjbApYQDjmzQn1iMC5TuSplveU1MyO/yQy/j
	efzZDZF4vlSHLwIRcN8N2Xoby/LqiJjy89vzoj534G3Gup6bOfZA/FOWZSgJNhR5W+0B/cnA09N
	t9+SsuMtSqsQ8pHZq5pj4h0rD30WSr6A=
X-Gm-Gg: AY/fxX4os4NgRv7RL6GpVzKI+noIy81gXbyimPwamVaWDA5Iocl8sE4XmXwU6syjQmu
	AV8ttkuuIqYHCJOdKVT16yZkePF914ZBnonf4lNw5SUOjeKGOhdDInQNaVH/1qiwhZD3WYOevHR
	UjYDNYo7WgktQy9i6e99Cd5mf1bPPt+Rv/YZEq6Aqbo3nUhiwD3Aeq9bvWmmQzHM17KJLFIsXUf
	i+GfB+8NgpwR9Q+a+eg+34t/ZK/m3OPN3/urDB4zsy64ZcgHus/cXEf7CkwcnUVKrztE0bG8C7x
	8mooyndhuJsi+Le7BSD2nFpkgA==
X-Google-Smtp-Source: AGHT+IFGSP0WIXeW56/d36iNW4wftOiWFYzfmmnbj37r9h7tjPe2UQ0ZehS5BUGbIDZFkEsfEteFUqU5FJ239xAHiGo=
X-Received: by 2002:a2e:a915:0:b0:338:10c9:5871 with SMTP id
 38308e7fff4ca-3812161d8ffmr110163551fa.34.1767365529452; Fri, 02 Jan 2026
 06:52:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260101-armv45defconfig-v2-1-3a57f69624e0@solid-run.com>
In-Reply-To: <20260101-armv45defconfig-v2-1-3a57f69624e0@solid-run.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 2 Jan 2026 11:51:58 -0300
X-Gm-Features: AQt7F2rTWtpnDxwUx1NNgMEHsWNfQ04mtquh3qojbl8Oooiz5nLz1ccv6oEyu1E
Message-ID: <CAOMZO5B1MM3FxutDRP4_pWJQYRdGO8kE9hqe4vuSxygEgRW2aA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: imx_v4_v5_defconfig: update for v6.19-rc1
To: Josua Mayer <josua@solid-run.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 1, 2026 at 11:43=E2=80=AFAM Josua Mayer <josua@solid-run.com> w=
rote:
>
> The i.MX ARM v4/v6 defconfig has gone out of sync with some dead options,

Typo: it is " i.MX ARM v4/v5".

With that fixed:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
