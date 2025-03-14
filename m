Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0341D86FB
	for <imx@lists.linux.dev>; Fri, 14 Mar 2025 08:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942552; cv=none; b=ieqo70bDOLvCibTKDgnn6d3dGzKnTy6Xl2qTIFJq2uZqZd+iuZ1urlkqrnzilHPESDZd8YdLcYtXOnw8zMRyT45lpU7ffYTe+C4RS61MvwCvLBYnk2osY/XvLUORi/pK2dpvkC/QQh20FFTu5ZLVagobl7KWqM5VKNBOwssC63U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942552; c=relaxed/simple;
	bh=QVf6IAM1bd0o2o9CRTs9hW37xXi3Ym7SihZPhvQUXpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPp4smCzmoRZQ1FVqArw4Q8T244ZQJTYBWQQmpRPZDqi+iDaSruZH1aCw9R+Fr9Jua8pbzQHqbzW1MZPgfMvkccl9OsYZmvKPS/RMZEpZ0pNREZeO4iClqS5UXdLQHb63thfZY++s/lLnD4Y9jwTnFKuMfnCG1z6ZlYe0KhQxOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tt0pX-0008E9-6S; Fri, 14 Mar 2025 09:55:47 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tt0pW-005fmk-2j;
	Fri, 14 Mar 2025 09:55:46 +0100
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 787483DB85A;
	Fri, 14 Mar 2025 08:55:46 +0000 (UTC)
Date: Fri, 14 Mar 2025 09:55:46 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: can: fsl,flexcan: add i.MX94 support
Message-ID: <20250314-berserk-wine-turkey-18f714-mkl@pengutronix.de>
References: <20250307190816.2971810-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wqldkzxr5zxyxjkx"
Content-Disposition: inline
In-Reply-To: <20250307190816.2971810-1-Frank.Li@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--wqldkzxr5zxyxjkx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/1] dt-bindings: can: fsl,flexcan: add i.MX94 support
MIME-Version: 1.0

On 07.03.2025 14:08:15, Frank Li wrote:
> Add compatible string "fsl,imx94-flexcan" for the i.MX94 chip, which is
> backward compatible with i.MX95. Set it to fall back to
> "fsl,imx95-flexcan".
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied to linux-can-next.

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--wqldkzxr5zxyxjkx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmfT7w8ACgkQDHRl3/mQ
kZzYnAf/WJzCDW04eHxhTNrkCZk7STUIXOpvxwWNwYPyUcpi/Le/aaYpItBySi7P
kEdMGBBg3phIGSwbo+9lTrYMDRP02JUJbDJaS/0UrwqFPNvSKo00KYfNWUOrRnY6
R+9Ojlq5wYFJnsDjXp822iR0kklnyRs4SuALLTdRn6LDkiHAEYSmpzOHcT7m0V/i
O2Ir35lx8LrcL/6MXiHSmZhod01oUHS3WcvEMkBJa/B7JQX6x5SC9LGdbwnAvp4n
Du4OcWS31kUvI/EDreABWjx5HMeUun/MiSPRd0RNyajFvoHNOPy3gJ1vWFpfO951
u5EerZ8QkMFQfB0K2O3VZortPJke2Q==
=yFfj
-----END PGP SIGNATURE-----

--wqldkzxr5zxyxjkx--
