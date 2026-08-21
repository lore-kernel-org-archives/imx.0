Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F9A493643;
	Fri, 21 Aug 2026 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787331202; cv=none; b=bvs9nT+B7IlH6eqezZUkD6CkzKpNFlqvDyF/iLbciWthkw6WYQb5XwVGzViI5PCIXSvUa2/sS5XjfDnhJPCioZjIqvrN/OWWju+WYJIRGSapHjkEY4UoS3W71Fb1xFBK6AE4pGy4BwdJch1CiMgD4Zab+z50L5rL0QQ9E1Uxg4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787331202; c=relaxed/simple;
	bh=XaEo/Q8DPjC2aRIBe2o2/H6K72zUa3Cj/+YcwwZbnbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9zSC+1ymn7cQYkaMI0EtB0/bXiaCFF2RThRDMez2Hxxro87LQYg/QFOsh9+SXG97/jf/ULdUk6YOTHgko8DJSSGt6qvE9e93nMqO1umeuM7qO24AeaFzLQcxAqzH9l2sLYRMTUpsJOTzWfsr2O2p9hA2rxAbZ7vQW0b4sNhFSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IiLg7fYD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IiLg7fYD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2760A1F00A3A;
	Fri, 21 Aug 2026 16:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787331201;
	bh=XaEo/Q8DPjC2aRIBe2o2/H6K72zUa3Cj/+YcwwZbnbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IiLg7fYD2mLzDGhg1ZIVX5mtxwWk9W9LY1e43z+2XG/JU8ynt+bY8ByiZ85e71j6p
	 ELSVKC4xQPmFfV9ivnzhZhq/vGS8Cea6dJ/8k3RVvWLW0DeP0eCt0PEuve1wgNUGsW
	 0+LAFoRuFOJisvFU9UMmA1m1t3pmDI1RDZXv4zlqBCH2QerdVPachu1puaAh34sV+t
	 CUtso9d0ojl86wVFIao808FfLRWhdzEB97NQtYyxUW3Jc6cSjsfeRi6r8OQ+vnBi+l
	 DMBFLl4Bo8qO0pDxaa1WL/uQ9T7uXvnpK0cpNEiXS0LXjdYV0WUM84ldDsuqAEg7gG
	 Mt6fp70/46VOg==
Date: Fri, 21 Aug 2026 17:53:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	alexander.h@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7
 boards
Message-ID: <20260821-map-zombie-8253e7519ad9@spud>
References: <cover.1787314780.git.stefano.r@variscite.com>
 <2e7d5abd893afb7f5362a5b3b8ee83730546674f.1787314780.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yDB3euLzDHcfq/YN"
Content-Disposition: inline
In-Reply-To: <2e7d5abd893afb7f5362a5b3b8ee83730546674f.1787314780.git.stefano.r@variscite.com>

--yDB3euLzDHcfq/YN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--yDB3euLzDHcfq/YN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoiCewAKCRB4tDGHoIJi
0jGqAQDjp9T4So4L2JtvC9C4rr4NY7BPcQ03c5SD9yuip+zf9gD/WxGCtpoJX6jJ
voEyZu9VSz/C+ghr3z9s6Uuh3BBIGAc=
=7LRq
-----END PGP SIGNATURE-----

--yDB3euLzDHcfq/YN--
