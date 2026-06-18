Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9933D75D7;
	Thu, 18 Jun 2026 18:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781808766; cv=none; b=fwodcF5Bp6yWB5N5xBsut90PQ/797L/ki04SNIgTF9XvaDFZG0JAUoTv8DUNhOZ6b6e97hrrcGDFliou5Gub+Q+AXUg9Ko+LEHC2pDRweUd48TWghtHNFmtruQUWOH3PxVjbfMxM4ji4/cfsqH9lx4ykEza/ZT/X9POb7XuNcck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781808766; c=relaxed/simple;
	bh=yKHWv/SXnlN/T5ZXVJ/1P/o6FU5A5hf2AjOF+dFznns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/Kl8XRdcx44Ak/G/qNLJeEU8ZkGt9JAAZwABPL2vaffmZaYoFd1sCx62K3Bfyrau/kWsKew+M+Q90HDOniDhrJZnjwdoHkMdw7QbrilQfFeeKrZ/L0rwiS6M1ISUjkOQIiiA2CbUopNHIxkH748+X2uXbJLjVGWfjk3PwwXzqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrs9q/uE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrs9q/uE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD10D1F000E9;
	Thu, 18 Jun 2026 18:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781808764;
	bh=R+D/3BzK2bxEPRnczp+3d+oLlW+RGD2pxKoXb7a18do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nrs9q/uE1cpbt+wHuoIbeiRI6k4UqeMEMJIEvBj6ZX8GzSlYX8cj7SaCyFDD7HEi6
	 zB7QPqtBpexseXynBu5X8brbvRDcfT28jTulDhwKrx7XRnbJzdpki1vkVQW+9JES7W
	 86c0KanHdLsA544Tc4PNheDAmEMqV0L6pAz1VvNbuiH2Ela9YRajG3kEbd+JzvXlra
	 At3Oq5vrdimwDBckRwN2/zEuLYAgR6NrykNLmzgdCwhoImTdwEWcHxjHdVYtohn3ey
	 nKY7UIiWo9gtF8F6AouNoXXOUMLuhfB9ebQAhMAA/D/0zPV1d/hUroEJB0TAtMdHiy
	 SMCRS/915rciQ==
Date: Thu, 18 Jun 2026 19:52:40 +0100
From: Mark Brown <broonie@kernel.org>
To: joy.zou@oss.nxp.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Ye Li <ye.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Joy Zou <joy.zou@nxp.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] regulator code improvements
Message-ID: <0928af24-fcb9-403c-8add-b0773b5e35d4@sirena.org.uk>
References: <20260618-b4-regulator-opt-v1-0-c43b1f62aaf6@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="srLBFQj+NHDP6Hul"
Content-Disposition: inline
In-Reply-To: <20260618-b4-regulator-opt-v1-0-c43b1f62aaf6@oss.nxp.com>
X-Cookie: This unit... must... survive.


--srLBFQj+NHDP6Hul
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2026 at 10:03:04AM +0800, joy.zou@oss.nxp.com wrote:
> The main improvements include:
> 1. Correct the default toff_deb for PCA9451A and PCA9452.
> 2. Modify volatile register range definition.

Just a general style note: when you've got unrelated changes like this
which aren't really related to each other it's better to send as
separate patches, it makes it easier to track things and avoids CCing
people on things they're not interested in.  A series makes sense in
cases where there's some relationship between the changes, either
similar changes in several different places or where the series builds
to implement a feature.

--srLBFQj+NHDP6Hul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo0PncACgkQJNaLcl1U
h9DDmAf/ezahuZL/TL/zjtaHX9rX8FYCWuGti7elQ68G7wHOG3AHQ6sz0Ji277Kb
mt96BE5ZiGKfBH4EQiXbL9gt9DMgnI+YYESdE+6ne2mqrXbMwIMZBzBD4kPUzjhd
GSDOnOFFLM9ZjvSD3+magP4jJqPT/6dZQ+rkVGdNHHPwjTePfwg9moDgM+YB1tdf
2hxyQeGdrwR31/gHC86I+qCAYY1i+f0pgkJERwOz9YGyC717EbNlORc8TJGSHWOj
VNxbTL0pFm+5/kku+Pz45cksvx88UsVbM48S0B2MMq6d8uk5KZyigHkSFheWioEy
FheFJTcouZn56VX8v5XT12oMb7gKlQ==
=apun
-----END PGP SIGNATURE-----

--srLBFQj+NHDP6Hul--
