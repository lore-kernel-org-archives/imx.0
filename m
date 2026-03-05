Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5642337F8B8
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772706581; cv=none; b=UtnCZhPmP0ubamqH/K4/qtX8eLE3cm8SZ3SLO3PIAiZxSbPKk+aVHPhop98EZnBpIvGPq28Ds3k74+Ra6VBDqr3G4yofHKi5jVA4g/khNibT1pfNugHxBid2sdNkSeArIHHqgaOo5qWMfiMQhtpt5s/u/r3c7FGulL0PI8XKqj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772706581; c=relaxed/simple;
	bh=hzR/DJPGKmySS9c+Pr6X+vQuNGBaidaL+cpT+F96Xks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cO0rJ8glxVORCgP8aCbCF+HS+0oyBdf8WN3bdmvIJLeCezsvLF7He7o3AuhJW55An86LsiPlTedp59H9tfaSkPIwy7GmWJRfyLyInjLv15UCLHLl7QrNV5k0ZkPFVOLaYGHIfitxZ8Fx3fq3Qe/m1kHiXQSYXXxQAhus2Ve7iDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-899fbf92bdbso61065306d6.0
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 02:29:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772706579; x=1773311379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3yqJTxsIY1lPN4PgWxKVyykkH8+ipNK1w9pI9/GKdU=;
        b=bpO0bhuMba400XYSMQeHTk3ubxcsn7u9LLDr6Ab9w6IRrUumoje/COJZn/MEZ6teh4
         OLToRTZnbm4jQEOOYsyVCtG1+DQOTNUvOmuSLGHSANbaef1gn0kLNK2q4qCn0Ov26Mpy
         bjf1goezVFsD6SugnfZ85tnxSbywHGcnrFn2bAE4BA7lZOWdhjMWyEN6iJeChBlORQm5
         lwIdc+4PsSmlmXBGux9QjIPs1j2aRp4Ts8S5MTAMs/j4bdPmLVajza1koI04BMnqW37P
         YigCpS/nrG/8KOXi5IzzhPuS+cmxzq0AyXF0OgZUycAh+faM867vZP1vltf5hWnE7sjn
         A9Cw==
X-Forwarded-Encrypted: i=1; AJvYcCV0yNTE1bHpVhxWJGUjxO/zR720+pRIY5r3zvaVxUC4KkTOJq7oMZ4GvGhbkfVZvOe0SK0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyK/7YBAVDB+WpRTXcN7C/Vmlrgr1mEpXdaVbTz0nRxEPuy0eFq
	QWlVunI8ou6+MhZOpbzwfftiAG51BjGdgZ6v9Kzc5JFnnrUvEy1DxxHCVYIB+ytR
X-Gm-Gg: ATEYQzzlvc5r8pCftLdcqy3YvstH4e563kVCTW6aLGWrE/AQX96OcLbwpq4Aczbjaww
	ENfPc5aXqzGis7beP/aDWE9bJeRu6a1QvPc9s1dUJvf6vOVQsBgG+ELk3U4eZwnBDsBmiVvfRyN
	5/YkakEknfNxRQoRrTjlEu1ikuhoDYlsgRkJ8Q1OntWhcRhyUk1S1rEp5udONzr3Zcd+01O86Wt
	nRa75pmsBstaNstairEXcI/1NydI8KLPGv/XwKc4rl7lsq+7ncP+EHP8FmLJ/IP6jmrHYxzlbh/
	Z59bjUabSFIF/jcf+qQnZym3Bros9nyO3zWS+S5FIMorAH2hVyBTFetQltlq3phtdCVugtRxUmO
	tz5MHfgZhoCLyeHhOFlCy2EU5O/1tcpZQ2CbJaYK/b7mBNArM1tmTQDv/17cpHNuQy+wqn/1vyy
	n1BU+hTwqiObO7VARNhjX1nrGdpCO3kL5z6nNaRpgk5g4NHnUWeqws+4fOKija
X-Received: by 2002:a05:6214:29c3:b0:89a:78c:7cf3 with SMTP id 6a1803df08f44-89a1997919dmr71828306d6.3.1772706579219;
        Thu, 05 Mar 2026 02:29:39 -0800 (PST)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com. [209.85.219.44])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899f8ad5b8asm114846556d6.0.2026.03.05.02.29.38
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:29:39 -0800 (PST)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-89a05955720so51287466d6.2
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 02:29:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXakn2LBvmQCmeJLu6nLg0uMxVqMIl464G200vsTZ1nWaP9kgZGezrE1dLVSBfACxWGSB8=@lists.linux.dev
X-Received: by 2002:a05:6102:3ed5:b0:5f5:320c:4d36 with SMTP id
 ada2fe7eead31-5ffab240223mr2483807137.40.1772706274492; Thu, 05 Mar 2026
 02:24:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1772644406.git.geert+renesas@glider.be> <d22488d128d39fcd90359f59559fac637bb4b04c.1772644406.git.geert+renesas@glider.be>
 <86v7fa7fdq.wl-maz@kernel.org>
In-Reply-To: <86v7fa7fdq.wl-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 11:24:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWWYNGThGYsj6Oakwx-1RKO_BrENiSSUi08ZzfE_b3EXA@mail.gmail.com>
X-Gm-Features: AaiRm50s5nNMGcrhF9lpYz1D5nEmYHga723M3h1qHVdFckZiw7-IBT_v4J6wsk0
Message-ID: <CAMuHMdWWYNGThGYsj6Oakwx-1RKO_BrENiSSUi08ZzfE_b3EXA@mail.gmail.com>
Subject: Re: [PATCH 3/4] irqchip/gic: Use GIC_* DT binding definitions
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Antoine Tenart <atenart@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Daniel Palmer <daniel@thingy.jp>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Thu, 5 Mar 2026 at 11:13, Marc Zyngier <maz@kernel.org> wrote:
> On Wed, 04 Mar 2026 17:21:58 +0000,
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > Replace magic numbers by symbolic DT binding definitions.  This improves
> > readability, and makes it easier to find where the various GIC
> > interrupts types are handled.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -35,6 +35,8 @@
> >  #include <asm/smp_plat.h>
> >  #include <asm/virt.h>
> >
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> >  #include "irq-gic-common.h"
> >
> >  static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
> > @@ -1602,25 +1604,25 @@ static int gic_irq_domain_translate(struct irq_domain *d,
> >                       return -EINVAL;
> >
> >               switch (fwspec->param[0]) {
> > -             case 0:                 /* SPI */
> > +             case GIC_SPI:
>
> I'd rather not do that. I use *numeric* values on purpose, because
> that's what the DT *binding* describes, and I have no control over
> what lives in that include file (it gets changed without me being even
> Cc'd).
>
> So I want to stick to the binding, and not to the interpretation of
> it. If you want symbolic values to be used, describe them in the
> binding, have a tool to generate the values from the binding, and use
> that everywhere.

This sounds more like a philosophical debate, so I'd like to defer
to the DT maintainers...

About you not being notified: that can be fixed easily ;-)

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2110,6 +2110,7 @@ F:        arch/arm64/include/asm/arch_gicv3.h
 F:     drivers/irqchip/irq-gic*.[ch]
 F:     include/linux/irqchip/arm-gic*.h
 F:     include/linux/irqchip/arm-vgic-info.h
+F:     include/dt-bindings/interrupt-controller/arm-gic.h

 ARM GENERIC INTERRUPT CONTROLLER V5 DRIVERS
 M:     Lorenzo Pieralisi <lpieralisi@kernel.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
