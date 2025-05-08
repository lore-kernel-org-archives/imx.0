Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E88E219311
	for <imx@lists.linux.dev>; Thu,  8 May 2025 07:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746688431; cv=none; b=d75qLNZxAOIffxbXSwEuV3nTix43l/KwCbTQu2ugehBK9HYLEt8c2E7ceYudl2GbsFRiUVn3CCuOwmd/pVncQT3vIxqo29VGjpgZabgQyIvR2AlAWxrYzaeAv0DPWv8RN3lHif94ONOjTy9jPjMerfMTyFHZGvzs4empnwfZylA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746688431; c=relaxed/simple;
	bh=hrwGFHMMwMzLO3qU86OI8t/Nh3XTJsB3z/oENIE9U9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KX1znqZulYpTTFOp72c5xW7HG+gadzdV1bEpypmX7ytcU4AX3rY9t+QQA6Uv0LtbRSSXEwwpsduxjP4dIp4x9ZNnPqmoNJDJ6hjkofQjWSjn3z8+ZTQ4rI4AxUyXUZG3IsYSVvtQiErrfCOFRC/WhWuy+ddYrW28owyk7m8Cljs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52b2290e292so239699e0c.3
        for <imx@lists.linux.dev>; Thu, 08 May 2025 00:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688427; x=1747293227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCDiRMnhh5NRGE6kDeKql7Kl5Sr5vQvd1G2z+pchMa0=;
        b=rY8xj+IwK+Xy8LwgFuEeAagf2eyqX2Exdt0KsVvb4Tcb80dhiJBP/qqxryZYBZIkjC
         2O6Diojf+Q1b4Ya/Ih85KX7G/vAuUtmMegfus1tpUpl+N0ZtQ7rme0zFV3N7WELAEkIr
         fqxQtW4SeBqK5rDk77l9pR6bYClUX3P+ks8KL7uj149+7N+9yLVvFTYGDSUmYkDfFJ1i
         qJIvx1v3pVV+LFcTHvbBKih22DIhSyRsPSP0R3+y5DNNkSlqN099YH5oAVwDzcCXdrMA
         prToeGHPop4rJYT27AyI7Hloq4kOYuVSP6VmZRkQ1qgmNttge8gLUOAHc1b79YrUsoU1
         2lrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBDeCnE60UHu1nCspOKOmF8SHZOuhBZAw1JaKIJuTMLR546P6ZQQr4NXdgBItQ/Wgxjao=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEG64BWY5sNyavNt/gk8b3ybIK+4hQNQPYmj1XwQLgJqQAwHm+
	P9kZ6Wg8mjdbLZLOeQvbC7uh9J7ZqkVcE06oka+mYJkE3v8YDQd8o4faDNu2
X-Gm-Gg: ASbGnctwY0AU0r37rGangw8hkUsK1nTFGJb8KCq6PbcSHrs/L3jnM0twg/55P+ne0xC
	th0ATNtbvggJsio0/m+nVPs0KK6xsVo2FnkjYuzRaqNOZbzsssQSejtBXWV2gCW1FBMhJTzrPpZ
	dTBM4ADKYo3qCPo6aQyknmP1Q4HIHWsv27jRPvvki/dK7p7euPCSXtuq/LoAoTsuHGcsAIzvTm8
	MaQe3Bu7k+r5sRpbPdvQelJc1BT7WEOYXs25G766Tfw88QBl4JZkA5KCEECWjrkd6qOqJJ3GOB9
	9B+4fyTZiWNIqnW+WM4uHfW8eTa+iUif7lUZpydU4CdEnG8DOwkPZt1ehDhiy+RVoNlyUrW02Nw
	G7oE=
X-Google-Smtp-Source: AGHT+IGFlK5N7r2NLZAQ/F0PI/Kd8J5Muapd6tNSQ3u9wvLdteF+LXFKJDDODeUoK7ZnsVkfb0Hikw==
X-Received: by 2002:a05:6122:c8e:b0:529:d7e:d13f with SMTP id 71dfb90a1353d-52c37ab8a8amr4724659e0c.9.1746688427319;
        Thu, 08 May 2025 00:13:47 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae419cd5dsm2855867e0c.37.2025.05.08.00.13.46
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 00:13:46 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4ddb53a10d1so82127137.3
        for <imx@lists.linux.dev>; Thu, 08 May 2025 00:13:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9AsIZ+mUdetR+C5dMuWgTi6DebL5bGhDHv8TzHokDWMUTIq8Vu9ohOOM7fchrjrzeKO0=@lists.linux.dev
X-Received: by 2002:a05:6102:2c87:b0:4c1:c10d:cf65 with SMTP id
 ada2fe7eead31-4dc738bc3famr5378135137.25.1746688425863; Thu, 08 May 2025
 00:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-24-herve.codina@bootlin.com> <8b97e095-dbed-438c-9c6d-d3c2c5929fc0@lunn.ch>
In-Reply-To: <8b97e095-dbed-438c-9c6d-d3c2c5929fc0@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 09:13:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVvOMavxSAKaSMOwj_zXR=5h8KrrqNg4RS2Yaw3WXpKg@mail.gmail.com>
X-Gm-Features: ATxdqUHmcSjbjZfHI-fr6cqBy9DRd_HkLObPFwa-nuGiyXHv4iNIliDKKGB_NdU
Message-ID: <CAMuHMdUVvOMavxSAKaSMOwj_zXR=5h8KrrqNg4RS2Yaw3WXpKg@mail.gmail.com>
Subject: Re: [PATCH v2 23/26] misc: lan966x_pci: Introduce board specific data
To: Andrew Lunn <andrew@lunn.ch>
Cc: Herve Codina <herve.codina@bootlin.com>, 
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
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 00:24, Andrew Lunn <andrew@lunn.ch> wrote:
> On Wed, May 07, 2025 at 09:13:05AM +0200, Herve Codina wrote:
> > Only one device-tree overlay (lan966x_evb_lan9662_nic.dtbo) is handled
> > and this overlay is directly referenced in lan966x_pci_load_overlay().
> >
> > This avoid to use the code for an other board.
> >
> > In order to be more generic and to allow support for other boards (PCI
> > Vendor/Device IDs), introduce the lan966x_pci_info structure and attach
> > it to PCI Vendor/Device IDs handled by the driver.
> >
> > This structure contains information related to the PCI board such as
> > information related to the dtbo describing the board we have to load.
> >
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>
> How big is the dtbo ?
>
> This is going in the right direction. I'm just wondering if each dtbo
> should be wrapped in its own very slim PCI driver, which simply
> registers its lan966x_pci_info structure to a core driver. Only the
> needed dtbo will then be loaded into memory as a module, not them all.

Alternatively, the dtbo could be loaded through request_firmware().
That could lead to a generic support option in the PCI core, which would
fallback to loading pci-<vid>-<pid>.dtbo when no driver is available.

> Pretty much all the pieces are here, so it can be done later.

Exactly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
