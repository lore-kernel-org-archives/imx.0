Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86772C08BB
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028384; cv=pass; b=FT5RyS/HUOYyOj+K6OM/jXWdaEah9h/V92XRgViIv6lzrJZB66kkjTw+M9EVgxaweDoPPBrEWxUE4nRSkKjEfDspCkZ7bGLDC+ejeCc7aR07uQYy4yQMpAC2kFZnUrX12MwoOEdH2iOMOaO28fNWX+CJyPiYLWLWl5CW7+etJNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028384; c=relaxed/simple;
	bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c62JugcdCHigiKu7YVuF0joJrwa3+pZ5mubYAfqY4X0tOlBTTTABHffOmoTzCf110hoagUhsQlBnlxn5urtzbZkXY01JO1ZTWuBjHUDJ4uZH1fOUlbAyIdDiydNq9q5yxwplm8l0GutS/7q4KfHCW7xamQpqSxB/ZHJhplYC4P8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoSkePzA; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoSkePzA"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1918041a12.0
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792028383; cv=none;
        d=google.com; s=arc-20260327;
        b=Fl3YrKWlTy4Pqcn6U5Xo1//eg6Il/qMLXTy92egy6PeuI9tTHJ1XW+48li/eh5reLM
         6/vcld4J1Rg0ky5mScIYp7aOfZVN2Ejt7uAGtiZ7/Y1G1T811TUA9xS4xOvyX7ogX1Bw
         VcTpGX/LlFuVvO05rWsQHv8eyyebAlS4NQkDrNc0qZg5h8B05iUFMKUUzFFZ4UcE8LQv
         aaMdn8OnZrBHyP4JvJ5bsYljVijFZltiBJ8bf7XAUwMbhYSQg0OTfZhdbMHXMhHn3aEX
         6DalHQO2xqKp4NU5S3Gie92tlNcpFmf8r5SchPTWro8Xaq6g48LKDJjhKau3iJqqv2+f
         qUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
        fh=lQdGVWRpqsVMm5k0YMvlsMIKyiXBA9bxk6so8F0zxeY=;
        b=DROGI3DRQ8PQM28DSbBoezH1JTJwYElEtCBfzvpzh8VrZAJSzD0QrqF1dvBK2voFDe
         P4qAjbBtc/G/CzLkpqmq8fD/T+ZoT4LrG8BKfeiYxaLu/WbbBol5Iok2hde835aJbZB7
         svizb85JwV8IjhKNqzOBDdFfxtfD8MQ5gRwJU5FY2CEaMdwzMhMlr6ieWJBSSyRULyOi
         KHpbCCCp2l8wBwGP95qtuFEltnLgl57Y9DNF0kQzTOK+fpJH8YPhbICpzle51t5bsYt3
         Ocj7FoGp0Ol58cG3e6LxAgHarVP8ezg365kaIZ/hC2jkdRs6jJeCfmN3iyiqxcoNOLLl
         UDPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028383; x=1792633183; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
        b=JoSkePzArueMo2xxyDqdUWMQBx1Nhe2psQVqI73zvZJ5U9e5RCeoarfuwwXLt98fXk
         rApwD1pLu/yyvppUVd+OxCZTMvQVKHABxYu/Y5mmP8LQPELeqoVlYXLlgkPquSr3xR89
         g22baMdxcnfF55QSLiuK0C5/NFP5abSRmOdQ0ZIXRn7LpqaY0mEhPD9yQKVZFBAN92LE
         zbQLVSCqvCcaxnGknKcLGwMNN4uZPAli/yPnmZWehuV9dOC0ttlR7oFM92IdA2QrERtf
         e0DRoPPoq+rsI5UXCjCqzuhq4uHLwA27BYez0SieAhQLPNNaF03jPj4Gt1LmrDdtFu0W
         evMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028383; x=1792633183;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
        b=qNHKqwBe6FP+7ddHDU5mqoRlHTay/TgFNo5BxqOVetp5kiGicu61f2fb3nU8RbZMv9
         U3lsv77N6uLCZQXaoDZD661p/H1HfaFr4IRrCaQy0xum1Y/2rYMl4mhdwaYGkCfQ1M3Y
         yC1avdx2rUkQ0cDBsM9DJvrSHr7jM6VyIfA/Jg+LWSWthAdSMHgjAystQkAAhsXzPHFY
         egmIss3pOoSynPaubi3dtgtitRGT8JiJU3jPL6DAZEr8a53DJWcNhcZ1L2XL+ROhBRC/
         ayEEUhVMAVbzHc3RcRbkP/Ehk2A85+XmmVIiqnfRbUUPl8urMoWFog/+p52JNPgxNw9k
         boAw==
