Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD20B2652AF
	for <imx@lists.linux.dev>; Thu, 25 Sep 2025 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758786949; cv=none; b=Dry/tiMGDTnqnMRr8Gebm69IQGEwiyo+cU8vkw1YxIOe5FT5E5X09P4/wmhe7wKPMxHJNuDFNzKD/Ks1dz4YJejyzO2f4QTWhdcc68/TXiyHCRNGgFrEJVIa6EL9YsqRr5q2w3Vmlbz5+Wf3ce3QJxkLBpfKtwLUtXf6LlRaSDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758786949; c=relaxed/simple;
	bh=8MOOlgpt3OudDO28qQr2MAUrM06asLJeVuzzvJ7Tovs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OTDk4trQoQVncuhkgdpyNPjthuuTdB+NaPjGCQM6lxM98W+RbG6qiiGnym4bZri7DKY5dKy87jhK760MXgHdD9v43ciCjqhbsNWYaPm14i0L6dSq/h5zgBY6NqJHhvizkGgAru0tmnO+0+B1yVUQj+vdcOiZ5tbO7IVmO6YrxPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-4248b34fc8eso6315815ab.3
        for <imx@lists.linux.dev>; Thu, 25 Sep 2025 00:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758786946; x=1759391746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fvGyyGJ8hFx3nYrMkZDfGE5Winq5taN5wWeFI0QZNc=;
        b=wHChqPo6T1XOb5nDlU4B10yhLsKV2R/zIIorUqISbIoKFO4RAgi1qz5Jb8XvQHafke
         SzgMpMrbeAcXLGrECAsOTTpM+YWJZn/zeKUy15JnxenXEj1zRbKa5S8CxfEp+D+c9NyX
         v+N6/87VxHpsVsqVlYxSbF1TFsTxbkQZGANaUfK+3syxbWmFY1cgbuT+c2mUKC45ku8T
         OIQFjKyyzZj+2ADTsNXWDGPNjNrJtGmZAvFCkGxCwKlWfR2P8qm2RgpJtJ6PzLGM5+m9
         Qnr5RjCNhe7ldGKuhcY97/cSlFdQefuLyAqDkPuf3//Aewza48O6FiXDehkFGaw98yB0
         CZ2g==
X-Forwarded-Encrypted: i=1; AJvYcCWEx54H+PV2goR/REBShsF8AGqhY2JA5rou2zdODwGIx079QzfQkktKfo1SY0gvNN9iLkc=@lists.linux.dev
X-Gm-Message-State: AOJu0YylaVKfrUy4QaosV8xToffMu8M3Bscmwt+eK1z+rC4TrQu+xVEY
	7XKd/XkxMc7goRQ/IKxbX6LoZUnRJTjt2wxBeEsOJuKXMdHVIUPMwQO+LVkwlxbF
X-Gm-Gg: ASbGnctNPcEAaYFS1xn9kf6y2FJr9rHs3FJ16sCm+ilkydhKS85qP61gitiOMnhi6Uj
	WiP/XqtdGzfzZ4ehMHr9XTNa7XAq45P2TZV1R58O/aNezBeZmuPwcTggls+63guBBtHIn02AcdM
	ZHf5G3oe0Avs9bb/bkPCoW6wpxVhfqzTlkp/muut2jSfpi1V34IKIagNilJ2n4ZjH0f9Tz7Ok3o
	LeDEeMpuhrwd72XoE044OJZNnchlXuC4QXCr2g02G8CtiPwwPhitkG2aoZfCt0MkVZIiTEbC0ul
	YbeCMPf2PI4hJYq+DVL1VFnshHsxgMKVzgjGXwRdNee8kP1c+u4Xq+1C6AsOZGZ8qZQ0H1/ZMqA
	Eb99Em5YR0M3apReuHJuImJUMOY58stOH8nPwp0GfRdLRxAAYW4ZUXGV5OW/F8EuS
X-Google-Smtp-Source: AGHT+IGLHS5eMP7QUL2gJ4pvOTYYjRnglGjvat0j/T2mFl/7x+hBtzRmphrFJJBUjcYnoSSLfGa5eg==
X-Received: by 2002:a92:d842:0:b0:424:ed48:9acd with SMTP id e9e14a558f8ab-42595655ab0mr29027565ab.27.1758786945832;
        Thu, 25 Sep 2025 00:55:45 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bbeb3b0bsm6630825ab.5.2025.09.25.00.55.45
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 00:55:45 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-425635acc4dso6999835ab.1
        for <imx@lists.linux.dev>; Thu, 25 Sep 2025 00:55:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMU80xoQR+tWzrjvaTf6xxK0FpsVvN2sjdYbLUjVhZchrcwcdLSiclutH4GR7j24Jsa1s=@lists.linux.dev
X-Received: by 2002:a05:6102:510d:b0:529:fc9e:84a0 with SMTP id
 ada2fe7eead31-5acd36bc5d5mr955558137.32.1758786509499; Thu, 25 Sep 2025
 00:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Sep 2025 09:48:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
X-Gm-Features: AS18NWAlEwAE5FC0AW6Wq0ip31mrrj6gmcRezsp6GMYcQa-YSc4N16xdaxhcVw8
Message-ID: <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Thu, 11 Sept 2025 at 12:02, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The (typeof(foo)) construct is unusual in the kernel, use a more typical
> syntax by explicitly spelling out the type.

Thanks for your patch, which is now commit da3a88e9656c17a3 ("pinctrl:
use more common syntax for compound literals") in pinctrl/for-next

> Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/

Looks like you (slightly) missed your target. The correct link is:

    Link: https://lore.kernel.org/aMAP9hAWars0T83r@smile.fi.intel.com

> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
