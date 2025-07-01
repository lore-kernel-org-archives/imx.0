Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B8D4A0F
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 17:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751392662; cv=none; b=MuPLHozvneGpLNbP8azYUc+FYrW66+9WW15x23h14Ky8AC4D1M/mz+oaPHAm70clPG1A1LQkchgH/9j230bW9RfVzx87qFI/mfCLHKKO9ybSQdOAGhiNLs7mocSn5OIJjUEJN6B0lNT4IPdd/lK/W8Zp9PoS/DlRLoQ1qyhySl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751392662; c=relaxed/simple;
	bh=Xcj3t8dS0FcmInmyKWAR0WJhIMN9tZ31T0nM7EtTJpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSXhZya4XURCXoKlKZ2QVG4sUG50x0Ww+OmXOfg7ZBKh8r6EG6kZklDtTW0FsRJNa4Cjk8TcBCwVmpOIDs9KM8w8bAmezXKn7pyvCN0UIdsUlm95N1H2EWBkHWLVdhNg6t51QM/bQfDB6ftINs+mThT6dPW7nHogvlT5g81PwLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVSqrN8Q; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVSqrN8Q"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-adfb562266cso971625166b.0
        for <imx@lists.linux.dev>; Tue, 01 Jul 2025 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751392659; x=1751997459; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXjfR544OdpbJ9besQg+JvGQxJKjojQewq85hiTyzvw=;
        b=NVSqrN8Qqr4hRKo2P2nP31T0pjusjUvRyBTBa+qj+L4zsBKJdhKg/zEvh2D820AQhp
         +ZXXSrJpDr7uH5dlkBeHyRm3/lpaVN+ugZQTOs5c5gpqp9khxdgGlXN4EZpPs/6y9e8H
         0lwUDzmBcaY3ZWZPHDhcF86QxG3Q2CbTdZ3oEoduJUEna+lIbhgD2WUs0DGqkoJ6Uiiu
         LU5Xrep23lJK+ZS33bthZvxDne1rwf8Osv2rXsAk0p6TKKInJ8TpuFxX9q3dZwdUzo1M
         fihz0pU5ARtWc2T07q+s6LhuK0qPO5f59k2xCOXGl6g8SS8yduJp57a74zXQbEk4vaU9
         9i+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751392659; x=1751997459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXjfR544OdpbJ9besQg+JvGQxJKjojQewq85hiTyzvw=;
        b=CLJQF49frp+0y5gzenOHkatzvhjdOBTkdSEjQxXFTqbrRlede5OH+yRPvbtTEN/glb
         oCgbekNebWEnTlWQl1iBEAtxqrkuc6yFD7T6nEfa1YciYKPTrsHov9p6f0+w5656MU58
         Sv3Bo3cDvHzqv+VbeSyRucVqauC8uD5kUI3z9avvZCbULSSu+LxA7knglPL0/OfHZTL1
         mDJKeE+aItaEWoa5wohJNNsoD6f8Hvu7834AGR2olKU7z/4ympVwUcLzZHZwuoNfntfY
         iPu4yGSpxKBaLe/DqXaGblBzHEuyBMtq07jX+B32DqmvbKUflVykPjMc/UBuqImnUxbm
         ogRw==
X-Forwarded-Encrypted: i=1; AJvYcCUnapc8ji6Ym+L0LwUnwR1IreHO47ConwVb0efy1FS8Q6atv206d/M5bGcO3q7P2ewI4Rc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzV3w0+3b8MRPNB9RIonv14tnnJrWzydaL17a9YWGUn0LK9Mog3
	KL9keTLdCUzx1bBlfNM2YqIp0hLug9A8ItDsevFLS3gkLcy8P5NKZN0FVW8qMMefRSvDEOX2dSO
	FaQz0Gw1YgF0F5Jsov/QIJ3ArabxKVvU=
X-Gm-Gg: ASbGncvSVvXG/4kj8mID3XCU+DhqqxYVsZAt/4nzo5FFimyUqpVTgGfuF1HRor1qaPw
	78fE9Hn3ZYjvrysK6DeNV8Ff/zJDTAH3PLRk5o+gBSccDFOXl/23jlp9nkNCxkIRcbe+QTYNtmP
	2S0Dt5DT3KeeCAoRonAMt4jB8+W2jOEOfaXjb6BVjfIIY=
X-Google-Smtp-Source: AGHT+IFi2mQZLuvuKUJ5Vmbx2bMFhgEtTB1rODdhMnUJkkTAqMfdBOcO66FNReafO5ChqP0c8B6r5Lro21q2uCkd3k4=
X-Received: by 2002:a17:907:1c18:b0:ae0:4410:47e3 with SMTP id
 a640c23a62f3a-ae3501a58a6mr1915225466b.51.1751392659068; Tue, 01 Jul 2025
 10:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <pnd7c0s6ji2.fsf@axis.com> <ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7p7eeo@qpuddn6wrz3x>
In-Reply-To: <ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7p7eeo@qpuddn6wrz3x>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 1 Jul 2025 20:57:02 +0300
X-Gm-Features: Ac12FXyruF9twzstORuqQqTbcXFq7Oy0k32bhmiSfPFWKw8o7JRMkyPmwEAJIYk
Message-ID: <CAHp75Ve=Zas8=6YKoPeTRrvjCaTyyRAyJG1gBLripqZgQpfg7g@mail.gmail.com>
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Waqar Hameed <waqar.hameed@axis.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Julien Panis <jpanis@baylibre.com>, William Breathitt Gray <wbg@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matteo Martelli <matteomartelli3@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
	Mudit Sharma <muditsharma.info@gmail.com>, Gerald Loacker <gerald.loacker@wolfvision.net>, 
	Song Qiang <songqiang1304521@gmail.com>, Crt Mori <cmo@melexis.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, 
	Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sebastian Reichel <sre@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, kernel@axis.com, linux-iio@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-mmc@vger.kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 8:44=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@kern=
el.org> wrote:
> On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote:

...

> With that
>
>         ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
>                                        meson->channels[i].clk);
>         if (ret)
>                 return dev_err_probe(dev, ret,
>                                      "Failed to add clk_put action\n");
>
> from drivers/pwm/pwm-meson.c is optimized to
>
>         ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
>                                        meson->channels[i].clk);
>         if (ret)
>                 return ret;
>
> .
>
> I would prefer this approach, because a) there is no need to drop all
> dev_err_probe()s after devm_add_action_or_reset() and b) the
> dev_err_probe()s could stay for consistency in the error paths of a
> driver.

Why do we need a dev_err_probe() after devm_add_action*()? I would
expect that the original call (if needed) can spit out a message.


--=20
With Best Regards,
Andy Shevchenko
