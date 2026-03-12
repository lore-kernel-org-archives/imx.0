Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A903F2F28FF;
	Thu, 12 Mar 2026 18:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773338458; cv=none; b=Xp+0FclVvhGk2z4oeeXylc391TegvBFDExU02LyIbUL4BFVLumY1mCgstRVuabfDnHvuAwyIHZoBuVcWD+S7OErbJz6yxDjb0xx4G1sZzyvOg+RWNilB2GR9rqAuannsZGRnwc4HS22yQulhon0lCNuSZ/wYdP111Dx4uQcc2Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773338458; c=relaxed/simple;
	bh=P+YpUYOSxqeAfQCK38BVn/0glA25QwFXJlzX7Q6uxNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWoJ6nJJOl6rlj29jY2/i885Sv9jcNm3xImXTRrrqOWr86QRbf1FPmvsokUkS8Xf71fcLIDzdsTNpId+KejSa7SnZwpZ6P5YuUG6Dq9MgQLoTFFZrioKZTH2nu5nZpkDWB8TU/abymZLnippQPvblYi53I+ERuOC0G+yBeKQv1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdmjszZo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdmjszZo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03463C4CEF7;
	Thu, 12 Mar 2026 18:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773338458;
	bh=P+YpUYOSxqeAfQCK38BVn/0glA25QwFXJlzX7Q6uxNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VdmjszZoxHEOeKTmNadWSPRE24vXcqZGXo3i8hie/IgMCXA1lQ76oITmxkhZZyiJd
	 Rlkbcd7+7jYl7l3Jjlw15hlLLgeX9mcdDXKzJJ7v+3XuBiyXNgazw4wB7ka0NuLI1w
	 JBxZbRlQuAojjrt9cnIuCpchuyF+8VpRH/ZKvTsayUe3EC7xjQXX5qMxTOyK/EHtma
	 lPeWvWeSsFQ7FqsskGH/utNT8OYkWenwqkkop7agw21GhSyfAucEpofxGHu8uBRP5l
	 ckW8wyVTNdkeRhlc6HQlpG4paD/Gzmz8JeuStDV1yMA0sgSpOe/1OPU394+lppb8QZ
	 7ErjnfzfMIRAw==
Date: Thu, 12 Mar 2026 18:00:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Robby Cai <robby.cai@nxp.com>, lgirdwood@gmail.com, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: fp9931: Fix error handling for optional
 regulator
Message-ID: <62d8a4ce-bdf4-4629-8669-5f6c3e07a699@sirena.org.uk>
References: <20260312040148.GA4007088@shlinux88>
 <20260312185854.75e7a7be@kemnade.info>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lrae0Asnu9SKAJD8"
Content-Disposition: inline
In-Reply-To: <20260312185854.75e7a7be@kemnade.info>
X-Cookie: I feel better about world problems now!


--Lrae0Asnu9SKAJD8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2026 at 06:58:54PM +0100, Andreas Kemnade wrote:
> Robby Cai <robby.cai@nxp.com> wrote:

> >  	data->vin_reg = devm_regulator_get_optional(&client->dev, "vin");

> looking at that thing again. I think I have abused the optional api.
> Of course this chip needs a supply. It may be hardwired so something
> not switchable. But that needs to be wired to something... So I think
> rather the _optional is wrong here.

If it's a mandatory supply that's right, I may have misunderstood what
the supply was doing when I originally reviewed this.

--Lrae0Asnu9SKAJD8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmy/1UACgkQJNaLcl1U
h9Dr9gf/bQ6nu07ogT0iQzQxYwgAoMTrmFkZYFazsihMx5qsMiDbWA/q9/fs26yW
vfe4XMy4G2gOBWuXzDMCxIWY4ZB8gu6IbA6HiwCX4b8Uz2tH2oXPv4H6HS/L3MMW
uBnkRK6FeuGzXg4kr8KnQdWtfNC6GgWFqut2F9IqEm/O0oCdkwQ/PH8XuCbGzzyi
4AI4Wt/I4b+6Mirgak3iypVC77hLkdkbS7OW6Qac0O6a6O1u1O7wVXTv/fkGaifw
9jL70dvQZdE/zT1k6exnFV8Azpm3YQDcrVZCCIW/Mf8FMR0D2ZJ8Pvw5hd491ccS
cSaIKCPD4TiXMRDiZTqfvCv1QfoaAw==
=iMHU
-----END PGP SIGNATURE-----

--Lrae0Asnu9SKAJD8--
