Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91441B4248;
	Sat, 23 Aug 2025 14:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755957779; cv=none; b=b436i0tQtJyNfWall9quWqKXoFZFQq/rkWf02D9MhzYxVTv+bQMiNGC3oVY9bqyEhPm7kuB88gFic3HCLGRIbHOI6FRfdxNN55qPUyW+xOkxhXbaZX23cehEHHjbNHQqgJkNUynt8IYt2TCg9LWXUAbNydA/iCpDNeOPQ0OyD94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755957779; c=relaxed/simple;
	bh=caleFy4kbE+uvk+Sc3e36cq0k2w5/jsAIKa0fhdNasQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2NyxmigHoxp8otkpnwPgJEoxkfBXlkEsMjJuELqQ3/3ND4SKPubWD7kjOetinTmpmY5/2e3LX1NVxe35yJTbOgdmYRBDkzTT2yY6NbEXV2dIiX1U6CITJYoezwK+zO35mVn0j2CG+FCoY9K1CM0CxoEsHqiltXy/YU/lhQ5Pew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2dJWl3O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2dJWl3O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EA3C4CEF4;
	Sat, 23 Aug 2025 14:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755957778;
	bh=caleFy4kbE+uvk+Sc3e36cq0k2w5/jsAIKa0fhdNasQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q2dJWl3OewBdvZspyrkXJtc/pEAkGEL4Kp6j+9pW5g+tFVxg3KGCcs5TcDAWs+niW
	 fn2auyv+V4wuRNYNz0NNeMuHm+aZwfjkeH93f+g06aMy5fgL5SoOwNcCcVYSGCZdoC
	 pS4IjgdDGFQa9BkbOihvhiadlsHHRxPGJRSv3t/sRhA2SA0fpPWkyNkCCf2wOcM8uY
	 VvIr4xh00jrqwAhjYTNmBjZgpk57DUNF0/z/8CCHlHa0036LNAGD/oTgddYGD1KE8d
	 h6Hc2446PDOBlGTW6w4apuFUSAQwuQIJehVWm7n1ENp2W7Yr3n5iKVg++lDjVuZlbx
	 Rf6mKqLS7qOzQ==
Date: Sat, 23 Aug 2025 15:02:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: soc: fsl,imx-iomuxc-gpr: Document i.MX53
Message-ID: <20250823-shimmer-conceded-35d10a7b5264@spud>
References: <20250822120241.26419-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C1ZqRzwRJhwxXUSo"
Content-Disposition: inline
In-Reply-To: <20250822120241.26419-1-festevam@gmail.com>


--C1ZqRzwRJhwxXUSo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>

--C1ZqRzwRJhwxXUSo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKnKDgAKCRB4tDGHoIJi
0twtAQDhBDDAYhVJmau4HmLAEuC6wDq0to3phN8IMEFZVeNB+QEA1cljqSj4WxWU
ONvIfhtDTCppLOw2os+kUlIBdwNkcg8=
=4Euf
-----END PGP SIGNATURE-----

--C1ZqRzwRJhwxXUSo--
