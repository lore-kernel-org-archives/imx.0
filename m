Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F50830E84D
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767691338; cv=none; b=unodUT6nif7zT+t0S2fWItQV7RkF7PIpUfIFlCSZ5EfPz/U0Tg0RjCPn3uMYT4WXhWi2jQCvBYogVe8zAKr0QT0qkdv2FWCgNaZ6xeaCGNUvYfvOOMpFIQlU+Bxco3P3lJmDeGdQreK2/h9RAtbAJ0aIj82F5LBcz87iXNdREuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767691338; c=relaxed/simple;
	bh=oGWEDzx0GCta1OvN+DPAb0Ri8GEUryM+YKckFtZpRpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYeL+/+umZxZ9gPTkMNjuaG87RxecQDMhjkVBIA+wmgiM7p8zL6v+N/vLqvpZqUPsC+AAfXARlr9PeWZKVKIJR5x+qEZ8d5xVIQWWT6pTMEhOPmFikmki86CLM5zVSAKREu355A9JX5FJB3yDGaAv3QE3evm++QnMv0hIFY7qrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5598b58d816so561555e0c.3
        for <imx@lists.linux.dev>; Tue, 06 Jan 2026 01:22:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767691336; x=1768296136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWrr+aouVwIROBpBmJECMnG33Dep8i0hbCwAaVkq1R0=;
        b=XBehX4/ixn6BQUOtC512UN1g0sAZiH/HFRj1sgg+OYgRaT2JPI1676X/7y+yMSr6gb
         dInVqw+YfFkzZiiSmdOFRUrZQEY9WmuvyTs4FQqnaV2iHGfKKBdDpTEWjMWFr3u1cyrT
         SsmDHdp9iMh2DpF8FALb+pnd76CppofQnNbvsdk5NCoFPERqL0fKdB2qggXD3l3PR+nx
         OyKbYUKo2I8E68HN4j0MMQM8zJiKahwy39JBmztrv4ETn6j6cg6+Mck8sMQq1xCb/MU3
         ConpV7s0fkraNrnPdr8CigLQBllQh1f1XdU6Zud3NvFtZwU80pxWMBoR910bU1BFfSlj
         An3g==
X-Forwarded-Encrypted: i=1; AJvYcCUZaJNuNMx+L0Lilm6wcfZhhOiyMNrbKo/iEjWS4xGzn7vJHmOPDgERjYrNwYJLSUzWrg4=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywzk/IaKwuh4eL1u3J9rn8Gl9dPfhPsEvbx4euYavIMfZ4R+LGx
	L3pEt31aORMbkPNc/sl+YpAXRA2UKulYoxeb3IWHVlH/YVyyZD52FzPE++KmbAdI
X-Gm-Gg: AY/fxX7xeDy0V2n/qzYWxrzxWwNthhwUzhId06/mtz2SUWlO/XfzO4P6rHyklI4XBYY
	mGF7eLHURwL20NbahJJMXPLdb5TFOUOj8GTi2uN7swK95IpyPMvwIbuVuWD/liFCfoHVUlBPddb
	kYnVn1Xw40M1VZuSbLP2XG+0JYiXW0tNpy4oHJqVaZwtubW6pAuZKWkvxEtrIKdGUfONu5L1EqM
	e6RKRqgeBaQOIcoJj1IMw0NnQj+9Jk3jkvl1OznYcBj+24wrmrGCU5Cxt6dsfHUpeUdNqUgqS/H
	gXqFmEEmRH13m9dLj7XgJDWBrT9pundr9w8pqTwBh8XsikjVSbgvrWcwsrYYltGUyFJk+jh/NzE
	9ls+pAdFf0ZHeduJ4Jt0FWEWuRY7qQ3dRO3kZlSVqvTuKLZAFDcCHyfBcEnFBxZ6wMBGopgDESs
	wkphr/QRoPtTLj15rHKVKqz6t7vfcBlQC7mEUQ2bYuaHSr9s+ZGeN4Trx8j6rMguk=
X-Google-Smtp-Source: AGHT+IED4zpRfTYfJjpJj0m/ly2K0/6zQcxj7966+3llYS3erdQAFgY17/pk2ybIQwT3YxoTLP+OXQ==
X-Received: by 2002:a05:6122:190a:b0:559:6092:936c with SMTP id 71dfb90a1353d-56339500d9cmr731196e0c.12.1767691336146;
        Tue, 06 Jan 2026 01:22:16 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a20a183sm516143e0c.9.2026.01.06.01.22.15
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 01:22:16 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-55b09f54e98so233348e0c.1
        for <imx@lists.linux.dev>; Tue, 06 Jan 2026 01:22:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+0/SE4/pocomcb37gNa5JYzYZIdBdrnpMizSywIDy0t8h+JcT0BPcEWimElACxJd4ifA=@lists.linux.dev
X-Received: by 2002:a05:6102:6a92:b0:5df:b31d:d5ce with SMTP id
 ada2fe7eead31-5ec74524009mr734718137.28.1767690842994; Tue, 06 Jan 2026
 01:14:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com> <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jan 2026 10:13:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5ffiW_vEuDjV5bnmTeduhoqph7t8rsaFEVO7RXOM8jg@mail.gmail.com>
X-Gm-Features: AQt7F2rMrz4VfFE8hOXFGnfaW6TUCM_pC_Fx6Bfylmm0kWFPuXvkE1g4WrvoTA4
Message-ID: <CAMuHMdW5ffiW_vEuDjV5bnmTeduhoqph7t8rsaFEVO7RXOM8jg@mail.gmail.com>
Subject: Re: [PATCH 06/12] i2c: rcar: set device parent and of_node through
 the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Tue, 23 Dec 2025 at 11:05, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -1149,8 +1149,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>         adap->algo = &rcar_i2c_algo;
>         adap->class = I2C_CLASS_DEPRECATED;
>         adap->retries = 3;
> -       adap->dev.parent = dev;
> -       adap->dev.of_node = dev->of_node;
> +       adap->parent = dev;
> +       adap->of_node = dev->of_node;
>         adap->bus_recovery_info = &rcar_i2c_bri;
>         adap->quirks = &rcar_i2c_quirks;
>         i2c_set_adapdata(adap, priv);

    [....]
    ret = rcar_i2c_clock_calculate(priv);
    [...]
    ret = i2c_add_numbered_adapter(adap);

As rcar_i2c_clock_calculate() uses rcar_i2c_priv_to_dev(priv):

    #define rcar_i2c_priv_to_dev(p)         ((p)->adap.dev.parent)

I believe this will deference dev.parent before it is initialized by
the newly added code in i2c_register_adapter().

Let's check...

    Unable to handle kernel NULL pointer dereference at virtual
address 0000024c when read
    [0000024c] *pgd=80000040004003, *pmd=00000000
    Internal error: Oops: 206 [#1] SMP ARM
    Modules linked in:
    CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.19.0-rc3-koelsch-04401-g9e22366a23cd #2288 NONE
    Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    PC is at device_property_read_u32_array+0x0/0x14
    LR is at i2c_parse_timing+0x14/0x30
    [...]
    Call trace:
     device_property_read_u32_array from i2c_parse_timing+0x14/0x30
     i2c_parse_timing from i2c_parse_fw_timings+0x28/0x12c
     i2c_parse_fw_timings from rcar_i2c_probe+0x1cc/0x534
     rcar_i2c_probe from platform_probe+0x58/0x90

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
