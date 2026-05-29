Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FC73AE196
	for <imx@lists.linux.dev>; Fri, 29 May 2026 08:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041751; cv=pass; b=qSTouasamFxSVKTJqQ2Cc/oJ6OMVqa9+wXOchWZGzJHu8+LbQdS6L5R3LTC7LZrlZQCeWrpjqYmmJy7abxC1ZlKxShGdOy/ODqkqgSFymSBrNECiKgIWBPYT8WqqHwjPZdnyotA9WAmoeiOKE8t4jR9LKU8K69P4s0ccGJvlexE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041751; c=relaxed/simple;
	bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dz3yC+TfUMJP+1jQSpVeScMdh3P942us2Yquff7O/dSCMORmNRyYvjDAM2M5yWW6wfBBz2Zwnm7q9ZCzdm1oGu+BaQiupt3d85Dik4LsNHdwklpG4aBb5+y98BePDQKgnnK8GuXR+wNQ4dY7lURMfmVa0eT427PGyNpDiRpRZCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KeM0HHNb; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeM0HHNb"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b9e9a6802aso59608545ad.3
        for <imx@lists.linux.dev>; Fri, 29 May 2026 01:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780041749; cv=none;
        d=google.com; s=arc-20240605;
        b=MOrwSkcnxcieG+isHvIQA4mnyLMpcqNODecl+g+u4aO3PLdcs9MrrUhJFKLeKB05Ij
         EUohc6JB7aiAOCySOeEZtTCrgX40YF3kXGXuq9WYBYmF90R0SP4iq27Cm8xS8AdDY9Lj
         wXR9q/pC5sTRQGGrZ/ytJQFzGMbht0b/MiRfza+NKiDdXHhyLPMAsKZCooEWUCr/uMgH
         91Blc/TL374xIcgljBvPUA/JhMzYzDSJjN0xKZvY7mB6wiMiP6MuyZp1Utbi/NPT8lNi
         e07DEVoQhoZz45sPLo3nxRfUmesAYiV1ScMXtMWAgejTAv2g3CP4eQpXSOD73Xf75kw4
         ezbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        fh=KRH976cD30Eo9W8Hs6s6+ZbW4Qc3VWRA3ik9AQGPcoM=;
        b=fGK5kllTlGADN8GtHEmphUgOyvT22GCT+M3thxxPSnQPV0CNoOouM4JkGs/byFJw8/
         daGKpfv4d0z0HXxskleXSTWj12INrgHqVbGLu1dOtQdB3XRVGnbjNfxkySi6yXpphxHu
         S7YBAov9gO1Wxb9cXzBs65Dvf8be6dEbTFDhijxBssGpAR7+OTKnYsrcgfw1liPcG/Ya
         b+z5Db5KZq4APlPZy8orbl/faxl2c3TIh3ZZp1MBpwlX8l6ftmXx8Glc3FQ9IaGuCVEv
         kGDiU2TDv/viWVwoTR4c7VW2T93p2YKcKIyoCgH5d9pGHdo6W6/Q0MtzuT5fvSYzNYAr
         dY2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780041749; x=1780646549; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        b=KeM0HHNbCsyz4ej6V9Y7TuAVaG+rlQ3sndhxnsvxOz30wmIjPMmnnyPrpi6xj6YCu/
         MnR/U3M9jeiK5oh6DDK4qbQfGVgy6h3caS2CbeTmY1hVmWHc3BagSNcha90+/JuXr4Ua
         EgYXchL33qDNcjNErX7xU64pv0CT0ZBYYUvSI62xQ/i4Vqn+xexHWfSpa+Zt723RcbZb
         7u2fNa3ZSdRmKa56AHhSp3o5iveTJTgJ+PNeDhvgJVTXqPunj4X1f1btR4GhY6n08FkS
         AOO9mB2nDauXAF8uvHbamHbF7bHtkWSniv+GqUD6/1inqqCBvycncpnYM6Q2F+AXlRZw
         qfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780041749; x=1780646549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        b=oYARRX6+xmHAg41jCjkKtVf3yDDUXxYwLWz0sxrdnNuS9QA1hwZLiem0Di3upmAfvg
         b+TQtr4l07ncPkHwn0YJp4oDpt0nf5WNDb6TIO6QKZAaHYzTjmIhGYAQpygDFK7pYb1R
         g5CgBvxN3g8ROfpjWC5L+xkDAvlCAA5WVsMV/MDKhU8IPaQjGbgTVOZU4ZPEZsiQQrSx
         23Gtv7B8FswwungQhr39QJwYECTs82seeypQveJAsAytIWypecGBBWlWDcptptFcypYZ
         mjPRXAr4u/m71Gqx0DFpPnPU1U8XljpR7coU3QPa4G432iRRIss0eTiuOUho7Md83mqg
         kGqw==
X-Forwarded-Encrypted: i=1; AFNElJ8pyprpNeJfBPe7VCxiDOgQCUiVo8avW3x7EUpm+qh0UJNmYaRksXoJNESD0o2R2x2ia9o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw6h3GT3w7lpE1ojZcM/f5wC6aaQKmSAxaihjmlbo2tpkjDgiZ
	iTAIiJBWQ2CoLEHuuePDn8PMZXntXcwyg3lhC3Gm4r39UWJuwdRrgNH/K+s38QrwwBuCX3EWibS
	0MQo+/dOtPPSXqUjDSm+L9i65CeKu78U=
X-Gm-Gg: Acq92OGPya7vNK6iXlTVzivIuMTwz59uKsNcZ/iDG4se0IMMngfwj7d8LuX+gNp4eII
	99ZBWVsQrTGJTSFfZV3yrzoye1R/2//M0d22xV6vAaxJNsJTVNARiv1XDMSaOSjQskWm3zH1zOm
	EBE1FF+5sOG7qrpqCJQ5pPCSW0X0WJUkJ3FVprJUvVjZ/QTBRaSBcfETJ/W78bk85GiMUGe9jQP
	Qpx3EHjcx26EQVC5PgLvJQD8H2IkOqqiZfB2O13JdtyXMBafHjIKR+p5ApTCnQGLKaP6sjxFZ/8
	/3WkWzvpKi/olOLIolg=
X-Received: by 2002:a17:903:fa5:b0:2ba:6ca2:be0 with SMTP id
 d9443c01a7336-2bf2053340bmr25566605ad.4.1780041749021; Fri, 29 May 2026
 01:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1779878004.git.u.kleine-koenig@baylibre.com> <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Fri, 29 May 2026 11:02:17 +0300
X-Gm-Features: AVHnY4KLQby2GKgYCaNbHrRuPj0X0-ETK3PqgCK0q7F1iL-UnUKeln5tOfAvRio
Message-ID: <CANhJrGNyB7aqMhR5DiLXd6OPmsE4Vox=K7UwMPZ1ZZc2-Ciw3w@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] regulator: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Karel Balej <balejk@matfyz.cz>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Samuel Kayode <samkay014@gmail.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ke 27.5.2026 klo 13.48 Uwe Kleine-K=C3=B6nig (The Capable Hub)
(u.kleine-koenig@baylibre.com) kirjoitti:
>
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous unit.
>
> While touching these arrays unify spacing and usage of commas.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

--=20

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));
