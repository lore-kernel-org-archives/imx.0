Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE22275AFF
	for <imx@lists.linux.dev>; Mon, 24 Nov 2025 13:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763989533; cv=none; b=VE6FZ/lU7rUwf+ncJdAanDvsjUt3Xt++UN8u+9gGI6AALkkPZVcJ9C78mgMPIf9Qz40ZrJsGpvuDQXLcfvYJ7UKq9NqNUUPGVrvdApRFy+o1tkMhKajIaVXNk7S4UVvk4C/TKGRaD2D4a/gy4nlCkiT/mYuCYREnz3wI/FGvIHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763989533; c=relaxed/simple;
	bh=rvffBPeDVxbQoo+Q7lx63a7eZIjGM7ukQNoAugTkn9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXv+g488H0ef4IOPMRGUFGfvIaKFykjXZbLpFa1Fmc3+QPTWJK4GBquftALsmhO3/GAY5XL0Qes51kExR6UTQ40oa6yIjrSB6a7nU6yoaw8EyNhf5/QUgDA810JbC50pH3AUTEPvsTQwha91Ec8cnsYYl1d1Fsr3sRQSVXga8Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5de0c1fa660so1388434137.1
        for <imx@lists.linux.dev>; Mon, 24 Nov 2025 05:05:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763989531; x=1764594331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRA7IiXm/R9YyxGpbeRsKjwk7bFwEo0rtrEj2XwEZxU=;
        b=eMATc/R6L6D9hlCodSk1FSuAllDZcl6R9gkVRJiJVtKHJqeqDVpXDPunBbRxR4ssQz
         DRKBHvLdZETg/N5/FABSxMU2AGoHZAnfPFYpC0960LgPQ9Fipea2TIyLXMKepg0c0VdN
         IK8L204qi06qQNb0k1gsG3+dQWkmGZD/CXoPszQ43IKdayQIwcJLmeE9a6GzxDun0FQz
         gNijSYl1M6+WWX8ii4nhHCzCbXpWskf8mUrW8GQ4Jk/mhoZkRV+OExoXYZFDaELAS76v
         iJ6HCtgyEeSvjkYLQU2C897InXYyubvIg3F3E7dU6V2jNl4uOflrbfdvoGU84WfqP0lz
         VAZA==
X-Forwarded-Encrypted: i=1; AJvYcCUDy8+MgQ63lq8aqOH6hysEKPZ+p8mJj7HjKBzfcaxpILHjbP9bN11GuaWKLkd70By/taI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+ZsTxSKNxMUWZyouSxSSVNj6KKPOUHjPNGRzPcGQtjF7OPZSa
	WPawwpsUDgbzsUFx4L4L+qRKGcECIE7TIcspI/f5wsPZ47dRTIK3Gggt2MP2GAnJ
X-Gm-Gg: ASbGncvcIEFgZtKz5Gp0dEJ1Tr3iJcec2oZs/l7+q/ZM9yCJ0prI9komoDkNaXDnRAY
	r8Nuz3AXuQA+YjnqB9DcDfdM97OlqNhHwIUF49wZXzNHYIzAOyeDcLFhx4t2nHJ+cZqunUmkCkM
	arcxpfamy9bxzT3PW7Msnz0gDyJWL24AaLNHRM5HLgyUxYtoUH6jz14Esh6h1pd294rXEeEZ8FN
	/7vRTXwwiOHpjvgOeKCQQ8++lTEdwZOwkTdbiDO+9yKzgS13BQE/512IHn2//JaRarx3/Xkb+TM
	OMQtXUcDZOULeijoYJR3dETA1br8TRpHdPVT8ITxes0pKeFCDL/oMy7hpK/8eP4aIzIl+Ot3YOZ
	yAAGJN/h+jJQZlOXs/B/TbfbzYGcjoK423KsxwuJ6C8Tufvr0CCGPv+WkwIUoFte6uJxLji3PBo
	nyMyrkqEh02AWYyGJQfqCBtA6+GbHUXaKWJZPb3megIbwgJeuq4m+1zFirZXQ=
X-Google-Smtp-Source: AGHT+IGCFTuOJ00pH7i5itBtx07opY87PcgVMs+SoY5d3W5XqvlqSjGPKP+X6ZyS7/7KgGvuhPxejg==
X-Received: by 2002:a05:6102:8092:b0:5db:ce1d:67a2 with SMTP id ada2fe7eead31-5e1de18eedemr3185096137.1.1763989530419;
        Mon, 24 Nov 2025 05:05:30 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1bdd21e37sm5105880137.11.2025.11.24.05.05.29
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:05:29 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5de0c1fa660so1388415137.1
        for <imx@lists.linux.dev>; Mon, 24 Nov 2025 05:05:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1SiYmStTKMXWdD+pZj0A/Zrls+JeAhS+bi7RpA8CBiDw2Z0DsVyB/jjbwJ8HKc7+MWHU=@lists.linux.dev
