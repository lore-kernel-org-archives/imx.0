Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617876;
	b=mp3IvjJSQyd/iWH4vfIGcQuAunuS3B1dYNWyhaTpK8sTz5lVdzG+ZIJS65PNy4pADdV+
	 zyOcgJEhFecIz+wTYe2yAs94T4zoDkZjRjSsW01DewzII0A9plwlqNkx5fJWqLzpkEqg7
	 Q67q0Gp00y3Namtt8w89ICqPhBJeFOOUMGOW5h+pSfx/+fCy3wYbI3q17rOAT6cEggpCp
	 le1EQZEv0XcLWvTDO6tE5QcxkpvDl74R2KDm9lU0gSFpC9S+V/x+OKtDU9QIQLnqSEWng
	 CbnnN9o06tWfJ7AhbShE6Q7mEXTtFJyRID01zENa4kI9Tn8088XwCInjTWd/SV9QWvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8ll/7pjiu26j2DN45BTUViH87j7UCm3E+vVLd5MHWxI=;
	b=dtJp9z3kdgNOqCvQkPwFe+l3XyhnknF6q3XFYWuDC2uGiFV/XkLTXPVXq5gy3JUJLc+v
	 tCB80rFYFECnk3m1348+jWuqp9sHLBa2OxGJnR2H0CS0HNppfJBQbflwPgbjFP/YaBf5L
	 WA7MnDyKHxJyfVGEl6QL+phV3BWH4Nex0IRylc9GGRlIdCSze3nmdJbp1IHzZOJgFisRP
	 nEf9oKMz7HOOviC1vXhswiIbbNAcwwU8urPDNqPIssQAbUtGS+bCrz+WmEFF56DUHy7n0
	 pirs9PDKn7fL9rE/JW1gYOgPVelpYnK9KWPlNqE2NwQMO5qs8ke/aYNomW7XPOwfayA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJp++8q1;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DCD606A32A
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 14:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3DCD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJp++8q1
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5348aaba5so6436045e9.0
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 06:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795617874; x=1796222674; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ll/7pjiu26j2DN45BTUViH87j7UCm3E+vVLd5MHWxI=;
        b=HJp++8q1DovZH/dd8JFIs1ODpQQsRZcvGzc4HvdSO1Dv0GV5lXyEnhaaNnxYathgpC
         OZmKCA0bJSxRQp+jJuIWrs3QlHkMLFdGbp2UU0bjRIeu0JavhOY+xJuHFZ0ChEPajWS2
         SpIbrnJ/4Jrg+2fkzOvoNguFbfUxCAUjpk0VOCJQ3Ux36Hg9aw/akUIMdgqOYJ2CHlmm
         Ww/MWABvNhz7QPXb0uvP4x7r+m1bGJQZokkgkFnMva0Ch3NmkDvMXidVFZHi5oIHrkeH
         3CjiQeyam15EERet/lmJjp/DBtHnecxTDygC+SdWJ/SEysm8DB1Wd7wAwnRWBuVUakR2
         0pLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617874; x=1796222674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ll/7pjiu26j2DN45BTUViH87j7UCm3E+vVLd5MHWxI=;
        b=eJ1U4kW/j+GWF8/jAKIgzPCwpjweS+NXCdpBgYWx82ss3LHHRLj3zCYt2f9jRPEwd0
         /ExoqaGJLwHdKQ3MhBU10YLhKmwls4dvsAUC7aH3L4UrN5EHniX6F9PxzdXtQNCFg5UK
         OFAJG4MsJ1ai5Lx7zeJ1C5qCqW9+uob0pz25mFupZAeedC9YOOI13B2+1x5jbLoJ3bpb
         /FABbcW6lqXCRDbkmR0wn2f4fphqmMX62/FkIgabUa9qR5WZEwQ5Cwaq00bM2Akp+RpK
         whYrsoaVaH+6MaZZLvnEWpxZ5/14V65GCCVM+57ZWGMbo8BciYJsZf85bop6MFtMk+02
         0GoQ==
X-Forwarded-Encrypted: i=1; AL+hErH77OLE52sHL25leySpaedSYGsZlvz6vnq1CQ/+QkWNGhF6jSO/Hz7E55x9bSsRuS9kS+M=@lists.linux.dev
X-Gm-Message-State: APuU4Z8l+kjf55rB4LirWzgls9UHngE+Oulmy6py6OZV6WP0cL0HpHBC
	e3cpvz8vs/tKS1KT7meI2CqGo6DyrOGFrpzsm7cGoL5rTZve6UI8bRWa
