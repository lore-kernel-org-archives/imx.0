Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6342F2F1FE4
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 01:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792115583; cv=pass; b=HBSUkGLTxzFEsOArCGmJi/um5IiV2H0y/9r8e9sLtx8mZUoqO4v9pVEMjhVCR8YEOwa2paHnb2+VvRgjuuod1JG0Lp+kU/82oZqI/N9O5jTraSNHXdvmFUprQMijHYvWWzcHD/sJk77VXLwWtYEcmxujLxF/hkKtmRo2FlIHyAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792115583; c=relaxed/simple;
	bh=Ia+9qnQFXuT7Qa703XqyFy/Lx1I20mduDC3TrKVaE04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkQ2kvSQNd30IGgcnW1r95gxOqZ75xRLcePxqOSdKatwA24Cnnnqcah9UzTDLyanXV7aJjCLPTEpxbxYyDGiuDfP3Y0gFvsLMuIdEtcRmhArsT/etPpcs9XSf7ZPGXJJSBWIjMaJzbvuwIr0hdS9BKWNLllIE2zP5YleyYHy2OI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpDrhJwK; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpDrhJwK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e831e86ebfso15827865ad.1
        for <imx@lists.linux.dev>; Thu, 15 Oct 2026 18:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792115582; cv=none;
        d=google.com; s=arc-20260327;
        b=q2AfjYzKq4elwomnD0d/ayn/cDjXFjD2nHAV8dWttKd+H1KqzIuzHNwLuo35/BXTkl
         Z6hJAq4RbgDLJzMmV491UsbiKRmGfigkkg2PZqE3JiZiT//7qg9EKfmyO9WYJLa60vRq
         vLD60MjjXM+IUhAI4vZ6sSbKT83fbL3P55vVCrqDo7BIX0L+iHYXf90z1ceT+qJ+1IGW
         jhh0S/4G3NIRsHGUPkX/Gm4NfVn8DNJRtZziK6toeoIV2uwpiL1ac77YsKE1cHJSpF2x
         l+Bv9gZqTtzUt/WMUQh6ekR4opLtodTZq8YDn9xUvam6BcJ2p8ZlHWOI2ZNBhrbZfaSY
         4zkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QzWh/mXf6G5Fr5INTJvXRytqPL/zBujlCdMkS18GyKQ=;
        fh=n5HOHF7OJnBEzPVRlnr/ElMjIGPG1M/eWOqb1xJIVa0=;
        b=UzvcfIpqEg2Mt+RRS91/GTLHUt6951eOGM67It6SSlCD/EGJi5APqdgkcP76en2b+E
         BK9his3dI4A6J0iEr9JqtL28RiiOIjlattPTNN1g5tcr4rOXXzTWcq+i7Y4p32/pwiZl
         S4SlQw0fig5PkB3cS/6GqPH3wZgRZlFHZ5GVl2e2IBf/LvE6r023dRYEiTqIhn96RKhn
         b2Gm2RdVrU35ngkE2CqpunUHSrRKu97zHDC30BtF8TXrRvzi9EJb5xjVMsBbeaYtkUTZ
         NEuStZROBDBVn0hwiWKzecoT14w6He96NiQ/DJPmZdKGn5ikSxOfXE0+MsXddpkbwU9S
         AC+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792115582; x=1792720382; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzWh/mXf6G5Fr5INTJvXRytqPL/zBujlCdMkS18GyKQ=;
        b=FpDrhJwKtPFc+ZeP0nvE9tHknUsT8wJbFnHv16XTc73OTMEIr963UwFhz/rsflTcYL
         pVMZt3yf9Bg0mZiMNxKqAJO/Cz45IC7aJfYtw0SO248NpSwSl6TzL0zM0e+jHQwfWa+f
         25uJdfWp/Wow3qLC8N9M8jMvVjYEwf8Ixmze0YT6R6ueOXshO+iFnqaEOczZuh9aIsf7
         atu9sQ+5G7JmcPkYjIoxVUqu36+6MNUTIcwzp8lUCLTXkfziBCUxAO+JSCf5BlPgW36n
         4pnu7A4ZcVF0+xHB65MG2H7bY/419i/8XJfTOJcuAnXy8uXFDnVuVk9t/dsQFjA0bvQN
         U1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792115582; x=1792720382;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QzWh/mXf6G5Fr5INTJvXRytqPL/zBujlCdMkS18GyKQ=;
        b=2NGBIVn5vSp5ULGYDBQiSkWlRKyTKkQCgi3rKxQi4jTw0scTfT0sidHvA9uCy4DwGA
         bB8sGDTJXPpouUAEfVjR6Df1XYYBCh9VjNuj1RLvDuFIOp4OghEtdA0Vi/STlB6XiQxV
         Zd9aUhXvi+xdf5CYEjmzY9oPrZR+Nc/gkhSB3cRFDa9+hj5jTvrhl8H5fG1d3+xNw28k
         opqZuT/iw5KSufBxNYZVyMciKjC3uF1QWeukXK3Luj6cx/d0LIjAUJREBx2OnF8rg+bf
         VfslsKW0S7cutA2WpGEuISmS8/6CwdDnaOGDUSZEd+vUrAf+QhPIhBtXVQefxlInI+i8
         MrrA==
