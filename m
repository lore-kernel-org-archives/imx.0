Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922EC531625
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 14:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174938; cv=none; b=lAfFOy7XeDdJ5nRCyJNiUrLPPZkKYoBypOjiP0g4t+sp7CA4OzJ8jXfZPcTodoU9OdgRBqu61sSiFuBKKBdCm0+4m+5LESbp+9CmuPn70A3gRgrLKeNirSLWXaBwHqc9SAPWy2lbG2j68XQaVATRbm9bvJWx/dUyxpnG0e94MR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174938; c=relaxed/simple;
	bh=HAiG2uKeueum3NwR1fOOATsx3Nfb/2XuIB0lowPT5AE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ieMRD1m2d3sQ7z2UW+Xxtk7QVzABsgnp3S/Bm6Cteg6WpXaM8yGq/UCIYAm54DPGH37nlKIj0BU/CJsJOeXlv4Mhso9bYcWZVo7BUEhIvG63Q6j1wLJDdyaBgMfZtnhdqqUrduLvjVRfDRjox4gKJFTCl4rCuSbiEcBiaQ6evzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6ebso7156736d6.2
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 07:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174935; x=1790779735;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3QXVYin3gKtafVdGEnWDbswOTPSZ/Xq4fs9pj7jQGAU=;
        b=KPIsGfHYIQ6hJzmu6L9HXLQEo/s5owamxrb9XeEb9AZpJdlIkmie9lij1k8+ITIqtT
         NN8kWNVDjty1dqoSWMZ7ef986/tKL+wOmTk+ENbFHRuBLzUqJaFlBW3sxrZI1unqDPWB
         BioE85KKtP9YpEWjMDQUqSTgHGbo4vvFy+hzXLFEbsrGVlf2s8iBJ3K+/DIcIqjzN6qR
         J8i9F4XHDkJw/XRHRZE69SJdV64+9MEDP724zaGJPUintOT9P0MVkbH0XptPuKxPChkj
         4Ztqliz+Kt34G9Cz7GcWAzdnGHbyO+BkFN9VyT9xVILlKNPtNOaMBoXaLn0hM03vfhuE
         8wLA==
X-Forwarded-Encrypted: i=1; AKwUvBxBaijrs190u96gM2HDPtt58cdDuN8pDLHU8zwlSfjK9nUideIGp9EPxCbdVsFGG/QMK80=@lists.linux.dev
X-Gm-Message-State: AFuF++mchEKC7/n5IU71p0X/uz10qjIcjMqGxXGPttwuOaKGzZ4lJfNd
	EXp8cUrHAZHau5+8AMmM/xSjv+SraWV1u/Lj/gLiGvExp6k6P7EhQTvM/0y9qB6yfTs=
X-Gm-Gg: AYBFou18NiouRkLd655FzwSSe3iry5CSgSbdjDz6u5tPsW+mf9emTgjudGHM3FkIB4o
	1gBKVBKFNVYG/Z8qdOFGmspvRpyIF1Zd+bHJOtVLBPTWqVHAbqqWH6k8eWAa3lvelPUklkq0Uxu
	rScqpvaXEEYesKt6lul8HnwYpYE34qp0MNXqqGyuHrxpc0xLLe7fXGX3azGSshAlQk++8ubWOC2
	GFbQA+6ruG0OiGlqwJb63cFE/Hl5+BKydl4PmGiujOQkfjtEQ6utaaIi8HLGHLd2euYoV588c5P
	4zp/HVZi4cKm6AZ40c0nG2XxCDnwNFg8iLHIE8LJNO7KtLbrh84WS/lYxcmosiWZh2wwLxS3pAM
	V5RkQavO2FZvUoOtLuczHIq4oIFmsshQWUcl8IVdFKqofY9LcdZe+WftweWVM8Z0Tdi8I9MJ/qf
	99dliUOvwgiZ2Y1Gmw8Pjgl+5GKqU2wltLRaQA5Juu/iOU0gEQ6dlaiA1HDo5D05rI3oxOixuoJ
	rbJTNs73fz3UVHyMZMLBptJqD9BjlxaYvKcf7Egb9N+RpY0
X-Received: by 2002:a05:620a:838d:b0:93c:1710:78cb with SMTP id af79cd13be357-93c250ee23dmr417053385a.24.1790174935158;
        Wed, 23 Sep 2026 07:48:55 -0700 (PDT)
Received: from mail-qk2-f24.google.com (mail-qk2-f24.google.com. [74.125.230.216])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2c22f729sm111950585a.13.2026.09.23.07.48.55
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:48:55 -0700 (PDT)
Received: by mail-qk2-f24.google.com with SMTP id af79cd13be357-939695b5741so90508685a.1
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 07:48:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz0y93dp1pgu7ZBTa52yq67SC9OPDsaXBbMGRtQaicOvi52ZhTIxXh5khcagbEUWacceT8=@lists.linux.dev
X-Received: by 2002:a05:6102:3711:b0:785:c643:a415 with SMTP id
 ada2fe7eead31-7ac1bb45468mr2431267137.12.1790174453060; Wed, 23 Sep 2026
 07:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907134037.1855408-1-gerg@linux-m68k.org> <20260907134037.1855408-2-gerg@linux-m68k.org>
 <42ad1525-fceb-43d6-aa03-d17e844a9ad9@linux-m68k.org> <eb987eb9-f368-4d28-bdd0-c289c3039c3b@lunn.ch>
 <46246a5b-3e95-4ecb-bc52-e374dc136514@linux-m68k.org> <fe8a632a-80a8-45da-ba64-31158af7c987@lunn.ch>
In-Reply-To: <fe8a632a-80a8-45da-ba64-31158af7c987@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:40:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrRmvaEVjs4Whncybn-zVCKStC4gOpvwsnT+XRtm9Hbg@mail.gmail.com>
X-Gm-Features: AclHuK8JOpxbtBL9eo2JZ21xOlmZ2HJ-Q_I8grURwALj-s_IRRLbJXlaWaj0iq8
Message-ID: <CAMuHMdWrRmvaEVjs4Whncybn-zVCKStC4gOpvwsnT+XRtm9Hbg@mail.gmail.com>
Subject: Re: [PATCHv3 1/3] net: fec: do not use readl()/writel() for ColdFire
To: Andrew Lunn <andrew@lunn.ch>
Cc: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, arnd@kernel.org, wei.fang@nxp.com, 
	frank.li@nxp.com, shenwei.wang@nxp.com, imx@lists.linux.dev, 
	netdev@vger.kernel.org, nico@fluxnic.net, linux-can@vger.kernel.org, 
	linux-spi@vger.kernel.org, olteanv@gmail.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Wed, 23 Sept 2026 at 16:16, Andrew Lunn <andrew@lunn.ch> wrote:
> > The driver will always need to support big and little endian hardware, so I
> > am not sure how to avoid some abstraction like this.
>
> I was wondering if there is a linux standard set of macros which is
> supposed to handle this big/little difference, the macro knows the
> architecture and does the correct thing?

Unfortunately not.

Quoting Arnd:
   "fec is an exception to this because it happened to rely on the
    unusual macros: all the Arm SoCs using this hardware have little-endian
    registers (regardless of whether the CPU runs as BE or LE), while
    all the coldfire chips use big-endian registers (and don't support
    LE kernels). The powerpc variant of fec also uses big-endian registers
    but has a separate copy of the driver that hardcodes this. Other
    Freescale drivers already have a runtime endianess detection that
    is needed because they built both BE and LE variants of the hardware
    on Arm SoCs that could run the same kernel."

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
