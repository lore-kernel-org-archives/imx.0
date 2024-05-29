Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD69C15B0E8
	for <imx@lists.linux.dev>; Wed, 29 May 2024 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974236; cv=none; b=cEAXNlCa35uDs0o/YKP6xno7+7b7ddiWoZQ8Jji/zChVjHFb+VnPP6Z4duaIJ+zST8oHjbxZZAJPGC35itMmnOMbSL66bc/3iXKOCtILYLU5SAiWirZS5C4KEjTLJYaEOdS1CwJ3IBvCF4vmiMKEJzUbOOGuycoQtsbc+NC//5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974236; c=relaxed/simple;
	bh=DhhdnnOXh6qGL5/6zvdk/VdVZmsP1nLae35wo137JWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNbRQgg30+Jpbpca8AdXPuyJvMI+gsvqui/+PzZcJ4f1jSVYsVonZ6FBr7/DOCTJnxw7F7qcxtKh4Sf7ZaCYv2nZ8ucOB+w1ZwwsewCDvReilAqToVbgD5cYovrY8KS+8rp+EPyJ9+YTAd/NuUg31uqUrSw/xhWtZUKz0F0HfxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ri/epnns; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ri/epnns"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5789733769dso1107773a12.1
        for <imx@lists.linux.dev>; Wed, 29 May 2024 02:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716974232; x=1717579032; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhhdnnOXh6qGL5/6zvdk/VdVZmsP1nLae35wo137JWg=;
        b=Ri/epnnssFODEjbWsxVHqVwy/+D0l65UNBJrhUVJWF+b3uvBEqW11x8QEk9WHMhg39
         89lahF1Bsk8gpVZ3Rzc26AHrjg5dxYakCNvuWXLbgTOu2dJZni1ZRgY0+nHuopf0sHHN
         gNnaszaI7Kor9U45HXAxXaRH31GCxLhJ6xSTVOpKLJZ/NdL+/B2jNtm2Uvit0iiU2VC/
         hMQwCRn/AvpyHNwJeoheqrgozXeCREheYneENWOqJIszhnTh9cGHgE1yWOzSWSNoK7fc
         h3ebg1xYk3rR8Ebq+qGruG/AlRjoBv+sgjZZYEHtNYVZgN4LoQot13jVB9M5as+Ewt5V
         yPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716974232; x=1717579032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhhdnnOXh6qGL5/6zvdk/VdVZmsP1nLae35wo137JWg=;
        b=fMr7WYMLVYRqwQhE4NkhLngLdehsxa57ZZw47ATBeTZ/7bivfzKuQN/CMLnxs91AJs
         IUB2GVm1n5G5EYEafbqEkHdpvtUHSjnG4KncrEK6sESmX89EFTmIaf7zYWmSzL0DOPQF
         FucEIGec89SNALhqM7XyQlrBT3D6jpyKMs/KXpdgT/U4uBoHBop1Y8Qh5/ZdXOHwbaa9
         HZX10tmuvHgpqXd0Dxv3IpBJlHIIzzgzecP5bUznmi3IGiDJ+fRhDZH5exyqjH3ed3B9
         ZOkeH4PfQtfmuMYZXpQ+BEvoztNvYJRVAGlyke3gzBwtyAkCKZ7RigcDY0dzBOdUPysA
         gySw==
X-Forwarded-Encrypted: i=1; AJvYcCX2ygY6qlch8mcCaFhyC/uK//qG4qzSh8uEpohxKp5a+B/lbbNXFqFIB48g+6AL4AStBrSuiGUu3XyNx/hLYc7//Rko
X-Gm-Message-State: AOJu0YwGy4XVcps/EK5TvZZiRBdQaeN3BkfrAHMVGRL99reEZa5u+txf
	x0RGa2uAxsH//Lz5ytxd3WSJZ5fgYNu+0Yt1mEXfVpdSFtP4Fuez2NiSJvnVzTkipVHpGHOH12j
	irc9W+xUdXoT10wI05eZhxFpK6+wyZy/B
X-Google-Smtp-Source: AGHT+IHGdwBKFS281WJKM1LepXLS87qJk4CkOo+icUfU1WShxVz0GmuGPZsuGmboZ5p2ros9zrvRRiQCXqmzCeTNR8M=
X-Received: by 2002:a17:906:718f:b0:a5a:7493:5b68 with SMTP id
 a640c23a62f3a-a642d95819emr140252866b.24.1716974232163; Wed, 29 May 2024
 02:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
 <20240528194951.1489887-11-andy.shevchenko@gmail.com> <358b6488-3f7c-4378-a811-175b6c77290f@collabora.com>
In-Reply-To: <358b6488-3f7c-4378-a811-175b6c77290f@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 29 May 2024 12:16:36 +0300
Message-ID: <CAHp75VfG__AA7bHd15-dg1UphkvzwpMN6eXzJXhyUDNW0a1_1w@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] pinctrl: mediatek: Convert to use func member
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Daniel Golle <daniel@makrotopia.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 11:24=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 28/05/24 21:45, Andy Shevchenko ha scritto:
> > Convert drivers to use func member embedded in struct function_desc,
> > because other members will be removed to avoid duplication and
> > desynchronisation of the generic pin function description.
> >
> > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> pinctrl: mediatek: moore: Convert to use func member

Sure, if I need a new version. Otherwise I hope Linus can tweak this
whilst applying.

> Then,
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Thanks!

--=20
With Best Regards,
Andy Shevchenko