X-Forwarded-Encrypted: i=1; AKwUvBwSGrwgOc4mRXMBijupy+hYgtc3olk5FamqqlGkO+YJn6qRYkEwQQ0J8V54cwRS8mZvKGY=@lists.linux.dev
X-Gm-Message-State: AFq9FYKNN60UHlmZkvPCdcRF7mRcuMHQmqiMMkWhCV6hgdVMggBJzcGC
	ptqhRpMi0+hLkgpXXs99BjEYXitBym2WoiaY5bjuT2cUd9sfulhnbJJPXsGgBM7Pca7zB7YO6L/
	VA+zEef/Z71dGuAnmElFleI3BKd0/wr4=
X-Gm-Gg: AYBFou3/0VjuwF++Nm84ABgaYPy79/YuIwBYVE7xmC2WOFmBWjf4OkyzwBllKwJTiQd
	6Eec5uC8EgKG2eKZMxPSX/Mlg75JM1h+X8l1LVfYfv1cqaUtZEnAZRbnBpXnDdZB88kAclR7q1L
	Gw7B5XaiNGT2JxD/Sr0ISncC0O1XQqJoly4yDQCI9ImaIrGSpL8iwI0Rwfkw2QoP3b9vpnyFmdD
	LKcAdfSffOz6aSzHrQtpYoD1c2y2F647wh5DTQf+57nxvZtQZ4lGOYWNQljIFKZrsj9kQnXlzlt
	8AaTiuaWCPjrk1um8bMhxSaD6493tK5YEmTmNyDE3I83F5G4TqraUg4k/VlhgstpYkHNOZVI3KC
	Opyh3Vgqn1j5W60j/b7A/TcuB8BK2x9D+n6FQmBtgrfK79kM+kzN4tpVWtWEDCLrfA8g=
X-Received: by 2002:a17:90b:4acc:b0:3a0:e1f7:9b04 with SMTP id
 98e67ed59e1d1-3ab3a60ac9amr16312045a91.12.1792028382966; Wed, 14 Oct 2026
 18:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com> <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com>
 <87se2aw3ot.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nG-YJZEdj6pVD-gbGU6J2EfRMQYsKd7u0UTgfrWOyAPXA@mail.gmail.com>
 <87qzhtyxw6.wl-kuninori.morimoto.gx@renesas.com> <3a6759c7-84bc-46ff-93f1-965c7e8dd4d0@tuxon.dev>
In-Reply-To: <3a6759c7-84bc-46ff-93f1-965c7e8dd4d0@tuxon.dev>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 15 Oct 2026 08:39:29 +0700
X-Gm-Features: AclHuK8C1u90VDPCucQhY3afyuLfcxP0SCIJrlA3M2hLxVwcjMsqinLCGr2nhSI
Message-ID: <CAABR9nFA5p=5hnMoxFHLtmGEj4kvfrN6M6UFPnm9hRQv_CAP6Q@mail.gmail.com>
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Andrei Simion <andrei.simion@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
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

Hi Claudiu, Morimoto-san,

> >
> >> For rz-ssi: in DMA mode, the driver registers the generic dmaengine
> >> PCM component, whose .open callback already applies the integer
> >> PERIODS constraint via snd_dmaengine_pcm_open().
> >>
> >> Could we drop rz_ssi_pcm_open_dma() instead, and keep the return
> >> value fix only for rz_ssi_pcm_open_pio()?
> >
> > It seems fine, but I don't know detail of rz-ssi.
> > Claudiu, what do you think ?
>
> That should work. I'll test v2 once it's out.
>

Thanks for your help and feedback. I'll send v2 now.

Best regards,
Phuc
