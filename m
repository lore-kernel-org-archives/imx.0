Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC0B4E3228
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 13:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417029; cv=none; b=SgDMGGKKGN8kQD0NIX5BUbcvUEXxmbCbJfxQH46wTwtBKFPRnKzp5LHtxWfohYUm+brE+IKtCktwNqxjS/GkmkZ1jToF58x3jn8lXPpKZMJp863JmmOCSgpJ2H28Jpdy/zxmFNxr5Qdis3GA7sPk6NQMYI/Y3ILxTHF8i4Q303M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417029; c=relaxed/simple;
	bh=fwAYS3zcXGkdd+Ibq1n5HFY65n1XJA1GPMTC7CY2epw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UApiJr8QMKM5CkeZMN+HJ2eXjmNEibwwlNprhSpb3tOIxOo4UfoEhigzNsxRLGG3p8NR2sNvurXeHzgFhAvnNaqHD81ZDKiy4ZUADFkKdKxbN8SittjmG069zMhDmjLNXvNWetDPy6R2SR3otGzEswixjaNbAZdI06jy9FJc9Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XVlmZmNw; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XVlmZmNw"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso3043763a12.0
        for <imx@lists.linux.dev>; Mon, 19 Oct 2026 06:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1792417024; x=1793021824; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kc0HBa20pNgTgn9A/dNG9MRjR4EzrI7cz68avvggZvk=;
        b=XVlmZmNwCZoJspshuxX8JeDZBgNhD3fgFKndZINJvXLZy8KQZ8yZL5ywNKt8I+GnVY
         CcC9hc9nfWJ/li5X0bDTcTBgaPP2LF1MDJG3fQhITjcKt7fZJWTVJaB45wzBTj4kCPh8
         CgCs8II3KFATUNWmlDe8SsgipPOkII+xit/iHp5cQMESvGv7F3MXNzG/YoYzUEHjrGfi
         KWI1IDEr1bepmRk7GDKvYUbqLs7cXukDZpaH6KO9ytQfHi5S7vh0PoMRkmNsYS6zXkXa
         UtQGDd3zxaSu8k2B73nDh1aVRGogtWjIuWZiBjISqUezgEOzcXh0ExLF4vEkaUu07Yqc
         LZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417024; x=1793021824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kc0HBa20pNgTgn9A/dNG9MRjR4EzrI7cz68avvggZvk=;
        b=Y18eGdRq78U4PqXdhcEiRxiLrU4+DbjDnr5H078jdPey2fWeBpgc0EDiSzpMyh3ZH8
         0uEPjU2zIhFc6eb1DdwBxItpjttZ/01Lzt1izNGDaIown4rErrR3Hf4xpxCEv0WcUezZ
         V6YIMwnq+90Ho1Z5YZMg4ivKEolHliKTKM0LTEzvH9HsRKP3g2jk5TQi6s3/aSYWIdlq
         jCztzG0LsRpgR8amEtzgBwSHBZHO+IEPOaTwKkAZ66z0fn6i/EA/NavEYKLrz4bFQ2IZ
         E0C3Jkidf/0qoBAObpx4DZvDcgvVB37R9wxxvY37EYhZpyPML9JEoBNQV4LYlxpy9Yqa
         08eQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhmWnMBWQwc4n66+wFD4nP4zyINUhOhVrrSTMjFLhumD5YP7p4rZDM4ibL3WvwRABOY1g=@lists.linux.dev
X-Gm-Message-State: AFq9FYLtfMmwES2xRdZlcN/O3k3pYCkEYjuzDylj1nbc0JNf//SPTUuB
	lgub4/3I0amy1JnV/SJkCnzfL1rLTXr+dhD2X3gW0nms3LhaM9Sxjh7qF+hg4XxBk1A=
X-Gm-Gg: AYBFou0KjcyKrRKdwY8rGpgw7qXEfqSuvQDjwnwMnlilqRWMaHFvfikyzjP1IRS2+Zc
	OEfmv2Yv5NCR1yrUuVBLHbiVcI8VamvYyiAuHmIJnSA7vJH+E+mMepO0ScJ7LlgtfPduCSdqYaZ
	LbzbjHoOVb+rzjQgNAP8GvmLtqSvRCdM3L1z1J6qsXrnqoJpXJv3R1oRtIm8iY3i2NbchnSC8x6
	Jv+7X/fAavTvunECKm3uuR05U9DXnmak+CxKR57N9BwxpwDe11utu7wp6t23fPEzZ9OB+6WWdgb
	aQHVFoz65+XnIlJy9sETXzEe/SmcaRY++RM3n9DDLjy8M3mpiEes58O+mMeYG9ucdICUl+e0i3L
	zvIwVNHt4y+wuAl8jv+CGGseUog4JYlFQYw2MHw9Ox+Fa2WQ3iPuPXti5OtH0QWnowZ67u6KlOs
	bRR4XVRyEvDVTqvI6hj4jUSLN8QkH9xpqfyrcGjcLFH1L9gW1QOzvguZWdXtViEZ/RzGuJIV62t
	dZjV9c=
X-Received: by 2002:a05:6402:5489:b0:6af:8a4b:7aad with SMTP id 4fb4d7f45d1cf-6b3a81a6d00mr4333695a12.28.1792417023411;
        Mon, 19 Oct 2026 06:37:03 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm22897379f8f.30.2026.10.19.06.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:37:01 -0700 (PDT)
Message-ID: <14f60932-9a85-45ee-ad87-593c20cc116b@tuxon.dev>
Date: Mon, 19 Oct 2026 16:36:57 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] ASoC: renesas: rz-ssi: Remove redundant component
 open callback
To: phucduc.bui@gmail.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 povik+lin@cutebit.org, Andrei Simion <andrei.simion@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>,
 wangdicheng <wangdicheng@kylinos.cn>,
 Chris Bainbridge <chris.bainbridge@gmail.com>,
 Linus Walleij <linusw@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Neo Chang <YLCHANG2@nuvoton.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 u.kleine-koenig@baylibre.com, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Hemanth Selam <hemanth.selam@gmail.com>,
 Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Zain Aboobacker <zainaboobacker33@gmail.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>, Bo Shen <voice.shen@atmel.com>,
 Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
 <20261016040946.521195-11-phucduc.bui@gmail.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261016040946.521195-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/26 07:09, phucduc.bui@gmail.com wrote:
> From: bui duc phuc<phucduc.bui@gmail.com>
> 
> In DMA mode, the generic dmaengine PCM component already applies
> the integer PERIODS constraint in snd_dmaengine_pcm_open().
> 
> Since rz_ssi_pcm_open_dma() only applies this constraint, remove
> the redundant component .open callback.
> 
> Signed-off-by: bui duc phuc<phucduc.bui@gmail.com>

FTR:

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

