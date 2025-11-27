Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EC131DDBB
	for <imx@lists.linux.dev>; Thu, 27 Nov 2025 08:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764232640; cv=none; b=DE6up+PbkBHCUQKlsETkualnL1soZ0Ip278YRTBonTwHM1eo8q1x3NDwPWzbKdNQGNo3XhhcX5eL25cO9qzxdO72BOuK4+BbXN8rZv6Acz3R1X0i017ScR1KVbfHeHs20q8H1Og3koYqdMGWQiVH3kfkkKB+vo74KKudJOIb5j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764232640; c=relaxed/simple;
	bh=/k8EWPhfGokPGMRiqiH2p4Mjc5NgvkT0g+q1DuCM1Vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7riNlOAQ0vowCOhXwZ5GaI0Uyruf8Z3W3Cs+C6bVZWw/iHmws9BjJF6a8zAWHlN/AlYAKwX6v5ltx1tU/Ijy+t6shMeg/K2jORPJEn013mzMmYAmNPDWsBOzBR6ypZH/a3MGetpCs8cv5zLUGDgnlPIlf77pkAv39C/1FPuRz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5deb0b2f685so1161969137.0
        for <imx@lists.linux.dev>; Thu, 27 Nov 2025 00:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764232638; x=1764837438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIb8SaPvztgKHHZzH8CWgVAXI7TZRDphVAmy2KGknFI=;
        b=kBpKqDulBcvs5DXMVTRb0jLJ5cSJ2uzDdO2im+J0QXYrC0eGMmcWPgPU8nNQIe5KYh
         PDRDUuzUIys2AGIoPS/8HvPA58wv8iY/02CzvdrNHfYRpMM0brNzGHs/9VE3qZ4VLmME
         +97DaztJFUJSHTzDe6McpKwU6OSKggyU2FuZycirB9rszg+gl571c2FY/7ShQAPibH7x
         aIiwSWEnIUKZa8Z/lXMctoWBP2TEhoQMmrbpKkudNbKjjWCh3SwVgEpKHkTCOL3ToMjS
         GFAZevVzcTLSu0Bm1KoAz3I5SAPKmg6zyUfHsih+y0tDRrVRST0gyadPck/LiQqDWL5T
         6ipQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHpwl+Y85I4Ao5dOACN26BVMe7DmlbXUzBX8E7wX84GsUwhtIVoc4KsUB9IMFSWp3dmg0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHCWT34xceF2NaznOFHdj5oecyaM3VY4bpZLlBlEEL/JP3OuV9
	cXdoKufMbQZ9CKVMXPAVmxUIbQu1p2vX+mep5Oa0bAgqgQ2tVvDS4HdUL0nY9CXZ
X-Gm-Gg: ASbGncsoK/OaNXKZVmvXHe2fQ9xUO3SnXhZFJFDP02uesDaWgwVpKNDHZe0v4tP3N59
	iy8jCA3gIhAluZA88NJjoN3es6LYVu6tiEJOgukF2IC4wfSyFExT6S8gZEtWg0TbTqXrrs/XxBE
	bcgSqOyeexFN8zWbiZG0SHPCiHSRtGUWJWms2LIDq5aITRvVgz5SiwwFopSAOCimhmuLsv/NC/Y
	W8cHCHELP+sZXfhPWPM6zIVcmbne9TDJ7qa1gOtKtwsxVkKNLk26j9swYaNfVBH6PxogKO48g+P
	PHgo2L10QS3DYTJXvfvYjvE2fPWl8MSJ/E2DQA0G9qbWw2g8Xfa9zw4vBLY4IA4AY4IaxfM/6pc
	wHWJC8WiWmfqwvyEgQq+MZFWsef2+Unoe+s0DtvvQ5UEz0kPyuDbqkMirYk1qo9edGNrlqSL41p
	deTTdmaKd+u/MwfzjrEKLVkmpjQ5eon6Pu4VPZp/oaBgkaKEsx
