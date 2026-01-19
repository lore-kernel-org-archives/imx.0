Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853F3143C61
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 19:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850266; cv=none; b=FuNZIMskdrYvJdxizwfwPe3WTqZCvPN1uXW2N+FTNYupqfPCSJxrKzI01CXjWbn2fp1GPPhZS4S76nBrS1GH4iv9/7SlJnRCtn1w2GKdNeBn3loWG0m7hy2PYt4Se9nA7qo1EPZndEvYZCcRxxZFWSg3pgkq/O3IYfQp7XtvHx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850266; c=relaxed/simple;
	bh=/6iwuNMZc5kIHFz9+eHrkjYu4KucuYpwvc1o9G18MMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rd2n0i+Q9dZBYaMOT3rZJAEU8+b85vXWC7Ajc32K0+MglxZaKpYxbFkfhmtmfThkMb+99HsPvlV/sX4j1X0fsEjSu88tOvPp2o0PzK5Z2EVIeShszhxSI4g8mh/5TZETIjldxvZbsmCib1aq0nSDG2Tp5ht71VD9HkCOHbYdPBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9371f6f2813so1314289241.0
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 11:17:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768850263; x=1769455063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/ksvhxDAHEK6GRShjDfoLa3UE0f58CuM5UI6afaKhU=;
        b=V99TPJfbUOuADNAMm0ICL417tfvBn1Q8bMeUhJM+IEG+kJDX+Q4EgQ8hQyB71ANGPq
         0RfZA+k/FORNV3pCKV7v0MFsHN2WrAyqETUEU5mqkeX0sSZbWQtex+2QopeHZjrkKpbC
         cnA+Kf6vTE4/zWU1LwFHwg0cJAiGxgutYIIFQmZwXUXWc1LmM6ol4aGngRAcU5UOmbuU
         +7QHn8OVRrX+s8naMFZipsz7vz9dIdP4nRVUmr0fMKZlj/AB9y2V3qzaO9MMS6wFkgxB
         guEdArll+6mlp5sg4wbSGj1+DKtB1z1qqZ2QlvMvsPMu5qH6kRo93rr99mIAqQcXOTa0
         5onQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXvwmfgUq4S2+fur8ikrR+414KZtlzoUCZELM4SHCsJFwMjx9jkmPkYwVlX39/ciCIR78=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx8OBKp9FpcMSC4GG7NKWfvHSGLJW58xIRyBHA5y6Jyembf2bO
	ddJpKIFD3nUzf6Rti3MEVCzKKCwz4W+xr0HMSTh4YvBRonw5wP07Khcv6qre52ji
X-Gm-Gg: AY/fxX5+vAFUnp4WewT74fR+hBDUc+4tRP9HA5W+v4zCljmu0YDGIbLrN1e6kz10e22
	akdM82CuQuA2pvjcsqLMdjtplp4Y5GuHDQJkOVlWUJG0sy8Vk01S7/SuMEFeIqjjJHGmaIAxqKE
	ZSjsakZruXsCeWOJX1iOxRCcfothq5S83cqOyGvun0XpFk+Z/6dcFriF9B38u5CRTG96ftyMmBT
	oPOla/HjqlghSM4D0s8j6/4ChNWKcHzdngaM3VjQhfA1kucPtnLK3Y+6yxue/FqQhWEhRX+/wkp
	i8jjI0Y+gi+gy+ztskNlzit6JOgepRm8BjIjmw46oUqjz+fckSKAjBVZ3lLXuD7wzVEp6AybObm
	Wgl9t7DBFOcsUwyvwSRIdAEH7Ew89++2P9Z5CABL3oZcseQJM6jDlphh4/R1MM7CP/8K2oIweXM
	zQovJlUXRosRBN7yMRSdeTsq0uySTU76O5kNbOXQByas508AOg
X-Received: by 2002:a05:6102:6315:10b0:5f1:c4a6:7f1f with SMTP id ada2fe7eead31-5f1c4a6816dmr1622944137.20.1768850262923;
        Mon, 19 Jan 2026 11:17:42 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6d3c9cdsm3715117137.9.2026.01.19.11.17.41
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:17:42 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9371f6f2813so1314281241.0
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 11:17:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXRQ6LRTxgXtzzwLgMe8owOF2iWk9ruZuTOxD8jfegVsJTO9/NM7OJ2wSpLyqhGeI+drzc=@lists.linux.dev
X-Received: by 2002:a05:6102:dcb:b0:5dd:84f1:b51a with SMTP id
 ada2fe7eead31-5f1a720e344mr3315725137.43.1768850261678; Mon, 19 Jan 2026
 11:17:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 20:17:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVG-2qucH5dB40CO=8Haw080NqxE-zg=GyVmD2njs-ibg@mail.gmail.com>
X-Gm-Features: AZwV_QiDYUVl5G1JTvUBamxzE_5VCyogXoHB30dVWIYjGOrIgN6mvoOLoE2_KFA
Message-ID: <CAMuHMdVG-2qucH5dB40CO=8Haw080NqxE-zg=GyVmD2njs-ibg@mail.gmail.com>
Subject: Re: [PATCH 1/8] of: provide of_machine_get_compatible()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Provide a helper function allowing users to read the compatible string
> of the machine, hiding the access to the root node.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -434,6 +434,19 @@ bool of_machine_compatible_match(const char *const *compats)
>  }
>  EXPORT_SYMBOL(of_machine_compatible_match);
>
> +/**
> + * of_machine_get_compatible - Get the compatible string of this machine

... the first compatible string...

Do you see a need for adding an index parameter?

> + * @compatible: address at which the compatible string will be stored
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int of_machine_get_compatible(const char **compatible)
> +{
> +       return of_property_read_string(of_root, "compatible", compatible);
> +}
> +EXPORT_SYMBOL_GPL(of_machine_get_compatible);
> +
>  /**
>   * of_machine_device_match - Test root of device tree against a of_device_id array
>   * @matches:   NULL terminated array of of_device_id match structures to search in

> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -426,6 +426,8 @@ static inline bool of_machine_is_compatible(const char *compat)
>         return of_machine_compatible_match(compats);
>  }
>
> +int of_machine_get_compatible(const char **compatible);
> +
>  extern int of_add_property(struct device_node *np, struct property *prop);
>  extern int of_remove_property(struct device_node *np, struct property *prop);
>  extern int of_update_property(struct device_node *np, struct property *newprop);
>

Do you need a dummy for the !CONFIG_OF case?
This is only used by drivers/soc/fsl/guts.c, and FSL_GUTS is selected
by MMC_SDHCI_OF_ESDHC, which is OF-only, but can be enabled
when PPC || COMPILE_TEST.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
