Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F942EA470
	for <imx@lists.linux.dev>; Mon, 10 Nov 2025 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762762889; cv=none; b=PAVnprH4vDPST3aFWvsXr0DVc/W2ZEk8u8ZOoTSdQlQ//FDEl2CO971uV2ZThX71KZNBFHHUMH+8WU8RPStCREWlK1EzIWNfrcxlWwxnXUHIDWpbCMKDshK/x2TssmHqQ+lU9doZcArc7ZxoMVAmoGtq/voBF30Hr9WUtRqGozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762762889; c=relaxed/simple;
	bh=0IoT4ilGrJkMrpqNcFCGUzEh7/+yoZb8/QXVGlKBPVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HDrxCF8iXqEEeuMG/ziXo1Y4MzK3sEOQ4lfStpDHEYVuqsl0PvkM9kXgDqi3ZzPoGb9ggyE3einHo+bkDnVWJ3RCT2/SWQqiAbz+//ufpgY7ZJAzgX/pbIh2+XWpHv8FRgLT+MbOV9CM0jPUSsHysxmYvwvLQrxmlS+d4eXmfb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ed66b5abf7so31559601cf.1
        for <imx@lists.linux.dev>; Mon, 10 Nov 2025 00:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762762884; x=1763367684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLRDHES8x7hy2Cq6bFhMakeR+ZtfEVkHELo4BsFny2w=;
        b=H3MVF7OtVzmF5hL7uO+foHrJ7w7m/n7hnydUPwRdUtwIvRPIe8KIxhBa2/EEsAIe/i
         Z1QuPwphpSY9GOlKsRMjRGPVF/VejYYJ6/1/l5yU/40DUNzLqxmCaIGy7b16IS/bs8Vg
         EB6MJ3s1ZCaWm8OQOMdiw5Sm153v+qicMt2tZrTTX0YoDAkJG6kZYIMzeFZQvQvytGfH
         OSibvL5P1caklchQPdu7fsZXTSHLlyJzmaQtVHzyUrE8D84Nd4p1U+tdyjb2/+7i4Rl9
         oBiW/8K/l+uX78V/dBPQMPr1ZqCwdiWpvGEz7K43cPMFjBRHjF7dPTjV8LuE/UDIPfe6
         dhqA==
X-Forwarded-Encrypted: i=1; AJvYcCUYhLiMrG8Kqjixz0fljcsFXAridQ6t+xsu0QyWUaMBkqJCxMp+E7PBZb/OFJ62UFCixJo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9GuFxJ1BYMgmJMRQs6eXHgJ1i0Xhg7EWt0zp3RKkJpdazvNyB
	cbfPwC1JYlt5s01+R05l/DmNwERz2tMXXtxI2xhgwYypCUbtKjbXCOwPQtiEPZHo
X-Gm-Gg: ASbGncskhu6M1kKdRL6tUnM8+HmoYrEDmjZWM/rIgBPHzLk9Atmskc4afodSgwXs28c
	rPPP7aKw3F2mDg8Q2Lt+L6K+hrj8dXY+9uYT9fkV8131LBqDyhDLQHeCEnC2xta4YSrm3HxRZxo
	2/ITkoPoMWnlOKS072g0rRdRyFHllLsg14ZyjWTKwfrTQ9HfmD9srm+s1cPT3t5lsqdhU67yk/D
	p6bwMMddWzkrhM9y2ER5y25aM4HoROpnWqp/H4A7jQeurmy3dkhNhmbzn8TgYYN04anem9/b2FE
	94ASD4SSwmPOOV3cvVgrhkk1zhOCVp1YPsQJBcPVwfHrB/CbLemRGdYftm9BLpWkyLkWBo0Z0fN
	0NHs2w1KPtUeTOXFju20Fzn0BE/4nGxLfDhnSHSDT6L8UIzK7oHExlCuCLF4bJSUFpO3XziKcT8
	FhuJc/00unz2weIEs3qEV+obZo57YwIGijsUItVfQFqEV1DcBo2csaSxIh
