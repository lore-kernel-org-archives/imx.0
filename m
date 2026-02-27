Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B82D36EAA8;
	Fri, 27 Feb 2026 18:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772216231; cv=none; b=Gboqg66Ai6/7fZ3s4hY88B2DNQ4zkUYGB+VyNK5gTHrTQGDtrV77+2oayIKT7S0MmiNodEoiw6SiuSt5baRdXTyH06gpQNJrts7Z6PKlmW0VroRbpEb3ZRO+A2oUSak8h1+Uu80y31ej8ZzMq5/nYhkXz+6Jm6xCtdlsW5hu6kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772216231; c=relaxed/simple;
	bh=AdqCVfgpAB3vp48KPqAzK7xJZl0u8xamspTLJbyFYiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nes4vPrreLOekgY21oPs51oLuJA/9h/w5h6NKsmCXnyAfNKHfWq+tTOdfgA0hQdOfwyFtVyIcklLbzxdKIcInCHdYEx6rVL5zNwrcAcHmxHJ06aC5syXrI+wS5rhjsdymHGXrm0U4hjGroGiPvsfYSsUI1uM23wLYh6rmvknHro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZ/PqopN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZ/PqopN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB381C116C6;
	Fri, 27 Feb 2026 18:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772216231;
	bh=AdqCVfgpAB3vp48KPqAzK7xJZl0u8xamspTLJbyFYiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BZ/PqopN73NVxSrssnsR+f0dGcbvScne0375jQFl9MFFvjjyOdLCneh99i3E1SWxs
	 zPOLVEo4bcJnXTUuDBWWjhgH+55krLVajFuZMfZTkkWLWNRNexO/GS5nSbG96v0sUQ
	 7ic3QFantdnA1n3EqWMBX4zyh8IDKidrTIoG4hRXIEX37klPhH/7EQ2VwffbDjZNYL
	 0LEElJ6yqs0rFXkGbmIIJWZ9NvtVSerMf5KKTEvsLXQbxk9WNA1fzLFperaROg5hCn
	 We/f1tvNolTlZ0KevAcAG8QVU3GtstGCYY1Rk5Zf88u2prUprTaZP7KdqR2Q/w8pzA
	 LcweeqCBkhVGg==
Date: Fri, 27 Feb 2026 18:17:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: media: ti,ds90ub953: Add new range
 for remote GPIO data
Message-ID: <20260227-buffoon-carpool-7a73ccdb8eb9@spud>
References: <20260227-ds90ub953-v4-0-dea596205f9e@nxp.com>
 <20260227-ds90ub953-v4-1-dea596205f9e@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pzRdTIxGwv1KPsTb"
Content-Disposition: inline
In-Reply-To: <20260227-ds90ub953-v4-1-dea596205f9e@nxp.com>


--pzRdTIxGwv1KPsTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 07:21:10PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>=20
> The DS90UB953 supports four pins, GPIO0 through GPIO3. When enabled as an
> output, it can be programed to output local data or remote data coming
> from the remote compatible deserializer.
>=20
> Make a different GPIO range for remote ones.
>=20
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--pzRdTIxGwv1KPsTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaHfogAKCRB4tDGHoIJi
0mHgAQDqkV16HQ1woOMuAhpKuzDdlBaNuDv8HlhSYlhOhrtcfgEAm2otfL5wfLR+
nxS5gFFrRXH/6sJesP9befmJ5DKF5Qg=
=Ky1T
-----END PGP SIGNATURE-----

--pzRdTIxGwv1KPsTb--
