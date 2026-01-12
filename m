Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8233345722
	for <imx@lists.linux.dev>; Mon, 12 Jan 2026 09:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209795; cv=none; b=SjhiWJUx9KBaaGmYkKNOE86jPUcdTre2/XorZvpOEO1D610B97F6bASGyc9nxewsY33lntRG6JvapZyvH+8PakFHC9EOVM3p0rAdTtTTmVRaNN77q3VAHu2g1PA7IShwoyq2tDXAI8ERQj+cyMx+yZJGLfIg9u/bbDuKziLhwYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209795; c=relaxed/simple;
	bh=VQm1PyOgsvCpvBNvC4Qdu61ZrW6H6U3qOQ/DdDMJmQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RELmSEI7+ht2wa7dUPwgDY8kWqK+I1A84nlYMTSbTMAQSPdfSizreTIJWKZWO3YA1SjmGO3CPikR4pR8uaXOYlaHaNZb1w+sEUJk49Vl/BzPrTKFmdXn4sFTL/s71dNwRPY2UxbS/8b0YR2Tq5ypFjt6d0laC+GAKWx7pU+oREc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxWiRck5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxWiRck5"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775895d69cso30115725e9.0
        for <imx@lists.linux.dev>; Mon, 12 Jan 2026 01:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768209792; x=1768814592; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pH7l/IngScfdGsuBC+TU2Q1UG3VpnMUzYFClpTkwAAs=;
        b=HxWiRck5xG+an02A0RU+gH4utaJDQZ6OT7yGjPlYJe66igwWx58C0QJ/MYfblVnchZ
         g+77MDUIXR3t9hQovVM4XvyBKMZF/MoN3n0gS2eVdvLxENZyxhEMq1t/UE9WMoAfQZTi
         ovxEVPGRkKs/h0PHxhSeXHz7Z6uRGKqqXK+VmbVvLe6r8Inx+QkrtDm5JtaRQrgiPUIL
         FEP6xHmiuKqgZ7nEnuP6DXDyrpQ9uezPKo1fKXfnss2KmqFLvgqQxVHKqEOFGRruSV8Z
         DiKUlpAiLq02SzhqVVH3loowCUlz9DgPCw2RzRmw8XS5Vfcf69ld8dBUJwxLabIOsKQv
         kMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209792; x=1768814592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pH7l/IngScfdGsuBC+TU2Q1UG3VpnMUzYFClpTkwAAs=;
        b=jDdD1JuNnxzPzfzmqMQFW4ZzXxXUkmoWzhbSiMYRbiRZ+4raiuFcDlbrZJjjHf6Cdj
         sEvm5acfS4WxFR0M23oLuPE1ljohxdBoZevYeCrPjjEDPytHGOevsB6INttw7s7V+eCp
         TSOval6EgFbIDouPigfnaxhd7i0aOer/50NX5JTMTyZS/nAsv27Q1NvWN4ZhwhZC5O3t
         oLcDShO3PG2vBNZTSv0TU15wrpPVBk2kSPHuuDfP1Po90/cwIvPwwnZHXaYLZgBIA04a
         vvvjK3FW89wxExzTlGl/J2nbWv255/cQp1ghj2y7o0xAmQht9x1eQy/NMlovuUWHFAfc
         5e9g==
X-Forwarded-Encrypted: i=1; AJvYcCXeb0bhlvmTS4REqgpzfTEj4shAxnnID7FccywF9wdB9hlSm/I9dE43Br6I2fZQA9vKAGs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPDUywoQgaYR3ATIj+m7llwElW+bI6JxdhVDxTTZmlQ/OAkUp6
	x6FwSt5TL7CzlNXn+gCw+BibcISEcv/4G/oCqZJxsPcWtWTn6Sm/g+K0
