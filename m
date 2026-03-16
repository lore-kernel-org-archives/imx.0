Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE443E9F8F;
	Mon, 16 Mar 2026 18:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773687403; cv=none; b=eiIr00VVSJdd47O0bRvYobJYy5kar6zDaNVUxVfH7b3HNxfqX8Pok+VAg3OnuVQ9YYZ94pfNJO3c13abwrYmJY000dxJ5epi7eYmENac0tPVMfWmVdH5MORP+v60tggGKhp4R9O78QFaRCqNMY5NDeIfn5q97TcUH5aCfK4KnqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773687403; c=relaxed/simple;
	bh=jUKOiRkth4NHvLaNYEfaZ/92sOfLfw/RM9ligXnEmd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nG8+RLMYrqLqqF8WlFeMQn/w3No9msDL1O0pS22Dt758Qf6F1bJ+s99JNXzzAD9t9GwqsnixEQIs4GYinmVFAbyEr6i5Ghx9goVfaoqt9Kh3qT3zIaBv3Ik5SRHY5SgRRnuHsMOZj6PELaJJ8S+CS+DrKP1g3hOesmCBL8Uz+H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWmMYn6O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWmMYn6O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF408C19421;
	Mon, 16 Mar 2026 18:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773687402;
	bh=jUKOiRkth4NHvLaNYEfaZ/92sOfLfw/RM9ligXnEmd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NWmMYn6OLiYwqNiI3cLiXqdT/A3oVziLouMTyE30myfM3fvH08WJp1Lbn4Uki/uyr
	 uKa1SSiSIvxSySXP+ObJBZKP3y7GZn8VhbAB8464emvijEZtjf2f2eA+HmlG21KuaV
	 cULJfrxEGgYdNS5y/FCugoG2NLD4vIMHHnlI6qEgGWceK/+3mhJL9lS27chvx4HpOZ
	 8DBPW9uzTWlLaaJh46Opn1VIoUwM70wp0o3DR9qkut37KLrFmUfnhX+4gjzHKSjonS
	 FGZ/ZaKVkBTAju9/tD7NQMIFavci93oz6hWbm7zyI1vFBPOaz5J3m4H/TPAbebSYGG
	 OLptQ7fW6MSVg==
Date: Mon, 16 Mar 2026 18:56:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Robby Cai <robby.cai@nxp.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andreas@kemnade.info,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 0/2] regulator: fp9931: Make vin-supply mandatory
Message-ID: <c19cbdda-bf96-408c-8479-b662011e490c@sirena.org.uk>
References: <20260313133102.2749890-1-robby.cai@nxp.com>
 <f787e9c9-004b-4b34-a122-7b1cca3a2970@sirena.org.uk>
 <d57d9f4d-098a-4663-aa72-4d3104451aae@sirena.org.uk>
 <20260316073125.GB3683539@shlinux88>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ipN+P2z6MbO/+5bK"
Content-Disposition: inline
In-Reply-To: <20260316073125.GB3683539@shlinux88>
X-Cookie: Not a flying toy.


--ipN+P2z6MbO/+5bK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 16, 2026 at 03:31:25PM +0800, Robby Cai wrote:
> On Fri, Mar 13, 2026 at 04:27:21PM +0000, Mark Brown wrote:

> > Your v1 was at the tip of the branch so I did actually just drop it, but
> > please don't do this.

> Thanks for the clarification.

> Just to confirm: since you already dropped the v1 from your tree,
> does that mean I should wait and only send an incremental patch
> when there is a further change needed?

Yes, exactly.

--ipN+P2z6MbO/+5bK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm4UmUACgkQJNaLcl1U
h9BbpQf7BccqPjfDIAGsMot5LlIXHgBEkJ/Fz62PEyW77dPvcZ08eR7rVwm55v1c
gYWBQXH00f/j7s2xip6F9k6VSEE9k6eNMHLr8/C1+PdJSg2DTLgMpxtQOrH3F2RZ
2KEcvq9dhmm0GT8IYJDMBIFfNv5zbXzuqTtDtELeOge8/P19zWA8itwsiLVfHpNf
+TgXBLcggP6+/AW4saTN3A6Ofvc/iamJ4Ny2hfyJzJjslYT5SlYiqphH7AgeNPV2
7bfvJiIx86REMQ/+tKxGGDHaR0u0Lquzb3WcSJsMww93JcrWND35+3U9Bw/iTmj0
CKiQk7RH7+hfB7Svu2GI+9E2r3GRVg==
=UQd0
-----END PGP SIGNATURE-----

--ipN+P2z6MbO/+5bK--
