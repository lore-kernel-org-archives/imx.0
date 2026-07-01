Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BFA379EDC;
	Wed,  1 Jul 2026 17:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925642; cv=none; b=kvuaVI3GPhKAVZGOhPxFngYFL5o0MIQyIzF5znHe0t75nYS9OVvThI7Dkur3z28L7nhYoIiARphs9Qmot6wsaYx4Y6RSrR6z+dTLFS8pOG3vapGVcwMgsvJrDBEXGvZVSAmcr0IN5uE8hKIm/eHAVd6RAnIA8ztweNvqYrrQmAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925642; c=relaxed/simple;
	bh=jQjO0POpW5npv7gePynnmnZhFEpgwRLzhnQyTwlih9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RvAQnkMkj+S6lMMW2muKi0Zx/yk/1AOKzyudMifkfNysBglYuNei1+5Ug4636z6/KxQCBuYrSVHnFE040cNKHSpzG+/KUIs2wwAByaqjO5jyg/RpNO6XrZhgCGs24y+p8WOww69ARotD+phuMHlwv3pczo9xNvy5lakCASiclGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4C6p94J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4C6p94J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E291F000E9;
	Wed,  1 Jul 2026 17:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925641;
	bh=jQjO0POpW5npv7gePynnmnZhFEpgwRLzhnQyTwlih9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d4C6p94JW+TBVhPikzZjIEPEzISzz+e4aGhdMTzu8fjimtFMF5ANFijXKXsbMI5m3
	 4b64KGe2iAMmj7T9XmkS02AlhwA/TIHGhP7eaoQYqsDwBjYwnEsDK5ZhdAnZDXWiD9
	 SvhN+RUFoYRF718u6rSzZbRUXP/zd0jOCaW6OEsD3d4ascqQzTT7EnqLhJKvJ2bEY7
	 YpqqlcAws1S9ihtwO6F7ZAxVr9MOHn9e1XpFprKMb7KMUg4vTW4A5Tt8elReYyDTKD
	 Wp9WQBQ/0x1SOs6H/Zyu0aY0UMA3rSjANO4Ygpg33g9a8QGiba3pZLDfEDAw272Fo0
	 c7gOl4Dba8a5A==
Date: Wed, 1 Jul 2026 18:07:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: fsl: add compatible for new
 Skov I.MX8MP variant
Message-ID: <20260701-tingly-splendor-490c985bb91f@spud>
References: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de>
 <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-1-d74f7e3f8293@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2nTvnn+3qjdlH96h"
Content-Disposition: inline
In-Reply-To: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-1-d74f7e3f8293@pengutronix.de>

--2nTvnn+3qjdlH96h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--2nTvnn+3qjdlH96h
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVJRQAKCRB4tDGHoIJi
0pNVAPwNAlfWYnCiw8kwj89N3eXDVY04B4SiP+XAAonRzhCV0AEAtSursEhGx4D1
IRD7ENVrg8nW3zpXj2penFbCtfIjIAE=
=4KXq
-----END PGP SIGNATURE-----

--2nTvnn+3qjdlH96h--