X-Gm-Gg: AY/fxX5jdxwB/ZMqvPUUMgh0xPmHlxYD7aw2PkPii7qYKZLXPCrMBcmQpB2ThVRKhnL
	cuDSk4megygLnrz+G4XdtOWp1kxiDgqVlQ8lw95GnlCrKwhk0c5WVbKa/G4Jd5qNRy5ajeC0Xoj
	0BpUZBvDnumgpg56Y0Chwb++w635xT7zM9qXetQV67UA9OxVuB9AJ9OCimDwKFjxJdkO2dIFfrH
	bnwRwiN6BHEmwAC1x9rugV3cwdfqlkslKfMrnVRIs0WzA19pW6mmWtdApTydmZaMWKLZjjhnn+s
	8YqW0UuVcexEOqWR9MZ9+mjptQ6D4GiRN7YPnEcgqpWfrkOtNcwtHnCOS1tY+vueDNPIs2nGve8
	xcMJzYBYFnSJwNc+zGrGCVQqwcXMueZAdO8zIuReCt81hXpOZsG5oeGTKYRXvySzepogiL+Ekmr
	bWWNvvOQNdvo0=
X-Google-Smtp-Source: AGHT+IEgPar+mXM5tZEw8XTR8zGlfzWecvjpL3x+Bjt2enom7FVlV7Q9qKVKAMWvUj+uzL/JY/TX0A==
X-Received: by 2002:a05:600c:1d0c:b0:471:700:f281 with SMTP id 5b1f17b1804b1-47d84b4093cmr171075305e9.25.1768209792166;
        Mon, 12 Jan 2026 01:23:12 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:6091:7b62:54d8:ee9e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f41eb3bsm357831195e9.7.2026.01.12.01.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:23:11 -0800 (PST)
Date: Mon, 12 Jan 2026 10:23:09 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, francesco.dolcini@toradex.com,
	robh@kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a fixup for
 the Micrel KSZ9131 PHY
Message-ID: <aWS9fbfvuayJpo3a@eichest-laptop>
References: <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop>
 <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
 <aVv7wD2JFikGkt3F@eichest-laptop>
 <aWC_ZDu0HipuVhQS@eichest-laptop>
 <8f70bd9d-747f-4ffa-b0f2-1020071b5adc@bootlin.com>
 <aWJXNSiDLHLFGV8F@eichest-laptop>
 <aWJ0iV6-_4XqpeHD@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWJ0iV6-_4XqpeHD@shell.armlinux.org.uk>

On Sat, Jan 10, 2026 at 03:47:21PM +0000, Russell King (Oracle) wrote:
> On Sat, Jan 10, 2026 at 02:42:13PM +0100, Stefan Eichenberger wrote:
> > Hi Maxime,
> > 
> > Not problem, thanks a lot for the feedback and the discussion. I will
> > then proceed with the current approach and send a new version with an
> > updated commit message.
> 
> We could add a flag to:
> 
> /* Generic phy_device::dev_flags */
> #define PHY_F_NO_IRQ            0x80000000
> #define PHY_F_RXC_ALWAYS_ON     0x40000000
> 
> indicating that the MAC requires the full preamble, which the PHY can
> then test for and configure appropiately.
> 
> The question is, whether the requirement for the full preamble applies
> to many MACs, and whether there are PHYs that default to producing
> short preambles.
> 
> Looking at Marvell 88e151x, the only control it has is to pad odd
> nibbles of preambles on copper (page 2, register 16, bit 6.)
> 
> AR8035 seems to make no mention of preamble for the MII interfaces, so
> I guess it has no control over it.
> 
> I've not looked further than that.

From what I have seen only the S32 and i.MX8MP MAC require the full
preamble because of the errata. I also checked the i.MX93 and i.MX8DX,
they don't mention the errata, so I assume they are not affected.

Not sure if adding the flag would be a bit overkill. However, assuming
we would do it that way. Would ndo_open be the right place to set the
flag in the mac so that the phy knows about it?

I would think about something like:
- Add a flag STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD to stmmac.h
- Add a flag PHY_F_KEEP_PREAMBLE_BEFORE_SFD to phy.h
- Add STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD to priv->plat->flags in the
  mac driver platform probe (e.g. dwmac-imx.c).
- Set PHY_F_KEEP_PREAMBLE_BEFORE_SFD in stmmac_init_phy (during
  ndo_open) if STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD is set under
  priv->plat->flags.
- If PHY_F_KEEP_PREAMBLE_BEFORE_SFD is set in the phy driver keep the
  full preamble if the phy supports it during config_init.

I could send the next version doing it that way, to see if that's the
better approach.

Regards,
Stefan

