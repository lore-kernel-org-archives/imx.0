Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793861352;
	b=POnsAtIiOwBAz5WwND5CYdpRqTUJQKHcX1twW1DGAZWDpTZ12uHBrQ21q1Q491ySaaRg
	 DoCsPbtQQxwZrbj1O0BakrRZTTpF/+J/4E7Vv12T/cxD7cNn6THP4317YQwCXnPp0P2E/
	 32rcJxFRglw1B7iHoCIKAfbjaR1JQ0fqKvHjohofrNgg+Zk61c7zy3SHDeVGRUvxoZCsS
	 di6KlPKoMQRMYWNgbe6RgvaFztoYaxsxbzFrIuSLzM3Gx6YNrY7/4R2MMr2EkdzdLNGQZ
	 EB5uCgKBci8eXxMrjYA8lK/bd0foW4sJU4AX8x1Ce3yq6cfaJ4n6C7WCjpqIHYyA+WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dqJik3giojyQdxTVlYt/SVYHbelelREmDC0vou6fiGs=;
	b=VG4k4AZ+L0JtjPBdXHEyreCI/Q4cJ4tSQd1N+JRMn6MVWZ/iDqmNF2snuE5ILEUqdMwM
	 3A0uPRWQelSDSMy/zXmp4aaYY1egmhZ6z1i7bvD4JWNTAfJTqqW+NR0Zn9S0pPdz73e/O
	 Yvrs4C2lStA5yUF0aweFpFwY6aACCkMh/BCEHH8zTe6m0+c0UUh6nchZxlq+RZhoqdhXf
	 1GDFJdVNqjHVvb2qQ1O1iWTORbfwUmV3ydJ7+HEJLGWAtuP9Xdh5XpVXByIBrB7FQM5w4
	 IcVyRFyCh9a4tqoUg4cOLNJqVmrwQ4VvPGB5YTxmCzzuDA5MEoepKbPEUDMTsklVVHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VbAgEMzq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69301606A32D
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 06:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69301606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VbAgEMzq
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so135019a12.0
        for <imx@lists.linux.dev>; Wed, 04 Nov 2026 22:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793861352; cv=none;
        d=google.com; s=arc-20260327;
        b=jYpz7JJYIMaUU3NPSQUxc0ELI7WvY+VQZ6F8/3TcVRkhEalzztBtbj4XfvDzJVHBBd
         5I6+oVVwfjibgjsNeudkZeFMXOA/HkCz7/8WEX81prafc/ANml5eX1W06EkXaN87QBuN
         COfubVeO33pT5OccyDZFSN61+8mBnsJ7jpgeXwocGbPIXdwAx/YKgWzchOERi7R2uYMk
         mjRZcN5YCxWQ3lw+oGJohv5UN3iYkJi/S2VulYiZw0IKy8H2m9KPd4IyMKi7kNlRi2YO
         XYPIKmuO6hsPkMmSPS0l8jM6xcU0BQn/6wQV7+MBA4dMfVw7qkU51Zut2Hlq6ol086Vc
         whDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dqJik3giojyQdxTVlYt/SVYHbelelREmDC0vou6fiGs=;
        fh=oVvIOwNWpu9nH+muFLYFzgh4KFZ8mCdU4qA2N0Nxw90=;
        b=LUj/lhMNfR/vBiDN0V46YTOd7Q51a6A55/LWnc4y9ERCpN31BM1HAhG74Wub0EI9n+
         W+329+K3CJkGCw3N8UX4GQqPQHRnPJks/omsxHrl1tw4c93BTEGMOi1kbZaXUODQFSey
         TndFRnrVo1AFy2lLk+3/Nhw3j1ehXtO/ZN8mlE/4kkn6f7wok74NzLcmnQ+1lb6QMRai
         rvLKQIUgcq+vFt1fXBQnEBNE2yURq9OqEFCLWdSRIQySbM4cpAy7CLWYtp71ZRaBpjkz
         /q8rkwzfe5TAcnA+RcjC7jkALiZTqixMENDJfybyrSSrHxn/vb/dNHXKNi4pilp2BFKc
         2s0g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793861352; x=1794466152; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dqJik3giojyQdxTVlYt/SVYHbelelREmDC0vou6fiGs=;
        b=VbAgEMzq9zYT1vL+dHFYr8lEZcqlTR9wIUOGxpH+t5L17bbxKUKKLLe4wEIq2hsxWV
         StgDL+yF+vo2OUvc03noytJjGp5eQETGEHtZciWxE8KlXMqR7c2sq3ulUSRFpEMhjrkM
         FZLN7t9fkfcvlKTW9G8t1R5EEUIeta8P4IVEhBpkrWCB0rrJSzKuJWoxGYlXebCCZ/7/
         DWKjW1h4vzkD/8zy7btWumjLT2dlI0ZwxqS+JXzPQHwLBq9sy8yEb/FN+ce0Yief6yxU
         DEWAYmZRan7cQ0QkXKUOBO2qqdxsfCTIM7PEha4heSKsV906eZc9aO3wfyonWKR80eTm
         RGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793861352; x=1794466152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqJik3giojyQdxTVlYt/SVYHbelelREmDC0vou6fiGs=;
        b=C0CBllCHFDoIYZCC8l8dyEMqokLnN1TrMrPEZxAEf0laCXXKECTuBT3Bchc4K5HFiH
         99fWsOkaJ7VKh80f+Fvc49qY2YPNTO9YDKiblqTr5naHFzG9jio1s2/utvH0c76IEvAv
         R//Ksu+aTqaU9ayL7wR2ewXztqfPDwcqgaIdhKPN0/wBh3WY47dCGL3Sw+Cbiv1T2ekX
         kaZ4vpOiOUcudNI4p+mOlLEAWhe4pNlnU0LfVBuSIE2zFrjnjxkllC5r2ZOE7aI4LsyU
         nz2F/9lAtXZ2B/2mz6J25jnjEDY+WKxsl9yocW8YM8rEaZAiXnYD/zKTN5OCuRs3QPc8
         1zew==
