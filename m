Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0B23CAE67;
	Fri, 13 Mar 2026 17:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422764; cv=none; b=tI4Z48buBAH7o5PZlYrVH4dj0QbDFuLgOLOkFXdYAVb9SVYF7Ojxd07DqxbN07l0lu0dwtwUaCpYG6bd/uTxEkhkjUT8327xRhqOQqYYR4JyJbzl5bCNrUB5wvZeYXAWlJxiFejkEMt+Yl15Wh9HQ+WmIzHFusQo+8q6PhfttBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422764; c=relaxed/simple;
	bh=zZNYqBYQpWUnW/tLMvfUh2kjUY/YDWM5Q+UdXtOlsMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvsHHn3iY8GyaSohczusjERvHwIGHey0hhe1b50Bpqk+0/UGTnroQFIy2wWd4dRKTrdEIbCE+w+yNR9GzhkPpbdxzqgPFRxOZkmtxq6Ee7Jwtxkyi2PYtP9cs8ubbx3lWq7yjpEaqUa1P20EmyhiaYn5gNtaHvLK5vvSpjOjMB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLAW11TQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLAW11TQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCA1C19421;
	Fri, 13 Mar 2026 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773422763;
	bh=zZNYqBYQpWUnW/tLMvfUh2kjUY/YDWM5Q+UdXtOlsMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLAW11TQMPOsxVrmWlW/razPRVJT/XzIxRENzZzEZi08nlNqc5BwR6QDve3cyQc8s
	 FKNe8qqR4s+fiCl3NZXfLPzVi7l4MNelmQRHbhhTEpf5QcvuTulzbKf7OvxGdz205J
	 v2PsYjA4wnU3vYXWzxywydeL+qHIs+Lge3CnzdY0uAO3LmPUZ9ZCUXstGxN6HesHUd
	 bxsYA6/2a3UtLWf1yp5g2p505N8B52jtZZHq8tTjOMwbub/+8KFA0lMEayGH6qeOCu
	 hgG1wfvrI5kWtMX6y5G4S/EjW7KYmzlJ5XjKQeCnhGi9/yEWVM2HNzWnDGocHmTayR
	 kP5EKJb/2YxeQ==
Date: Fri, 13 Mar 2026 17:25:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, amitsd@google.com, gregkh@linuxfoundation.org,
	kyletso@google.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: connector: add pd-disable dependency
Message-ID: <20260313-cradling-rocker-7ea6db821916@spud>
References: <20260312071609.388047-1-xu.yang_2@nxp.com>
 <20260312-facial-backshift-7e810ca5f996@spud>
 <eew6denbcj2orizphwwl34qhbwfnumas44vx3f5t722csugmp2@zbsmhpcqazao>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6USddsxsDHkuXizf"
Content-Disposition: inline
In-Reply-To: <eew6denbcj2orizphwwl34qhbwfnumas44vx3f5t722csugmp2@zbsmhpcqazao>


--6USddsxsDHkuXizf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 09:58:18AM +0800, Xu Yang wrote:
> On Thu, Mar 12, 2026 at 05:47:32PM +0000, Conor Dooley wrote:
> > On Thu, Mar 12, 2026 at 03:16:08PM +0800, Xu Yang wrote:
> > > When Power Delivery is not supported, the source is unable to obtain =
the
> > > current capability from the Source PDO. As a result, typec-power-opmo=
de
> > > needs to be added to advertise such capability.
> >=20
> > What's the impact on any users of making this a dependency?
> > I assume nothing negative, since this will only impact systems that
> > don't work properly at present?
>=20
> Yes, right. Most of the user satisfy this requirement,
> expect imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso.
> I suppose this user can't work well, so patch#2 is added.

Okay.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6USddsxsDHkuXizf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabRIpgAKCRB4tDGHoIJi
0hTeAP0V1CWIyzl7ZQX9Pnvcy+h+Cv/hX+KNv50caRHWkfZH8wEA+tCGP/dGbZRT
gRj/q/9O7SsxXuj0iSXiNORmQNAeOgY=
=jVap
-----END PGP SIGNATURE-----

--6USddsxsDHkuXizf--
