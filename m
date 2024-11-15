Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575B7A32
	for <imx@lists.linux.dev>; Fri, 15 Nov 2024 07:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731654246; cv=none; b=QlWqohe3nO5LIJiARqvCVW0nOM2Y1uixVWnYTi181Z4levAOniYgusPpTYKyEJ5acjxJtrziRP8jS8coHRw5M1zJRX9+n6h1PNmwBP9XdtR09SzqYSsreqOWfeMmOb6MeqTqoVUfgLZMPQ105LOGFRPzTt8ku28bm0Jx16z6zEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731654246; c=relaxed/simple;
	bh=/gQa+AAzsMOCTBdSpSgTZeMXYgSmQafHAN36EAUBUCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGje/dNZvAGYA8wCCvDCluiby0Tay+8IvNr5yrMWgjwaFC0KmSYGOIkoSy8318zyfTjM4Z803+7YlfQZUieI3lQmpHreE16elYEy3Ack5Z0QmAmLDU3wCZMid3/bz1HZQv/jJEgvrywoLl8xcccYXbuSc4bua4Cwe3y1hB5RJ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kK/0R99s; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kK/0R99s"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a6bdc8f7a1so1436455ab.1
        for <imx@lists.linux.dev>; Thu, 14 Nov 2024 23:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731654242; x=1732259042; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsPrhcE+0wOhQ0UFNclRCtmPomSqHnfw2nB7AfJcaYw=;
        b=kK/0R99s4HcOjOHj03d0DLsyp0PSbeBlKue174NK85JOfO5PLexFnrnCS+i0CqHOGg
         4Kyu8mBsTCZIqPCBxPM6pVS7EJuqI8TMqZjB370LLQNxNLuh2OXNqJYLKTaav9037q92
         wf/f/cSmBGUvvW98QpyKTlnsTghlQ2kjORnO1UvRsFvfFH+7DPiTT0KHCKPmRXIEBCnP
         Heb0myDC2mm9UWxSUSw2HiCPNMxFiw0Os7SwqDXx91LJf5a7566glc8/x+yGBt2hL7xk
         XkzXXA/qEW41xBVb/A5cdRCeZb6OGh7uZZtsa4T8pdFhn2/Er9ZqIA01Dh4Dz6bYYw0L
         PtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731654242; x=1732259042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsPrhcE+0wOhQ0UFNclRCtmPomSqHnfw2nB7AfJcaYw=;
        b=uNOxK1HNElEN2UregXUZ18w6hjI7wJ61wtuBD58CHbC/rhuzLmcXeuT2fK8qOEkfDL
         AXQLjr8eYHjGKf5gAqmddjdeumBKbTdJhAGaiewkbe3atBNOhamr27WXjuGNjUsTCVhJ
         Rb6vYe8IPXRLWQY3IIAJ1XxrFn2cpfrii53e+kFV7STZ6jkhWJd3Ziv0xrQSk9PWiv+i
         V0Ov1Pk57IDZjG9mz73M4K4BPiRHq7u2Wb1859Z17hFqvz+ipSboaRVwxy7g03J/0xH5
         zbIju6BvE3C31vtans6/6abQ6a2LJbMEfhoKGd5UUFgPa5n0NJtb9Jqu2uJDeNwjjM12
         iMuA==
X-Forwarded-Encrypted: i=1; AJvYcCXQEjI02j0OWtr10K8iDEC7pXfjuS48fhDXSYG0B4pnyHNi5E8v/OHF5DKYBZo5F0khB5g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlGSShYOKMUNM6WEzmoL6S2VucVxUiTWy5padCI8NDNzN7nRFM
	NnJbJs7+BDJp5hk6ZaHLoyHrBuwrYVJ9cLAsH6BqtodC4fZGaCvzavU+6WHETAE8mO3BkUT1LJC
	yT0BvElrUK+4EBWglGUeCGGT7S6aU0sCX
X-Google-Smtp-Source: AGHT+IEtsEzuxTFVYUEtGRJ17ltNdc3B8CWdUjAK/NkVesj+VHxHxo69gD7qxhlfC640Txa54IvI2/V23E1N9t8qlpw=
X-Received: by 2002:a05:6e02:1d88:b0:3a6:ac4e:2659 with SMTP id
 e9e14a558f8ab-3a74800f183mr17959245ab.6.1731654242441; Thu, 14 Nov 2024
 23:04:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241115065610.39112-1-hanchunchao@inspur.com>
In-Reply-To: <20241115065610.39112-1-hanchunchao@inspur.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 15 Nov 2024 15:03:50 +0800
Message-ID: <CAA+D8AMG5VpOk2PXOqUaLV1XwyBa3B2Mbdnc0+v3ArwWmkC5uA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-audmix: Add NULL check in imx_audmix_probe
To: Charles Han <hanchunchao@inspur.com>
Cc: viorel.suman@nxp.com, kernel@pengutronix.de, s.hauer@pengutronix.de, 
	shawnguo@kernel.org, tiwai@suse.com, perex@perex.cz, broonie@kernel.org, 
	Xiubo.Lee@gmail.com, imx@lists.linux.dev, inux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 2:56=E2=80=AFPM Charles Han <hanchunchao@inspur.com=
> wrote:
>
> devm_kasprintf() can return a NULL pointer on failure,but this
> returned value in imx_audmix_probe() is not checked.
> Add NULL check in imx_audmix_probe(), to handle kernel NULL
> pointer dereference error.
>
> Fixes: b86ef5367761 ("ASoC: fsl: Add Audio Mixer machine driver")

The fixes tag should be:
05d996e11348 ("ASoC: imx-audmix: Split capture device for audmix")

Best regards
Shengjiu Wang

> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  sound/soc/fsl/imx-audmix.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
> index dcf770b55c4b..231400661c90 100644
> --- a/sound/soc/fsl/imx-audmix.c
> +++ b/sound/soc/fsl/imx-audmix.c
> @@ -274,6 +274,9 @@ static int imx_audmix_probe(struct platform_device *p=
dev)
>                 /* Add AUDMIX Backend */
>                 be_name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
>                                          "audmix-%d", i);
> +               if (!be_name)
> +                       return -ENOMEM;
> +
>                 priv->dai[num_dai + i].cpus     =3D &dlc[1];
>                 priv->dai[num_dai + i].codecs   =3D &snd_soc_dummy_dlc;
>
> --
> 2.31.1
>
