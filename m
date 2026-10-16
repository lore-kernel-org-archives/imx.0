Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCE84746BD
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149971; cv=pass; b=nhaTXOPTCT8xd2alWyWXHiu3zk8sy6uAFk+w5FPdDhf1tQwBt6d1ZuY8es/f3U6aNYfiPiN7zp3FLtpd0zpo1oLSFrE2PdV10zHQzOrzLSOgoFlHWsF07dhO2sWgwgjLoOkkklwjuSc72MwfdlIT7Akcm7uE5tKArLRqocbq9RI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149971; c=relaxed/simple;
	bh=R7fc9o/O4yqhA3W/kJmDsBhaIBU4bJflgTG28U+KE44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qEkN45gGdlseiVrYi2UEoCDgVjw4JBWk7kJ3dREJ4kV5Uu7Y4w/QbP1274eQsGrPUnVT35Q1/7z6umW4naaeSl95B4cLqG3m81rQBY/N/NFHpTIGCvmdkc7eLR7UL1oj+H4JaHUc6eiuzlzbifcmboMBiC/iPCFh1WPyplEHMxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UG2+dOpU; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UG2+dOpU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2df8c28a0b1so28461725ad.1
        for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792149968; cv=none;
        d=google.com; s=arc-20260327;
        b=aXrlNhQplqmqUVuci3veska65JIfm+zI4LpC11uVH7hj1QmmThKPcHoerlPptvjzv4
         F+bNyNc+VEl7jNTCo1xgr6VXcTZao8oUfVEN3YSW2izS31eYkfWQNGs13ymvTLNqyZiJ
         RUF9Md3a8d/P+gFcT8m5KQUDVu3+D5CvPBxQS4Wm0PlVRZNPTd0tlU+w9k000ijg47Um
         DH8HAdVe9HTRglJc07nphkEI2Q9p9WrWfUuSA4SbshcV/B+5/GVAwRj412XxxOiMrcLL
         XyXgpoI39Z57f/qN6mNK/s9mhrOfkywrcGIVlV0Mn7PG8qYMriIQ0Ptu6FXIgRru7EdX
         705w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vApPRxEqpGQADna5mwyiV+wtnRS+6fLHQ7GBxAw9kX8=;
        fh=Gny7zfqWySiCJ+OcZZ3xVLWOgC6VIIGG/Ucr7hwrs7M=;
        b=Xk2KOa07MhAstdoUIA9edJE2i5L8IRVOjOrMznBZ19TCFinOR9V9XK9bxuI/rUAt9M
         YaaTC43w9RNmhNp28olBEZs/1Y9svMndPV8FHi6Lem/s3WfXnPChvNJnnSDLGboa/nO4
         aX5lYvj0GDgZw3Q6Q2DLsPCnM1ea58c78OwBOyhsTPBwzvSdGyEJ97COHO5JNFVexxFC
         +AY9XRZoPW3hFY+TydZRUsr5i4Rswzs/DMteeCluyDCEdN2nkDMsq3rwHRh/gvtGtWIH
         6At6G62BwL26W+qQ8mRx1bYM3K++Tmv2RNWAspVLYBXsWHr8w1GBQuegv4daEV+5M810
         48wg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792149968; x=1792754768; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vApPRxEqpGQADna5mwyiV+wtnRS+6fLHQ7GBxAw9kX8=;
        b=UG2+dOpU/PQfOESHhp7MjaPbDCmVW0bFq7RfGA7rFl/VKHOpRiaHkezgJR1NIwv1Ub
         eCngxcNIv8r0emkd/CXi2O7IAyT/N8QknSIRb7nNMtT2Ryc06EuqSN87uuyeyW6zToaz
         EnIZybD5vdKa8ve2Dy9421nMH4HO3SdCi9jC8YwLTbieSAzp+eLjVy8tPd9AWzbic4Qm
         At9aD4YfWc0SdYS/BgSdcBc/az7P53ztUyjeCnGwoPUQYRnzsn+pdIUDggQ8G3tfkzV2
         B1PGPfIf9FSPIxSBYW8BMf8NGFu5mppJDFX97dwshzayVZO4ufGYHHxBcjvtQa6dCYO2
         sdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149968; x=1792754768;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vApPRxEqpGQADna5mwyiV+wtnRS+6fLHQ7GBxAw9kX8=;
        b=N2KEOf3CoN9c9ZQhaQXRDv9SRMtABSmC8VJXFnItyD27AzYIE3YGFtOZLgfuMVaM7D
         u7/NvQsORjkuHSUiCon3Ix16VNELkYViMy4Jd8CNNOn1R29VVvOWijV/rpsoTDaN6rh1
         Az8n4C7rIjkfmPAHg4kLHMVeYjIMCY2r0NNmNDJouPtLMMX2LFt8dYD2sq4kDFD8rOAG
         aamsrJ0crNZWrAZuMEv2F/tIwiHGbQimQ7F9Ho3VGRaat56hJhyc4kQxYq0BuUB0o0Hn
         4a1NbJXXIjKxYJXeKmSS0zWKVuuk0QyXyyXbsChRPNSQdzJucEKGG6P6IKVZWWM4BDMS
         u/Og==
