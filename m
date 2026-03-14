Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029201EA7CE
	for <imx@lists.linux.dev>; Sat, 14 Mar 2026 02:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773455564; cv=none; b=Z45skk2eKv1Dmv5SxoqwM1j16VyT4v06IlmjD13opw0v0yNSJXrzVIYcBrW6OgYiUV6JaBXYtcyiO7QL/2LbjWjxQSjVVj8WSxWpqgkah0/wJxHnk5ZcIqvhRxSp70d2cWt3brvNMB5bCBldrpPdA1DnbJVPQHTzmKlc/higBxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773455564; c=relaxed/simple;
	bh=VoXeC9IHasi/UAtluQskzXJbdOFysDaXJJx65ggrMMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IceeQ/PKyHnkeq+4S5fcFMLnmVzVyNOO4v1eogYzIimrbDyDBYxUdjjOldCR3AcADdgRA1XNiw2blEd09rU63t5Sa8I9ZRvvAcvDjMaiq3dxxsAUVn7rg7JxIKspE4wOVCs2Kid9B0qmZdlNOm4La8TmlB9N9UmKcmw3d+yBV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HylEy45d; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HylEy45d"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ab232cc803so13610905ad.3
        for <imx@lists.linux.dev>; Fri, 13 Mar 2026 19:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773455562; x=1774060362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXws6LkfRc01I28IbH0KBFSnQLO6Cva5ehRLzaS0ijo=;
        b=HylEy45d7aMJ/juoHicCd8WBueNS9748F8SOU5nQdFW2ofXHYtTr/JClS5zuq56JUv
         28bHMVfV19Qx0aUlKYssfK8NZTkFYAzYfshRZMq/N6ezcFcK4wG3EDg+5pSj2iqYvbb4
         kzhZf/HtWbAUze/xt/xqYG3hIfDJ3U+A7eMrqxs50Qybd3u5ASSIj8Jf0GBJl7N1hTrb
         o7R6ZcwVl82f7DQh3ntgKd1FwIaAYwDIXvoeLJa1TrLYcbq4kidOohpXgA0/vGBeYvCU
         qKZgC2AVk/xgNAQ1lduz2sJz3KaseVzmwlDrrDwFPXGd6fD563quhAKe/gwCAPj/NWpk
         nBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773455562; x=1774060362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QXws6LkfRc01I28IbH0KBFSnQLO6Cva5ehRLzaS0ijo=;
        b=PV2ksIkxp61hiOYGjKOZkpv8p8vm87ppmEPUC6bFmWCWgIF3mwGS9WChdvkyL0OxGp
         tVU+0Mgz3eEIkyl+8sTilNSt8qa7D8g0xPTr23PmrRnGfsys/U/nVlXT7cdgfmcVoBLs
         Gx2+bNZYPwzd7NmeYQLASasj29cnoqzqXDFBruBhF2IThPGXMPj9H3+3pEpJ4s8beW+g
         Zu2odvFg0HB2+07Av0wgHKrSaUMIcc+iJdkYIozrmF5gvxbvAM0wCmZCUNV1aGq4FtAf
         urDLbr0xHgaShu564HjZS3BOZkBrUSADmtGitzjlxwr5syLYt7cE1kJCqJYFstzbpm5R
         J6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWCCSKvRDZ4aDK2dGPH5hxt741q0sTNVlJ313h+O6678XzUgc0ItWcPgZh21NYyAs4UG68=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTTTfVStN0j3LZBAXB5MwM+fQBp7cHup0EBqIjR2M0aIcm5KBM
	PuXEidruXYxBzYUyhSuSS6KcjTyjaHAX5RtfaHDRbW0cVFOQuTnRdRTe
