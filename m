Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70FD5964EB
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 17:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889189; cv=none; b=qRYb8p2MlqECQ7xdftFzSVjbFNOLPiicEKSsWroT5KJdT1nCoiDjD+kfHVnX9vKoLBWMLltEn31HcI2jx1etEBEJp0x+W0jbrl08iXseHULqRRMhSfl2WQYfuuRCpiSsYW+9Z9n7imgAdfp0T8IZceQbA2PyUQaXruseTz33dmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889189; c=relaxed/simple;
	bh=qeRwoMgiYVUi/Ah3tQJF0Pa9MvRlkNB1dv59WKnnW+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pbx35Pha9GDcGPenekijUR1Esh1iBVLUwrSw5utXgv8l+V3fUCPscpdLdohc7ATq7YENsT6V4tngAjryM2iP/P0wSjS7UNyG79YVs80XAIKzVDDJWP/9HDnePsJS80um0uNI8cwZMmN2lFIxCPIBXVcoye+XZkXlr+EdtQMxUqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SC8mB5rP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SC8mB5rP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAA71F01562
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 17:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788889187;
	bh=qeRwoMgiYVUi/Ah3tQJF0Pa9MvRlkNB1dv59WKnnW+4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SC8mB5rPyRTvkIZvrBlaOR0NMk3ObczsexyyqjAcxnvVlw2KWPZwVcgOTJohPKr4v
	 lFwpA6TAjXfPrX5vVoLpEZEllzT5VjBEHLjG+/RNg4j/oF7Igi7JxJBvHPjfKTI3Mn
	 5jwmtTmPXIzLvCDliV4B8pZz05GCd5UT7sunng5r60WkldzA+7CD3masBg7dGPOkVF
	 TXpx52hb5VUss5MoyBD2mhEIiX3XbbyzesyYp9HYTX+K8OOyK76IUmfxC2bY7+WcIQ
	 UVCLz8Na0Ufzp6bkonl9YeSy0WvpUjzOXn5Tl1TOVdNiZ+OyDS6tKqz9xvuPqyPa3G
	 mozDMh9YQ8zfQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b5607bd3b5so2626379e87.3
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 10:39:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByFJl1ohmrY5WQfcs4eWl5VdSwXpO6HkwCwclXUOhATT5RwqeMTJCcxfMh0c8PEa9+/Gzg=@lists.linux.dev
X-Gm-Message-State: AFuF++kvkdSqsmEORS40edXeM22Srsr/XhtRRU+NCQJO52KfQvyZOmWd
	8l8F/MCe7ihrPO65++HfOCOStZnzPP5pcbil3UkBhFAeHdN6Ro3RsdX5k2fR2ZlBDTLj506n40/
	4Nk8SAYDyC9eyLw1ZvNtNee/NnangaHc=
X-Received: by 2002:a05:6512:6c8:b0:5b6:1870:268d with SMTP id
 2adb3069b0e04-5b6187043e1mr5134617e87.62.1788889185812; Tue, 08 Sep 2026
 10:39:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-13-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-13-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 8 Sep 2026 19:39:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLkZqGPP5XO0FwORA=exTpMTHnw9pjEDnhDRbdGAXaE47g@mail.gmail.com>
X-Gm-Features: AcwNN1XFd_7XP6HTCgVzAbMTQ1UQaJXktIWC_-YLfvh2SZkqTOYcmI8a_fbRBVk
Message-ID: <CAD++jLkZqGPP5XO0FwORA=exTpMTHnw9pjEDnhDRbdGAXaE47g@mail.gmail.com>
Subject: Re: [PATCH 12/13] ARM: at91: remove samv7 support
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 5:30=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The Atmel at91 line, now known as Microchip SAM contains both
> SoCs using ARM926 and Cortex-A CPUs as well as a number of
> microcontrollers. Only a single one of those MCUs currently
> has Linux support, and has no known users.
>
> The samv7 platform was deprecated in Linux-7.3LTS, which will
> remain supported a while longer after it is gone from mainline.
>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
