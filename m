Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC9728B4FA
	for <imx@lists.linux.dev>; Wed, 13 Aug 2025 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755104261; cv=none; b=rJGuFkXa90MOFJT7H3bqdMADuHRjA0gyqUQEjPr3h9RfXmHe5Cpk+poPmihz+qQ5m0vEy9ohkXZ8nrai74kUa9r5NI032MIf7E/4JQeMIk0EWfQI0fJoUqO3eAkkN7Tqh8xLey+T/fYbHY6a4Bd8ANHR8oE7FfvUmBGENp0g+uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755104261; c=relaxed/simple;
	bh=d5wzBkVFNX6qAoxoJebtm0HqVmOo3GmOYnWMCd8weXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qi7ob+ZtrLVVySobUDDg7RDy0YgNl4yjYXjUtu9NCusKQloBhCWf+nYso14zVeaCPblexC3+OBHOYu9EjjPw02zQ+IIZsD4rvutPGeScvDuv5s3Dm/ILCK05PvLJuH88H5Y+vcen+ug+RSF8NSVTZitUV3gdQgeOZPpPIlFZJVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkX0EaYY; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkX0EaYY"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb78ead12so8970866b.1
        for <imx@lists.linux.dev>; Wed, 13 Aug 2025 09:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755104258; x=1755709058; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2gxI4yFXWVOtLhM/0polO/7seLsXtV2FXKtzlfxTr8=;
        b=WkX0EaYYuUT0vs7PGI/QVr4fYXA/AX6aSRY975oLVKYklr/QO7TkEuY9jFV0VxcOp+
         ynmwFp68HOJwNU+eWRRgL29Lxw7bjeDg2+pMH2izFBBf9IgE9MOHRtZxyKlYSqDHdh8u
         df5Qt0Y4tl1OjZVlbYwMyVPxoKOoK3xHOgHmpTm8WN+TvJsjzWHCN4AfQiXpOFB83yqc
         bvC07WrsmtUofj7a19fXM3f9Tq83gQZgTeNK4Az5wMnCzfXHTL13CM/fPO+4U8G9PXc4
         iHqY0I2v9Q4kF4E+tHH3qFbYtKWxwpV1x9RjrbK1ixCHN4RXA/Pud6cDDMmfSeHE8VJ2
         dJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755104258; x=1755709058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2gxI4yFXWVOtLhM/0polO/7seLsXtV2FXKtzlfxTr8=;
        b=HfFO4SfSRclH+4QMH9qR8WEH178rCgQDHgQ2zLVyxW4YQZflOPdM2dP0Ermc77wkAH
         yFLQY0aARWmPT8WhhonHkYnjwFkrUTsQcsYoQOYvs3znZCvbKYe/5jPSFI7OoNyoofJT
         c2B1urQNj6KRIpRJVHb8I8xFXHs0LihQs7Jvd4/zMtBqXv9h/4hD9O7jutQvtBUGX+47
         Id37K/s4OLOYHdaGnM408L0MW85f4mkHEhDGcRYP4oHyMrzLcJNd0wBi864rR3Rhmcb+
         e3nqBoeSP+IhShwZZ9pZgFNmZz8LBmE2ZBWrFkBRsX2YtWzt+KamBM4XCUsZVS+g9tfr
         F4Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVPlxl9y7gM6C/3KSD7BkVMclETrJO9gI/CP+ww52LLVFPVKy46XdmW0nrt8E45Z35HG8I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWa+M+YpXKSrdVsq3J6ROtJSlyXB6mI8JpV2kcCirNXAREiK56
	nh+5jEy+d7LY/eVsffhrvEYXeYePjU9DQigrwJWvX+BiXvBmbh/rxPKNs8Kl4nInxh9hXRpuEPY
	IQqCVK2eL4IBwWmwDncZUdPRsEcKILU0=
X-Gm-Gg: ASbGncvcK0VVE7o7wRTL265DuMlrLKhS4nf4tJNfpxWcR6OGaOrqwmlXt+v9gEwtjm6
	4Ks8VMR8lhiM/0Vii0K15ieFVUvWSNFvV4SbGB732G0IMek6utbEsrNE6d4P9ewLHl7Y49ZNWqK
	dKKNTrwFGvzGbkVimgUdQ3gbkkZKeI//lWUTWh+t0npKZvnaUVUJmvD58DPr4GzxxuJSKxNSafy
	W0YwEz9cw==
X-Google-Smtp-Source: AGHT+IHbk44OEj1r3kasIcTcyEDngMuhrBuyXGAMgY2npDrtdlj0x5dJHeL/vjl9xwrgnQvrGKpG6wybKFGCryjWMzw=
X-Received: by 2002:a17:907:3f0b:b0:af9:116c:61c4 with SMTP id
 a640c23a62f3a-afca4e44cd7mr358157166b.48.1755104257569; Wed, 13 Aug 2025
 09:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org> <20250812-pinctrl-gpio-pinfuncs-v4-3-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-3-bb3906c55e64@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 Aug 2025 18:57:00 +0200
X-Gm-Features: Ac12FXzRwEdbOG7WcfkJrIX52h7RVyVAx5HnOB8PpoXFNYyQXL2enxp09SWUXag
Message-ID: <CAHp75VeSA=AYDKOV5XQ5nnz7EZRmnhbbVyJrcBUcMO2LrRMTmQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/15] pinctrl: airoha: replace struct function_desc
 with struct pinfunction
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:27=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct function_desc is a wrapper around struct pinfunction with an
> additional void *data pointer. This driver doesn't use the data pointer.
> We're also working towards reducing the usage of struct function_desc in
> pinctrl drivers - they should only be created by pinmux core and
> accessed by drivers using pinmux_generic_get_function(). Replace the
> struct function_desc objects in this driver with smaller struct
> pinfunction instances.

...

>  #define PINCTRL_FUNC_DESC(id)                                          \
>         {                                                               \
>                 .desc =3D {                                              =
 \
> -                       .func =3D {                                      =
 \
> -                               .name =3D #id,                           =
 \
> -                               .groups =3D id##_groups,                 =
 \
> -                               .ngroups =3D ARRAY_SIZE(id##_groups),    =
 \
> -                       }                                               \
> +                       .name =3D #id,                                   =
 \
> +                       .groups =3D id##_groups,                         =
 \
> +                       .ngroups =3D ARRAY_SIZE(id##_groups),            =
 \

Can this use PINCTRL_PINFUNCITON() ?

>                 },                                                      \
>                 .groups =3D id##_func_group,                             =
 \
>                 .group_size =3D ARRAY_SIZE(id##_func_group),             =
 \

>  };

--=20
With Best Regards,
Andy Shevchenko
