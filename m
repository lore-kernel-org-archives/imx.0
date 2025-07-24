Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5028620A5EB
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355714; cv=none; b=odvMaYo/yg9ipjW0IvAqXiLjTTsuzED2hC0zLVK8gYRUBJ6ye2lN8mssXqyiUBsWj9brKvVFHpsKTzPIt4m3PUxLAN+Zte1pjGq7vLFRgTVMtOVQP/Lsb+Uj+ySFkYR8hGiihzOxlOMLadTKV7Ohs06TN/xntkYoYXdpIebdhjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355714; c=relaxed/simple;
	bh=QAtHv6jVtOKPfBxG+t4sPI1ngV8CsevwVhkX4+9+HYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p012xFKqKpGxkVx9z9b/tJnOtSkWg6Y40Is630NPMlRa3BL5WYVRAL/jK1l3MzzPNi4sIPyI+rVLfuf7IScw8ElGF2wvNn4IC9ReIMslRsIrMGMY+tuKKcVPH969YDIUjeSJv5oCe5BHD/qYZLqZCNGl5NY/BtbptyGLvEZRiGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GApDDdzD; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GApDDdzD"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60c01f70092so1471164a12.3
        for <imx@lists.linux.dev>; Thu, 24 Jul 2025 04:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355709; x=1753960509; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAtHv6jVtOKPfBxG+t4sPI1ngV8CsevwVhkX4+9+HYY=;
        b=GApDDdzD9uVW9p1OD8gP47XqEhSZ6B38qVmU8gJipDEFneXQhm28p/RZmp4NfANJj+
         UGauB2w7GO3pcDMHCtt9puHQDiCZnzJwe23vwN7DgOmg0M8JYAsMMsqqiUEJ1KZBEJJe
         w/SpeHSb84gh6PFe+jpMHmC0Q5e0P2oiVVONZJ8R0/RSWK0B3axuZgnWzP8p7Ljb0Iu5
         zcKPZWZo3rfarqOFRahD5/76YGivJvAz9pWG9XPzsAE//OiMKvNCJkbActKuYfgxe6yL
         LGKggUuxjKnCf0Z6EhJiFLaDoHfHSAruzkVSgOJYmyNAjMJaYgUxOAbohQJM5yzwzVLE
         SgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355709; x=1753960509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAtHv6jVtOKPfBxG+t4sPI1ngV8CsevwVhkX4+9+HYY=;
        b=X9HAfokL9XD6dNsocLcWtWyxge3SLJ842eZM4Czw/Gz93rog5dxi0RNef/V4Z/zcpQ
         wLDYkBScnMOLVjQczo+jCDbU4k2K6oCdKLEzlT0OXYWUEEimVLKTNHKs+tVAyP5+WSH4
         e1EN5cujDt1fAMBeksMlM8GC+UPQ2vdHDVsN5lVsmOcoL6KdDGyqhF2N8gFB9yFIHvPD
         5F1jvlBoJrc670JSb25vWk7184IxIiNPkDLA1Eyi7Yciio55DpCGi6Lz99Q7uXo03b5G
         EsvowKYGUIw9CV8n8aWJlObBJ7veEP76B8fn7636Ixz8NdhVTpTyPZWutP2yu3l1RujY
         Hxqg==
X-Forwarded-Encrypted: i=1; AJvYcCU0nx8p7DRbFraENOkZCv5g/I5I2Q2KYZbOZoxkjKVLwFUxjJKWBKcN8u/ICL6eRgPSl6E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzN2EUc3ubfG6UCNHBI0y/3M5DF5LoSGalkitLnaTG7yy61NeSD
	KB3g0QfqjRa5XAITTa0Y8EHKLvb4LwOzUIGcuMvfl3TI5n8MOAVwijVMb9TzwdeMa+TFyQ1PHYG
	SuwPTKz5IJ+KaoLSmUTYHazu1wqFsmWw=
X-Gm-Gg: ASbGncv+4Imurj+lvLIRI238AXmH32u0I24vh+hhWJxBRynfySVzlb1SF7QwqvpCOMz
	iFKOXl78gn83d4iFAsNX/sjmbRO8l093mD45HphQ7CXCQ8GXEIq0tCbH2iH7W+E8kllDePz2wQT
	Q6Lyrzw3ax4LVFfpgPgjzxy+kKd9S6QLpGixo2q0PVElNcHeV1aCAERGPN8jKo+qObhCB6THLNo
	wUlosip5p7Frti1CFta
X-Google-Smtp-Source: AGHT+IGWvdFdi6zzckyJlm6N2JYQgwAj1cZ4UkHgtQjTXi3F8fk1lJZ/2HIRvhtKXI2VlvbdwgIvW4p0HjJsBk5xRxw=
X-Received: by 2002:a17:907:9487:b0:ae0:e065:ddfb with SMTP id
 a640c23a62f3a-af2f6c0ae2fmr725433866b.18.1753355709200; Thu, 24 Jul 2025
 04:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-9-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-9-af4db9302de4@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 13:14:32 +0200
X-Gm-Features: Ac12FXyOn0y78pX82gZjLVt_m4TA-GVnUEaS_-xxL1ntUx22Wj5veadNWvnjdU4
Message-ID: <CAHp75VcEX6FBzAu3+-5iia6Z1+kSQLYFGp0FnO71gXwCF+-wDg@mail.gmail.com>
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
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> With all users of struct function_desc limited to only accessing it using
> the dedicated function and never modifying it, we can now constify the
> return value of pinmux_generic_get_function() treewide.

I like this change.
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
