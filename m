Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ABE15EFD8
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 14:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718635349; cv=none; b=VVcDvhhugAAjEEUQPk0j8FoBbPcSOzRUgV0z8LVjx8WCe5RM/jtd5ymCam4I6BTpqqgKLCt1H5qtpUBCKNr1K/AQAeMHVujA6AlSeTckgjHy2GU1AV1r1ELIMPpBGIHWrhkzb5W9m2EYwrWPY+Fhn+RcyTJWfouCoKjejsiRXLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718635349; c=relaxed/simple;
	bh=E2YQNX6Tuz8HfUHpOihGxh9fyCb+mnp+I4qgACuBpKE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fup+BB14RM6fq+v1Xn+ASJp346Nh9D5m8G8cYlqALdoxjf0OYm5B6H6BkRhe1TCxh/nqvkbL15kOQMvUJV9KlQpTHR4piqEoXPJ5rmvjRDAgsDitULVSVlBmzRHAKT+HZSSZpUCASZRhFqXtXvde/vM4TeXGes7WWnltSpB+gcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzyFGBMI; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzyFGBMI"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57cce3bc8c6so2410139a12.3
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 07:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718635346; x=1719240146; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E2YQNX6Tuz8HfUHpOihGxh9fyCb+mnp+I4qgACuBpKE=;
        b=JzyFGBMIGjZRqsqHrTDRag81xgkAYUFDykzJ3yvmDJVFUgav4bdmU2h16lpezGQcu3
         I3GaOiAZQnuTpEdxAZRXeGu3SvGK0M9K5R43/5Z+wYlmK0tEoYl1gzdTkuLU03hzUcgd
         wf4gTPy4IZzzaiADczoUkhUZUv9Hwc1sQDS1U5jw5OBntT4OvEM3A84BRcJlum0/x4RW
         r9DQMYAMlDEOmZN6McmYnFruLi5NWvCK2shS7iy/8k5ris43PBA1z/A6pECVwyoEYXNL
         4kUT6exTEyeCoa9l3nAjPlzcbVX5nIGdg6+eKP+zkfVoi3KJUk/l9gAztCxTOZt42fP1
         mikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718635346; x=1719240146;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E2YQNX6Tuz8HfUHpOihGxh9fyCb+mnp+I4qgACuBpKE=;
        b=oCqwQZSclGP6taubdgNjzCFv+sSjj93jeAS5g7wSVv+XsiGnPAlChskblS6YsYCRSJ
         cQpgj/8q0ifITRSzHGoM27xl/RbfpAF820+1hkVn4xanGabr8bJDzROc92LrUmHAuK4K
         byJlq32ayhBxkZeomVHj4a97lcInC9HurQ/tGkhsGMZ/u1X3303VCuFRA2G3XJNluI/k
         4VYjJVil1R/I7mh870GLmtIJWH2XgNjJMgaxEsoe9RSfg5d3xa0+j98ubodGz0/JoJSg
         eOoyrUgZ9G1XrH7gXfuFqwnwm6JaqB9a6WIyPjVxfsBfmffxapsB5yPkCyOoZNWy4wJD
         bNvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBybaSIAwIsuoba2HD3nNJq6x9zVVd2oBctP4m3RnysXAt06VhxxH2rqmlXCWWgiujlP+WaTY79FFtOphYYnRFGTHl
X-Gm-Message-State: AOJu0Yx+SZtgV6DDPi+iq0S+nG5UktZyx94vwx0K9iXZIQ8SNp4ZTuG1
	zvStWZ89fZpSoB3RttjW98QFV5zdDdpuGkWJ2CGBm8/z4AtxrARq
X-Google-Smtp-Source: AGHT+IGkzpQ7qdmk73JHhNvar3yzbeO/0JuLTETghlv9ovmWg6RAvgWc3MKokHO04h0aGO4cAJzoZA==
X-Received: by 2002:a50:8753:0:b0:578:6378:bc4 with SMTP id 4fb4d7f45d1cf-57cbd69d997mr5941494a12.10.1718635346075;
        Mon, 17 Jun 2024 07:42:26 -0700 (PDT)
Received: from ?IPv6:2001:a61:35f9:9001:40df:88bb:5090:7ab6? ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb743890dsm6514525a12.83.2024.06.17.07.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:42:25 -0700 (PDT)
Message-ID: <a818344871a1dd2bf139732a7de9016ece456288.camel@gmail.com>
Subject: Re: [PATCH v3 04/41] iio: adc: ad4130: make use of
 regmap_clear_bits()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Trevor Gamblin <tgamblin@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>,  Lars-Peter Clausen <lars@metafoo.de>, Dmitry Rokosov
 <ddrokosov@sberdevices.ru>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>,  Chen-Yu Tsai <wens@csie.org>, Hans de Goede
 <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>,  Scott Branden
 <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Saravanan Sekar
 <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>,  Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Crt Mori
 <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Date: Mon, 17 Jun 2024 16:42:24 +0200
In-Reply-To: <20240617-review-v3-4-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
	 <20240617-review-v3-4-88d1338c4cca@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2024-06-17 at 09:49 -0400, Trevor Gamblin wrote:
> Instead of using regmap_update_bits() and passing val =3D 0, use
> regmap_clear_bits().
>=20
> Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>


