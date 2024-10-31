Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82B819ABBB
	for <imx@lists.linux.dev>; Thu, 31 Oct 2024 11:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730374623; cv=none; b=CdIn3JiQphw6uoefnENRy+QCedHZwowR1P+ThftaU1YBT48KZ5nJlSvlQH4G2FxjWrYz3ZDoYUKwephBh/8oINv2BXjUueXIm8s3GMzT3CMP65TluvTYB/DK8CPBFoGGSRUT95OiV1cw0Koujw69syt5Pgw/PeehfnbM+oWGifI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730374623; c=relaxed/simple;
	bh=sY7sSj9zzVbapJohFIPMXSIHokERR7ps+8FB0kOwgHY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZawCF9CCa68404TEEopnxpc2IKET5zs//X+Y35bdY/WcZqjFrv6LbQNRQRu0O7Nq5pDId44vKQbIsnARP1xd+4qWDbeKVuB12u5dg5MBGyDnbYiHpfSMv+rFFfJTA7HsW4TdLa7p29zQDKmSqdnYgbgoVTP8/Mo4Gn2szcbt9No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=nWrE7/Md; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="nWrE7/Md"
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 676B288DEE;
	Thu, 31 Oct 2024 12:36:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730374619;
	bh=cIwdYgqrSCvO0w0cPugYjgRg4vwcTagWndmY5Hgtr7E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nWrE7/MdiYBoDALSdAHrhbb3tO7ZX/Lmnm0sa0V6D5Aaxo+D5YkwOXnjnlWOtnwtR
	 yWuXpXvtbYht3pNxwfSMii4W52F3zbQvpQnHiigIBQdAvKU5PJtnsjiUiY/EAyTOe8
	 WxKTUSsKSppIT+merh3fVy0RzdVvkKt75BdVXFfu11vcg3twYqQ5QPaRUNpspTCZ3R
	 9sMBGn/YADg7sSu6Y2TioFZBStghy8vaOXCND9SSpV3lml9YLHFwPrp0f6h4cT61NT
	 gbkyNXubKXTStiKBsbOpHd23OvyCoTeECY8/p//HbQ0++hYyWplkrd7ZPFt0BV6lsq
	 38T22Br2uneug==
Date: Thu, 31 Oct 2024 12:36:57 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 4/4] ARM: dts: mxs: Add descriptions for imx287
 based btt3-[012] devices
Message-ID: <20241031123657.337c816e@wsk>
In-Reply-To: <0cb1e74f-1163-4a80-8c62-9c7b0a0584f9@gmx.net>
References: <20241022133040.686562-1-lukma@denx.de>
	<20241022133040.686562-4-lukma@denx.de>
	<20241031094236.17ed927d@wsk>
	<806770fc-3830-4e89-a3ee-487b662685ed@gmx.net>
	<20241031113425.1e3d1da5@wsk>
	<0cb1e74f-1163-4a80-8c62-9c7b0a0584f9@gmx.net>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g3B9Qex0+pwrL7MIg=gQKwE";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

--Sig_/g3B9Qex0+pwrL7MIg=gQKwE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Oct 2024 11:57:22 +0100
Stefan Wahren <wahrenst@gmx.net> wrote:

> Hi Lukasz,
>=20
> Am 31.10.24 um 11:34 schrieb Lukasz Majewski:
> > Hi Stefan,
> > =20
> >> Am 31.10.24 um 09:42 schrieb Lukasz Majewski: =20
> >>> Dear Community,
> >>> =20
> >>>> The btt3 device' HW revisions from 0 to 2 use imx287 SoC and are
> >>>> to some extend similar to already upstreamed XEA devices, hence
> >>>> are using common imx28-lwe.dtsi file.
> >>>>
> >>>> New, imx28-btt3.dtsi has been added to embrace common DTS
> >>>> properties for different HW revisions for this device.
> >>>>
> >>>> As a result - changes introduced in imx28-btt3-[012].dts are
> >>>> minimal.
> >>>>
> >>>> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> >>>>
> >>>> ---
> >>>> Changes for v2:
> >>>> - Rename dts file from btt3-[012] to imx28-btt3-[012] to match
> >>>> current linux kernel naming convention
> >>>> - Remove 'wlf,wm8974' from compatible for codec@1a
> >>>>
> >>>> Changes for v3:
> >>>> - Keep alphabethical order for Makefile entries
> >>>>
> >>>> Changes for v4:
> >>>> - Change compatible for btt3 board (to 'lwn,imx28-btt3')
> >>>>
> >>>> Changes for v5:
> >>>> - Combine patch, which adds btt3-[012] with one adding board
> >>>> entry to fsl.yaml
> >>>>
> >>>> Changes for v6:
> >>>> - Make the patch series for adding entry in fsl.yaml and btt3
> >>>>
> >>>> Changes for v7:
> >>>> - Use "panel" property as suggested by the community
> >>>> - Use panel-timing to specify the display parameters
> >>>> - Update subject line with correct tags
> >>>>
> >>>> Changes for v8:
> >>>> - Use GPIO_ACTIVE_HIGH instead of '0'
> >>>> - Add the comment regarding mac address specification
> >>>> - Remove superfluous comment
> >>>> - Change wifi-en-pin node name
> >>>>
> >>>> Changes for v9:
> >>>> - Remove not used 'pm-ignore-notify'
> >>>> - Add display names for 'panel-dpi' compatible to avoid Schema
> >>>> warnings
> >>>>
> >>>> Changes for v10:
> >>>> - Drop new line with panel-timing definitions
> >>>> - Add new lines with 'sound' node
> >>>> - Change 'codec' to 'audio-codec'
> >>>> - Change order of properties for saif1 node =20
> >>> Are there any more comments regarding this patch? =20
> >> Sorry, i wasn't aware that you are waiting for reviews after Rob's
> >> request. =20
> > I did not received any mail from Rob's automated DTS test script, so
> > this is a good thing :-). =20
> I meant his comment to patch 2 V10. This patch "depends" on the
> binding.

Yes on patch 1.

> >
> >
> > Best regards,
> >
> > Lukasz Majewski
> >
> > --
> >
> > DENX Software Engineering GmbH,      Managing Director: Erika Unter
> > HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell,
> > Germany Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> > lukma@denx.de =20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/g3B9Qex0+pwrL7MIg=gQKwE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmcja9kACgkQAR8vZIA0
zr0mzgf8C+6D8Jl3ixvC1AXYJa1PyLIjhfmmi53I1Xl15NDAn3gCQlS1O9ECkLIf
yRoMrH2mfxq+s2R+bo9APQvVzRzO5r8E8/XFoMrMmiVxPFXBEwNvOPvZsCNup4ZM
SIDDl/MNhyOBX8ejc7vlmjvMfOGRdzGwvXUJIAmfEtqH3qufup/WWaMfs5uVgZzQ
jQfcLiaDqSfVBpt9Q0TvIxJurOfkyD41D2O4sOiJT0UQ5FvRbAbYLo104pUrTK45
LPBTeR8Xf3i3N9mPKgkAAxaGmMCj3sb3VGRclSlN9C/fz9TDVM7wDIvTgjdjslMI
6aRcdTRro/cKd0s2b3LkPWloO5y1Og==
=Fg8h
-----END PGP SIGNATURE-----

--Sig_/g3B9Qex0+pwrL7MIg=gQKwE--
