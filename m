Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C71277C81
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 16:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387146; cv=none; b=JAzNBCp2BnkGUMFoXqOBoHRJzQyQNl7mpPqENGiTC3ZdAkoMdhIBYv/cZe9HTny+r0UOvDEL8y+/X2DqhpLDSfh+jkECaeK+9lqirSr8dWKLDXNxd334iVCPS9tN3EO7PubMHcr0yDE6ZUsZsSqYhYnkiKSqwSZTGvM2/c+uQNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387146; c=relaxed/simple;
	bh=ZUqpZFwfZJt5F5fCgCl/+TyIxH9HhSMeCYCIU8CIEkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=polFHdK2v9tASY8hdUCeKW+Jc7G3/mnY8XsP2ujmUISG4lwqHmM+SgB5Hqt56cTI4IwmDKuiE78Y/nhEW9yFKQzdtMnDyBf02RJsH+aLtk84WRWvMvW2eAx9eB+rUQWpay7pp9vlpqdkajWz75StrapS3FK4FZyaTu0zqdopdZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihhZv6XW; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihhZv6XW"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d219896edeso621537385a.1
        for <imx@lists.linux.dev>; Tue, 01 Jul 2025 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751387144; x=1751991944; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MwCrqmYe9TCJHuYWG2jCcUWVn5259lJARsV/a3PINFE=;
        b=ihhZv6XWhSOclh4yzNy1DUzm/dJWy6fddiCIMWBD4rAK30IO18hEmuYT3UugmZSTMS
         YT9OU7LGfWqC5gZSfswpbXwN5UCjSdhNNumupGFCHlGEhqGfMPRL1imr54ixDofqfrLS
         bY5T+EaWKtosi0PdaKZGh9m8tpu5nrW0EK9Kz0IWmLW5DPW7Y2N85cn8emhN+B/nSC4d
         NeF/bOmx1m1e47MqJNy+xeO+auoCUjDPLNZYK1imdOUnsPvUCuR3BCnWB/a3bDWJTrrf
         knxIwHfg1rv/GUbPBZGonCLFWP9GE/rJmgcFwDdQDSMXnzjuC53Qj/RBzI2no9XYWy3r
         edUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751387144; x=1751991944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwCrqmYe9TCJHuYWG2jCcUWVn5259lJARsV/a3PINFE=;
        b=ahsOf4vRL6Udu6SfRjMBD6is3tyPtgVwlwKE2kySwxA2VhAD/PSZkoodLzrEPjhm4b
         Ur/fEdEUatUAVXi8MzQdzUJ/bzdeChsOM8KKVs2/MV6xgc/YbjK49YE+G/+vX2SdSpIo
         WdV5efF95Lzp25aJTOmqvLE+4J9WBLt8A+32Hf9xug0u4cdyX5eqxxxBnC1tnDaSBuuL
         HJWSFBJNFTsq8oUWRgQlxompZSN43eOzMSMQhkmox5HbuNLvif4HvyTTMfBh+XsqSdeN
         ptIhU7RZHq39R1KUwyo8u7UqVVCHDJLr3h7F/Od8NjObzPM+C0O0OboWYbMnn60ugaJe
         Q4HA==
X-Forwarded-Encrypted: i=1; AJvYcCXqHsUTVpKphSgPJC6awetv6lojizc4PeSDcSbSOUjNjqfQfkj3/Lq4miola4PHdOuTHbY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsiLOW6mNjdMvTBuVvHKXlw7FS6nbqC9EHPmH2HwhxzmWS31bw
	s4bNw2AVIdKjhN/QnioRBByPh5Nsv7FJcZIuG4e+NTWwzqfKqNgYbtdX
X-Gm-Gg: ASbGncsNRGY70XCxcOpXKrpdTGw+yGpdx8s7hVpaZ4eh7JV4wGCEaDDm6ziCcLznwx+
	THzbLM6P0AJQvntxEmSFJmVFUpZMj6DI+z/ebQbiMq7ryq7TcR/hksPCiiOEf9AiHgxh2sHiVpw
	M8itb0Cr63BX2voMFZtV7b8O3YOil6G50Adjrxa+AmIS2embR3aVFdZX7ZP78nAGXk0MzZfF3x3
	St66l9Xsdn+8dZm+/xHOrEqDurhe3FSJsqGEpadeZZKSliE+j7klKoLDBjQufMev2LlAZA6M39U
	09qJpC6mZqrV53BGMCH4eQU0HW/kZxHi/wVFHU8gTCzepkR7ig==
X-Google-Smtp-Source: AGHT+IFaquJkOuj7GD/t4hRYC7j2CE8mxqIujMtOYOepN4kjeXyf+EKHtvQBv03/JpyXmxYQUG4sHA==
X-Received: by 2002:a05:620a:1a1a:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7d4438566f9mr2476294085a.0.1751387143543;
        Tue, 01 Jul 2025 09:25:43 -0700 (PDT)
Received: from geday ([2804:7f2:800b:55e2::dead:c001])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e4305sm86349236d6.66.2025.07.01.09.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:25:43 -0700 (PDT)
Date: Tue, 1 Jul 2025 13:25:19 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Julien Panis <jpanis@baylibre.com>,
	William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Francesco Dolcini <francesco@dolcini.it>,
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>,
	Mudit Sharma <muditsharma.info@gmail.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Song Qiang <songqiang1304521@gmail.com>, Crt Mori <cmo@melexis.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sebastian Reichel <sre@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Han Xu <han.xu@nxp.com>, Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Mark Brown <broonie@kernel.org>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, kernel@axis.com,
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-input@vger.kernel.org,
	linux-mmc@vger.kernel.org, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
Message-ID: <aGQL72Ssa4RHShIp@geday>
References: <pnd7c0s6ji2.fsf@axis.com>
 <aGP92Aqcxt-x78nu@geday>
 <pndsejf6g5k.fsf@axis.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pndsejf6g5k.fsf@axis.com>

On Tue, Jul 01, 2025 at 06:15:51PM +0200, Waqar Hameed wrote:
> On Tue, Jul 01, 2025 at 12:25 -0300 Geraldo Nascimento <geraldogabriel@gmail.com> wrote:
> 
> > [Some people who received this message don't often get email from geraldogabriel@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote:
> >> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> >> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> >> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> >> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> >> return the value instead.
> >
> > Hi Waqar,
> >
> > thank you for the patch. However I personally advise you to split the
> > patches per-file and remember to then precede each individual patch
> > subject with the proper subsystem and driver touched.
> >
> > While this looks like a nit-pick, it really isn't, and my suggestion
> > will make reviewing much more easier and you'll get your Reviewed-by's
> > and Acked-by's much more smoothly.
> >
> > The cover-letter should probably be preceded by "treewide" instead of
> > a specific subsystem.
> 
> Thank you for the suggestion Geraldo! I will do that (as also answered
> to David).

You're welcome Waqar! Note that David's suggestion is even smarter than
mine: instead of patch-bombing lots of maintainers with changes unrelated
to their subsystems through a treewide change, he suggests you split the
patch into one series per subsystem. This is indeed advisable.

Thanks,
Geraldo Nascimento
