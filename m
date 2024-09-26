Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CB615B572;
	Thu, 26 Sep 2024 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727366745; cv=none; b=BRb/v+rxcJ7VYYGsObcpc7PUpWwfztr0na6gkl2xPWTKjxNUIXocdGJxNBsxoYEgR3Z/frYoeffkGtEPg9kOB8aA9R/dNzlptl8xowLkKOJDPpsQipZDXJueYEaUJlV33bXj1kBNsSxG0orBt4W2LltmyEretqHaNYgIRpsU9PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727366745; c=relaxed/simple;
	bh=y71oe5djBpgahISwwokUnuA5S6RXN8KO01tpPt8PVFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYwA62LW9CzXnE8FbtGPGD3m0WT2TnI0ySg6k88ZGDDPwNcA2Mynis2oEkoxsFW2cNX/BjoWkw/yvwy/9n6bvJBO1Qk0CEcxh6t7PzTnGa7J2p6yQYWv+hzJqTjFtWpPZL272d67aW4Wf21/wuu53s8AQJ18Wj/Ab1o0SgO+d6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLztfgLP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLztfgLP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FFEC4CEC5;
	Thu, 26 Sep 2024 16:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727366744;
	bh=y71oe5djBpgahISwwokUnuA5S6RXN8KO01tpPt8PVFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HLztfgLP34GBrSkn4a2ImWvhxujN3a8PG6cY8g+9hXQbte2MWjU1cMI1nPJKWggS5
	 xMy4KGxoYnzn+puUv102KhChfUXsv6GVz1pmiKqdNs9ZCxev1cJJcYZGvh8W4m9lm7
	 o5eEqeA2sWUK7Ql87U1jIhwAqLIIiT9quAREWFkiuf19xgq+k7Vfdnqe/L7B1cjhNv
	 Z4SLB5KqIBKnFgMqSR68V2GFXNZWON8CGZpGm2cLIHNZap8vALAnza80OxwLA46Gr/
	 ABH6wNviF5HBJ2qWE0H+M27T21HjDbtHYJPNr/i3I/Wux64RbQt5nmldlp7UXcmnql
	 BTsGV2mY++V8g==
Date: Thu, 26 Sep 2024 17:05:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: phy: mxs-usb-phy: add imx8qxp compatible
Message-ID: <20240926-avid-underwire-b10f52de08e0@spud>
References: <20240926073951.783869-1-xu.yang_2@nxp.com>
 <20240926073951.783869-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NidS9fCP2a6+3gA+"
Content-Disposition: inline
In-Reply-To: <20240926073951.783869-2-xu.yang_2@nxp.com>


--NidS9fCP2a6+3gA+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 03:39:47PM +0800, Xu Yang wrote:
> Add "fsl,imx8qxp-usbphy" compatible.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--NidS9fCP2a6+3gA+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvWGUwAKCRB4tDGHoIJi
0tZjAP45pdp1VzjUVWwXfkqpFjscXqBUz+cV53iFA9/9oJLXHgEAnFqhV/mBKLeG
spjqaMm7fRaGBcEtBx+Lq4NITSpVmAA=
=+la4
-----END PGP SIGNATURE-----

--NidS9fCP2a6+3gA+--
