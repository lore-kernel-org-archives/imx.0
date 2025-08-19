Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0311A30C363;
	Tue, 19 Aug 2025 17:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755625666; cv=none; b=HqfHjZivAbHLulPjCBoXaKWyEGFQm0mwWNveiGuI0ZS/D1U4JFG/qqB2EJRODuwd//zknp72jsIzUlB/Ky0Lf/tXB5f6XtxTRN5hvkm+RJ4NrPXs4FzyBYf98IFobTVUbac8p5xqLvHCUQ2fEQYAh2AMrv/HDSTxUuYebJusv/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755625666; c=relaxed/simple;
	bh=KnGr86t4OlNB0wtikQZECGf2X0et+OHGw1/9y8BAxis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RE0TIChXHemvejzYECLbd1SFscB/k9LfYSaJE2oloehK9WeNr9o5gad4Ss7WAP+p82y5htoLlqXgi6vdNxmzZlTAaA/w7SNrJSuWNhXFI77Ck8OLq7nxDYyoRS4OXhB0P0LUkxZMdakG3GRBkJ/Mo2eHqylbTPj9hU8rKbe+t4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5zkJ3yS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5zkJ3yS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F026C116B1;
	Tue, 19 Aug 2025 17:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755625662;
	bh=KnGr86t4OlNB0wtikQZECGf2X0et+OHGw1/9y8BAxis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5zkJ3ySBFlAGPKVLMQe0bu5GBilKDXjybiEoGjXHCiVhsmigNUcKx5WzKy4Q7Bs6
	 FDPTNqlA70Xb9Dvztob+I403BT0p1+lSCIHyArD/f52s/0xrxuR8Ln2S3U805bP8mh
	 +DvSifctvHGlkoDyk8IafTP+6tmWfAirVBwGdrg3/QICykOsmFfS81XR2MPBzJRq+g
	 0J+UmKNyqHyo1dB3aFW/i1OTmk046Od3HDhH4yIDFrXIsNUqIVSVZPAJdnlATXRJoZ
	 OaaoCfuvB7mz52LsTSnBVb5IFL26ZCICl3u2bEXVtFm5w8WYRvHH3o8V3SVzRi2b5n
	 Mkab2IHP66rvw==
Date: Tue, 19 Aug 2025 18:47:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: w1: imx: Add an entry for the interrupts
 property
Message-ID: <20250819-elsewhere-sprint-e2d4a7a6a405@spud>
References: <20250819121344.2765940-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sYTRPFVk4jMsZHZi"
Content-Disposition: inline
In-Reply-To: <20250819121344.2765940-1-festevam@gmail.com>


--sYTRPFVk4jMsZHZi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>

--sYTRPFVk4jMsZHZi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKS4uwAKCRB4tDGHoIJi
0qeHAQDShjvMloQUPPzOLvieEzoHqb5r+J6AE2CYYVQhROWjNgD/WSoIf8kr8VKT
lpKMpGGkDEZ5vae9/J4z825YbqqfWw0=
=V/Q8
-----END PGP SIGNATURE-----

--sYTRPFVk4jMsZHZi--
