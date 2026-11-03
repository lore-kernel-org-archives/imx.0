Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793714625;
	b=Jmy1F3qAesctGgysFbufEr9QvxCocaLW84zOeHGjRXoG7cp5cNbrOK4JvBnrNhphlwUJ
	 m8rHpk1HT3x0rsmTvFzQ4ZsdjPfV8IdNVr0xLTrAkk1v61EMAO9HhlIqTtoT4/4DuOh4v
	 kvlodO10g0NDs1GMNAyUt44rUU8TdvKxnZG8TAEPJAFACgE9W23RlrlHkgJeUeworIN0J
	 qWdIjG1uatvkIwY3mJomOm/rnNZMHlPU0UQvE07WIbtzLRzbR5/T+TRr7B4ke72MyByz+
	 h0NIfEuFErcGeWW0CLvXoaBpXBLd2aWHg2QwsrJOFjKfyb1KcrPuWsLuHwAA5imGVVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0mpQqPcx/wO2M/JeyOkuY7Hd6GV1/TOLmZZItrx8K9I=;
	b=YRvs7MvIrg7+4o2wy0LwpvgZHX0FpDjObNlEyMAZUWG74ik2R79/2YJ8DNNzMheapqMf
	 appow2WVm92id7unAveIxX8UBFoplZmg5lWoyfjO6DW1oiwm2qIg2a6M6HPkZH/PEjwgK
	 ypQPpFiuMABtdgL/8+bQ+KVIjoi7vEKxsb/aXM2qBFf4OTFAjOytL/FM1uON3mHVGEe99
	 R8yO4K/AzPEdX49zsJe7+JuruAN2cPDPibz9aF39nTV7Y/dJa5UKfRtPDrqj/QcdOpL7b
	 uvfodk4B+T17X36E2ukCzzMoLZfQZo6TulvNTlo0TLgUj2pglcw6hTEdRvLXfnu4c+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AOA+32KB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7D16071BD1
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 14:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB7D16071BD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AOA+32KB
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so37938605e9.0
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 06:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793714623; cv=none;
        d=google.com; s=arc-20260327;
        b=UjTTHZlWwMpoVrdtnLGXIsL2JQ8fu3DrOvm0KrN68CWgWrY1JsrorYvtDtfr8msOX4
         vmPWMYaCKRe5WHrRJ0JRPrG/GffLvZoW/7u7HDkkrXgcHqtXhBbMMdnFVNhwr1UPeJSI
         HnNu6anJkuR153GSk3cvaS41aQ1z2/6C/ox+Jr03XTmKaAfs+NZrZ/sCcLXGpXtWtEw8
         zAiCGvzP6emWuaTyIyZrdSgEZ/4VMgyCKkpu2RcpQkmKFzUunbsrQD6AbNBDXwFgdKzQ
         +IsGwx/jbBUskwGNvviwKhiomCVXt99swnzo8j+kICR76bxBb4A1wZXl6q4BZ0saXfBS
         2qfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0mpQqPcx/wO2M/JeyOkuY7Hd6GV1/TOLmZZItrx8K9I=;
        fh=NVkxb1IkfAIBWjYLgYRiFPQt95IDiVTheIjZR4+i9J4=;
        b=kf4bUqqA82W5J+1ero2d/R1v5hiFXv1tw9Bng4W/rTHTfO9NY727eaz462+KWzjV54
         wD/dXWAn5gP4ni84WOjBImLrA6u9nzEENRG1JtsmZpciG3r7dOgVZLF8TgmDJQEhmm2a
         e5wvZVaNHFTzgY/KdpXGGAqDe1+/P/Fr0PCbphFf0pNGiKOxeF0alKR4fmMamdNEFgH8
         3cB1KhzgfOZe+T8YGjhl4w8xeQ3vMUsnMffkkuIh/LLtABFN4dEFwUeoJyGLVTP+F7/X
         JH5hz8LC6TIdRzclT3Vn4uJvyaJd/FwVcpOYSBgwY9S4MEB37+90NfYQzuZzuJm6Y51w
         wYJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793714623; x=1794319423; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0mpQqPcx/wO2M/JeyOkuY7Hd6GV1/TOLmZZItrx8K9I=;
        b=AOA+32KBftXDOGzTH5izJ3PZvVkbsDTOwEwbbTwQwrEvpohE73xMoi9rPnWJpe2SEy
         9ySXMl1V2Vr2uUKMoAxeLFfHz/uEi6zNfzv75VmybXnDykrpozSlnHp0e0nwbSZAippN
         Z3dw+ocgiaRSNwo1umE8b9qKlHRo7EaCMAs6daX0HSl084mGIGUv2ZD6O37NciZn6myf
         Z0HDQcMsXUPOTjzeC/AV9DwCoKtV8yYKLxfjZNmkykD7CAcGCLQ7LW6BekoKeMIqNAL5
         hqkq6qQzjxEFZ9kFFXJkdh172lS+Cu4NtkgdOiXXiqIY9pCilxLl2YWt4593AOJAdRPd
         kkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714623; x=1794319423;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mpQqPcx/wO2M/JeyOkuY7Hd6GV1/TOLmZZItrx8K9I=;
        b=pUkjGbyoj+PEMByud1Y21Ffa03jgSs0a8Sidh0hUYpw87HRLNTQQbU+u3AQQfHqK26
         Sqrbkq9imnIpS1UvSM6drSYgybAf+KnjBUsXhdvWnL6mxzaI/NH+ez2ePIRJTQvBKzi0
         1Ywjor5qYFmqvYw6DJkUQptIijebQJWUQ+/dvRRxOTj0aT7Cs5T3XiS5rlVImYHxtIfN
         +eD0exWtEsNycu/Ve02VKfBJoCbTfeh5pwifZDq7nMXx1+DTnd9XbCKP9pKCPA+3j7aP
         e9ByUshQaTWwz/CNWl504uhekP1WigZKZW7CJ/KmOAV7sLNKe3d9SQhk4Q6vHPwgvyRN
         L+cg==