X-Google-Smtp-Source: AGHT+IG/QIM/Oxi5JpicBJeXA59850MYKFaOKaL8mFc2Vt5E295GXdCVPBlz0SOrVCvGjmSL9LVkdQ==
X-Received: by 2002:a05:622a:254:b0:4e8:916f:9716 with SMTP id d75a77b69052e-4ed99820988mr126475631cf.36.1762762884379;
        Mon, 10 Nov 2025 00:21:24 -0800 (PST)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eda57dc174sm44086441cf.36.2025.11.10.00.21.24
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 00:21:24 -0800 (PST)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b22319db92so279500785a.0
        for <imx@lists.linux.dev>; Mon, 10 Nov 2025 00:21:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVgFn4wecIHLEqf+m4l7y1Qsu2OK531F4IL4aE1kKQYI0NxtqIEtAci3vjiC9s0E9dv/DM=@lists.linux.dev
X-Received: by 2002:a05:6102:c8e:b0:5db:e179:1c2f with SMTP id
 ada2fe7eead31-5ddb9e00ddbmr3016566137.18.1762762522544; Mon, 10 Nov 2025
 00:15:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251107-b4-m5441x-add-rng-support-v2-0-f91d685832b9@yoseli.org> <20251107-b4-m5441x-add-rng-support-v2-2-f91d685832b9@yoseli.org>
In-Reply-To: <20251107-b4-m5441x-add-rng-support-v2-2-f91d685832b9@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 09:15:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWL76hY-Pv30ooSM1J6XkVWbRXSLTDCjfpPOvhFN4tKyA@mail.gmail.com>
X-Gm-Features: AWmQ_bkP3DEy9lbUQUJXmebZYXL_ADR8ol219vUzw9saT-bIiR6N27eoovxyIr8
Message-ID: <CAMuHMdWL76hY-Pv30ooSM1J6XkVWbRXSLTDCjfpPOvhFN4tKyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] m68k: coldfire: Add RNG support for MCF54418
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Jean-Michel,

On Fri, 7 Nov 2025 at 11:29, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> Add platform device support for the MCF54418 RNGB hardware with clock
> enabled at platform initialization.
>
> The imx-rngc driver now uses devm_clk_get_optional() to support both
> Coldfire (always-on clock) and i.MX platforms (managed clock).
>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Thanks for your patch!

> --- a/drivers/char/hw_random/Kconfig
> +++ b/drivers/char/hw_random/Kconfig
> @@ -270,12 +270,13 @@ config HW_RANDOM_MXC_RNGA
>  config HW_RANDOM_IMX_RNGC
>         tristate "Freescale i.MX RNGC Random Number Generator"
>         depends on HAS_IOMEM
> -       depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL || SOC_IMX6UL || COMPILE_TEST
> +       depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL || SOC_IMX6UL || M5441x || COMPILE_TEST

Is the same RNG present in other Coldfire SoCs?

>         default HW_RANDOM
>         help
>           This driver provides kernel-side support for the Random Number
>           Generator Version C hardware found on some Freescale i.MX
>           processors. Version B is also supported by this driver.
> +         Also supports RNGB on Freescale MCF54418 (Coldfire V4e).
>
>           To compile this driver as a module, choose M here: the
>           module will be called imx-rngc.
> diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
> index 241664a9b5d9ac7244f15cbe5d5302ca3787ebea..44f20a05de0a425cb6ff7b2a347b111750ac3702 100644
> --- a/drivers/char/hw_random/imx-rngc.c
> +++ b/drivers/char/hw_random/imx-rngc.c
> @@ -353,12 +353,19 @@ static const struct of_device_id imx_rngc_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, imx_rngc_dt_ids);
>
> +static const struct platform_device_id imx_rngc_devtype[] = {
> +       { .name = "imx-rngc" },

I believe this is identical to KBUILD_MODNAME, so the .name below
should be sufficient for binding?

> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(platform, imx_rngc_devtype);

Or do you need this mainly for the addition of MODULE_DEVICE_TABLE(),
i.e. the module is not auto-loaded based on just KBUILD_MODNAME?

> +
>  static struct platform_driver imx_rngc_driver = {
>         .driver = {
>                 .name = KBUILD_MODNAME,
                  ^^^^^^^^^^^^^^^^^^^^^^^

>                 .pm = pm_ptr(&imx_rngc_pm_ops),
>                 .of_match_table = imx_rngc_dt_ids,
>         },
> +       .id_table = imx_rngc_devtype,
>  };
>
>  module_platform_driver_probe(imx_rngc_driver, imx_rngc_probe);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