X-Received: by 2002:a05:6102:5113:b0:5db:18fe:7520 with SMTP id
 ada2fe7eead31-5e1de3bf69dmr2992625137.22.1763989529183; Mon, 24 Nov 2025
 05:05:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124-dma-coldfire-v1-0-dc8f93185464@yoseli.org> <20251124-dma-coldfire-v1-3-dc8f93185464@yoseli.org>
In-Reply-To: <20251124-dma-coldfire-v1-3-dc8f93185464@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 14:05:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWDryHHdrsBzsUF4BRhNoDXm4+3FVQ4FV2acGT6reeYhw@mail.gmail.com>
X-Gm-Features: AWmQ_bleU8rfcOoPzR7hq6Rm0AD1QUkBfKzAzzAbdXJa_V1TGP9TwrSr0BINHw4
Message-ID: <CAMuHMdWDryHHdrsBzsUF4BRhNoDXm4+3FVQ4FV2acGT6reeYhw@mail.gmail.com>
Subject: Re: [PATCH 3/7] dma: mcf-edma: Add per-channel IRQ naming for debugging
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
	Greg Ungerer <gerg@linux-m68k.org>, imx@lists.linux.dev, dmaengine@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jean-Michel,

On Mon, 24 Nov 2025 at 13:52, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> Add dynamic per-channel IRQ naming to make DMA interrupt identification
> easier in /proc/interrupts and debugging tools.
>
> Instead of all channels showing "eDMA", they now show:
> - "eDMA-0" through "eDMA-15" for channels 0-15
> - "eDMA-16" through "eDMA-55" for channels 16-55
> - "eDMA-tx-56" for the shared channel 56-63 interrupt
> - "eDMA-err" for the error interrupt
>
> This aids debugging DMA issues by making it clear which channel's
> interrupt is being serviced.
>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Thanks for your patch!

> --- a/drivers/dma/mcf-edma-main.c
> +++ b/drivers/dma/mcf-edma-main.c
> @@ -81,8 +81,12 @@ static int mcf_edma_irq_init(struct platform_device *pdev,
>         if (!res)
>                 return -1;
>
> -       for (ret = 0, i = res->start; i <= res->end; ++i)
> -               ret |= request_irq(i, mcf_edma_tx_handler, 0, "eDMA", mcf_edma);
> +       for (ret = 0, i = res->start; i <= res->end; ++i) {
> +               char *irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
> +                                               "eDMA-%d", i - res->start);

Can return NULL, so needs error handling.

> +
> +               ret |= request_irq(i, mcf_edma_tx_handler, 0, irq_name, mcf_edma);
> +       }
>         if (ret)
>                 return ret;
>
> @@ -91,15 +95,19 @@ static int mcf_edma_irq_init(struct platform_device *pdev,
>         if (!res)
>                 return -1;
>
> -       for (ret = 0, i = res->start; i <= res->end; ++i)
> -               ret |= request_irq(i, mcf_edma_tx_handler, 0, "eDMA", mcf_edma);
> +       for (ret = 0, i = res->start; i <= res->end; ++i) {
> +               char *irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
> +                                               "eDMA-%d", 16 + i - res->start);

Likewise

> +
> +               ret |= request_irq(i, mcf_edma_tx_handler, 0, irq_name, mcf_edma);
> +       }
>         if (ret)
>                 return ret;
>
>         ret = platform_get_irq_byname(pdev, "edma-tx-56-63");
>         if (ret != -ENXIO) {
>                 ret = request_irq(ret, mcf_edma_tx_handler,
> -                                 0, "eDMA", mcf_edma);
> +                                 0, "eDMA-tx-56", mcf_edma);

Fits on a single line.

>                 if (ret)
>                         return ret;
>         }
> @@ -107,7 +115,7 @@ static int mcf_edma_irq_init(struct platform_device *pdev,
>         ret = platform_get_irq_byname(pdev, "edma-err");
>         if (ret != -ENXIO) {
>                 ret = request_irq(ret, mcf_edma_err_handler,
> -                                 0, "eDMA", mcf_edma);
> +                                 0, "eDMA-err", mcf_edma);

Likewise.

>                 if (ret)
>                         return ret;
>         }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
