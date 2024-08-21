Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAA314F9F3
	for <imx@lists.linux.dev>; Wed, 21 Aug 2024 16:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724258644; cv=none; b=KK5rtqBWLts9ZvsWEG0L/6zDw6obI5tOFHRkHVufoVhzF+8HA14w29P2OIb7LwuHhfWG0EJGmKaT/Ygqaf3vU4/QjYA+WuQ7H/x8I4pzJ0IpNeJZN2N4UyxLsbbdQEEohYlPCAbCbBRKC2yfNHtvakpyTGQ66O0/dY19J5gfKB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724258644; c=relaxed/simple;
	bh=sEnyaVCxeTo7fogPBKiKimrrhQPVr0UrqigxywBdCqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Peeeaf2dsQrEs+5/Zz7tDvGbaQ9HpKrVN/VL2LbRlkAn/p8KI2+57yCdFoui0OM636xGUZqN43LIa+NEA4OfKNmgXoAcVtz28xLVPuJr4BXXbmaUjb/FOc83xIbk/0SG1rnPzP001FxY9AnCEH6JC5D0hKZIwByI9FsiBdE6Dvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/qyDdmm; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/qyDdmm"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5334879ba28so1178295e87.3
        for <imx@lists.linux.dev>; Wed, 21 Aug 2024 09:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724258641; x=1724863441; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEnyaVCxeTo7fogPBKiKimrrhQPVr0UrqigxywBdCqE=;
        b=f/qyDdmm3cjc6zEdMbEe6uK5VGJLzBnsP4D3E7XvP+TQR1U64phlru30ZOfqycfEQ9
         BJS3llmjKawv1G+YGqW0teIHeSlCj8wdEO2rj5HcUuLA/bJ81SnvGkh3IIvI+Au0OfDC
         rsDWMe9sSk8ghIX9rVe+UqXXDBs25YzQRIDud5qnkEP1JlsQ+6MYMiG/+5EUi+2OKdSQ
         cTMInejoE1RF6JTjeSIo461zGYOz7svoOIElfXOli0J3mlVud06sSdT4OMQXosZRe+YI
         GEvtDeoIDrv6AUriMb+rsGyvcuGgawD9Litjke8GsskVy8PYYWE3mZrkM1DMyQYjIEjb
         ZEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724258641; x=1724863441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEnyaVCxeTo7fogPBKiKimrrhQPVr0UrqigxywBdCqE=;
        b=hQSJ3uOg0A6dDeo8N0RfCfKxnjz8U1PHX7rxxJYnTavjFffQsgb1C2VZ1oW7QakuD/
         qW+9G/h0r8cstHwnYI7P9wFSVPHDyVofThtSfaFzHG8BtmdtgE0BTVgnn8kv2VdFOVTb
         T6xFULo4qBnOqNPKfaC8JLwA4x4o6/ewDwocJaDA54Thel6UYi8raaFHIgx/AY319ckf
         Aa5ny4X7BZLq4/LaLPTN0FVvVoZ0xKRd4gK6QtDr8pwmXHSzy+P4E4MrMbGqftRpQVBo
         wS83xNPjqO/LdwtApTt1/e2+VtHPpx/Nnz3AmZMaz5zDXHzFs+tEnMom9UffNJLItCFi
         30LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT3I8bg3TdItaHprS3JG3mkW/cve5VvcJUbhoiWbJHNRjkI1A+G2szmtqf8OR51DZX944=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRxPjcPqotecRJN2XeLeEJUy68Q9NZyIHqiyTQdmn0RQ9IbmfT
	dZdUhu/P2D5SzBGtNSSm/9k2S8+ADm95N8t8Mxn+ZlJmYy1tY5TYE5+NKkIQFeELkGcde3+G2wR
	ruWZl8adxL9VjJ0YKTjM0PNw0Z2I=
X-Google-Smtp-Source: AGHT+IGc8rj17D69zG/VL5kmvymbTbJEZ+tI2QgUHXTXpBZk+e3xvP9nOTqIPmeJUEePvoo5TEkBh4VQJE2KqOlRF10=
X-Received: by 2002:a05:6512:3d09:b0:530:e228:7799 with SMTP id
 2adb3069b0e04-533485bcd97mr2196989e87.58.1724258640875; Wed, 21 Aug 2024
 09:44:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819072052.8722-1-eichest@gmail.com> <20240819072052.8722-2-eichest@gmail.com>
 <CAOMZO5CYUNESmBdZBMSMwNraQbqvvsF5fn8i+nHr=MB_T_AG7w@mail.gmail.com>
 <ZsX8KzkQw0wJUCbc@pengutronix.de> <ZsYGbN36jwxyMAvE@eichest-laptop>
In-Reply-To: <ZsYGbN36jwxyMAvE@eichest-laptop>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Aug 2024 13:43:49 -0300
Message-ID: <CAOMZO5DW+Wz7AWPJCBXkdaMf3NRcZTAmj2Wo9rvwnH9pDGbSGg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master mode
To: Stefan Eichenberger <eichest@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de, andi.shyti@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, Frank.Li@nxp.com, 
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan and Oleksij,

On Wed, Aug 21, 2024 at 12:23=E2=80=AFPM Stefan Eichenberger <eichest@gmail=
.com> wrote:

> Thanks a lot for testing. Are the other patches required as well or did
> only introducing the master mode flag solve the issue?

Only applying this one fixed the problem.

> > It looks like with this patch, the I2SR_IAL interrupt is not cleared.
> > I would expect some kind of interrupt storm. Can you confirm it?

I have just inspected 'cat /proc/interrupts' and no interrupt storm is seen=
.

Thanks
