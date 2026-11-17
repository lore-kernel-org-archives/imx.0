Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927477;
	b=pl0C1Z9a1XfzmU7qGDKmS+uoXyiQMbf7D92BxPLmlcKUTV+oTyD7ro2oyiyzdlCX11jZ
	 yqShh5oFVorbZ+ZFyMtvVHqLjddqKbSfVWQuqqKSE+CN8jRGtl1ujLt0RyHtsmFDCS2s+
	 IVUjcHqVy4kuM16+juy2+mfyLetAPA0IDVngEjncZUXxRgLO02Yb6amR7JnJe8K1TfjUc
	 MfWud5IAWBzaBD1lS81awC0KPIqt7eIgtAHHbHzAAEjiNy3GSX9j0ET4W6V7uPG6F79WY
	 29SWbhuwiZ+doELKjiBVcjCeYwFGfRIY+vrl3w1BGuO6KZhxR0Bo+o9rq22lwMLFTVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927477;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=s6kZBCjfiQkhSEJV2Z1jyMjdsrciCZ6ttNX5JGYKx+4=;
	b=d6bfxaRAOoHKhEjxhD9KwQzqv/9jFnROP22U/kCjZQFlCSaX9Ho/RTLpBhNOhvywHlI0
	 nxG707LRzJDUik6Tma7AtDDudXGF8L1q88l+eoddUIN0CTr8QCqtaf5eT4EoYeNMOJv/i
	 NMU4JUwLEVH7gtYTteCRO53yxdC4XgyB/1KefLHqm3q4wEdm0+SVCCMIR+fxty3HsbS0m
	 fjywf+Qi9euwE1UaJXUOZitm0fz5MLxs71A/kIw3sgQrXxxXZiWIL7rYc6FOBiwBFJgIi
	 behs6LDiV9b90B3kgiLW3MJV5h8NLnaB3tDW7fzZi6TvT8nDty5323xzxRTr0m6XH0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=agZnjsJQ;
	arc=none smtp.remote-ip=212.27.42.6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D6A606A882
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 14:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D6A606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=agZnjsJQ
Received: from L23803.iliad.fr (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3E5A5780510;
	Tue, 17 Nov 2026 15:57:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794927467;
	bh=Kxv9zLHW2Eb4osegyxsTaFPBbgAIfUoYui4bAAK2XVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=agZnjsJQLzDfu3kiyhn9g9Sy0L9RXmaKwOcrWY/ydd2lvFoEG5S9tDXomzsdJ1VXJ
	 6Efhw+DDCL3WoiHk12XxonGtBUnHIhNCazNoTIrzAfuRtLZMQQFyFcu2UHxCjLQADB
	 hScFR3JbvNWUVxSXxsCfq5BXGNYwnbuxoKWlRjpizBFRUIXTETgyq8CAW+oQJUDFJy
	 /SsNK4xGmX5TYhdANwCFD9lfsmUCExQhiLbR3ofnBYnQDvbmme3MajAzHttOMQiJ/1
	 jY160eWve0YCnHZLGap/GtTdoe2QJs23ebh3cXWuKGWKBwbQ7Bl+Hhl8kUsHfU0Tru
	 O8KB8MTr4ysWA==
Date: Tue, 17 Nov 2026 15:57:23 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v2 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux
 driver
Message-ID: <avxrU7frfDp6HeF0@L23803.iliad.fr>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-4-3aad0860b984@free.fr>
 <CAD++jL=Np+_+wTkuLCiqjNY5EBqn5qq8zKTJB6F-=1G0R+7=Ww@mail.gmail.com>
 <au9YgytCc4TKfETI@l3017727.home>
 <CAD++jLnWcVDbh-vf20w4nfvOSZik619XqoEjXTBZ29sJkX-bCQ@mail.gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jLnWcVDbh-vf20w4nfvOSZik619XqoEjXTBZ29sJkX-bCQ@mail.gmail.com>

Hi Linus,

> > Could an ack of Christophe Leroy be enough on patch 3 to 1...4 could land into the pinctrl tree ?
> > Then, patch 5 could be managed apart.
> 
> OK let's try to do it like that.

ok, recorded into the serie 7, but then it should be patch 5 and 6
  https://lore.kernel.org/all/20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-6-5d7201970629@free.fr/

best regards,
  Vincent