X-Forwarded-Encrypted: i=1; AKwUvByh8LHu6tc87vm6v1XPboGU5HxU6vdl6tGPWHxPchtcjo5T08TZzY9CJ7YhjMGdzxo6YN4=@lists.linux.dev
X-Gm-Message-State: AFq9FYJXJoX3q+ZtB0Pm7BDrjbA+TWqykJtjXC7WT6bnQv/BxSbqNMF/
	w2AuL8EBmcLnyQgP0s7hLNsP4hDPPJOfvnAey++SpaqkB0ydp35TH0M5tAv4P9q/0X9N/G7BTiU
	d2Nez2WZPH55zoDmVxKAkHL0W/ABMM+0=
X-Gm-Gg: AYBFou3y6UJBNC1/CULINKid/x4Dq7HjLSnvbvmXL3B0Ribqn5IiDFrOHRZXjAIPAax
	GgmQTrNzlfc5GYOqJZ6BK26XM/SV4rSJoIBlYjzTJcg/4DSw7++Smra+RKPEXAyCnZQGWTf/dVN
	fDKJtXSxMLsLj5Ghi862QGJsIwWUgwp06BjGkemvRawOHdeAjXx54t8V+lmyF8zMYp8orHBJOez
	twZFqGF32IIKruIvpALlVoG1QDfeg4820cbqmh81g9bionX53u9qmCQXtimstgI0nRIY8vN1/uy
	9aflvvzrIArCAmqfBUleoooetnKuf5Mj40wXvILZIj7rMV9fDeWntwOk9ijzd1bfteOW1kHASxI
	N1dymGAuWrzzABaTXkwrmkI1FgsO2Riqyx5eZY5MhKrOd1JxjffyhCgIEv+avKPLQ5ko=
X-Received: by 2002:a17:902:f641:b0:2e9:5714:608e with SMTP id
 d9443c01a7336-2e957148bb7mr48721225ad.49.1792115581670; Thu, 15 Oct 2026
 18:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015014324.5569-1-phucduc.bui@gmail.com> <ad722297-5ca5-42c5-a07e-59fa958387c1@sirena.org.uk>
In-Reply-To: <ad722297-5ca5-42c5-a07e-59fa958387c1@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 16 Oct 2026 08:52:48 +0700
X-Gm-Features: AclHuK85_RuY5Eq4148HpcAJND7CX_R3cPSTmudMqJuFIrc_MXHUz5ZN3dyw0W4
Message-ID: <CAABR9nGU0qW6iMadffrXw86a=ty=FVhw_Ypoa4rQtwOCbepVWg@mail.gmail.com>
Subject: Re: [PATCH v2 00/25] ASoC: Fix constraint return value handling
To: Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, povik+lin@cutebit.org, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>, 
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
	Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

> > Changes in v2:
> >  - Add Reviewed-by tags from Vijendar Mukunda and Chancel Liu.
> >  - Remove redundant integer constraints already applied by
> >    snd_dmaengine_pcm_open().
>
> v1 was applied, please send incremental changes for the differences.

Thank you for applying v1.
I'll prepare and send the incremental changes soon.

Best regards,
Phuc
