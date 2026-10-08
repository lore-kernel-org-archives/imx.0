Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF673D8107
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 11:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457249; cv=pass; b=ezvoughDwKGJH3Z0/Y4dMsCGNe6m79UkGpLGU0PG/tmunLKkDf3bx0kVlnjHsbnXTLPi0qg6vuh7NtRzAUjuqAG2NEtuFtWvPrHZ5Pf1FgdFG9gI/meGgFxTcrb0W3PwgDsAtQCppCfmnWjt7QtDtkB0nvFZ5ZXT2sVA8CAgRB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457249; c=relaxed/simple;
	bh=PwHZM9ypG7ivy6DiyvJAIMcoKpqU4Q9ea2Q0SCuiZzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oo4pVnAaqssYQTd892qx3Y2fxbqadEgNCl07cjXdhYXmZEkw+7s3qs9sFfJPcaqdvjgvwUESqpefqRmCnMajHAY+bbWAvGlhzP3wp3I4n/1lH+HPs6a6IyO+92YB0vJWO2GadSoujf9/jh5pLfCWDHAdMnRe1b3iE9ZQrXredNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEbLk3Ye; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEbLk3Ye"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so561939a12.1
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 04:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791457246; cv=none;
        d=google.com; s=arc-20260327;
        b=Tkk2mwx+LHhBOqdmroR+CVshIIzTSAtFPnDr2XkXMRvayuhiHKzeV4h77Tx6EFM8k7
         +sHVS05eza5WRIXqn8oETLa5M8AKJgvdlTElLplNWhxk5/dbx3N30tg775rKoZfp90zA
         mYTd4vgzZCGyIfOhRP3MLmqJxwF0ZDcmDCzIkxxNd0VXZcrRZ+Kr8tdA5Pg7zRTCo2H6
         uh1IVtrULZfSK8T2TuJtPyn7EC+BvRHVQarqrz5upNsxtnBzBA+lfIRZoHmNMe33IckE
         35Rvllm5hKdWzh2X58rTwKz7ynADdxVpQL9hl8ZOMa2cK4ibFp140rjMpynVRA/AZWNb
         QLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eIepTPV7DS9Aylyj+4CBDzvdvhaffPGskWIagcgTxBk=;
        fh=dBzIPdJaCgSauyOVaSLHVnSBw/7c62U+SFGz+pPU6jM=;
        b=RAYfExuzWE6s8jup3yRIWsVSTxWVCJRyzBVcnbq9deoC6jPs2ETUzZ8u37+XStBRnE
         Gdv5CS1jmcsCaL+WC2eRKydvYe9Rxki0PEe8AnAmVrtKDKIynT6Tsi29GzIZDkIPZTrO
         Yfq658t6dt7bE6MbY6oIPhJ2XFhcNMcILbF/JNV6M0o+hfvZz/pfVm9nkMFJkBzUNAt/
         ho29bbi+bUd3yTlGhdgjBgbetx00OnJecI5V4bwU1k/8jLNlzDHB6ez39lCpLs9g4WFO
         abiPiS9pFyG0oug9OHsgzJ+1UjVzlkQiYvNCdyzpej8uAHxkdX12BlU2VTMScWzsyjtM
         A1Yw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791457246; x=1792062046; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eIepTPV7DS9Aylyj+4CBDzvdvhaffPGskWIagcgTxBk=;
        b=cEbLk3YesCFAtuDuYXJ9WftKA5OqV5vpLDmJLhp3QL6YVKLOrWoQi3w+cESzr/T+Ia
         I/J5u3vv6PT9vpv2poUlAAreaEHQG/ZKcTwjCciLqc+WidHcrAEjfCsp72A4wgky9Ey6
         PeQjuXKlkND+C/etEbo3fgm8pMqyYoqbpVTZ1mO1a+OMEq6FOCThbUpsJxuoLufsGg0r
         cI7t3GdpmNMZNhB532ZKS1PohDX/L5n6fZ2H9yGdUWhvftXiGp1PtDzttk7H9yjyuC7v
         17/KRqEpeVzSd1v0yVveX2M+jew5GZzS4ozvCGwU6spCDTMwRJ5DhQdH8TJ/DhE8Rims
         fc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457246; x=1792062046;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eIepTPV7DS9Aylyj+4CBDzvdvhaffPGskWIagcgTxBk=;
        b=O5XKy47WIizL1jVu6BEpTwc9gLCCD+QOoHn0S6jkmBaMzmR7QRIuNmHRT3ZysEX8vK
         MAW5g5quw/Y1Ac/9/l59xELWs+IyImnzHCEsvf9CGD+5INrsq1sCOPfG5S/YygusWM5D
         5iDskmvBxdsjFWyZkX6eux+PTp2zSk/qpw8r3/NuinIlOI24UdPJod1/XQ/CVgp9ZCbl
         FYw+HKLbc7zwZAXC/WrbTfYskmjc2jiwpvaM25tQzuhiG3qWZVDf5WZk8fyV9INB3plG
         +tM2SgUygtTyyHtz4fAQOkqVSa61KjZoGgI7JMB1VuSv0DQh3PhgIk0gH2OpjbkkOreR
         XnfA==