X-Gm-Gg: AZFdTZf4W1Sm5/Ts8n2M1gdx/1OJY6CUZZG78eQxx6mLsaHtTTFpjEBNYGj4sVwz+U5
	+4dI6hm+ccHtgsowQKHzZ/M3E1mDCo8OSEbDDPgva5Sw7b9z68KwFgEUB0yCVpoYh6Y1xzHt6C8
	1qOghaLPF3Ogudc8hJsyslnyja+MocSt3Ke8avX/eKM/cZoHEcEyeJfztMIdFAFOM7VEwUmMrx/
	MCCNQ7emlbcYERDhNkD/tsWC3PvDfybwtMfWuJpTnOGQ68mM5wPk4GQy8djxaGXjO8MF+C/QDA9
	FRmd7Mn32kYpa7+za5joaxcpLliuCTDIOsqiFsLtbwfym6gfBl4CWJQHKxtXMTIS4FmWiv8Nju4
	H/GOG8OplnN8XBGmvJIEuKKgCobgYdYKzKinEaD4QqVo2cd2FldMpIByfgk9gHh+GovlPNPoTY8
	11uaMtfoHQI/+DobzlcHogXWgFn5oSa5mmC3wy701H7aVy6NLvwhEl+AyKS2TCtamEDfXQThVdB
	Qbz6DA52hA2rn/JZDd/h+qDOIf1Yh6OrLQjNulUqcXJ5N008qMI3kUEDx0VKXWyiwQVjAYLFyBK
	+43S7o4lG1amxJMPAyKMPg==
X-Received: by 2002:a05:600c:1088:b0:4a2:417:7db5 with SMTP id 5b1f17b1804b1-4bb887f43cdmr285531595e9.2.1795617873970;
        Wed, 25 Nov 2026 06:44:33 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm303747515e9.4.2026.11.25.06.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:44:32 -0800 (PST)
Date: Wed, 25 Nov 2026 16:44:28 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: jan.petrous@oss.nxp.com
Cc: Vincent Guittot <vincent.guittot@linaro.org>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, 
	Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Bogdan Roman <bogdan-gabriel.roman@nxp.com>
Subject: Re: [PATCH RFC v4 09/15] phy: freescale: s32g: Add SerDes subsystem
 PHY
Message-ID: <awbmvSYZ9RJ6agIu@skbuf>
References: <20261125-s32g_serdes-v4-0-3bfe0589be8d@oss.nxp.com>
 <20261125-s32g_serdes-v4-9-3bfe0589be8d@oss.nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125-s32g_serdes-v4-9-3bfe0589be8d@oss.nxp.com>

Hi Jan,

On Wed, Nov 25, 2026 at 10:33:51AM +0100, Jan Petrous via B4 Relay wrote:
> From: Vincent Guittot <vincent.guittot@linaro.org>
> 
> Each S32G SerDes subsystem is made of one PCIe controller, two XPCS and
> a shared 2-lane combo PHY. The lanes carry PCIe and/or SGMII.
> 
> Add the SerDes subsystem driver: the PCIe PHY, the combo PHY bring-up
> and the setup of the XPCS instances. A MAC gets its phylink PCS through
> s32g_serdes_pcs_create(), which also creates a device link, so that the
> MAC is unbound and suspended before the SerDes.
> 
> SS_RW_REG_0[SUBSYS_MODE] is derived at probe from the consumers' phys
> references to the SerDes node, <lane type instance max-speed>: a PCIe
> root port names its lanes, a MAC names its lane, the XPCS instance it
> is wired to and the highest speed the lane is wired for, 1000 in this
> series. The driver walks the tree for them, as the mux is programmed before
> the reset is released, long before the consumers probe. Each supported
> mode has a unique lane mux; a lane nobody references takes the function
> it has in the first matching mode. The reference clock rate is
> validated against the derived mode.
> 
> The SerDes provides one PHY for the PCIe link, whatever its width, and
> one PHY per XPCS instance in use. The XPCS lane PHY has no operations:
> the lane is brought up with the SerDes, and the MAC drives it through
> the PCS, which it gets from s32g_serdes_pcs_create() with its own node.
> 
> After the subsystem reset is released, the PHY needs up to 5.2 ms to
> become operational (MPLL_STATE). Poll it before any further PHY or XPCS
> PMA access, in every mode.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> Co-developed-by: Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>
> Signed-off-by: Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Co-developed-by: Bogdan Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Bogdan Roman <bogdan-gabriel.roman@nxp.com>
> Co-developed-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---

I am trying to spend some time to understand this design. I have a few
basic questions:

- Simply explained, what do you gain by integrating with the Generic PHY framework?
  The XPCS has a dummy phy_ops. Clearly this means phy_init(), phy_power_on(),
  phy_set_mode_ext() etc will do nothing for it. Who and why is better
  off if it exists?

- If you have 2 physical lanes, why do you have 3 Generic PHY objects?
  Why not a Generic PHY object per lane?

- Does the lane mux need to be programmed by the kernel driver? Does it
  ever need to change at runtime? How do previous boot layers use the
  SerDes? If you leave the lane mux set by a previous boot layer, and
  make the device tree describe that configuration as read-only, what
  doesn't work for your use cases?
