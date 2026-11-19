Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094652;
	b=BUl/J05a+i5HJbLx1qKWYeUmUxtszovv9oDKKLSHT6inmh30uFnTlXze8rCpAC5uZgRo
	 hDDoVKJ7GXigOv4N/5xW6qvLAj6Y9UFJXOZz5YzWGmcXrbM9kcka1Lf/MwiVcp+yQIBYr
	 QEExekmffjn8PvCn74sfxzZJIveYn3VFTkU6ekvC56Khd7yXHkcdXOCSYFqaAt+GsKx3p
	 vmRUQ1ke3iVHSN8brlOg7+J8vRGm/aaX4f87JRWsWwvU9MG1ZONRgZ0JCJ2ty6t4sGtnp
	 Mf0or65FUtX/KdzOvcI7HfYN/issjPaXgb3TTaMv2OpRldSnREbpK0WtlAKG991x0Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094652;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OFXele7O9ewGXPrSJa5N3rwIvj+PnZwMW0AQw7Tq4qw=;
	b=Tza5ztDsjVLReuCy3AYEioBFoMTtClZQ67tqlKzklZomZDnFTHvJ4Wvesrh5Cdx096Bt
	 Qx/3iamQSXkIshLbPl15GpFkFkrnA9BC+BbUdQVcY5i+F2OV3IKCAgBT3b6shcTgrskNn
	 YGWMtmEOmP7OBZZnDoswwoRVeY6U9oqGZaR9Zbrc3iV50UEqCUhAHsun4RTDMqc4pnRdO
	 J2WMXYmcb66pfhBy1PIqRIZcD14ZfqbLuCuAwPpywDdV58ictohzodKrtwDcdkgRWX6Gf
	 Lj8AvwciJ4JU8oIK+mSXZY7XQRUG2QWJ+LCudPS2Q8EOBAgbETjnlMeS/GF7LlpxiSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VTAdpaYI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCF4606A335;
	Thu, 19 Nov 2026 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VTAdpaYI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478E61F000C7;
	Thu, 19 Nov 2026 13:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795094652;
	bh=OFXele7O9ewGXPrSJa5N3rwIvj+PnZwMW0AQw7Tq4qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VTAdpaYIew02CoWFAk2egRH5POTRuzI9+AlL7J4SCMXwPvJzshaeJkKLBcPJ+P1o0
	 3F736HlZzp3fFHRTHEYilSVBTk3qVTyHBBY3n0AmWxf0SvX490IrDCBDWDZabqoNr5
	 b3cAkMNb6BA6IBH/3IRVZOaOHpg/N5tiW4DZ8GdwsISo+Cdkz2AmEcPJ9UgFyGNLxI
	 D6vCfH58mnDYbQ0o2Dtx+qxwDI9llw+dwY0Ks1BCiupFfDMC0z2y4XH3aDX1yfzHn0
	 5RXXrW/M4Vv1uhEaXK0tx9IHtGold5IWn164FWMTM05MEDjUaAJeu/G4ubOdVHb4Eu
	 mUHNaDPYgn5jA==
Date: Thu, 19 Nov 2026 13:24:08 +0000
From: Simon Horman <horms@kernel.org>
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: netdev@vger.kernel.org, s32@nxp.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 3/6] net: enetc: Enable probing of version
 4.4 devices
Message-ID: <20261119132408.GX860048@horms.kernel.org>
References: <cover.1794581338.git.claudiu.manoil@nxp.com>
 <d783ccebf4b38bfd1e2ede44c36682269a5bc68e.1794581338.git.claudiu.manoil@nxp.com>
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
In-Reply-To: <d783ccebf4b38bfd1e2ede44c36682269a5bc68e.1794581338.git.claudiu.manoil@nxp.com>

On Fri, Nov 13, 2026 at 05:02:34PM +0200, Claudiu Manoil wrote:
> This commit adds driver data and platform info entries for ENETC v4.4 PF
> and VF devices on S32N79 SoCs with a 500 MHz system clock frequency.
> 
> The ENETC v4.4 devices are present on S32N79 SoCs and feature only
> Pseudo-MAC ENETC ports, whose PFs use either the 0xe101 or the 0xe110
> PCI device ID, and the VFs answer to the usual device ID of 0xef00.
> 
> While the ENETC PF instances are usually designated by the 0xe101 ID,
> in newer IP versions the 0xe110 ID was introduced to indicate the
> power-on reset default NETC switch management interface. These IDs
> do not indicate any functional difference between the designated
> ENETC instances, and can be interchanged and re-assigned at boot time
> (i.e. from firmware).
> 
> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>

Reviewed-by: Simon Horman <horms@kernel.org>