X-Forwarded-Encrypted: i=1; AKwUvBxVUMdlcf5BfxNGpyHPbjX7fibanrsg2/BwVciaQoQDblP5TraiYh7xxX7k9yFhsAeh7Zs=@lists.linux.dev
X-Gm-Message-State: APuU4Z/F02XLuhU9XG5FoaMxS1wHX9nDe2aJb/2iSNZkAJBtSKGJEE2n
	LSH7Np4imuI+wQcQFobK04oaPOmyBs1ygbfd0Wn/Yta9HebHJS8Jp7MDzrlAofiNrLJchNgX9J+
	2v2LpFrdtieKWZq5KPGLSNaqQi2jEMfk=
X-Gm-Gg: AYBFou3ak589HCwG7DphQwaahKcepxIGfn8bAnyWPiAihFmhWSwHphnS8rDW5vLnw8G
	S9+ZFE5nOjj1ZbysppEeJQljj45ATZO0pTbH3w6wpTeiuLSWrBijb1g2sQAOhw5Uh80fB4VjBt1
	AvZs1/Uyrt/ZuMogcWRDQcjWKFBF7NOAkaGwJd4Dd5RuqKS02+drzVSdDLliYPvlacgfqoyR8Fw
	BYCbxeRI7B2VJqgeeFSbgBPJUGdDrD6p1PrZM59EiDak0MsJQH9f/12PE5LFAtgcbEIoQbSEZxw
	TbVPqBrjt9/wLaGLIjCEtokThhKEMU057VLfxOLC1VA1lvpr4MdJVxJeXAiP6nGds/sjVIaWsl6
	szKn4Is1CuSz+ZiP8NC6zKDXuG+Py35yDpX3wKRMA1T1ZuEF/NvtYdd3gtBw0Y4IqPe64Y7854A
	Br5LQub1IZ4x3UuCLiVhZdmnSgSu6z6JHKyUh03iUirGDmJCgX+ZKYKeCD
X-Received: by 2002:a05:600c:848c:b0:4a1:efd3:9862 with SMTP id
 5b1f17b1804b1-4ac1765d977mr282488195e9.21.1793714622717; Tue, 03 Nov 2026
 06:03:42 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102170911.3867389-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102170911.3867389-1-Frank.Li@oss.nxp.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 3 Nov 2026 14:03:15 +0000
X-Gm-Features: AclHuK9lTBNUFEhnmVUe-0bw9b56qg4kVZy5zFZ6xKayAE9tcP58fndIr_XiG0M
Message-ID: <CA+V-a8t0bf_8hc1vd7c+OXBQfgBjp6EJjDALm8+myVYRNzy-Xw@mail.gmail.com>
Subject: Re: [PATCH 1/1] iio: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Eugen Hristev <ehristev@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Stepan Ionichev <sozdayvek@gmail.com>, 
	Felix Gu <ustc.gu@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Shuvam Pandey <shuvampandey1@gmail.com>, Piyush Patle <piyushpatle228@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Cheick Traore <cheick.traore-ext@st.com>, 
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Shi Hao <i.shihao.999@gmail.com>, 
	Kees Cook <kees+treewide@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	"open list:MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER" <linux-iio@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:RENESAS RZ/T2H / RZ/N2H A/D DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:55=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/iio/adc/at91-sama5d2_adc.c                 | 3 +--
