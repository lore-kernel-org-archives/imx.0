Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BBF13B592
	for <imx@lists.linux.dev>; Fri, 29 Nov 2024 01:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732845296; cv=none; b=lVxcm5+qkrUpc3ZkVHfjXXF6jai75bVGgo5P32rIdlOCTUAZKmMqofDBEf5IRT/XS7UecPt+B4SE7MTL4HTYuHqD32pGHfSAoqZc3+CqcGgJbIZeV+3ftiHj1DfYJe05PlAKr4aYI+k4m5iYIOYqZZdEoTRHb9Gt1zqRbxaZtks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732845296; c=relaxed/simple;
	bh=QDeUT98KS5fxKKoSZqvb3ItVf0xcYnDtU/zOpzcHAfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0KsnspCB4DZypwZU2nAUgcBqSJuW4bqMI/bEvzyVrnPp7LmGBAWjtksLAMTNuGL6zVdHIYCDASNFdSwRGD8SwZWBsRyuM4jrCXPtlPrHKe0Cgu/0+zZmSt9NYGGHBO0j+MXqzZjPlNI6xphCPY1JoXpspa9UkhQ5CtjztFWS0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Equ7yXOs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Equ7yXOs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QDeU
	T98KS5fxKKoSZqvb3ItVf0xcYnDtU/zOpzcHAfI=; b=Equ7yXOskTQtUcbAMe1A
	Prc8PyWfJzaXvfvhcYPt3wnDgrd247CTnqYrL6jSaHv9h/gtJnB3eKvNsd1tBPDo
	ghb+izK7AuXrBJu7QlQUOHCrIuiUpTYLvutU17QfGMwLWzZ4c1Kz20NAaSt2GB6k
	aMKiFNsqFyZjzBxv7F3trHz3S34GqBfAL5dvIrqUXte8gUN8owK9vdHg3TUldKdm
	/Z6dBkHWCyp3TSrGNOCpQbZi1/gAX3u4THQIWY6jwhqbtzxDZCqMjrNjIYmHqcic
	Lsc7MCILk4CQioEV9dKIPpOTqN9nTCw2Np1qeOZbpu9RmJTwKNnKu7YQxKYcA6qe
	SA==
Received: (qmail 1195842 invoked from network); 29 Nov 2024 02:54:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Nov 2024 02:54:51 +0100
X-UD-Smtp-Session: l3s3148p1@v+UOfAMozKdehhYU
Date: Fri, 29 Nov 2024 02:54:51 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: Frank Li <frank.li@nxp.com>,
	"o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx: fix divide by zero warning
Message-ID: <Z0ke6xBY_xnnh4Vc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Carlos Song <carlos.song@nxp.com>, Frank Li <frank.li@nxp.com>,
	"o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20241125141521.1612947-1-carlos.song@nxp.com>
 <Z0SxUhBmp06ScnfP@lizhi-Precision-Tower-5810>
 <AM0PR0402MB39372A814D43DBCD5AAD1595E82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QM6MgxSTAC5BqVvj"
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB39372A814D43DBCD5AAD1595E82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>


--QM6MgxSTAC5BqVvj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > You sent this patch twice?
> >=20
> Yes, because I meet a net error, I send the patch out and wait for a
> half of hour, but I don't see the mail in the mail list, so I send it
> again, but another one come in after 1 hour.. You can dismiss the same
> one.

You can also check 'http://patchwork.ozlabs.org/project/linux-i2c/list/'
to see if it made it to the list.


--QM6MgxSTAC5BqVvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdJHusACgkQFA3kzBSg
KbZTshAAl9m1FL+HhV82/XxjaECfvKy4bK+kBkt1Si6Df8V2/0RO/0I1Y3D1yT86
VkInNDR/pn5hH0yJsm4oZTOg68S+GFZtC5txrtZQuQi0SJePaGbyj2egfTpo/RXQ
PBqLqTKe5Y7Kkmyz9SeDG0E02MQC4j6lVCdXlpytC9lpnvgk5FVNWNFPVAQG72B0
jV/iPv1V+edP3od5TbRmiLN9PAAlX3LUKqCVfdSskx+fE3wvms8aK0fOh+LjPxkJ
CAikKY6spXg3U3xxRkwl1IixAwL4J/2R9HAMl3Qjy+nSGX+YK9iAgRbqJnzpGB9i
cZSXo9elSM0kTFEtw34/499YU9eDuPHjPa7RtNwKAURYgmgkzRYsiizFK5+I4ZBM
9mPqhYBcnQoBe/7IopD+AgtnQdcdYeSZwwKCLkk29rR1mTfnl0ty1hFDa5gCPrO+
jmiWawqsbnMT600PuiPHGiUT4eL/o/kUhTMKPqWOJU8oVW1UtRUIOzt0l1YVyQ4M
igS4alxzIgveQB0cK7HA6OpgrYOtVu+xzawLH2HPBToiqhjzQFKCiKkslShUk8R1
Q383wN8DhHSCf+OV6U5yizPc8Ga6+Jj7mz1S8e9atA0kc+lZeUmRir9fyQqozRZm
nHBLYjG+D8E9OMiSxuUMSUIBDoECy09im6oLNzQeAZMYAcUm41Y=
=0PZf
-----END PGP SIGNATURE-----

--QM6MgxSTAC5BqVvj--
