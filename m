Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496E526B2A5
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 11:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355101; cv=none; b=m5PCBqrOoK/2JyMpVN6vcY6zzoEddYaX4MYqD0qlXB92qd2SMfdSweb7kRCa4ZPwdFY9T/JNipgInQNKG2P+vlSKB8tmvudqxXQk+dbKZUOT6gUQlQ0zi3tiNKvkVWoZwrQZoq+cbFm1Hz0XvPUqyZGkSGFaf0AFqZnqctq2TiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355101; c=relaxed/simple;
	bh=igMiFZD+4/xHRfFv0ukEPDyxclLRIIklR7KHCUrrWFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpqgCKNt35oafx3DNnZNIvTdnk5VLxGBDOoNA35rj7DUV4PoudIPni6KHeTN0Fv/Ls9yVlCjuQIiQkDiyG9yvyRnlalztLD7rkj+WuWQstjityKSDYOTQl1IYfTYUOv0LKjSgnlYDTOQy0yvKCXjqLaLkhU7NI8pgainKUQzzSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ps+EDZIv; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ps+EDZIv"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6129ff08877so3193849a12.1
        for <imx@lists.linux.dev>; Thu, 24 Jul 2025 04:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355097; x=1753959897; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIUwmPHAS5I/CUOP00py81w0hjNzvTvkcVdQbKas/DA=;
        b=Ps+EDZIveXOkf1pr56o0a6+JCBismpWpl3aACce1FV5XDY8nGAgRXTOnlyVPJKhm0X
         5PM9wX3P9+4G6A9q80wj1jFbbEYncRt7k2QbjIpJxkq8qMYPwnHDjTAlTab5VyFkKjri
         gAfgKqk+Oas5cJBF3p0q2Fqi21qSCA9Q02S7y8As1PjQsKVTSk6uJZaSW979qZBPi4e8
         8oCBygHW5JEtlYLnpdXwIR06EiGdMUVSg/0UzYEkdLxSNPNEAmN239Rjt6yF4mg10+ff
         9nG+z43Z/3BeOX9/Xhik8QoUCVpQ40Yd2pJrIZuI9Vkx9b7xS4z0NZ3cDL1EsIWoV8Is
         625g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355097; x=1753959897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIUwmPHAS5I/CUOP00py81w0hjNzvTvkcVdQbKas/DA=;
        b=fMDmcOTrVJZ+uNcOY/6lwp11G9Wlxtk75MSSAedMB4DkcVRzPuqFDRPglIl5ff6VPN
         lKFtXvN+ykGyGauXDt9BiO4Pdt6m6qikS615Qsq14iI5q7UfiEBoZH0B6Q0+zGqRLUZt
         0Q36IFntG2fPa7EVoP/jXRiJeGXVK0suOpyi7ipbj0m6jaSnOaB9+3JbXS4hXGs4akHv
         0dH9VhTcixPzkCORpObYHJOjZglvnh0GVYAYbsWX5YEUAjW96eUcDc9g/V6kjeiHpM96
         208NkSbsX1f2GVByjQfZ3XwOYI0gqtccOHrN5Mlgn14z9uoqq+8UrDiLn1Lg0KZDWTCg
         QDpg==
X-Forwarded-Encrypted: i=1; AJvYcCX3RxmqI2KzuagoHL3YXQpGn2DhL3g6BEbzVWa6OHbHAEGTJH7NbaWmvOw+0CvR9yhhxQc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsnEDz/XBRJ+UTzCY2cGwCM2DIiHsHb2RU6gs+UOUJLVXdOLBT
	JKnn9iTNl+8+4urj0eIWhXh/m/e6RkEnzyoqIs+hmOSbS7/x/hgDE6d04SgJpFq6UR+1DiGj9Xf
	GK8XnTTwyqjDqdsSfha/uFRUaA/fOetU=
X-Gm-Gg: ASbGncs24/UqEESO0QZ35SZk9Nqq2GYW8poKA6BsxZugHxau9foqSp8aYaYxvy/E0Mi
	JNryA7p75/iJxjFiI+yeaHzjgB5h4kI5IMa7tr9kfK0KfGEVYaJamF9tPW4z6DsXQ9fcV9DSJfw
	e9zp0nV8rwHUfvwmHdjg8nbldh49F1w+8S6Lxn5HOccxeKiWl/QXSlybzDEhN0w92wTONRptByk
	nV4eY2HHQ==
X-Google-Smtp-Source: AGHT+IHPG9CppWQlW2WG11oa6jW9jIvsCOFaEPh9C4R84HymaGR9H07ZVvtMJ1em3UaqkyymENVRG1C3VhJB+3+pi38=
X-Received: by 2002:a17:906:478a:b0:ae0:7e95:fb with SMTP id
 a640c23a62f3a-af4c1e2633dmr202631066b.5.1753355097066; Thu, 24 Jul 2025
 04:04:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 13:04:20 +0200
X-Gm-Features: Ac12FXwYO9py2pad9YYkUaWtcE51AjTlJa3erYsopqu9ohpn5SMp_S7iBIXDS4k
Message-ID: <CAHp75VdoZr0YCm3Pc7F5jOV8Q-H9K+gje2fi71nonHoXq2YPdQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] lib: provide kmemdup_const()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 11:24=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Provide a function similar to strdup_const() but for copying blocks of
> memory that are likely to be placed in .rodata.

Makes sense, one nit-pick below.

...

>  extern void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp) __re=
alloc_size(2);
>  #define kmemdup(...)   alloc_hooks(kmemdup_noprof(__VA_ARGS__))
>
> +extern const void *kmemdup_const(const void *src, size_t len, gfp_t gfp)=
;

Can we locate this in the similar order to the C-file? I would put it
before kmemdup_array().

>  extern void *kvmemdup(const void *src, size_t len, gfp_t gfp) __realloc_=
size(2);
>  extern char *kmemdup_nul(const char *s, size_t len, gfp_t gfp);
>  extern void *kmemdup_array(const void *src, size_t count, size_t element=
_size, gfp_t gfp)

(below left for the context)
> +
>  /**
>   * kmemdup_array - duplicate a given array.

--=20
With Best Regards,
Andy Shevchenko
