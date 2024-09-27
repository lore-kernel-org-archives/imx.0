Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B461C175D
	for <imx@lists.linux.dev>; Fri, 27 Sep 2024 17:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727457006; cv=none; b=gRiruSppSrG6UQ6qRttbfAycIUlTf2WadrelOWlJRKLg+Wve6hyGgUdfE8b5s2Anef/Uk0+YzokI3kI8OwwdRxUi437BS3awpsWyQBR/Ivn1zmLTILZyA1oOhqDeVTBsSIVLolW4qSscPaLsOuV+SQaEmMdvTLnFuYTlZZIuZCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727457006; c=relaxed/simple;
	bh=msPFs0oHddcTpnqpQnU8/vyIsstY5Hmuyz7ku4/n+Vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhSNjwMg+lL66ASSlKeiv+gwq5hyswx10qwC5CsC39NPni/Sd0Z0T86ZRWftpm91ZiKGTyDp72EZjBk++zxLuFyoCZLnaL08F4fhvVu+7cMfZiW89k7nZnlBmIzRALoCSuiTSxLeI7NS4YektqWkp8FDl2S7pBvayCvqpWHC25k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e25d11cc9f0so1763033276.3
        for <imx@lists.linux.dev>; Fri, 27 Sep 2024 10:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727457002; x=1728061802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoY6H2xihm8sOHd6/SknfHzEtRV3+jpw8m+Q4KMLP+g=;
        b=q+sU+AVdIwiODlPPHNKBrjLWkDkKMLw8tQmHGDgKabouBMNy0VW5yGpmJ6q0nqVPew
         lRNbot+wXqmFFMtWS+0F9cgL4eu5vM6ArjSiaiTnutcrD+AwinaFsOvOXBv437QwRsPu
         C3tJ6L/S6K41ROieP8W1rRA6tVaHVS+u4M827X1zDJzlJi8L1JoIX4vVEbkRuHhpam3r
         /BUzUzL475CzP7MHRpceAQk53acTs0hb7ucBtzrV98JPOtbWHCZaGEo6Ad7BkkDqBnlb
         c6pJmTzczwscSiriR/mBR/nAMN4BcrphwEDNcUGHq1VMi8dkZB7oHGaYgPQS6l7O8pDG
         OoAA==
X-Forwarded-Encrypted: i=1; AJvYcCVUBE9DvXru23Y95Nhg2t062BMjCmFv9Z+a+08dXt8e/b/htpSWsJilG4MG2M7W24l5dZs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzldJ1s45524YXsPAQ4aYVN1NkIV6heb0ufSxgRwBlns1E6XA6D
	mSwCv+ZLJMAEcsyourh9KpsSYquiQs1/csfM9Ht/d1lCduGLDJHWuKeddkjA
X-Google-Smtp-Source: AGHT+IE56lR8HLDFVQnDMUvS8xfqP5I4MVmxPgxctyAvP+B/F/k64Ji4T6yLHBDO7jgobB73AcozbA==
X-Received: by 2002:a05:6902:118f:b0:e25:d6df:4e81 with SMTP id 3f1490d57ef6-e2604b30177mr3146984276.9.1727457002224;
        Fri, 27 Sep 2024 10:10:02 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e6c32b25sm502824276.60.2024.09.27.10.09.59
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 10:09:59 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6dde476d3dfso20291507b3.3
        for <imx@lists.linux.dev>; Fri, 27 Sep 2024 10:09:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUsIXULVpQe5r8skHxDmU148vqcMvdNX8itawXTumufB3d5YGbzi42erloDirg54l1uVYQ=@lists.linux.dev
X-Received: by 2002:a05:690c:112:b0:6e2:985:f4df with SMTP id
 00721157ae682-6e24dc9c710mr22157267b3.44.1727456998718; Fri, 27 Sep 2024
 10:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1727438777.git.geert+renesas@glider.be> <4455919.MSiuQNM8U4@phil>
In-Reply-To: <4455919.MSiuQNM8U4@phil>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Sep 2024 19:09:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVBfp0ZJ5Me93p1fB9-ac00WcAYOb9jkG=D+wm01j+qw@mail.gmail.com>
Message-ID: <CAMuHMdXVBfp0ZJ5Me93p1fB9-ac00WcAYOb9jkG=D+wm01j+qw@mail.gmail.com>
Subject: Re: [PATCH treewide 00/11] ASoC: Clean up {hp,mic}-det-gpio handling
To: Heiko Stuebner <heiko@sntech.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Adam Ford <aford173@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-mips@vger.kernel.org, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Fri, Sep 27, 2024 at 4:45=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:
> Am Freitag, 27. September 2024, 14:42:15 CEST schrieb Geert Uytterhoeven:
> >   - The second patch updates the Audio Graph and Simple Audio Card DT
> >     bindings,
> >   - Patches 3-9 converts various DTS files to use the new properties,
> >   - The last 2 patches convert Freescale sound device nodes to use the
> >     new properties.
> >
> > All patches can be applied independently,
>
> though I guess dts patches should wait till patch 2 gets applied
> somewhere, so that changed dts and changed binding can again find
> together in linux-next?

Yes, if we want to avoid introducing new dtbs_check warnings in linux-next.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
