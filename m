Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9669B244678
	for <imx@lists.linux.dev>; Wed, 28 May 2025 07:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748417885; cv=none; b=EVN5CRPcmflMRdEHEVN3GetKabBQ2ZnWOQLVRq5a5uPjBlZoWOy4ruHtgOSZsG2H5d6X/JgXWTxpV69dmPotan2ICeht6vnzuSVfAlUhk/V2QSpwXar2+Csrvhyfr/3sH93+e6aa1iu5tWH4Kwp1kjFWlNs0YxoIme6wRcGiTLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748417885; c=relaxed/simple;
	bh=dC6/r+XL94KrBaJDEg8ysPYbOiXiNK3lHLZP0ifcAGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RW9C/0hfL8yh7PTAH82vOycIKaZIShyjg1w69vNw/mD3ztrM4ovFzGfRIA9LxCHLm6TFIi3D4wB19gCript1HnNS8L8fYLwn37ek2MnNDGQTGtLop+KKi1EI4QB2L2AZKP16w6bHyp/mkrFFPsLsfyA6Lfi0T6nsA9s1Xnj9KXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52eec011ff2so1291000e0c.1
        for <imx@lists.linux.dev>; Wed, 28 May 2025 00:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748417881; x=1749022681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0FIvnATmtkNNdXQbt1Fz7I3kCcVI6Dqou2JsI1LDaQ=;
        b=vrtQnnf5kqVa6QIVDdOLQXfEVTShoFvYynNMW+QyP8LcY28PVkORFVWs98DI8yJvd1
         WsG/jyUZmXqnD4rYncSfjCv+MJBpIFoAYzovl6JgEczRefEdRelvtQglzNYDROEltUAO
         sadmDkhMESUMgqw/HI0va0Y84bo/xVQAdqZo/ftRlKskLZSrDLBQ2KFmlRqOzl2GhHfI
         7h7V7OPbGmFk4d6UmEhjrVcks0oHvbCjsUkG3i4Z9NkT0iNY+xGqCRyXF+LA9zVHEBm3
         LkrAF5EHxvBn0xuQl02Ykpv2D6aOmvaAseRF4qLP5Rs0HG1ncLQ7cMuGNcRO/5+6fPJD
         yPSg==
X-Forwarded-Encrypted: i=1; AJvYcCWgKVyTZZW+I/cY5UHwrktbWnlwnUsdot12DRRed4oUn/QyFy4Dd0uaqyRwU8wA323+RbM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1ND4Je4X4netq3eafsioejI1dw3I1c99+Z3osyikwjhJYnGUl
	RcZfeG/K+gqT5KRR+yFe92BrZG1yxNaJV7uhoX8tFAmiLl9+KgbRJ57gGU/zg1ZZ
X-Gm-Gg: ASbGncsg0KH80KPyooSyRLvfk/xVa5fmoJT7UCARhfEQJLtsImJjTnn9CsfpuaERiq2
	Z2kFazV1LVQERT4dj8nKqHZYP0VVQ7rFU1+LB/+aNA1x1Uvbe7S5jFET+22xWan5WPMM6wgJtwR
	yxQNkX/pSrZGZAZkHkEeVRF6GBydkzlDsIvMWFfhB6k49MSp8rUpn7BKqB5G0pum6gxqzTi1AEn
	ScgATuD8dQ0DhHPaFhuaTaO+e6v+4C6I1ZKxMeyAAhjfOKU9fCzH3yNCz5vvTYQf8f+5ogAGMZ1
	Lt0mhVWb/9EzAZa6gnMcWTIYCuYtYpsU0LqzjdiG0o4PNEYppv58Hs3vBDwaEbRE6Ao3FZ4NPls
	lUbFvP/fc3n9/NvTWf30S+mkM
X-Google-Smtp-Source: AGHT+IGFSLaSQBP1BwqEW7PsJzsUmXKHNtcmqR/t1RZHmqDusGM9LN9Grxu25p6p7cT5g3wwmsoLmA==
X-Received: by 2002:a05:6122:1822:b0:526:7f3:16e0 with SMTP id 71dfb90a1353d-52f2c4aff40mr9851640e0c.1.1748417881105;
        Wed, 28 May 2025 00:38:01 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53066973bf4sm496429e0c.41.2025.05.28.00.38.00
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 00:38:00 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4e45c4d0f54so799982137.3
        for <imx@lists.linux.dev>; Wed, 28 May 2025 00:38:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBW92A6uVXxIBUS6RWH1yh52qQ7lZmisGQjW2wIDqVLRZuIp35m76oqgKckwO1mUjH7+c=@lists.linux.dev
X-Received: by 2002:a05:6102:d87:b0:4e5:9731:6ded with SMTP id
 ada2fe7eead31-4e597316ebfmr3313200137.6.1748417879962; Wed, 28 May 2025
 00:37:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250527082446.2265500-1-aichao@kylinos.cn> <20250527082446.2265500-3-aichao@kylinos.cn>
In-Reply-To: <20250527082446.2265500-3-aichao@kylinos.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 09:37:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5ZhJrRiuEWLbU_gFcv40+izLpR0HN0EZU415s3QAkVg@mail.gmail.com>
X-Gm-Features: AX0GCFve4Aj5WArc9KkplJVctpVO9pqz2wSMOeJzSTUgarGo2ZgOa2T8YLQGOCU
Message-ID: <CAMuHMdV5ZhJrRiuEWLbU_gFcv40+izLpR0HN0EZU415s3QAkVg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] ALSA: aoa: Use helper function for_each_child_of_node_scoped()
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net, 
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, broonie@kernel.org, 
	jbrunet@baylibre.com, neil.armstrong@linaro.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com, 
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ai,

On Tue, 27 May 2025 at 12:52, Ai Chao <aichao@kylinos.cn> wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically.
>
> Signed-off-by: Ai Chao <aichao@kylinos.cn>

Thanks for your patch!

> --- a/sound/aoa/soundbus/i2sbus/core.c
> +++ b/sound/aoa/soundbus/i2sbus/core.c
> @@ -155,7 +155,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
>                           struct device_node *np)
>  {
>         struct i2sbus_dev *dev;
> -       struct device_node *child, *sound = NULL;
> +       struct device_node *sound = NULL;
>         struct resource *r;
>         int i, layout = 0, rlen, ok = force;
>         char node_name[8];
> @@ -178,7 +178,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
>                 return 0;
>
>         i = 0;
> -       for_each_child_of_node(np, child) {
> +       for_each_child_of_node_scoped(np, child) {
>                 if (of_node_name_eq(child, "sound")) {
>                         i++;
>                         sound = child;

As people pointed out before, the original (and new) code is buggy,
as child is saved to sound, and the latter is used after this loop.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
