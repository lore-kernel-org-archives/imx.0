Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F1746AA68
	for <imx@lists.linux.dev>; Tue, 13 Oct 2026 06:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871477; cv=none; b=j3C02MiVoYkRDwN/FmRq1y93LuroGeFblGZ12IVis9VVyNjfhletZGZyk8JgT4mja8ewmXVBVtMbfWda0C2szjWZ66mna0vzqj5e58BEtCpdXrj91+HGsg/QQlSgBjPxku2uRn6EBL/h41mljr71ueG0hafEOAfAiI4BxzAJ/ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871477; c=relaxed/simple;
	bh=Rjpe9v6RRYU+NG7RT5Zptya1DV0KrnwiYyeVJX03vKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hj9gKGxRdJOSIDBM/dCXRbgszMxC/6TX3qf+ZYaXj8QN1MycBIpKKrpHdcXAjMu6H5FHdxJhDKuiV5QelUxJOfaJuLsZwXQnzNCf9NrY68u55WYGSq54x0c2LpNpcssjkhy/VDb11v0qheyD2HYfetuuLQ0nsTGeLFUqvluu8mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oABVZK/q; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oABVZK/q"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381b831d535so3040724a91.0
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 23:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791871475; x=1792476275; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acEtVgfuadFdXlisXUuNZxKScLo0hQqEFXfuOZQe1a4=;
        b=oABVZK/qrA524Qx/KmvQq27gtMOohT3+DOCnAINA7mgyHsl+NDfuOcakmM3v+L7U7t
         wlIDDIssPuEMwvOBcvAceXvDFpAQo3vvqIUM7bWE7Z4iwAkEE+gcErhslS1nHQX7kiaY
         1Qy08pg6YPty9pq5cIYQkzyyq2iUqXCreOQTG+g1E10spxkWDkdcQuzeK+ZrFUW3HF87
         Mp+E7KWXF53Rr4drgDwq+mtvwN2RaAi8kZDCe6fIXZNggSItfANJHngG2STQrXBhJR50
         LOSdbBIbhtgYxdxjwsXhA9OoaJF5A5ZgoV+o/pWszCkaJCEmlvVvwb0REe+pV+dwuaq4
         3kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791871475; x=1792476275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acEtVgfuadFdXlisXUuNZxKScLo0hQqEFXfuOZQe1a4=;
        b=IKXhzTXnOV9BNSI9iXULU3I0yq7rLgsK0vZK0OD3IRX1rWxBoT0S+jr1yqxPP0/4Ai
         Z5iXO+71/Vs/r3JEjjftF32I0lz0jTLA5idBdh4WcksFRNaur7orTbVnXQjLxFOkLySQ
         i2iLJRsMrv1MBCBn0X3lSPgzDP4G/54Rob3QqnZjE8XHPkRp72aAndwM05+tCH+W0tTM
         Ttx8y/FJCI7oCIbAeq5CDAStNACyuIw4malnc6mOjf2x0SiQ/Whqxzc9Cpv7ce0jNjU7
         1w/k0oS4f8uYAaqSr9Q34QQyxYtYKyFZWt9gQzGuV/yUqRGPoyd9ue0Q7xeQk2H8id5R
         P9/w==
X-Forwarded-Encrypted: i=1; AKwUvByl8Q96fhG23RZzaA/h2cMfiZZi7tzQSIOe4BGPb/yFM6/02TEKJ/RiGdoenBkzVEF7QlY=@lists.linux.dev
X-Gm-Message-State: AFq9FYKrtxdP3gEWcaXcFBXO1RJPkkW00pLbTAft2nAOEBcKcgnGHGfv
	bOcKld3zQqmrJbG+fV/WgY5yFx/lU5gwAZnrs/sCKlb3iQa5c1qwrl1U
X-Gm-Gg: AYBFou0lHm6f3Zy/6iRhqPLU90wkhjR+pbN7UKJ2SGeFlaDQwJAQ3udXsq0TxZ2ZYKN
	zYz259/g5WITQrZ631lg+1QymIvSa2O1WOZiOzracHGm+byCw55BkyvROJV1rSMzkY+NdGFxcq2
	/uMGdOwt6EFORW4dvsks22VPOxGkigw5IDW8432QFnFGOFERDpWAywksym+OpRXKJLmOyTHD7v5
	pCFmvSp8MkYzteJNDWwTdb820HXiA05ODikER7UarRkp+hnFLE7agsNRISTi5dzOUaIoxgA6FiS
	pCUxg8UB3m/t+pXNSA7TYcGxRD0IMjr+nffDZfLvKwI9PjHoScNIs8NtuLbAxPUVM3TSUFa2i6t
	6JRzB+OH1vvOWYcC+5XPAZfbj1zLOLW8T1cK1zHv/j+sILmZbmMP+4llXtV4Mz1eJhi7TPpytFV
	8vQ9Ov9clSCx07Rm1q8oO/TelBopwhByyTDzOdjO7DehPMKeee5VKyVWzeZyUZRWk65Y5e4dorV
	EdPydGGLAh9SnhcLz4=
X-Received: by 2002:a17:90b:4d86:b0:3a8:6571:b43f with SMTP id 98e67ed59e1d1-3ab3a9f7f28mr9589394a91.29.1791871475585;
        Mon, 12 Oct 2026 23:04:35 -0700 (PDT)
Received: from [10.25.160.252] ([165.85.154.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23035084a91.11.2026.10.12.23.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:04:34 -0700 (PDT)
Message-ID: <14bbf027-4a16-4bac-b530-d4654ed38d4a@gmail.com>
Date: Tue, 13 Oct 2026 14:04:10 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close()
 being skipped on rollback
To: phucduc.bui@gmail.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrei Simion <andrei.simion@microchip.com>,
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
 Sang-Heon Jeon <ekffu200098@gmail.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>,
 linux-sound@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-19-phucduc.bui@gmail.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261008103831.542533-19-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/2026 6:38 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> snd_pcm_hw_constraint_integer() may return 1, which is then returned
> from imx_rpmsg_pcm_open(). ASoC only marks the component as opened
> when .open() returns 0, so .close() can be skipped on rollback.
> 
> Return 0 explicitly on success.
> 
> Fixes: 3c00eceb2a53 ("ASoC: imx-pcm-rpmsg: Add platform driver for audio base on rpmsg")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu
