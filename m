Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743151;
	b=LP/hegs3OibLDfWyTrzIX6hW3T82kzKwTyqEJkBwbRWKi31ZWDb3hh/7HywwZIbfrHrA
	 8RZSCcKKQgOciIsnWZeJuACcPYapqZsc8m7URld5df9afUfqMLbNIJpxxXYuqmXlIsfMy
	 MQvbiICF/vET0feSQ5Gb5yLlXi/B4cZjpFB/QFt6C1TaVqt2/2FLIklKviOtfnyTmCYPD
	 4mJ/uuYadzTor9QgCXzQYKmrauaZfrFXjm0xfp4FpSACmGF1gXblvWvgQ1/sRbPiREOw0
	 FBvcbPbb1LbDXEstUML0cmz9VoEV7qG4RLSI6+ekMLqL0pdAFWWHECOIZdikFR0bKVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743151;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=8ZCc0kYbccT1j2j1nFYSj16fkgBLnDHoEzJYA6Hd1Dg=;
	b=YwQdlmEE+ofRsEgENgT2uF4+HzADkgn1BHdPasgKPppSDm2mHnRAa/tC4euVHhLFI81X
	 MgW46JlqDx6UgkQDeAOMCLiqVcGnTzEnT2F2sLLn6Y/RJ7t3j1hk1YVyzIfIehBigMUS0
	 s6L60vWIEB7oAuJd+L6VsgEJGHKHXVnQTqQv+xS9HiYclwySN9gvsWb6WPJaWect1Ax1H
	 FetDvp3hu6ftP7gJx1ZvWYlh0jpIDK9T/9UY8lLQkW5pyrOyRH/ZMkK2lwHmaW8a4RRYU
	 8QmgqC1fDIe3cbg334yWjXT6xEca6cHQoYi0h/+omwpB9OIQ3/EkABGDsuv5ZgiCHFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=ak4ncVZc;
	arc=none smtp.remote-ip=212.27.42.1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2807606A323
	for <imx@lists.linux.dev>; Sun, 15 Nov 2026 11:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2807606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=ak4ncVZc
Received: from L30177.local (unknown [78.242.88.98])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4BB8AB0051B;
	Sun, 15 Nov 2026 12:45:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794743149;
	bh=8W7U3lk1daoKKwP7PjlQ54EL6MrGZ5IE9j29Mm2B3/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ak4ncVZcgW2qLwK9X4/zElIA1HMdni3U+8SbMT5UJn4dFCQlROXyKI8G9BQvCqj/C
	 85l6Z4oISGhzno9CeY6PTrTRE16V7rEvBAopAKZHId28/ngsYuwohsm5rhE03spsP4
	 nID1pNcGQt1JAF+7EOp6kDRnQEx8qPLR5JJB2oheBDRAzcy1WKl8vf3sph6+E6QF72
	 Oyjb3pyxSWpoFKCVmPAMDn5Eok8cg5T+kAEmQdHs7+LTQNZ+5guh1S2uQc3OBOUn5Q
	 6lMfFyadDcci1ncA09egoRaOrl0cflBClFU7y+lWlhikwoJ5lZuqMlNVeo3IrjQP72
	 SlnDToNGaCUuA==
Date: Sun, 15 Nov 2026 12:45:23 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v5 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux
 driver
Message-ID: <avmbUyfeTd_VMSYH@L30177.local>
References: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v5-0-d246166ea469@free.fr>
 <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v5-4-d246166ea469@free.fr>
 <avmX2HwOji6MBuhj@skbuf>
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
In-Reply-To: <avmX2HwOji6MBuhj@skbuf>

Hi Vladimir,

> Did you see my feedback on this patch for v4? Comments?
> https://lore.kernel.org/lkml/avjaK3cOj3iQ6G6w@skbuf/

No !, for some reasons, I did miss it..., thanks.

I can prepare a new serie to make it a bit more generic,
but I'd need NXP/your reviews for those CPUs, since I
cannot test.

It seems to be quite easy to update, I'll just
run some basic checks.

best regards,
  Vincent
