Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AC238BF9E
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441717; cv=none; b=Z4ezFQ+8WpN13ZqihkHkzw35e1GdbhFZaNM677YAUSTB/s5X1izzpYobptM5IDCZxmsqzoQRmwH+eGQGdb3juvPeJdmWyDI3fI7KZurCM9oNmEUTQx1PxDQCfDRcH/Zv9LFPWQA8pLSQx0JT2FmEc/2PsWx4yRvEqM+nSTOviUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441717; c=relaxed/simple;
	bh=Wr4tlDRl6oPSAmOvngxm+4SQmIJt0rroCHEQsJvSNW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQWss5dg1QM/8Ue326YQrquzBostb4JNUHd28gWwN06VsECes1c/hisdUgowmqEEg7hdYUZmZ7UjjZkQyu6aPxOLQTTwgLnGuhbnn7++23o+OM/gbaME+eHXO4vM10nGJtY2VnQyGqsYNQYvv9KFtmWE+GMpMraMpiCehRTkqEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OguXo6j+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OguXo6j+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9914C2BC87
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 08:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772441717;
	bh=Wr4tlDRl6oPSAmOvngxm+4SQmIJt0rroCHEQsJvSNW8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OguXo6j+KGJe55bk8IEbL9rPsIwNgDL+hdSJOPpCsW/UrwfixWfneOL/Rb43NbMtc
	 Xy5/b14r7HsT4zNEi2b2YcsmmLnvxZpss2TO3oeU/hHA7LoxqJNyFhsBOLdHXdSV/w
	 K24Lna4qdmybb9yy2G097bEfGlymxU2jyISEverK2tROniRtRqJz0/7zcc5AVcKtoz
	 NTN9Blzhz6bWJfWxNH/36qRtEStrmkzmjZ5hI0GgTU7YX2faK4vL9vw1h482OHEbdG
	 a29y1JPJtLhEWbefKHPW6aul8+MG2dMoa1ACD48/aez0IGvTstccEgSWdbW5n8PPFo
	 XYdOtKQ3n0xSw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3870dec27f4so2869231fa.1
        for <imx@lists.linux.dev>; Mon, 02 Mar 2026 00:55:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVmzoqqMsJktbcIRvlhZjU+SSZTgUiKEcByLyvtkO8Lg49hRGTrYelSmF3pEvyjink9NrA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwTWzURoMBZgso5wxLNrKXGwfeVBZ2nR+jGQSIr5MCpZp3spTN
	/zLvpS41CN+omXpyiMikfOBhQSc1UY96JKLE4mnz8wgXZgDitKf9FKRDMlsMfwA35utVpd3Fuxp
	g7BzDeAeSLJ/EGW5NX7wDxN4vpPBXCMWYf/NrW1kG4g==
X-Received: by 2002:a2e:b018:0:b0:37f:d9ba:747 with SMTP id
 38308e7fff4ca-389f1d73cecmr65334241fa.5.1772441715946; Mon, 02 Mar 2026
 00:55:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
 <20260223-i2c-adap-dev-config-v2-1-d78db0a6fcf7@oss.qualcomm.com> <ac23aec1-6dce-4dd5-8990-9fad40998478@gmail.com>
In-Reply-To: <ac23aec1-6dce-4dd5-8990-9fad40998478@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 2 Mar 2026 09:55:04 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf7vQYosm7ViZRg31EdPipfuD=wboMtEneGDCXc20tweQ@mail.gmail.com>
X-Gm-Features: AaiRm53-Jiy54KH5rFLuIQyxPw_sYDt2pmqB7mKXc8_Bgm_qwPjbm9X-evfdjaM
Message-ID: <CAMRc=Mf7vQYosm7ViZRg31EdPipfuD=wboMtEneGDCXc20tweQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF node
 through the adapter struct
To: Kalle Niemi <kaleposti@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	Matti Vaittinen <mazziesaccount@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail.com> wr=
ote:
>
> On 2/23/26 11:05, Bartosz Golaszewski wrote:
> > In order to stop i2c bus drivers from dereferencing the struct device
> > embedded in struct i2c_adapter, let's allow configuring the parent
> > device and OF-node of the adapter directly through dedicated fields.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >
>
> Hello,
>
> Automated driver test system bisected this commit to be the first bad
> commit, linux-next next-20260227 was tested. Failed tests include driver
> tests for ROHM PMIC and accelerometers, which are connected to
> BeagleBone Black.
>
> The failed driver tests all fail to first i2cget and the tests stop
> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such file or
> directory".
>

Wolfram: well, now it would actually be useful to know which commit
exactly is the culprit so maybe splitting the changes is not a bad
idea after all.

Kalle: which i2c bus driver fails here? Any errors in kernel log?

Bart