X-Forwarded-Encrypted: i=1; AKwUvBy9WngSOfLx1K+5HQPyXBFyVYs0NT/4vlvCis3Tg45rztBgU5zr2isGjqlPTO4jEiBaljw=@lists.linux.dev
X-Gm-Message-State: AFq9FYJb1jGCPW80P5v1NcPnlNwNZTg6kBvcUuLcOLTOUOp43wWAyOMZ
	vW0mrhVKhGAsByxFixv71laZWJ6rnisjmfIX1dkZ/Cc83o6MfalNgUCeIc3bJN5ddQ1dEg5keC2
	UmwSPZtbGsJrdFTc5GSSMrN00xbieBbY=
X-Gm-Gg: AYBFou31f/dw1R1CqhiymWtYS74bClPPpL2iXF0DZFokBNEaRd1wfcDbfmObPGk6oac
	QcaZ8yEMyleguis/rJL+LQb2WLHPXoeMvPRCppxRrtJukYHm3T0HWHTEZHYy7ZIlK+Edb0xGf7T
	nZiIKagaTy7aE+xl4QpOOpqGHVI7ydmjDXKn+T9gCF4Yh68IWdSB0QzVQVGl6XJxq4F2wpo4Xsj
	1ZYdrcoSLTp7fYx90sVetjsavmxdkbxSxELWeF+A3+N6Eq3QRkaSKe0rZ8ZjWiVTfQlJgj8ugP/
	ZbX9OJOqileVdTT03qVq57bWRVPm7IXobHpJwQBRtVYMfvph0zTjPFgNP5XCB6SdSr3wXAaYP7m
	FB7F+pcDVkj6j4WQjt2eaJ/GJ7we6aqaoKYZOybu626d8rTrEueFghRD6oiGqTHn4Wy5c
X-Received: by 2002:a17:903:11ce:b0:2e9:4e83:1979 with SMTP id
 d9443c01a7336-2e94e836527mr62789995ad.32.1792149967287; Fri, 16 Oct 2026
 04:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015014324.5569-1-phucduc.bui@gmail.com> <20261016040048.506531-1-phucduc.bui@gmail.com>
 <46a96bc8-2ee7-4c6f-ad8e-94321f8b9630@sirena.org.uk>
In-Reply-To: <46a96bc8-2ee7-4c6f-ad8e-94321f8b9630@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 16 Oct 2026 18:25:56 +0700
X-Gm-Features: AclHuK9bobvuHZz0ZvKJfKfhAJdiG3c7XQlmqU2uHEyUuNfyFRrkKv-rn3SiKZ0
Message-ID: <CAABR9nG8PeQS4GBGwENfHTRBUnroKYQiEu29iztix+py=Arprg@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] ASoC: rockchip: rockchip_max98090: Mark the link
 as started on success
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

> Can you please resubmit this as a separate patch as a new thread without
> the series numbering?  This is really going to mess with the tooling :(
>
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.
>
> Series numbering only makes sense within a series for ordering, if
> you're sending something separately to a series or a new series then
> preserving the ordering of the series just causes confusion.

Sorry for the inconvenience.

This was patch 25 of v2. I had only managed to send the first 24
patches previously.
Patch 25 failed to send due to an error, so I sent it afterward to
complete the series history.

Link to v2:
https://lore.kernel.org/all/20261015014324.5569-1-phucduc.bui@gmail.com/

Since you had already applied v1, this patch does not necessarily need
to be resubmitted,
so please feel free to ignore it.

Link v1 :
https://lore.kernel.org/all/20261008103831.542533-1-phucduc.bui@gmail.com/

I have also sent the incremental changes in a separate thread, as you requested:

https://lore.kernel.org/all/20261016040946.521195-1-phucduc.bui@gmail.com/

Best regards,
Phuc
