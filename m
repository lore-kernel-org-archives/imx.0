Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F1D5680
	for <imx@lists.linux.dev>; Fri, 20 Dec 2024 01:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734659998; cv=none; b=l+3WzjuBKzWOzUFLPLZ1zKagveMRROX2UH4jEDXn1l03zgG7OBz4EsqAYMC5udF4MihKfQxsuG3uaeq7RYUshT1cNtWWLk0vW5BLmYmSQNXFGr/3FJfXQXAmb3g5SwVYVTLjR0QbiuBF0Rqi/4sfKrtpni968cTu1WlpzTFTZMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734659998; c=relaxed/simple;
	bh=txGIzZDZ7emAst1jDCWk9iBkRM9m9iTw9c4HuFUPL+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVFNVwcaWiMYlwD6WaEd1Uf/Ocs+UxL+KQqEoclApPLQT2tFjYHbsq6xO0Nq+6fyjNm3u3ne+Qu4sFsfSYHc91zSpPU9PflhExURla8dEaqOIhMADtEmLmi3gxbhSpI2CFL8DaB2HXfWDHV+EZphsPjkyHmv+zeHi0RNz7pS/3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSpQTVA6; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSpQTVA6"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-844ce6d0716so111022339f.1
        for <imx@lists.linux.dev>; Thu, 19 Dec 2024 17:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734659995; x=1735264795; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w68OVCNKDRUYLbgJOcwMFHEvgy4OB2hhFbrartVXJTg=;
        b=DSpQTVA62cbekpSiqOBrcmOQrQ04/yHI8l5KvN/AUH9gTKGi2O2Yu4pHI9aNBPbG/b
         10u7hcK3RQXnH7Y9TWyz5iMhBwi5UR87B6rxyf40hyv+1J/Dodx3Eib8oAYiFTpTvUze
         4yQZxSirQ21evNhh7UYHc14f/p5kSRZ8/3tQNovUhFEfUMmrF0F6ypyIQCyS6FtKBRln
         rKVYH5XquZFzHsKYV31FHIdJNjAcwSttOTDeaJrWqtw03tzf1pnjHzl5AU8PqxVdt+hO
         DA/WODWvLBVyOLoRz3BJ54j95E2kDCXe9RFhJ3aXmJNsskZCu1N4D6qkAEe648hqfFzO
         lnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734659995; x=1735264795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w68OVCNKDRUYLbgJOcwMFHEvgy4OB2hhFbrartVXJTg=;
        b=WWrP2a4LsdIik1Tf2DAxsk4RTqDI/48X/kOncCZXiUvYrmEassrcQvIlDzeH7epEFg
         XDF9VY7TbHmHe9BRRjko13gANl4+iSG4lSc2fdHlSEwtjP5cRpbysalBEWiibnSiqj9B
         o3VX+uIT0rBmFJpCe0SeloDrr5jWudoViqLNEv+Fr/+VEVPfu9vHqJc+mFaac+H8LKDg
         A2nKrEf2ifopMQ9N0B7DT9g4P/WZPo3ktFjaFFTv/vN4/0FMFgaoDvaM1E0PpGKMtqYq
         371CwPMPqymWEWNYjsnZ1E2wuYI/g8cb72H4YuydvkNlY78dPT4wmZLShSQTNIxsOQXj
         jKhw==
X-Forwarded-Encrypted: i=1; AJvYcCVtjunPALOdFOnv7p1O2dvU6fmGLe+SkR99ili9soBRwDQvuc1+ckVwPTonZvw5qDsQ6dI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOm0zqcX/6bpBk/2Oy1ZwdNsnTEhzv3IYhHxt7N5SS2aQG0PFO
	7Z1BAMnIUj2drfgK7loP++0uSIjvNMV4zhTuhEQXHOSmCtkRfcBpKeX33O8Xdd3oXe75Dw9Fbmv
	XknJYDlVKt4WmjKW/8fymZyylNWU=
X-Gm-Gg: ASbGncu7QFCWZKKQj71YsPkeEOwTQgL+YLk0s/bYLp5qDGTfDyiC0CEEsWKRoX8yDx7
	e/++FPgsCdIf0+aaAx8dMoYGPEKFBqZLsBd677A==
X-Google-Smtp-Source: AGHT+IGGWwEgfDagGWdRJ2sz9qd4EJDpuuMO//PocPQVWC4Le5q0Eh1GxoTcg1NZhKqs+MDGDTNUymTHBZPUut5L6BE=
X-Received: by 2002:a05:6e02:2687:b0:3a7:e83c:2d10 with SMTP id
 e9e14a558f8ab-3c2d5b37857mr16006015ab.24.1734659995420; Thu, 19 Dec 2024
 17:59:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241219105447.889CB11FE@mail.steuer-voss.de>
In-Reply-To: <20241219105447.889CB11FE@mail.steuer-voss.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 20 Dec 2024 09:59:44 +0800
Message-ID: <CAA+D8AMO+ia5ztD8Z97TOn-NBbXKHfd+T65zBc6vJuNkeVdVhQ@mail.gmail.com>
Subject: Re: [PATCH] clk: clk-imx8mp-audiomix: fix function signature
To: Nikolaus Voss <nv@vosn.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 6:55=E2=80=AFPM Nikolaus Voss <nv@vosn.de> wrote:
>
> clk_imx8mp_audiomix_reset_controller_register() in the
> "if !CONFIG_RESET_CONTROLLER" branch had the first
> argument missing. It is an empty function for this branch
> so it wasn't immediately apparent.
>
> Fixes: 6f0e817175c5 ("clk: imx: clk-audiomix: Add reset controller")
> Cc: <stable@vger.kernel.org> # 6.12.x
> Signed-off-by: Nikolaus Voss <nv@vosn.de>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  drivers/clk/imx/clk-imx8mp-audiomix.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-=
imx8mp-audiomix.c
> index b2cb157703c57..c409fc7e06186 100644
> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> @@ -278,7 +278,8 @@ static int clk_imx8mp_audiomix_reset_controller_regis=
ter(struct device *dev,
>
>  #else /* !CONFIG_RESET_CONTROLLER */
>
> -static int clk_imx8mp_audiomix_reset_controller_register(struct clk_imx8=
mp_audiomix_priv *priv)
> +static int clk_imx8mp_audiomix_reset_controller_register(struct device *=
dev,
> +                                                        struct clk_imx8m=
p_audiomix_priv *priv)
>  {
>         return 0;
>  }
> --
> 2.43.0
>
>
