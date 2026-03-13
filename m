Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CB13CCA07;
	Fri, 13 Mar 2026 17:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422697; cv=none; b=afR4ALa2t/uQXCkwkWVyixCQanf/Gw2wMrbjjRaR4OYVWas0mLzJ5c9ceU02dtbHk96DzAUmwfWLBKVG6IaHdoYzhzSVEfrVhizKUnxwFdK8ucrHLom/YMoQL7M+gF/yJPh9n5INMWt1uSpUi8QVQB+2PfjRJqkHONMYG2egzss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422697; c=relaxed/simple;
	bh=PhgkdS5DvKWel9MdAAVCfG3QPkga0OY/GSOQG7dc5Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKiYlCh5cd7XZDXxymKMHWAofomykjqL8/OVnLQIrat65h+YlWmD0y15FXyx5uaw7qpggb/anF06p/VASQ8YkVz1CBVEg1EkMqCvyVUO1bxAybs0TMwwt64zrQ3tujv1UT6T9Cy0KD+0QxKIqYKuLnP0xbemcC3oyHl5kVEYJBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9/eVV6+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9/eVV6+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561BDC19425;
	Fri, 13 Mar 2026 17:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773422697;
	bh=PhgkdS5DvKWel9MdAAVCfG3QPkga0OY/GSOQG7dc5Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9/eVV6+G6iQHoVoQvE3FXt2QiwsFEbZ2Rfcb1d4yvmNUQ2SnDPYBuP5neW+O/Gjn
	 vrlhe17RVGUCHVj7LVykkfoLZVjgK2NW3KklpK4RPerWSBKQV+8X15gGN6AAHZKBEL
	 JaaDB1+1VH4aFa/39JwcAUzCQJhs/G1OdfM63Hdh6w+pbBdrHCz+FLXjI+ltupE9TP
	 qiL1OVN1Jv8hm+j60h6d7HqPcAgjJo91y77SqMOOYWlLEX/9b3InkkhnnyqRV71DIF
	 bfocNfbynOrIECN0GjFe/4cX5q4eNDA8F7cQA1oeHwY4O0lss1YWEt6Mapf/L2FiyS
	 hsdCCg9J/jI8Q==
Date: Fri, 13 Mar 2026 17:24:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Robby Cai <robby.cai@nxp.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andreas@kemnade.info,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: fp9931: Make vin-supply
 property as required
Message-ID: <20260313-collector-freckles-b918ae703a73@spud>
References: <20260313133102.2749890-1-robby.cai@nxp.com>
 <20260313133102.2749890-2-robby.cai@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p1S1Jfnom+KWoNa+"
Content-Disposition: inline
In-Reply-To: <20260313133102.2749890-2-robby.cai@nxp.com>


--p1S1Jfnom+KWoNa+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--p1S1Jfnom+KWoNa+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabRIZQAKCRB4tDGHoIJi
0qFUAP9M6FoyDrkxMO1NpPLvKXPslEQzLm8rciOfC7ZlkzQ4RQD/dZzDnJxPprB8
Y5zMx9Nl5O1MGLlN0Q25FdZI1nOjbgo=
=MbDo
-----END PGP SIGNATURE-----

--p1S1Jfnom+KWoNa+--
