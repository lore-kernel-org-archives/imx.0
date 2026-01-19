Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD742BDC0A
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 19:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850621; cv=none; b=PKqXRZpUk2NROj+vBx6uv5k6029YHawHvAoVnnucJUYg1TNYpEGxIVb9IA2BX1lf4zrDrIQ+BCloVpp5CVOnrgH3g3f2TTIWmcHlP9kq2Yq2UCj9f2LqwX1gXB6G9pcOJ2gvWI9pRdGwRPuQyztepqn5EQ5YB7QyowwPW8skWg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850621; c=relaxed/simple;
	bh=mMp6iFxraRTP7W2rjXz9S3lRqN19hV6viOdRrtle5z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOujf/DJjp40DY3dJWCL4r5+4eEnEE6DcI0mhiwM9n6sVKQk6UDFrsX1mXYkpFrIvY0PKnnLiTZOnMsGLt6ESBzb6jhzETVlWbn6k8HyaVkvPWK98yALajRrDSwofQdge1U1lJbAAU1fWzzULqz4T86JVuCJEs+LCBhHDpGIWUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ec8781f5c9so2061387137.1
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 11:23:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768850614; x=1769455414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCb1Q/eNGJuZWnaSy0QMCWG02dACV3WSdsoPlEt9HTE=;
        b=HVw4xS+mRCBt5XKppZx7P0YC3BDerEvolJNJg9nBHFwIyA2SchlyfeTk7/77ZvJ45W
         P4sfsP5PQTSH5aY6N0BGL32VpiU+eE1YTmDzHaVZFHr/6nEu/R3Bu0djYekBJ50qU6Fh
         nkFldpsdoQkoxGQnCCN5vNP7kVu5mGYgTDhfTwYGwN7002uFeElFGOfCP4JcIVcY62Na
         ey6IRho2wR1/MblaqYcXvm2KOSkrdoh7Yr5Xtq5NYVK8JwAlRwW1QDWem3th6qNXRno9
         4okZ/FvR6DjtWN567s+Ts045Q4Tdt4GKxoANfSR1VzrI44ar9p/ac3d0BvxTvhKQkHoE
         NJhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYlOBrODMerCiqAxhBIFpn3TiXolEn1g6T3QeHEwPRnzWUitgf8/9/78+uCD0gyvC3MAk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yys6MVp5n4peIF+akA90+6fFindwu6tCzi7FH2nQ52l2Jtz7kKY
	Ru7N3H9Ql1VbSongeH4965aFdDD2xRo9J3/Yxv/qV2j81TWXWEtG+fdH/wGC7XLP
X-Gm-Gg: AY/fxX7P58RomjMgqdQpabdQyVtjxqM1r8dZ+P4e6tQMy6+BlkHAXvH5p8PG1TsiPkz
	klVDJCrnuLj9LTzq7Sz/Q7ulr5K94snX6erndmnqIO6eqzmn3vCPnnspTxKAzmD0tmIAzmqOfvG
	0vRVKNlzhickRBmBimMcgi6AHmRGuQ6Nr4gbOep39Lhx2S5MFCoaVHdfOz9nFwarGpMC6P8Cotp
	6DZ39Of+LxJNdWYRYZQugTLd5Er1/eqf3SjPZ/8/NWCOq8qzLtC6fdO0pNjMJkp71E1dfel3D/b
	ZHOX23Nuo5YaF4xxcoeUED1lup1gfDc490JjL8DGIMPQoaZ77JMdGBTHhZX1Fz0Lsk64nCDiG4l
	HEIIDmgfG7max3lhB39ZMSCZSAcPJAJKpTx9hRUSZMb2pR1wsAknfQ3FSNmKOEA+GUib2Y3v1lS
	8gl/AHOJztymtSNpl2Q49kgYeI5ompMvAoz8ufOZPgPnX2mTIF
X-Received: by 2002:a05:6102:cc6:b0:5e5:2655:d401 with SMTP id ada2fe7eead31-5f1a5513588mr3818997137.24.1768850614098;
        Mon, 19 Jan 2026 11:23:34 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a69444f0sm3641293137.7.2026.01.19.11.23.32
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:23:32 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-941063da73eso3011866241.3
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 11:23:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgfAnmHcTR4RaXdJsTaN2c0iDNbb+aRodAMYoIxyUdZci04dxZpf/YE2tCSXlM/cc/glg=@lists.linux.dev
X-Received: by 2002:a05:6102:44d2:10b0:5f1:c453:b5ab with SMTP id
 ada2fe7eead31-5f1c453b6acmr1782180137.13.1768850612507; Mon, 19 Jan 2026
 11:23:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 20:23:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXt69AywBVsY3DKH+cS52=Cw1xsvvBDBV3MXirZ+LYj+A@mail.gmail.com>
X-Gm-Features: AZwV_Qja2okCrIX9za1x2Adx7NBF3Qx2Xd3iJQm2I4PbFkiFeek_zkUKX3woR2E
Message-ID: <CAMuHMdXt69AywBVsY3DKH+cS52=Cw1xsvvBDBV3MXirZ+LYj+A@mail.gmail.com>
Subject: Re: [PATCH 3/8] base: soc: export soc_device_get_machine()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Some SoC drivers reimplement the functionality of
> soc_device_get_machine(). Make this function accessible through the
> sys_soc.h header. Rework it slightly to return a negative error number
> on failure to read the machine string (SoC core can keep on ignoring
> it). While at it: make it use the __free() helper from cleanup.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -5,6 +5,7 @@
>   * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/err.h>
>  #include <linux/glob.h>
>  #include <linux/idr.h>
> @@ -111,17 +112,18 @@ static void soc_release(struct device *dev)
>         kfree(soc_dev);
>  }
>
> -static void soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
>  {
> -       struct device_node *np;
> -
>         if (soc_dev_attr->machine)
> -               return;
> +               return -EBUSY;
> +
> +       struct device_node *np __free(device_node) = of_find_node_by_path("/");
> +       if (!np)
> +               return -ENOENT;
>
> -       np = of_find_node_by_path("/");
> -       of_property_read_string(np, "model", &soc_dev_attr->machine);
> -       of_node_put(np);
> +       return of_property_read_string(np, "model", &soc_dev_attr->machine);

I am not so fond of these of_find_node_by_path("/") + something replacements.
What about adding an of_machine_get_model() helper?

>  }
> +EXPORT_SYMBOL_GPL(soc_device_get_machine);
>
>  static struct soc_device_attribute *early_soc_dev_attr;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