X-Forwarded-Encrypted: i=1; AKwUvBxodL/WLWKzumI2s47ktTLXNkpKoXL7VbVwYcvqrDHq1DYpcGDixlS6xg+rzhlT2829A80=@lists.linux.dev
X-Gm-Message-State: AFuF++nGQNFA8WbAvTfzBxZGZSTVlUyKtUkiyJ5hzoFoxtxZqdy1NKlj
	CRKL8W1HgyjCRCgNToQuh8dAFp3i6a3NJIgiiJ407eTbKDriZyUvV12p2NSStdTo+T6QUagAFH2
	JHhIwDg27QZvnIVwmHI1idaknRYIm/jI=
X-Gm-Gg: AYBFou25zFnqZjNRGf1nTBVOMr8q53+cLLab/EdcYXHAcq3ydXncc58I1rUREDQgY+q
	XHzO3rdNraZCSwDLEC0P2GdR/+QVagUFecUJ4/5UUQ6wbtd52jHotNcOSFN/8g9bWOUGGpU7afz
	eebBlP70l9HBrWCyHs6KmUiqTWyZOfKw18wpYQUNK5bqaXl4hlpJx6poSUZ7vL510VQcGdHRPjO
	qvlseEhpSNjxmZG073fPb0aLDz2hLsae5+7kcjWicasxqxjE/BNjrdg1nTCEO5ACiyAd8sr8NiO
	Fu0R1L2T6ZVbSR3gcyUldIjtCGnw6Py0ciqUom97XjISgqgsDKhsdDHoVPNP5deB4ZfTf7uCLc5
	HMlxkqBqgqOeUHn8vPduy6TzagvyMREAvzgva0/yGDiu5IVRqbloT3m+7h1zKZUdjXhA=
X-Received: by 2002:a17:907:3f9b:b0:c26:1648:a062 with SMTP id
 a640c23a62f3a-c317be58e90mr502991266b.29.1791457245712; Thu, 08 Oct 2026
 04:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-11-phucduc.bui@gmail.com> <fc7d2b73-e0a4-4a36-b6d4-8080ebb883f7@opensource.cirrus.com>
In-Reply-To: <fc7d2b73-e0a4-4a36-b6d4-8080ebb883f7@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 8 Oct 2026 18:00:32 +0700
X-Gm-Features: AclHuK_K3qxrvyLSGGdbMZG2p4PEMizBkDvUHEpZw0j03bz-I49nzoxH95pIpWQ
Message-ID: <CAABR9nHx1Uwket5-co+e-LR3j=0Cww0ZqZgZsUbiDmHTEXp-PA@mail.gmail.com>
Subject: Re: [PATCH 10/24] ASoC: codecs: cs42l42: Ensure the DAI is marked as
 started on success
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrei Simion <andrei.simion@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, Chris Bainbridge <chris.bainbridge@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Neo Chang <YLCHANG2@nuvoton.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, u.kleine-koenig@baylibre.com, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Zain Aboobacker <zainaboobacker33@gmail.com>, Sang-Heon Jeon <ekffu200098@gmail.com>, 
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, 
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, Bo Shen <voice.shen@atmel.com>, 
	Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Thank you for your review.

> Is there any reason why we can't change ASoC to mark the DAI as started
> if return is not an error?
>
>
> int snd_soc_dai_startup(struct snd_soc_dai *dai,
>                         struct snd_pcm_substream *substream)
> {
> <SNIP>
>
>         if (ret < 0)
>                 soc_dai_ret(dai, ret);
>
>         soc_dai_mark_push(dai, substream, startup);
>
>         return soc_dai_ret(dai, 0);
> }

I confirmed this with the maintainer here:
https://lore.kernel.org/all/CAABR9nEXM1OSnV6L4=N1YCbtWn5yMNr+OMEZ4p8h3WMaQXbgmA@mail.gmail.com/

It seems that the other ASoC callbacks consistently use 0 to indicate
success. The other call sites also handle the return values correctly.
The issue is limited to callbacks that directly return the result of
snd_pcm_hw_constraint_minmax() or snd_pcm_hw_constraint_integer(),
where the positive return value was overlooked.

Best regards,
Phuc
