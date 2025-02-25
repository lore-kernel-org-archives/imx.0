Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB3E19F41B
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 20:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740516243; cv=none; b=ip84SCQ0MCuul920bAVqGbwGGwg/40vTcE2Ozs8r09VWvOZ6GN8IG4VAcTMM20174l3OupAJ3uMy88DZKbmxiUOO1TKBOmnROd/Ps56BUO2zj62lhlDMrKcQo9lGNeHZKIrluQBLaDGh3ZwZpKaC5db736q3uDh/7o7TDoFRp4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740516243; c=relaxed/simple;
	bh=km6GgyUtBYWlPDyGMWfcUJBELXq839o82rzSdqdT8ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQ60KtqMbtKUA8Om6Mcm92eLcwwdCHw4/1XSVk/SQOritrl/W/T/QHKBxWm0bgPSrDQe0pSRs9udSRw5ypVBF/KOxcAUq//1sShUKaTNP/s9I3um01EROHs/Hba5q84YuxgrUyRx+V1kZf+1OtVjCi0GPWDAC5DmKLsxjRGFiPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNP92aNs; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNP92aNs"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so3463725f8f.2
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 12:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740516240; x=1741121040; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=km6GgyUtBYWlPDyGMWfcUJBELXq839o82rzSdqdT8ck=;
        b=FNP92aNsssifnAp2HkSp2DD3rWWWEOx9YNVoX+ZJFHLCisBKiyQQwTryIGA/2Ve4+L
         h1kkiapPDG02MUCwJtJSPtmmXuWoZ708EXXnB3WY7AZBLgHUVwuEZo/pQ6xodYeb//vu
         7DCUatG9q82k25+0CClvQEi2VCUtdQFBTg+/NFo9iVxfvsw0gbpALOAB/3ttkEGVQ16K
         5YhYO+58vJxQU3a02VFQhec2FuugHevrn2EOxM1695eBNcdB8qgWGO3bNGBAvRiCCIHX
         AzGLpjG30Z5WGMPdVeilQYAsfPUE25Wr9YTCVGMEDVFXU9yle0CTz9OlDjDggH9q60d6
         k0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740516240; x=1741121040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=km6GgyUtBYWlPDyGMWfcUJBELXq839o82rzSdqdT8ck=;
        b=comOA4mxw1VD3dcxSTfLSkZnyUPcZyEu4QSokcZa3u0502Z6wk2BjTt6CMvpezbg87
         usZQuY69w/d+M/WAabR8UHTRTuT9flk7RcUu8XYRwBK6IlSNpLoyHqKej/5lSwH/MCD5
         QXJsxZ9oFyAcX3mctSNIFEQUPNKByAKWO4XdHCAH+zk5hs7ox4KfsjBAE4pyYabYx+2P
         ywR+/dhSTyklnznX4UanRu1VlQej1yhrjXiUVPHxUJc/qXxOQXMwzbO4TlU0mLseJsa2
         sLP8SKZc1iWRh+QwAMh6k8kq6HjIKlMTzGUKq3vZn3ByDcsqR5w5f1upr8fNRCfsNSWd
         /QSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQq+kCNJ6vteD6gvks4LnL/Kbp17Rn+wfAJjBzg6qHi65ZghMY2SftXF68JWUIszZajWw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeilJRP9Zjg+Nw3PaYNLCxrv67+kipcjV1FJZECqZhPsHI1A0Z
	fc3VRDuvnfdYhlZJwG+rpblIkMb0cy+MN/GqSsj/JA98AuQIj2sr
X-Gm-Gg: ASbGncuWGiyX8L4NWldqwA1v4ZvVVV3GrETyakX7G4s4uiFSB2r3L+8huyYYmgNl6hl
	zhavv93yITqI8zPbqUtkQBXg+pj+T5hMcdYaYZWzgsNz9vTVYtvSaCy0W+/+V8uFb27LhjoqAbS
	rkEBuem3+dt+tDoHfNcYX8yreHTTw1qdSeXcP/onYL6shepRzFEbIwByCbwB4uf6Tl+2SR03wj7
	+YBMKppus9t+8gG7DyLjN1VwWUpMXCHrlrSOhABG34WS6uVHzwH32W2sSvXiVOm6URUhHKZVONH
	nXx+KYGFM5J0KEcb7OqkP/B2dRM6z0+Th9MZtw0lcf2SHE6qTeWArMyWITZuljYViRVfJPrikSh
	Y4emfttykdtBF