X-Forwarded-Encrypted: i=1; AKwUvBzGuAIpoYWlmFCHmomH1fCsMfJMOStrIilcyqWArUhUyK/T0SmPCSRS1VhotqWQ3+rL8Fo=@lists.linux.dev
X-Gm-Message-State: APuU4Z+n4sYcoKcCpm7MgzaQs3iG/uskYgP4BYXefLjiSkFcgg0UOc8Z
	Io6mFUUY4X/I6A/isP9KeIs69ahu/+hNlQkFkyoUTviuMdzIqJcPMmmlwUgZaZBDYsuhuq9HmOa
	BmcdgMsS/u8T9zEXooIBoo7gU7hvGm0k=
X-Gm-Gg: AYBFou2nG5O883flPS5OP8B+vTzzf7gfOr4L5GhHoyCULnaesbJF+l3SqWYrkUCQ6sI
	J2sp+/eRI1d9NXIGvugZZaXV2ZZPjItakEx5AdDJ4/l6zYTAnxEOR6W6C5k9ZViN5v0artTl1Kw
	C7YfW1RSN9hn9bG9qeyF04v0U8rEOyHstERblwn4yrDR5i3QPT2qS37xzFdfQ7GFL9+JF4BAosM
	CjuH+aWFIy4Belmvs0vFHZyQfIFOSrC+GO6aroD+kCD0odGXU2PkZRkqbFcUk+FRcKBM0Y1wFir
	QQuH2IbXc3LLdbg91rsO7UWpbWi8ID2YUFKbyOINfr0utaX5ISEdPRctFX/TqhQLMokYhrkAaHz
	LHB3JXXl/vlVbSuRJp5YLQrLuj+mMbULFl+PF
X-Received: by 2002:a17:90b:5145:b0:3b0:a7b5:c044 with SMTP id
 98e67ed59e1d1-3b0afbf69bamr928353a91.1.1793861351672; Wed, 04 Nov 2026
 22:49:11 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-imx-sgtl5000-cleanup-v1-1-62739fbb4a25@baylibre.com>
In-Reply-To: <20261104-imx-sgtl5000-cleanup-v1-1-62739fbb4a25@baylibre.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 5 Nov 2026 14:48:43 +0800
X-Gm-Features: AclHuK9RYtMW40xJ2QKN3LFb2Z1eP_S0Ak6cnyuxLFg7_4CvqzYMgBFsDCsykmE
Message-ID: <CAA+D8AO6dy8Jn+yAaSmdQ2Zh0r_L_ChCAOhpQ-AJh1k+C_usrA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: imx-sgtl5000: release codec clock right after
 reading its rate
