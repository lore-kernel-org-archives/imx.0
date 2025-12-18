Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AD92C0F83
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 06:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766040987; cv=none; b=ESiZWuEjEWCruMypLKMNaYor+Qb7N3iYzO5ADGVMPzo2UMO+Th9f0tFUGaML60z0dfLpVHQxt2PQA7C+PM8g7Prn64fIJrtDw/QKpYQnqLGreXFbzaAiGIuuaBvHrUkcLUefQtsdRA1X0yDVOFX4aFIldPKQyuRIfBGr9s9+S5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766040987; c=relaxed/simple;
	bh=SGrk8/R9L0MEahgXSmzffJq3ChEW+Yrh4pnr9HdOfEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lvADPtM+8NeL0WOeC0e2tb6YoMVzimvVKxvT779JuLwYhz7O6Ch1bIn35mtcF/P/zbEbMP0r60U4FQ7U7WSKOZfEVkY5dqMxTUqnjFKh8G1bnaIVi96UnEOTDsomIa/OR8gmYp80B7J8g63XIf27+dMOAN9p/lJabyYy4R//XnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/84FIkQ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/84FIkQ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b727f452fffso217768166b.1
        for <imx@lists.linux.dev>; Wed, 17 Dec 2025 22:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766040984; x=1766645784; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAVukUh1CdOiy+xfPVNwz8tlXcnxdzzzzsj0xUfa888=;
        b=m/84FIkQrzZL9RncswmjrP9zh/GuWjT1he6uhtf67fclbnJSSNUZu4LV37o3Mct5eZ
         oYKqmN/72vDSeFr0BO3nqqWeNQ2WXtOBVUlrxhcSQ1nzXWtQ3ZpREyRvHzLOpQknNaQd
         oZC/xatIXu14YoRPPgOdfrL0WTkedSqQDzAvrcmb9ziiYoo0EdRNDxdkpquyyAZVt/NY
         PTv/u/Gtrsn2+wkSRyNxEHAYbxWUzs/pQZWJ7YZiW3H0yNLn0ak46GituEmqjfOQZd3T
         5cHHp0i1FoVOlkb5zNZweG1NvhWOwDZEu6g6VQcFX3PtdJazNewWA1k2wi7yUP9D2xPu
         gMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766040984; x=1766645784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YAVukUh1CdOiy+xfPVNwz8tlXcnxdzzzzsj0xUfa888=;
        b=W/J9gBRK3tKNGOGlLCj6LzcEUsxauoJOUGyu4o7xh26csZrsnId9ZBh2p1L8abuflC
         jjdZd0LLmn9eyVoDHkAaV8WTZpM6fp3iPWxEtY+Y+KI+WEcXhYDX5IjGA8Cexabdl34z
         rfKSlaRQrKvqvwVFBIB8u/iWIrJHP3Xoadd/8cAHiwoklQc5ierybViRxVR6L1D/9Mbt
         eWPrU34qJpCxbotRyDFAQJqvweoytAwZyu9+RlmhB9pt4rMn6o8P3lG3h8allBSyYx08
         EcYF0HbCTiAjJ1ep8by7Ot9Selmpu21xOngdTXoxlkTf3VmqapiqBqhBCBuuiIyn91pE
         TQNw==
X-Forwarded-Encrypted: i=1; AJvYcCVbStmmJ1i4y9+PlGrbkeMHnlBl48A0th+mmN3C8XbfonA8qzbpUXWp2nS2Xg64P//ufxM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIl43MAgeupy7qRZTi/ZbtKOua9eKoKLt3ZniLDbjy+yBpok+k
	tScIz/9enxYVrxVl3bwxXHasbd8AxVDxibIE7lwb0xd/YI3TTvGTmR/+yp78HrcmoMhe8HYm4kx
	d0N759QfWQHnbWgOoRkQ9gdhAeAKGcHc=
X-Gm-Gg: AY/fxX6GhsDdtyT7TOkFr5wPfb9a9aHVrPEHY5vhlTYzFb9Yh5ah5j102zfKx/8W5To
	v0nBPTYPZze6WbljSls25MGNr9ljg/tL/LUMGCXjavHy+5eoZQCUQznRAf5dhySUUfXzKIqg3+Z
	yV/pqMD7KgD26YiA6jb6D5Q65WQefeU1NkSC75oeYUphk5F6390ji92OIcH93AEOl2bxH5C5sdz
	ekW0dMqyw9PcKlhHCcP7szkAmFL4ta1GcqMwT+58bjFQcx5yDCriHVGnW8j4iD3xVwZR6HLRsOG
	jw4Z4Q==
X-Google-Smtp-Source: AGHT+IHFwImRsm9W5Y58Yz5apb/espxQpExd3T9QEzf75EiWN/wCtlShDmcuZN7IAzuiQTmvNW7xlDPfmw1gINRTuvU=
X-Received: by 2002:a17:907:3f9f:b0:b76:3d56:f666 with SMTP id
 a640c23a62f3a-b80205ed2bdmr185161166b.26.1766040983515; Wed, 17 Dec 2025
 22:56:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216071656.648412-1-chancel.liu@nxp.com>
In-Reply-To: <20251216071656.648412-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 18 Dec 2025 14:56:07 +0800
X-Gm-Features: AQt7F2p6BPzhm3Mw9s2b1rAKAfmA3zbdy7Nz3msDjejXjz_TkGWdEggdG6FTAGM
Message-ID: <CAA+D8APq+6E49pSuKs0yZ9F5+SaxQaSq5shsxSFztLROhyLCpw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Use of_property_present() for
 non-boolean properties
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 3:18=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> Otherwise there'll be kernel warning:
> [   29.018081] OF: /sound-wm8962: Read of boolean property 'hp-det-gpios'=
 with a value.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
> index 2c7eb0baa0f3..70a6159430ed 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -1045,8 +1045,8 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
>          * The notifier is initialized in snd_soc_card_jack_new(), then
>          * snd_soc_jack_notifier_register can be called.
>          */
> -       if (of_property_read_bool(np, "hp-det-gpios") ||
> -           of_property_read_bool(np, "hp-det-gpio") /* deprecated */) {
> +       if (of_property_present(np, "hp-det-gpios") ||
> +           of_property_present(np, "hp-det-gpio") /* deprecated */) {
>                 ret =3D simple_util_init_jack(&priv->card, &priv->hp_jack=
,
>                                             1, NULL, "Headphone Jack");
>                 if (ret)
> @@ -1055,8 +1055,8 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
>                 snd_soc_jack_notifier_register(&priv->hp_jack.jack, &hp_j=
ack_nb);
>         }
>
> -       if (of_property_read_bool(np, "mic-det-gpios") ||
> -           of_property_read_bool(np, "mic-det-gpio") /* deprecated */) {
> +       if (of_property_present(np, "mic-det-gpios") ||
> +           of_property_present(np, "mic-det-gpio") /* deprecated */) {
>                 ret =3D simple_util_init_jack(&priv->card, &priv->mic_jac=
k,
>                                             0, NULL, "Mic Jack");
>                 if (ret)
> --
> 2.50.1
>