X-Google-Smtp-Source: AGHT+IFn60vNyjvN8suXWrn3N7MNMCvoYB7tyLvf0VIb/vaa4GNGBrrZf3vgpHtm6zuKbQT61XRnPw==
X-Received: by 2002:a5d:64e9:0:b0:38b:f4dc:4483 with SMTP id ffacd0b85a97d-390d4f421e7mr518360f8f.29.1740516239496;
        Tue, 25 Feb 2025 12:43:59 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86ce49sm3473823f8f.36.2025.02.25.12.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:43:58 -0800 (PST)
Date: Tue, 25 Feb 2025 21:43:56 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Emil Renner Berthing <kernel@esmil.dk>, 
	Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	Inochi Amaoto <inochiama@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, Jon Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org, 
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 5/7] net: stmmac: s32: use generic
 stmmac_set_clk_tx_rate()
Message-ID: <x56yik7opvpr3o5vjlxoxzxdicrz2pimsh4lkpxol7c64r6irs@t7dfqy7ybn2a>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZ6-004RZO-0H@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ofk7odbwikmdng6s"
Content-Disposition: inline
In-Reply-To: <E1tkLZ6-004RZO-0H@rmk-PC.armlinux.org.uk>


--ofk7odbwikmdng6s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 5/7] net: stmmac: s32: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:15:00AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

I wonder if the clk_set_rate() call for gmac->tx_clk could also be
removed from s32_gmac_init(). Comparing to the other drivers that
doesn't seem to be relevant since ->set_clk_tx_rate() will be called
anyway when the interface is brought up.

But it might be more difficult because somebody would actually have to
go and test this, whereas this patch here is the equivalent of the
previous code, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--ofk7odbwikmdng6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+K4wACgkQ3SOs138+
s6G4pQ/9HAe8mzGeYLufQVT2wUZVpeDW6XeOv6EOFIvwsgTf+44yqDw3xiulERM5
tTs3b8w6d4j3xO1PLdXoIlx3vANG5xRtGEcxXY3sB8HjmuSGWWig1zuSTAOJegbs
we7h3FfZwYlMaSJAfvQNZsX/rDN/auA0R8opcByCxOqFAqRwwJSEH+avYvvVgKEZ
Mmzov1YSzCyzB0pEEsAkdaB07XMdwl6Ee+ShlKaXzk88WS8KhxZKhYHWNFaAmqLo
1jyGoa08Vz/Y1WMhLPLCMPrjmWjrMcVjhjCNp9xmCffiJHDAec+eRfV41Cwmp6HC
wjh85xTUS/4hGh+Md5EWO8bxv9aTGHOkGwI4qVxl6xZVFJRkwZkAgrO4teY2RXy1
/flh/cJcM9x88N9LAemunvF+RuPBv5mHV8VWgnJW2a91p7hWKZWV2gxcbzEL4L8p
oKBcQDleR7I9gCunuLnQRiQlwSyw4oKX/96IQ86Dbr8th4/4pKsWtxfDPjHtqzo0
XzbRtT+vlLIFlTprG9nh5PLO/Lxs9OzJ0kiqhJh24nAwMNxbXS/msQ+m8PRWT3C/
/okF5ojWT+0ZijDIGhWi5uwBNWxiwav1tElTfJGEHIyz2qOiFZyFhUH7oi5E9iB4
rin6SAkxYbIF5XDT+zuqAifn/g0BNDr2moVdUvgImYtAMQUCLmo=
=c/GH
-----END PGP SIGNATURE-----

--ofk7odbwikmdng6s--
