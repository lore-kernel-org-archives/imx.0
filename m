Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2165A27816B
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753887254; cv=none; b=iMylA78r/3bfv0guuIHwhL+ptDgpRSmyEWa+Hkur5dvTNZcznQq0i2qmJQCja2toz9XPOXXL/fZ9Vw62aa0WjhrzCeiyasdGrjQJsWVzGlX2xbukMqLNo+VY3bUJYx8DOqOCr3fKJ/Z1jDqNrXsQsUUQ/+pdjVjZLXLMZBuSlkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753887254; c=relaxed/simple;
	bh=3VznigarjS4+bf7sHcF2OdxMen0xturLzi7KfF46aC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DmbJaCchlQQD/R8GHnoz9KOZjDop/dqrxrUp17CHnkjtsOwBUI/rr06EMacEcnPUTq2dy/+fgUFEMYwxwQDsXcpLfbc36Wg+D0rEsY5dhj0/MColUu4yDpL9xeL5ea+QXsZJzD767IJ0j/3jq5udYG4Oj6h2uRcq2Yxtkd1iUEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-88bc71ff9b0so761817241.1
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 07:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753887251; x=1754492051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCufAOV94HIMKHfZVdb3wjn9NSi/Vfyn02LpL1/VMoY=;
        b=XUnDuSNzFs45f5FS005RMASmNgpDzT4X6Ci8n8o7iqLe5V/29Ji2SZ76wnKeTpHWEW
         JnPo+O1tbXguuH8J3745tnx1vEDVliOhpmzq1fC7eX+W2m8GexhdcWouYngxqEY+DSid
         JHXwpDYpmJxaczG7YkRUqQRQHSLcFley33jWk9KTvaF2CaWwG1q0+aQ81DG6K+eKPi9e
         f02h9To/qN38Ws07zWjJ2wZR1iYp/F9NCA9A/GIJ2OW9rrGuk49c1ttLZEvfEO7x6Z0V
         gbIGdOXbrmCeCCjC2/W+lHVHrlFFj3/oTxw2XYXKa1KjHNa42RCG8QqUQny5QmkTN3Gj
         r+hA==
X-Forwarded-Encrypted: i=1; AJvYcCUcV4UMGJrkC6PAwC64g3+1U/2HHLoyHvOiPfwp4G1/ln26fHqrtuwIP6OBANogvyIGNd4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzLkRLnatQt2sXoIlxLqYybPpkOSAJxxEIK4+AmRCfQkDw886v
	rgqZTQVdFHKqvwDEWxPEByzfkVe8Ixy3lYqVZSMlF+WLklTmhsG0yJgX4o/vFmGlrnI=
X-Gm-Gg: ASbGncvr7N+/0ltbIOGY22hktgNHG8LmawCsdvN5oNlQvRVkastRfY84lX55QSMczA3
	aDIzvMfIlYrX1L7ZOFXIwttTKgwkJhwP4smDj00W2JvIQ+hL4Dgzdr1mRtTd3ryjIdXSFENGwKv
	ZzkKiX4r/MoVHXS4LNCn/c2vJi4XuNASMI0Ki8LwcCZTWEhE5T84JMIIoyATSnz73igRsYWOdbs
	dQkB3F+Xj2Jrd/Z/O2nZRjJKBMz6+aDVMAgY/38ov3O6PiYIu4sWyPi0Gr626gugxNcbsknbByO
	OZl1B5zwFI7wzfxmfFv4MrUE+Zt3b/wbzwccJeXOSQ3oc3BGbJxVRigywr/OoWWNgei5n7YXUZL
	LLCnmGaha+4eKjoDtAGxKAhZ4AfTpDgKtRVZeOh+oODy3Z2y2FqzULgeDH+Sm
X-Google-Smtp-Source: AGHT+IEFk4CVZzN1WO4BCtNH7n65jGK1fCx9HuFy5HdY/SWJgKnF77QfcRXioYclA8afVyD4XI9TiQ==
X-Received: by 2002:a05:6102:5108:b0:4f4:b401:d04b with SMTP id ada2fe7eead31-4fbe87ad7a5mr2226583137.20.1753887250871;
        Wed, 30 Jul 2025 07:54:10 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88b8de03ac7sm2401041241.21.2025.07.30.07.54.08
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 07:54:09 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4fc05e21eddso30738137.0
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 07:54:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXK2Lmi+jEJMkGXYBRbDncbS+yXwnT2WI20zQ9eCrhros+DmegZlHq2+WqN0syWmxZRLl8=@lists.linux.dev
X-Received: by 2002:a05:6102:358c:b0:4fa:85f:31c0 with SMTP id
 ada2fe7eead31-4fbe87acbd8mr2306438137.19.1753887248543; Wed, 30 Jul 2025
 07:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-9-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-9-af4db9302de4@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 16:53:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+fmSPDZ1q0UeWxYJsrUgHPi2+_HC0Hy6TtC+W=kaULw@mail.gmail.com>
X-Gm-Features: Ac12FXzcRmJnrFvnxFG5jsyy_jc5Ss1VNLUefIVdE-6ssqD0s07eH4xzZW0L3Ow
Message-ID: <CAMuHMdX+fmSPDZ1q0UeWxYJsrUgHPi2+_HC0Hy6TtC+W=kaULw@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] pinctrl: constify pinmux_generic_get_function()
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
	Haojian Zhuang <haojian.zhuang@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Jul 2025 at 11:24, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> With all users of struct function_desc limited to only accessing it using
> the dedicated function and never modifying it, we can now constify the
> return value of pinmux_generic_get_function() treewide.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

>  drivers/pinctrl/renesas/pinctrl-rza1.c    | 2 +-
>  drivers/pinctrl/renesas/pinctrl-rza2.c    | 2 +-
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c   | 2 +-
>  drivers/pinctrl/renesas/pinctrl-rzv2m.c   | 2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