X-Google-Smtp-Source: AGHT+IGDgyPkrafp2Z/wTHXZJI4aC75+a90cL+XL6hL90sWgscbIfROoXaSTrPn89amd9PDXddKWRQ==
X-Received: by 2002:a05:6102:6444:b0:5d5:f6ae:3903 with SMTP id ada2fe7eead31-5e1c41bae5fmr12232745137.20.1764232637723;
        Thu, 27 Nov 2025 00:37:17 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93cd6e50baasm336509241.7.2025.11.27.00.37.16
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 00:37:16 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9372164d768so1123922241.0
        for <imx@lists.linux.dev>; Thu, 27 Nov 2025 00:37:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX91A9rGVIpzyBH7ZjNAeVA6v4GPdw+HSxK6rLHma0wBlBEBLK6d3lLOiTPN1qVIIAvJvg=@lists.linux.dev
X-Received: by 2002:a05:6102:1623:b0:5db:e32d:a3ff with SMTP id
 ada2fe7eead31-5e1c41a822amr12513289137.19.1764232635987; Thu, 27 Nov 2025
 00:37:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
 <20251126-b4-m5441x-add-rng-support-v4-1-5309548c9555@yoseli.org> <aSdjT9BLzGF3_5PB@akranes.kaiser.cx>
In-Reply-To: <aSdjT9BLzGF3_5PB@akranes.kaiser.cx>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 09:37:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUGmw+Pa43oqcGzt0x7ED2FGw0=U7XddvdaUZ3GFmsxsQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkVv9s4nivghVE7rDnIpugWqg40dFmqyxV-7HzaTJ-oT-X1ymFUQxkCVvQ
Message-ID: <CAMuHMdUGmw+Pa43oqcGzt0x7ED2FGw0=U7XddvdaUZ3GFmsxsQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] hwrng: imx-rngc: Use optional clock
To: Martin Kaiser <martin@kaiser.cx>
Cc: Jean-Michel Hautbois via B4 Relay <devnull+jeanmichel.hautbois.yoseli.org@kernel.org>, 
	Greg Ungerer <gerg@linux-m68k.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

On Wed, 26 Nov 2025 at 21:30, Martin Kaiser <martin@kaiser.cx> wrote:
> Thus wrote Jean-Michel Hautbois via B4 Relay (devnull+jeanmichel.hautbois.yoseli.org@kernel.org):
>
> > From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>
> > Change devm_clk_get() to devm_clk_get_optional() to support platforms
> > where the RNG clock is always enabled and not exposed via the clock
> > framework (such as ColdFire MCF54418).
>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> > ---
> >  drivers/char/hw_random/imx-rngc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> > diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
> > index 241664a9b5d9..d6a847e48339 100644
> > --- a/drivers/char/hw_random/imx-rngc.c
> > +++ b/drivers/char/hw_random/imx-rngc.c
> > @@ -259,7 +259,7 @@ static int __init imx_rngc_probe(struct platform_device *pdev)
> >       if (IS_ERR(rngc->base))
> >               return PTR_ERR(rngc->base);
>
> > -     rngc->clk = devm_clk_get(&pdev->dev, NULL);
> > +     rngc->clk = devm_clk_get_optional(&pdev->dev, NULL);
> >       if (IS_ERR(rngc->clk))
> >               return dev_err_probe(&pdev->dev, PTR_ERR(rngc->clk), "Cannot get rng_clk\n");
>
> The clock is not optional on a standard imx25 system. If it's missing in the
> device tree, the rngb will not work and we should not load the driver.

As the clocks property is marked required in
Documentation/devicetree/bindings/rng/imx-rng.yaml, "make dtbs_check"
should flag a missing clock.

> Should we call devm_clk_get or devm_clk_get_optional, depending on the
> detected device?

That can quickly lead to complex code.  Nowadays it is fine to rely on
"make dtbs_check" for some part of the validation.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