To: Valerio Setti <vsetti@baylibre.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 6:48=E2=80=AFPM Valerio Setti <vsetti@baylibre.com> =
wrote:
>
> The 'codec_clk' is only used in 'probe' to read its rate, which is then
> cached in clk_frequency and used by 'imx_sgtl5000_dai_init()'. Holding th=
e
> clk until 'remove()' serves no purpose.
>
> Release the clock right after reading its rate. This allows turning
> 'codec_clk' into a local variable, simplifying the probe error path and
> dropping the 'remove()' callback, which has nothing left to do.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
> While reviewing [1] I realized that the driver could be simplified a bit.
> 'codec_clk' is only used in the 'probe()' function with 'clk_get_rate()',
> so it can be a local variable there. Also it must be put when no more
> used, still in the 'probe()' function.
> This allows to remove 'imx_sgtl5000_remove()'.
>
> This patch does not depend on [1] and they are addressing different thing=
s.
> The two should apply cleanly on 7.4-rc1.
>
> [1] https://lore.kernel.org/all/20261104022815.1484320-1-vulab@iscas.ac.c=
n/
> ---
>  sound/soc/fsl/imx-sgtl5000.c | 24 +++++++-----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
> index 8bcf54ef709e..032ea3e066bd 100644
> --- a/sound/soc/fsl/imx-sgtl5000.c
> +++ b/sound/soc/fsl/imx-sgtl5000.c
> @@ -20,7 +20,6 @@ struct imx_sgtl5000_data {
>         struct snd_soc_card card;
>         char codec_dai_name[DAI_NAME_SIZE];
>         char platform_name[DAI_NAME_SIZE];
> -       struct clk *codec_clk;
>         unsigned int clk_frequency;
>  };
>
> @@ -54,8 +53,9 @@ static int imx_sgtl5000_probe(struct platform_device *p=
dev)
>         struct device_node *ssi_np, *codec_np;
>         struct platform_device *ssi_pdev;
>         struct i2c_client *codec_dev;
> -       struct imx_sgtl5000_data *data =3D NULL;
> +       struct imx_sgtl5000_data *data;
>         struct snd_soc_dai_link_component *comp;
> +       struct clk *codec_clk;
>         int int_port, ext_port;
>         int ret;
>
> @@ -129,13 +129,14 @@ static int imx_sgtl5000_probe(struct platform_devic=
e *pdev)
>                 goto put_device;
>         }
>
> -       data->codec_clk =3D clk_get(&codec_dev->dev, NULL);
> -       if (IS_ERR(data->codec_clk)) {
> -               ret =3D PTR_ERR(data->codec_clk);
> +       codec_clk =3D clk_get(&codec_dev->dev, NULL);
> +       if (IS_ERR(codec_clk)) {
> +               ret =3D PTR_ERR(codec_clk);
>                 goto put_device;
>         }
>
> -       data->clk_frequency =3D clk_get_rate(data->codec_clk);
> +       data->clk_frequency =3D clk_get_rate(codec_clk);
> +       clk_put(codec_clk);
>
>         data->dai.cpus          =3D &comp[0];
>         data->dai.codecs        =3D &comp[1];
> @@ -185,22 +186,12 @@ static int imx_sgtl5000_probe(struct platform_devic=
e *pdev)
>  put_device:
>         put_device(&codec_dev->dev);
>  fail:
> -       if (data && !IS_ERR(data->codec_clk))
> -               clk_put(data->codec_clk);
>         of_node_put(ssi_np);
>         of_node_put(codec_np);
>
>         return ret;
>  }
>
> -static void imx_sgtl5000_remove(struct platform_device *pdev)
> -{
> -       struct snd_soc_card *card =3D platform_get_drvdata(pdev);
> -       struct imx_sgtl5000_data *data =3D snd_soc_card_get_drvdata(card)=
;
> -
> -       clk_put(data->codec_clk);
> -}
> -
>  static const struct of_device_id imx_sgtl5000_dt_ids[] =3D {
>         { .compatible =3D "fsl,imx-audio-sgtl5000", },
>         { /* sentinel */ }
> @@ -214,7 +205,6 @@ static struct platform_driver imx_sgtl5000_driver =3D=
 {
>                 .of_match_table =3D imx_sgtl5000_dt_ids,
>         },
>         .probe =3D imx_sgtl5000_probe,
> -       .remove =3D imx_sgtl5000_remove,
>  };
>  module_platform_driver(imx_sgtl5000_driver);
>
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261104-imx-sgtl5000-cleanup-371e704e5de6
>
> Best regards,
> --
> Valerio Setti <vsetti@baylibre.com>
>
