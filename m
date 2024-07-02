Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A56150987
	for <imx@lists.linux.dev>; Tue,  2 Jul 2024 08:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719910637; cv=none; b=B50AG0wsjduIkV+fT+7zNuG/x5M7l2HC1ZuiQaByjAoSikkAqEC/6voubNdsw4UzvBlCbwR1sDRgXWlc5CfDAkoKw77rmmCY0N0HPX9mRcPXO8I5CVsicaCbFcSfUtGZDfXTJyDPwCWYtyAK3giGEApo3hGOiMTRYW4/efNrX6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719910637; c=relaxed/simple;
	bh=lQNWMHSAHhi1B2REf6bXB44AOtjzCQUTtwwc1XnHiu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fx4n/SxE4dNR43gNEqgZ490EBdHwwT7qoUXy2bDyHTwDcFg7N/14ftSVleo1c7gsuj7R3v8S1/yxpUchfZlVrjRtMKUkIho0O65jJiZ8udE3nfGx3jYzqSWQ1MkQGJwjo7Ao6OVmnAJ7fLcvRSivI+NE4STG4KhFTfY1hVcgQB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mJvDgJXM; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mJvDgJXM"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so46104361fa.3
        for <imx@lists.linux.dev>; Tue, 02 Jul 2024 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719910634; x=1720515434; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQNWMHSAHhi1B2REf6bXB44AOtjzCQUTtwwc1XnHiu4=;
        b=mJvDgJXM6p943Kdr0TU8PTruEywvmV7u0f9qMkF1Wx5So1MJgd3Z59fxl8m/7y7g14
         4uu3iigp8JjS1gqdL5fNzzzn38Fbg4o4NQFhinxYpE2FlxnwzOw3T93I7T+F/UEtFdsR
         x1c5zz31EEe2/u2+SYg9gFMQzpZIoskLh8echghd2Qkam057J7++cTmZ3VExX5s8iBGQ
         i8zjuyfp71/mvqQZWRkjw6WyBecIZ1vBd7JVk7DRz/15NUPb8KOfqqJFe+rt4VseaztT
         hkNFU58mbxfjQKWR2YWEFPPndMqF17in1ZlDK3rGI2+Fz8h7boz7sa1AnkkKm6jpolq8
         jgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719910634; x=1720515434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQNWMHSAHhi1B2REf6bXB44AOtjzCQUTtwwc1XnHiu4=;
        b=tgZkCLaQARzGZ48dQCv0PZDnYdsYpHjZdfWB9mMAsST8ArE+wE9kpbPWSbxEfqY7Jl
         8yMCnLrSRHsPJ1kKrB+GtRfEceKOkTZf2eGwUN+V4LsL8eUzEc/MFfNaHrM6VV3ZKMlf
         wn/7icW3kdZQn43qAlt8RLvjKuyLcWIIl3c50zdp2E96LLthlth4HlsqKIgZag2xfc7w
         crfRjg5WQ+siv5RW04nWLXB0/YvpfjdupQjwPa4LDFHGt148FF2u9qPcokT1AsvnLqcy
         H4gnBcW2MWF+Cskewajr2GQZrFtrz/XIgos9bX2ezQjpO23OvI1gO9BYVd4jniZ+myog
         t3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWOHpc+7fqC1WOXdG7AL1o5iQQrxuVrofEBncGyOQxcVdvO8fu9k2JZJlDbXtyoQtkAqqoFJ9QjUBKdAMLPeGJF3cM6
X-Gm-Message-State: AOJu0YxcxctUUhlPZg+wX0xoizus+1abppFyWIBLJRz5pmuVxn2swWOd
	gKfWPtcm3Apzk0p9NgTlNz+BYIDJd7qA5JGFiNPSjdiEh1hKGLQWJ4KVekmvS979D5jCvmVFT7M
	W7TqBF3OjbchaQTFwwli/3ynPHKDfxmD68fw9yg==
X-Google-Smtp-Source: AGHT+IHo5eEIsVu44pGpnRevjVwA1ZpOtmw6Mmmn4Q+VHOJCxnzpE8v3YnPOHaBgvtoU17z7s4obBrZVrOf9sLuZILM=
X-Received: by 2002:a2e:bc06:0:b0:2ec:1dfc:45bf with SMTP id
 38308e7fff4ca-2ee5e6ba584mr55892571fa.42.1719910633934; Tue, 02 Jul 2024
 01:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-9-3fd5f4a193cc@pengutronix.de>
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-9-3fd5f4a193cc@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Jul 2024 10:57:02 +0200
Message-ID: <CAMRc=McP=K0jSD56JdCR9DPJmJN39Z74mjAo0qX2mEnTBN1GAA@mail.gmail.com>
Subject: Re: [PATCH 9/9] eeprom: at24: remove deprecated Kconfig symbol
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 3:54=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.d=
e> wrote:
>
> All kernel users are shifted to the new MTD_EEPROM_AT24 Kconfig symbol
> so we can drop the old one.
>

Nope, with this series arm64 still selects the old symbol.

Bart
