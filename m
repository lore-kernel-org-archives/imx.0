Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9944A371D11
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 17:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888222; cv=none; b=XfT04wYIypOBklL4vKdhU2JO8Jw37abrDOapIWTuO+dGopSJAdavzOGvZGGxbrwwc//hZ+5rhq2O2M1+ZXoLThrdgaG0fJ1wJZR3/2l1UJuBj3lA3Ru/qhfrpWzU1esYrNl9qh3GNqJXDifJ2eVwhSUCY9LKsb36MjTzAjliL9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888222; c=relaxed/simple;
	bh=Sj8K0bKr+QZ/S9dYM6RKCNRt49IKM+zHKFTuOaeQz0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZ1BDsG0PlqqXZI9wyw1OfaLpcCq+FzhZT+r9/p5NNTt8tGV0hqMAg+87Vc4Hgqs5WFGkpO4cLYkmGWazb0iNsNi9/6NzTEP3A3IlBd+Su1gd6K8EM9OIfU2Ygdh4xJJYgPJi75YVGNbkJQ1AzorTAt18FHy1gK8Q67ElL97PVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddQrHN30; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddQrHN30"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E451F00ACF
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 17:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788888221;
	bh=Sj8K0bKr+QZ/S9dYM6RKCNRt49IKM+zHKFTuOaeQz0M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ddQrHN30nhOEvSokqtHBmBF2IZEjMngfe66I7z/xF+nIpLfQMFzhrkZstpyTC3SCV
	 YVCXh4rNCyfy9alx3+pQF0UabMq1QP9Geu/5dOJsxjAU9iFSO6rPpTGGiy41e48re+
	 vmBhARYlPQ25cfGK5oj7P7w1JEYaJNt2ko7ZoJnM0EuQY++WA+raK9Cen8G/MNPAMA
	 6rE1in8zhab5s2tXfBzaWc3zIaZD+qYvlZ3pNYFsQiPDK2xEg3eTX9njnMCtFhgHKi
	 pWs3oOdNQJM7qOTCwOxNN5ytMf9umeDqGI3grPh6+BxUhER9YiG82Aj0h0C3LkFGKv
	 uM3fkgpb3KvEQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so4490878e87.0
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 10:23:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwDZIrikIDIX/diF5btysoGUw594UMuZUwikOCLipE8Xz4JfbLn9aiPRLMK+psGdU+XGnw=@lists.linux.dev
X-Gm-Message-State: AFuF++m/lY23XP/aYvOnxROjLGHZI4lHOSOx5XBn4dZx25pt3MChR8Np
	Z8mrsozpy5falpgZBUAoDJfRb+ladtnl4Q6ozyMyUd5HUrNbfRDX5vzAkxiXYKlY+AxaG84a/H1
	7aqDQVqgPxnCtpCaHd38aXL6GtBiy4M4=
X-Received: by 2002:a05:6512:6c3:b0:5b6:1a7c:39 with SMTP id
 2adb3069b0e04-5b61a7c02f1mr4244449e87.60.1788888219653; Tue, 08 Sep 2026
 10:23:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-2-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-2-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 8 Sep 2026 19:23:26 +0200
X-Gmail-Original-Message-ID: <CAD++jL=7NjsvV6_2Ea9qyi9fDvDiSASPsLH3uTrPz30_ug7BQQ@mail.gmail.com>
X-Gm-Features: AcwNN1VilFNAiGqYj4DGWJSxsv2DtJDi9vb9QstH70LkavpX1Bq02jgwVJfqHBE
Message-ID: <CAD++jL=7NjsvV6_2Ea9qyi9fDvDiSASPsLH3uTrPz30_ug7BQQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] ARM: remove sa1100 platform
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
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 5:28=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Most sa1100 platforms were removed a few years, with the remaining
> ones left as a starting point for a conversion to devicetree.
>
> Nothing ever happened on that front, so remove the rest now,
> including the sa1111 and locomo drivers that were once shared
> with pxa but are already sa1100-exclusive now.
>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linusw@kernel.org>

If some user really want to keep this platform around and it
willing to invest time in testing, I do not think it is hard to
convert it to device tree using an LLM.

But if there are no users, away it goes.

Yours,
Linus Walleij