>  drivers/iio/adc/nxp-sar-adc.c                      | 3 +--
>  drivers/iio/adc/rzt2h_adc.c                        | 3 +--
For the T2H changes,

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>  drivers/iio/adc/stm32-adc.c                        | 3 +--
>  drivers/iio/adc/stm32-dfsdm-adc.c                  | 3 +--
>  drivers/iio/adc/ti_am335x_adc.c                    | 3 +--
>  drivers/iio/buffer/industrialio-buffer-dmaengine.c | 3 +--
>  7 files changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sa=
ma5d2_adc.c
> index 78081cbfde5e8..d479c9bc9b3e8 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -1240,8 +1240,7 @@ static int at91_adc_dma_start(struct iio_dev *indio=
_dev)
>                 return -EBUSY;
>         }
>
> -       desc->callback =3D at91_dma_buffer_done;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, at91_dma_buffer_done, NULL, ind=
io_dev);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/iio/adc/nxp-sar-adc.c b/drivers/iio/adc/nxp-sar-adc.=
c
> index 2f716a2f97b80..82d8d921b0293 100644
> --- a/drivers/iio/adc/nxp-sar-adc.c
> +++ b/drivers/iio/adc/nxp-sar-adc.c
> @@ -696,8 +696,7 @@ static int nxp_sar_adc_start_cyclic_dma(struct iio_de=
v *indio_dev)
>         if (!desc)
>                 return -EINVAL;
>
> -       desc->callback =3D nxp_sar_adc_dma_cb;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, nxp_sar_adc_dma_cb, NULL, indio=
_dev);
>         info->cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(info->cookie);
>         if (ret) {
> diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> index 8ba7b0fde8a19..3e52b7d660dd3 100644
> --- a/drivers/iio/adc/rzt2h_adc.c
> +++ b/drivers/iio/adc/rzt2h_adc.c
> @@ -394,8 +394,7 @@ static int rzt2h_adc_start_dma(struct iio_dev *indio_=
dev)
>         if (!desc)
>                 return -EBUSY;
>
> -       desc->callback =3D rzt2h_adc_dma_callback;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, rzt2h_adc_dma_callback, NULL, i=
ndio_dev);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 600f975f1d7b5..fa2a781e37777 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -1901,8 +1901,7 @@ static int stm32_adc_dma_start(struct iio_dev *indi=
o_dev)
>         if (!desc)
>                 return -EBUSY;
>
> -       desc->callback =3D stm32_adc_dma_buffer_done;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, stm32_adc_dma_buffer_done, NULL=
, indio_dev);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-df=
sdm-adc.c
> index 674767da3ac37..f0239f5f30afe 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -1006,8 +1006,7 @@ static int stm32_dfsdm_adc_dma_start(struct iio_dev=
 *indio_dev)
>         if (!desc)
>                 return -EBUSY;
>
> -       desc->callback =3D stm32_dfsdm_dma_buffer_done;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, stm32_dfsdm_dma_buffer_done, NU=
LL, indio_dev);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/iio/adc/ti_am335x_adc.c b/drivers/iio/adc/ti_am335x_=
adc.c
> index e53c839e87ef3..230f1c990317a 100644
> --- a/drivers/iio/adc/ti_am335x_adc.c
> +++ b/drivers/iio/adc/ti_am335x_adc.c
> @@ -259,8 +259,7 @@ static int tiadc_start_dma(struct iio_dev *indio_dev)
>         if (!desc)
>                 return -EBUSY;
>
> -       desc->callback =3D tiadc_dma_rx_complete;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, tiadc_dma_rx_complete, NULL, in=
dio_dev);
>
>         dma->cookie =3D dmaengine_submit(desc);
>
> diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers=
/iio/buffer/industrialio-buffer-dmaengine.c
> index b9f8b5b3aa6b6..7ecb9d875b8e8 100644
> --- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> +++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> @@ -160,8 +160,7 @@ static int iio_dmaengine_buffer_submit_block(struct i=
io_dma_buffer_queue *queue,
>                 return -ENOMEM;
>
>         if (!block->cyclic) {
> -               desc->callback_result =3D iio_dmaengine_buffer_block_done=
;
> -               desc->callback_param =3D block;
> +               dmaengine_desc_set_callback(desc, NULL, iio_dmaengine_buf=
fer_block_done, block);
>         }
>
>         cookie =3D dmaengine_submit(desc);
> --
> 2.43.0
>
>
