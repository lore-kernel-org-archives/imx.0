Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878AC371076
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780680; cv=none; b=beVSnimd2fFbzMq5K9P/I2qSneubAdJa72KpIJUnmIOXwJQrgL+1WEwzKXt68Z/3w25FhUr6YSXuZDF8SfKZL/3vJLRO0/gbrsTCThnX1j64rXpZCldYhug8Zji6IzNBE9DecZi2/gubQ8VA+0gj9kHscMxQZB55o5U5E/OcUEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780680; c=relaxed/simple;
	bh=H80RO6ot8lPDo0rMkQCfDGAbtfo+W3wQW860gZOLVWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbjetbvkhPA77CrkaMh40X4HsVOc3DLItVHA67TiUH/lNCPqYRNsloXrNw15xXwwIp+r3JjrROlsA9pEmWI4j3284P13M711ov6ktkHZ0dbEUnu+k89IxVv7D7kUnGEtn8O+Q3EtbPGlcMoba1Vc0gSELeiC1ixcl20Z2fmq9j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vyPEe-00022D-1i; Fri, 06 Mar 2026 08:04:32 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vyPEc-0040s5-1A;
	Fri, 06 Mar 2026 08:04:31 +0100
Received: from pengutronix.de (unknown [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 4B5584F9179;
	Fri, 06 Mar 2026 07:04:30 +0000 (UTC)
Date: Fri, 6 Mar 2026 08:04:28 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-media@vger.kernel.org, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, gustavoars@kernel.org, open list <linux-kernel@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
Message-ID: <20260306-capable-gainful-goose-e94f08-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260306044536.149204-1-rosenp@gmail.com>
 <20260306-handsome-quixotic-catfish-705bde-mkl@pengutronix.de>
 <CAKxU2N9szBV0C95=v7_HxJOBgOhFv1J=k9XPE1Lm-w3zQMQWdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2uzw3kkivjpbaqyp"
Content-Disposition: inline
In-Reply-To: <CAKxU2N9szBV0C95=v7_HxJOBgOhFv1J=k9XPE1Lm-w3zQMQWdg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--2uzw3kkivjpbaqyp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
MIME-Version: 1.0

On 05.03.2026 22:59:13, Rosen Penev wrote:
> On Thu, Mar 5, 2026 at 10:56=E2=80=AFPM Marc Kleine-Budde <mkl@pengutroni=
x.de> wrote:
> >
> > On 05.03.2026 20:45:36, Rosen Penev wrote:
> > > Use a flexible arraay member to combine allocations.
> > >
> > > It looks like pipes never gets freed anywhere. Meaning this effective=
ly
> > > fixes a memory leak.
> >
> > It's a devm_kzalloc(), which means it's automatically free()ed after the
> > remove callback.
> Yes but pipes does not use devm.

Doh! Sorry, I should not review patches before first tee in the morning.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--2uzw3kkivjpbaqyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCaap8eQAKCRDMOmT6rpmt
0ui3APwJONlYYblrkwwoXFicyuw4HjAIX8KM4u1R9jFdyY/UVgEA5LhVNXfqicvS
mQPUC7n3xnNDIGl7fSPAREPtn970hwI=
=Jzjd
-----END PGP SIGNATURE-----

--2uzw3kkivjpbaqyp--
