Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8429626B2A5
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355229; cv=none; b=GGnCzrPMAhUknnBp+oCNn+I9vpFja68oUbNKpzShRd2xKWMQYUOw7hVOLUvlYZd2bUGbNg3ecppmKLOgtch2Zwr6mLceIRSMRjifCa+VbInGz4AZyDrRGPi165kDfep0Lyu3nGMpkipfaa3jrBl0XVoZ8GF3TKzdSdddw9zmkhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355229; c=relaxed/simple;
	bh=DXwtrodih9JXts+Xu3a7jWDDhz6m3rxPn9mOHcSx1D8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1eod4q9Xy7qxNQaOVP0lANw2CKv3/iITC1jx7Tp42Q++V1bFv1mQtlQJAIxceMF1PQpDTmhrYy9E1gAYSzME8bY/M/EA4ec6UWIWLQudXCCnoSDvsuOYXQlRdWYFFEPCdj6nH+z69s+ST8qnR/09Coxzg0CMzblGjIq6uk3kCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnxyjo25; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnxyjo25"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so200896466b.1
        for <imx@lists.linux.dev>; Thu, 24 Jul 2025 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355226; x=1753960026; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43dwDfmrGoNVQcXDC2wAL8Jp+SeF4PP+nL7X5CzoIgA=;
        b=hnxyjo25R7204b51ZphHy/Ln+dALLEB/dzA7TkughNegsnp24N11ksaZkMSVZTFc7w
         PLtLZ+Qkx0mdIgX789lCVvbp4zvTzEGgSRjnE3gCupK9f97zGdZNc6RjTyrdlhY9KkzY
         n+6cF+ndPnj2UJrW9LK0kXIRjMB2qBYWfbTGpAhtY04A4btk9zrpDpAkidMZVBqsnS7k
         qROMWTFzrb5MMqtGjCJIKmN2f1ygLsn2IM+4v5MGB4IFeiblImrTabavFGiQuFqjK6PS
         fDx30UsE0gCgloWGqegiIejBZIz6pMsokXTX0n4382Gptkhp/sTzqwDUe7ybBWGk0+bJ
         +LAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355226; x=1753960026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43dwDfmrGoNVQcXDC2wAL8Jp+SeF4PP+nL7X5CzoIgA=;
        b=LobIaA0/zcZowEeNj+/O7tFdSfhf19XfknHkUGclPuYPJNdhTXCoNvrCX0y1sIJr8G
         BkShw088GvzWbZAvQ3tNXtPH06WzARgQvvR1Id06HpFy0vzfm2TPIu82ezAs89gV4n7s
         jt786aAhLKfXUu837hcbjzo0RXZI8Ie/lyX5SALotCt+CsLiHPPTlzjLXOAyoW8GkzGB
         MIFC1GetEdEvbiE0A1T+M+/X8GcEkiiICWEmcy8yExbDTUnXyQMWzKNWvdzeHkcFN2ZQ
         2TnfTIwpyp474m4hRiL1yMQGoruJYfS7K+VeQZQKACeG60OjNX/0Yt5UdwSVxOEpGAuO
         XSBA==
X-Forwarded-Encrypted: i=1; AJvYcCXdhtfUMUOMnIwH00j85K3fIe5kTvFHfqRJl4QUI68jwxqEkAYwTJj+rLOOr1tabrW/Qxc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz96g8pHbxG/Z0bQxYQtS6Sc6cG4MSAvGxU83T0ScLzrjRxSAyA
	Jc4mmZga7eqK0JhhHLJ45Ux8JYPsyhIcuW8Zq1Jpe6YwyTVBrAK+sDJ2U0x3e/cAbKuab4PGrQA
	IsurNJwP6AHfizYwVp8DSoVHiwimKbl4=
X-Gm-Gg: ASbGncvtPx/tRt+OMmExeggHLRTGQcTwOUPi4/+r0mKVJgxF9gnbSmPxORd7g8ysC9k
	dBPwL6DFD6xeIPmFopO2fwU26PtSpKtLKH/0DTog6CwOMhUvpJcGsUFzuoYT/irsd4GxT9JFsRw
	JYgmK6Gh1SBtIAAmKfWkDrH615eatnjBmBrpmskcBmqNgqMFqoc+sFgeW8pygGllKPB0E8vtuJV
	MyOfG10lQ==
X-Google-Smtp-Source: AGHT+IEQNn6mc1SbQNgvNLpYIewbgmuOfADdxy4q8WVZzoOl9KNmTiYVcFlWZZpZmc6xxLaaxaSRyyOaGbD95ShsFlU=
X-Received: by 2002:a17:906:4785:b0:ae6:c334:af3a with SMTP id
 a640c23a62f3a-af4c1e266admr182496066b.6.1753355225671; Thu, 24 Jul 2025
 04:07:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-7-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-7-af4db9302de4@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 13:06:29 +0200
X-Gm-Features: Ac12FXwnivN4zoY_g5_4Ly7908cvVHMEFQ3vZsc8P3-b_-oZW11Scn4jIzuxtTQ
Message-ID: <CAHp75VcLaVsztRtiwUkNZJRGwd5+T-x3t2VGog=0E82D3U-qLw@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] pinctrl: keembay: release allocated memory in
 detach path
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
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Unlike all the other allocations in this driver, the memory for storing
> the pin function descriptions allocated with kcalloc() and later resized
> with krealloc() is never freed. Use devres like elsewhere to handle
> that.
>
> Note: the logic in this module is pretty convoluted and could probably
> use some revisiting, we should probably be able to calculate the exact
> amount of memory needed in advance or even skip the allocation
> alltogether and just add each function to the radix tree separately.

altogether

...

>         /* Reallocate memory based on actual number of functions */
> -       new_funcs =3D krealloc(keembay_funcs, kpc->nfuncs * sizeof(*new_f=
uncs), GFP_KERNEL);
> +       new_funcs =3D devm_krealloc(kpc->dev, keembay_funcs,
> +                                 kpc->nfuncs * sizeof(*new_funcs), GFP_K=
ERNEL);
>         if (!new_funcs) {

krealloc_array() ?

--=20
With Best Regards,
Andy Shevchenko
