Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74A4279DDE
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383539; cv=none; b=YIqr6s0WvxIhq5N5K6/4+vcGsX8gZpd0lFEPlqmemAfaQL1Xr34MtR5CEWpeqJTKWteI+rsvaunt2FK+UFVmOe08MERj/rdCU22MBw6wQxek8vzKY/PVysjYxV6aqAmjtUhkigPPIS6q2cxhDkRCJQP+T0jxbocalt0ZRnLp+cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383539; c=relaxed/simple;
	bh=H69zG5gO7h9M6iKs5G+TtTbg5NtVZiozRw1J2ZHqQt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6ZsG4xnp2WL/rSSR9LgsUxpE8vkzWdN7R/EwwCoz6d+/rHC+TQ0tqFyrSDA+rY+mJro3j3xEh5TVbf+vXaoGm/APW63phKh4tqFpa94kiLw1N5nLwYjTxKrn5a0ba5MTjG8Udg4dxyWZVpV6em0ObhUnq1hbW3HqPk9A5fiIgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQx+FnUq; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQx+FnUq"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fb1be9ba89so34153026d6.2
        for <imx@lists.linux.dev>; Tue, 01 Jul 2025 08:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751383537; x=1751988337; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H69zG5gO7h9M6iKs5G+TtTbg5NtVZiozRw1J2ZHqQt8=;
        b=kQx+FnUq6xsP0JcoBqO72JAFcKFORDhsfPpbHKVKlVBMfzsX4dfBZCXLza4eZuGtUx
         JAyHaoZVOXXOZdfKWFRd1yzcAXNYFW6pbLPz8jh4cAAb7RO3pjV/HAwAu/1DVKbsjXyh
         oBu38rJNCJ6SFY50m8aL6zuTbvTikbaVA3QPDhHf/2qmTPI9jf2auSFjjoLyyHu1QUgn
         2BHGzmFFDOZNbD5Mg6vZfr5jCBP7cm0jThtkzgrKUy3fLG5Mq+dNJmtkIlnDlYJjOFfS
         7lg7ZRoiJKsM677GDyoERvVLp0xC06p1nzTZ2VHnSkSXmLeWUNJ04RtNUbaChL2NBzuu
         Sxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383537; x=1751988337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H69zG5gO7h9M6iKs5G+TtTbg5NtVZiozRw1J2ZHqQt8=;
        b=qqCwccgC0FEjbX2DuXmiYe4wM9bS3JymWRzRBMszW4JLqpOs4NGt2LfRH/sLKGnRoZ
         ohjoKgL0vxL+Jhh8aaFEfcYa59yCi2ewWaYyNnsCQvjmjzZDh7VjaquiGf1Ipv5O54HH
         K004Jr+UnoltejWwK2cm1k6R2N/MaqfCR4K8WXoyFVswwfljLXgba0hTDh4lkx0E/LAH
         J3ChGI7gdECmuPR73Jds2C7o7QK4ic/fCU8rIN5fhCr3EUwmpuGT4eJue7cqdWRhVtvu
         O+nvekrK6sNnYpUsBEcAESfBKdUN/1nhCiCre29E0SGqpzBJNdP8dyM/O6+nPNC+HuHY
         cdxg==
X-Forwarded-Encrypted: i=1; AJvYcCXPQKw0QHso7LJRu7jO1yqpmLGXd2Z4yx1KQ13Jr9+6UOApn1txNpfIBxhb86RJG+2poTk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yws41ud81FIlsbISY6ygDrZF6hWEFDUKp+FQxrY27cjb9qgZ4z8
	PqWWqDaP2JlofqK5IBtdVpDDOWeVxQWSAQZTkxb3POIeSWfrf3+p08l7
X-Gm-Gg: ASbGncut1DbnYgN01bB3vOzwwMABLxe6g6aiwCoKWd6x+lfQ6+CqO0/Mgypns/dyK7y
	yQ7E46MTLOePViy+SG6c8LWHDLCcLQak/ikJE2tR7aAN2ChZWOJo6KOckesJYyvOIV8iRkW+Xq3
	PdI8ruuAi9Pk/cDbIx7CU4UDWge0Wq17l0fK+Jx1ypVJBgNvNcSFJPIaJHA2yzqPus0ou22ym5F
	/92sgca8k5jSSWeIA1Lu5biv6wMDP5LpN1VxB6Y4EOJRXJqBPfNKdIsftN9/IjVnavazxq6jpjQ
	oK20WTnzUW/bDD8oXblT2JTmCmnxXNpW2/fupIMh/4xyhsSwAzl83ukTXhw/
X-Google-Smtp-Source: AGHT+IFGwV5rgzZNlThD3qZhxiETqJeu0UK36HZAls92ncvO2dh0OxLl48BruxfcxiFAUDT+MVUh3g==
X-Received: by 2002:a05:6214:d08:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-7000291854amr270803556d6.32.1751383536220;
        Tue, 01 Jul 2025 08:25:36 -0700 (PDT)
Received: from geday ([2804:7f2:800b:517d::dead:c001])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771acfe6sm85521916d6.31.2025.07.01.08.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:25:35 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:25:12 -0300
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
Message-ID: <aGP92Aqcxt-x78nu@geday>
References: <pnd7c0s6ji2.fsf@axis.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pnd7c0s6ji2.fsf@axis.com>

On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote:
> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.

Hi Waqar,

thank you for the patch. However I personally advise you to split the
patches per-file and remember to then precede each individual patch
subject with the proper subsystem and driver touched.

While this looks like a nit-pick, it really isn't, and my suggestion
will make reviewing much more easier and you'll get your Reviewed-by's
and Acked-by's much more smoothly.

The cover-letter should probably be preceded by "treewide" instead of
a specific subsystem.

Thank you,
Geraldo Nascimento
