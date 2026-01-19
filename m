Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B60F29B777
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 19:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850744; cv=none; b=cohbN8lMpYQW6nNmJfdeGDjVgIA3JLDzi+zyZt64TX1t6u5zMJB4OgyHRo8Ai25hc5T+EdDD4gL+Y57b9klqdXl24ky1LVOByN+l5pSdXrLrrVIEmCCaD/NJ4E5np1+xGW2EhwlyKRxXrPkGOK9LKy6Yjh3BBlJ4mf+CcFJsrcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850744; c=relaxed/simple;
	bh=6w5YfztAxp+kt70NlhcKY/Kkm11Las2qp371F9dYbyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UwNXAKHxsklrWE71ijAblnNiywFs4wRMwFzULHLKdqC/6VPKxVyG4mXv/kHiGA4b4fyCJh0cWZcGBCuiFVmOHpSv7FFk6E783W4HPwK40tcwYU50PYBBWCyMZ+dGSa6wtXLiWTngJXcQdHHdz9vNHB2kXjG118RBskUXYsQhqok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5636dce976eso3546976e0c.0
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 11:25:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768850740; x=1769455540;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y1wTxdZLJ7XhSQYYR0Ku2EXGP2C5XG02vKe6+mSL78=;
        b=e/v792tNFa9Q0/4BpiwIlPHkAib9TIXwKLi0bDs1YgkrJ3lvHEFUQF0iJgQS2c2sHy
         qF3okQpcy/Vcm6UCXEP2THDZuN0HeFT7DqyH8ju1ER3QSVLnU512LpPwxllXGVVOksBM
         RYM6nxLWoUJyKV6l93V8R7dx0lAma75lMP+JrAmLcol5rAIGQFsvHQLBkHHa1BKsaKBI
         SOaWA40+PWaR1UCPNGOCco46Ccq5gkyYF8LG/jQ36+ckN0S2tst/4sNvDHo/Ykgdn8Uy
         zeNyFzpiexbiA3ydb0HW8QmkT9fQFlKuHbZjO0hBGjvK8qxenZaZZnWbcKU8nvzj1kkk
         4mQA==
X-Forwarded-Encrypted: i=1; AJvYcCUyh/maTHqGLfwXUHSriIcrs7i/y1D08wNIPobqM/8vo9O/Ij78RlaoYXji9fZEi+AIkvQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFmSNcx3R4Ikn1bNVgWDmRy94e4xpP3oOMpemcZS09G/p/o1US
	PKSXYyerym7ZOyH3KgP9HI3A7HSS3Tm1+ahoohi+aTxAzP4BL3sEmRgXmM5BU7nE
X-Gm-Gg: AY/fxX6XPB+U61+jd3k42V8nQwLhoB8UsBblCgoZJYj6tiRr6MFx2qV3zhCI9NVRNOM
	guAGCjLDcLQYbkaonS6kxqA1ElOgBCuKeltAIMsfnOGVtb+OQcZNDTHk1vZw+b+m0vnCqyFzdFg
	jrvFusqcEQwEAuwas0AUQzna+UpGxG/ZvBfJx/HgV9+qhPQIjBj07r9zbg6WTD3yLI30lB36XC2
	onGKBLuypqAIFA/KGENRIj9nJPQwxb8kmdYaS8OgxZfZ6gGpicShaZ+N6EbizyLI8XKtteTw0z1
	qyxT+AtIgZV5tyccdVHmR86xRlvdKQQ/svf6FXpH8XkL72A/QTWB2t/0Guq+xaURD/H1HLQEbH3
	pu+wQW7xFSWmUJVimHp86acN2kiHMbv/Pdm1Y1BJMrlGQf0tAOtFFFs1PdS/aDM4tZIhAdEuviE
	JaGs9DoA0aVzRp683KkQ2MjJhfim6jblG6w1FsouUervHDsKip
X-Received: by 2002:a05:6122:4685:b0:54a:a3b1:db63 with SMTP id 71dfb90a1353d-563b63dc48cmr3851511e0c.6.1768850740241;
        Mon, 19 Jan 2026 11:25:40 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b6fdb07asm2902788e0c.2.2026.01.19.11.25.38
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:25:39 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5eea75115ceso4081115137.1
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 11:25:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTTJU1+2yTLjpvBdEkr5j1hY6achV7yQ/eBUlQGH+U48s9Ru/SGAr4zvfbdLn6DtvoJLs=@lists.linux.dev
X-Received: by 2002:a05:6102:3e96:b0:5ef:b32c:dff8 with SMTP id
 ada2fe7eead31-5f1923fb2c1mr5826988137.5.1768850738083; Mon, 19 Jan 2026
 11:25:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 20:25:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU56p9jH8OZ5bpwKq8Q31C-8X85YAjiXZm8amYdo+Xotw@mail.gmail.com>
X-Gm-Features: AZwV_QjRSaQ_qXyXNZN9OqtIjEIE6rAZwNcvdO7jDgxqMH0vtYkLnv2_hmzs9Y4
Message-ID: <CAMuHMdU56p9jH8OZ5bpwKq8Q31C-8X85YAjiXZm8amYdo+Xotw@mail.gmail.com>
Subject: Re: [PATCH 7/8] soc: renesas: don't access of_root directly
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
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> to retrieve the relevant information.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -6,6 +6,7 @@
>   */
>
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
>         const char *soc_id;
>         int ret;
>
> -       match = of_match_node(renesas_socs, of_root);
> +       struct device_node *root __free(device_node) = of_find_node_by_path("/");
> +       if (!root)
> +               return -ENOENT;
> +
> +       match = of_match_node(renesas_socs, root);

I am not so fond of these of_find_node_by_path("/") + something replacements.
What about adding an of_match_root() helper?

However, in the previous patch you used a different strategy:

-       if (!of_match_node(imx8_soc_match, of_root))
+       if (!of_machine_device_match(imx8_soc_match))

>         if (!match)
>                 return -ENODEV;
>
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
