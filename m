Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E1517B4E2
	for <imx@lists.linux.dev>; Thu, 22 Aug 2024 11:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724327208; cv=none; b=D8H0YU9chmp3HKPCIku1ryvVPsOqUAvi1cseiQ3NKFWzajw6H9DGsIEcADLrY+T11jqHgYYjJy7FcKp2I+vf4KfXJ9kwuQlv5iodsSl3difVvMvfF48EYAgLIgPBB8ifBJdM2+thBmSO3zRWzcCPz8eAPt+W5z4ktmuP/nUXVbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724327208; c=relaxed/simple;
	bh=l6ecc7k+H9AK9KqihjUpo4KZB0Ulf8mRorDzf9vpmMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoKQ98cYBIVp7FNzcWygXftT5JKbxr0lhu6ADAMSzNrdFnRoL7Lfu5du5+4z7zJ0SWw710RgJL4PLXh5aOiota+O0vbi8cRZEfxRH8B8pSsC6BiUpX31jlui2+jNhZevDmzHhvJsmtch7lvHJ3KiinYZT3vJkrGAw88dXJpWEo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1sh6Gx-0003Ir-Nj; Thu, 22 Aug 2024 13:46:35 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1sh6Gw-002Erz-V5; Thu, 22 Aug 2024 13:46:35 +0200
Received: from pengutronix.de (pd9e5994e.dip0.t-ipconnect.de [217.229.153.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 88AB9324912;
	Thu, 22 Aug 2024 11:46:34 +0000 (UTC)
Date: Thu, 22 Aug 2024 13:46:34 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: imx8mm-emtop-baseboard: Add Peripherals
 Support
Message-ID: <20240822-calm-dinosaur-of-music-33db22-mkl@pengutronix.de>
References: <20240821135817.56393-1-tarang.raval@siliconsignals.io>
 <20240821-cute-cougar-of-atheism-3a9121-mkl@pengutronix.de>
 <PN3P287MB18298292CD27FD9D8365C9178B8F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20240822-holistic-fearless-bloodhound-e9095e-mkl@pengutronix.de>
 <PN3P287MB1829953DB0BBC5423672FF728B8F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xdfjacdwgthgcqr5"
Content-Disposition: inline
In-Reply-To: <PN3P287MB1829953DB0BBC5423672FF728B8F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--xdfjacdwgthgcqr5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 22.08.2024 11:42:07, Tarang Raval wrote:
> The CAN chip on the Kontron i.MX8M Mini Baseboard is the MCP2515, the
> same as ours, and they also use edge triggering. You can see the patch
> in the link below
>=20
> link : https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.gi=
t/commit/?id=3D8668d8b2e67fe7cf65f02becd5d67c0636689e82=20

That's also not optimal.

Better, use a level triggered IRQ instead.

regards,
Mac

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--xdfjacdwgthgcqr5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmbHJRcACgkQKDiiPnot
vG9y6wf/YvbHfD7rRV1bCuy5qKAbuuXQm06MfZYrDoVuKD6daQdC/sWkC0f9X61K
ESB/Dk0cKi9prGGELn4+ZeR168ln3trEBZXTP6jTiv98YoVto1DrFSpUFbKVpyqD
kbpV42pXp2ytm92rNiuXRYCrbVJ4Gy2JfNpvCXPb7OkskB/SCT1EWnXiIiL/oHgx
qa3iMKrzaNkC9G041ujM7PNB+iyygQfuj/Jia4F+nyytgMsW5NtLdIbe1Pr4EBhK
ugVH4lUFLupawEtJzCTMzb2yuSwxa6+vdkJqnn3FLkASMLIjL74RHlwzP5vk2CPH
9KsWnR620D4AAnLsaIYIHLEIXZR+kQ==
=Gxuc
-----END PGP SIGNATURE-----

--xdfjacdwgthgcqr5--
