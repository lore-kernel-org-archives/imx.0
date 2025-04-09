Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA4C3D76
	for <imx@lists.linux.dev>; Wed,  9 Apr 2025 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187246; cv=none; b=tm5EJxTyerq3wiCNMMV2+jkO+1cg7Ijx8mVTC6iYBYh9jYyvHlZNJO977IPsYbxknVTdLlAsOab43/zp84Jz1JX0Qyl0+79pm+wJlM2BJZy75LZICNGqWV8QcpNzIz5X6yG93o1fQwHfFP1+SShCmixlFG6WNmA4FP9hv5Ncohs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187246; c=relaxed/simple;
	bh=wEowYpxBCkDlmNfLtfV7R7h7B7J60vMLNj1+hOWh9KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ml3UBzPYiTRL3uXs/FZT4ypcW3pUKkgsq8mIcXrA1K+7ieioZG/b5Uws4z2QDCyv2VwomCuP7XQ4XUNuN2x/Fjt4FOPKu344OREWddh8kGDSi9JoWlH3CrS0Sq3fAvJxLctxIxs2hRl6UQB6MVuzpSCQHwk7mGt0G4gBRcZOiFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86cce5dac90so2817613241.0
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 01:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187243; x=1744792043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GV/VIz9Dal9GidNfi3rZQigxcHcKa0Red1OY/otJy2Q=;
        b=WyJyrsGOep6lGuxhMpQpgbqn7hYNfr1MbzH9oUItk2FvTv/efCR7XjXXId8XOavCqj
         OO1f7ZXTbDp1Sl9UGAYUbvWkrXuRB1hxVjqF//z0wT7C3xbkDx1Yd8Z9UKegdAGUsjcH
         0iJAeEvljyiaPcjuyPSbkMZt5JCnMem37ZYoZkGQUOpq4TNwbxpkuUSuAUoF42W/Uxg1
         3kK5G27RjtBZU0igK8R1YJPWm7+bODMS15JRwf302ChhsUYSUGQqWyhOhdfEQcyjom7P
         gAAtvj07R8WYB+Pv4cbGMvKFMM4boUTTZFGlNb5sjjmBlisojUhv3QEvvFRKTSdOhuMu
         m7RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaVKr5/Iw0mZVS+K9pXtCNgzMsgYF3p7OQZx/IMVRmCfA5xAZB/wBLGUUAaiyj0OQbOOA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoFwyTnfEu6qgmGKCqeQGrwwEj2A2EFUWLkAQBsOkRwKzFsx/7
	yzkhxK1lvCBzFvPPcXb1GDOxSLqJySMl8CjhD9ylbRX928l3waLhSabXo0C3be4=
X-Gm-Gg: ASbGncvp0z2ERvLtT5uwvS+ToHQKIg+OICLLcHnF64v85CH+vHzxxB7X6rWKZkp8Oao
	YuPL7eN8YKgedYekjPFVTWOa9l70zAGMVk1ghLMLBRRitiJ2d3j9++oJDhfy3/juzw75EPWNgEN
	kUh39azp4JJqfdYtafgybhdjUj8uCIECXFv6P50VlPzELlftAnT0w0xotnRWiiKy/G6nven4/gp
	Jc9YmMvdIFd4MykvaLqGoGfK/7jLdq+6Wahn9skOOwlMq7d3Lvnqo8l31w8NkDuvcwBQjlD91BE
	RRRfrdaWuSrDJs8upAOjXxHKbggX0eznvmi8oVs8gFOFpoy+JJKAoMcAv2ZcNMMIDcHyJAeR48B
	xXHw=
X-Google-Smtp-Source: AGHT+IGcOiRCm/94lUJCVXe+6U3/xZQ8mvQU7S9IyI8GW3iRqqIHlaH9RUrQcxfC3X7DDQhX44KhWA==
X-Received: by 2002:a05:6102:5f05:b0:4bb:c8e5:aa8b with SMTP id ada2fe7eead31-4c9c6b88013mr731003137.22.1744187243170;
        Wed, 09 Apr 2025 01:27:23 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-875571374c5sm141030241.11.2025.04.09.01.27.17
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 01:27:20 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86b9d9b02cbso2741931241.1
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 01:27:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHqYuH+UIZN2nwv7j3fXF+zN8nW+snZiuiYxuFy+SpWtSTDY4h+xZb/vu7LizLMvfQlvM=@lists.linux.dev
X-Received: by 2002:a05:6102:801b:b0:4bb:e8c5:b149 with SMTP id
 ada2fe7eead31-4c9c6a728e2mr725401137.7.1744187236860; Wed, 09 Apr 2025
 01:27:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-16-herve.codina@bootlin.com> <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
 <20250408162603.02d6c3a1@bootlin.com> <D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
 <c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch> <D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
In-Reply-To: <D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Apr 2025 10:27:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtrmh207usW45c0v5EmxgM+JgfQ=m55tXXNT0m4o5aGg@mail.gmail.com>
X-Gm-Features: ATxdqUFWOu-H2GpmZpjc1_rOXM2aP80PMBbJa2DlVS33R9lalUc2jSOHZ1dg-j8
Message-ID: <CAMuHMdVtrmh207usW45c0v5EmxgM+JgfQ=m55tXXNT0m4o5aGg@mail.gmail.com>
Subject: Re: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to
 support SFPs
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 09:44, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Tue Apr 8, 2025 at 5:38 PM CEST, Andrew Lunn wrote:
> > "HW blocks inside an SoC." That would be the SoC .dtsi file. Anything
> > outside of the SoC is in the .dts file. OEM vendors take the SoC,
> > build a board around it, and name there .dts file after the board,
> > describing how the board components are connected to the SoC.
> >
> > So..
> >
> > So by PCI endpoint, you mean the PCIe chip? So it sounds like there
> > should be a .dtsi file describing the chip.
> >
> > Everything outside of the chip, like the SFP cages, are up to the
> > vendor building the board. I would say that should be described in a
> > .dtso file, which describes how the board components are connected to
> > the PCIe chip? And that .dtso file should be named after the board,
> > since there are going to many of them, from different OEM vendors.
>
> Indeed, that makes sense. So if I get correctly your suggestion,
> instead of having a .dtso that describes everything, it should be
> split between:
>
>  - A .dtsi that describes what's inside the LAN996x when used in PCI
>    endpoint mode
>
>  - A .dtso that includes the above .dtsi, and that describes what on
>    the PCI board around the LAN966x.
>
> Correct?

Sounds good to me!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