X-Gm-Gg: ATEYQzx16JU043x/Rdb7z2SUfDkvX2ZsQq1gbFAXXCBy5Rp4mJJvcwiyMBaEAufjtYu
	L64u9S/4hC1fDIOvG8x/9u3H+E2LyZApXQlhH09KluS9tb+RAZPLthXs1pK5Z0UkIF7j9GXE8yi
	qwLHp9nP+DnLt27l20CzSukP7EYKXfFNsaGBKqaBaN7LrN3fBKm5vw/DYdQ4THu27SVvhMrL4zG
	GWBFfBZReln26qKI6H/AC/orQgnEGX5H93MaJLSzsAuH34MVY6CgFqZkACY3PrLUN7qQDUY9A0z
	HKMWXPwqgTgbFBrmiUE0V7/haesreskb0N7SPGph2ItEqSn2EalnN8JJPGRXInciCZET+DsI9Bx
	652bu6BruGlPFJiL0vo9oWoPSXTkDdyhpwRU24WyyYtk+dUNXzqyDFhDG8SYkJNC/veno70AV50
	8yZHkFFPVCfXXAuAGHbRtjs2oH+Utj4Cxi7Lra2sBQLitddo3B2QZRsELjShzWNg+8jr55se/5k
	pCQL3cLuh3cLa7rKP3Jh8VlxJJ3wmPFv+oZ/r2QcPPge82iFiZBiS3z9eP9S1wBR/ACEMoF3InR
	kxKL8TzytLhunQ==
X-Received: by 2002:a17:903:28f:b0:2ad:edc4:1796 with SMTP id d9443c01a7336-2aecaa4d681mr54393645ad.39.1773455562268;
        Fri, 13 Mar 2026 19:32:42 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8093casm35373165ad.61.2026.03.13.19.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 19:32:41 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Frank Li <Frank.Li@nxp.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
Subject:
 Re: [PATCH v3 7/7] ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle
Date: Sat, 14 Mar 2026 12:32:26 +1000
Message-ID: <5796105.LvFx2qVVIh@setsuna>
In-Reply-To: <6a3cc78a-77bc-473e-bfbf-caffbe8f25bb@sirena.org.uk>
References:
 <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
 <20260301-tdm-idle-slots-v3-7-c6ac5351489a@gmail.com>
 <6a3cc78a-77bc-473e-bfbf-caffbe8f25bb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 13 March 2026 12:33:05=E2=80=AFam Australian Eastern Standard Ti=
me Mark Brown wrote:
> On Sun, Mar 01, 2026 at 06:05:26PM +1000, James Calligeros wrote:
> > +static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
> > +				    unsigned int tx_mask,
> > +				    unsigned int rx_mask,
> > +				    int tx_mode, int rx_mode)
> > +{
> >=20
> > +	switch (tx_mode) {
> > +	case SND_SOC_DAI_TDM_IDLE_PULLDOWN:
> > +		ret =3D snd_soc_component_update_bits(component, TAS2770_DIN_PD,
> > +						    TAS2770_DIN_PD_SDOUT,
> > +						    TAS2770_DIN_PD_SDOUT);
> > +		if (ret)
> > +			return ret;
> > +
> > +		break;
>=20
> This and all the other cases only updates the bits it's specifically
> setting for the mode, so _ZERO and _HIZ don't update the pull and this
> doesn't update the _KEEP/_FILL settings.  Not sure how often anyone is
> going to change this at runtime though.

I didn't notice any side effects caused by not explicitly turning off
the weak pulldown, but it makes sense to do if the consumer has asked
for a mode that is not pulldown.

> > +	case SND_SOC_DAI_TDM_IDLE_OFF:
> > +		ret =3D snd_soc_component_update_bits(component, TAS2770_DIN_PD,
> > +						    TAS2770_DIN_PD_SDOUT, 0);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret =3D snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG=
4,
> > +						    TAS2770_TDM_CFG_REG4_TX_KEEPER, 0);
>=20
> Actually this does _KEEP but not _FILL.

_KEEPER is the important one. _FILL just controls the behaviour
of the bus keeper (zero or Hi-Z) when _KEEPER is set. If _KEEPER is
cleared, the bus keeper is turned off and the value of _FILL doesn't
matter.


