Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79349448D14;
	Tue, 14 Jul 2026 12:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032656; cv=none; b=YxiDDuAkx0F/AXKuldZ1YR20XqZdsIA+XfmLp/jQfOEF/idVkhLERBNACdNIj0fvNGK6pr/7Pas46iYAZHkTbHbZHo85RSwh4CeDaWJ3Juo/+zoAmBvEYimda7jFE0A6BE7k4imtjg+wwhW6dWD43IPytXVhr8naZzsgjkMFT4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032656; c=relaxed/simple;
	bh=RAfh/PzupwWnD+3cauiv6r8CFHSLK8xZ7xKOz5WJXPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tsonMv8+siwHiW/qkSUKCqVnJy4Ujo9YGqKdOF9QEMLBvBw5E8Q95HVL9QURknKP65aWZZqtvd2ACdmZziuowQfVNYoxPn2QoFO8srTwVmDgVPcTgWwr+lxqgFwUdxAjztweu0xrVbNrEZYEI6+PVr87/6HD8mI9kPellDG08oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=OksRTZVd; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="OksRTZVd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=RAfh/PzupwWnD+3cauiv6r8CFHSLK8xZ7xKOz5WJXPA=; b=OksRTZVdjiKJjUiNnWiOcaZqHC
	Ij5+zXHSfVUo+51wTnST6aiirB3z0PSAVnpRDYQSJfSj+flzitFvVWVPPtpNGNlp+xIQd3m1CN8GP
	i98RfJECcb5cVLcmsLUlleKCkRXDT7cBLZCOVFEIIgfO4bQhhGcAZ78Z4ENrO9F3/rmVctILpVKaF
	Abf5IrQamVjChCmQCMr79jdO315+kNgvjSwZRTsPSRPXdF+/g5+Uk/qC3hmrNUGnCzcIW8gcsYZEg
	O6shwVWXb1We0+o3Lw94XE1tHKH0rZAJXY1e0XoFzM8O45d0Bh2NBXMCDWxI5URh/adwz6Bl9xUPb
	q6ecBK+A==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjcO9-0003sZ-18;
	Tue, 14 Jul 2026 14:37:29 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjcO8-0009Wh-0k;
	Tue, 14 Jul 2026 14:37:28 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-arm-kernel@lists.infradead.org,
 Francesco Dolcini <francesco@dolcini.it>, Frieder Schrempf <frieder@fris.de>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 10/10] arm64: dts: imx93-kontron: Enable ELE firmware driver
Date: Tue, 14 Jul 2026 14:37:27 +0200
Message-ID: <3056369.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260714123350.GD22086@francesco-nb>
References:
 <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <2420855.ElGaqSPkdT@steina-w> <20260714123350.GD22086@francesco-nb>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3424428.aeNJFYEL58";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28060/Tue Jul 14 08:25:07 2026)

--nextPart3424428.aeNJFYEL58
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Francesco Dolcini <francesco@dolcini.it>
Date: Tue, 14 Jul 2026 14:37:27 +0200
Message-ID: <3056369.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260714123350.GD22086@francesco-nb>
MIME-Version: 1.0

Am Dienstag, 14. Juli 2026, 14:33:50 CEST schrieb Francesco Dolcini:
> On Tue, Jul 14, 2026 at 02:06:38PM +0200, Alexander Stein wrote:
> > Am Dienstag, 14. Juli 2026, 11:33:54 CEST schrieb Francesco Dolcini:
> > > On Tue, Jul 14, 2026 at 10:43:56AM +0200, Frieder Schrempf wrote:
> > > > On 14.07.26 10:32, Francesco Dolcini wrote:
> > > > > On Tue, Jul 14, 2026 at 10:09:11AM +0200, Frieder Schrempf wrote:
> > > > >> Hi Francesco,
> > > > >>
> > > > >> On 14.07.26 08:59, Francesco Dolcini wrote:
> > > > >>> Hello Frieder,
> > > > >>>
> > > > >>> On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrot=
e:
> > > > >>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> > > > >>>>
> > > > >>>> Add the ELE firmware API node and pass its handle to the OCOTP
> > > > >>>> driver. This allows us to gain read/write access to the OTP fu=
ses.
> > > > >>>
> > > > >>> This seems something we should have in the soc dtsi (imx93/imx9=
1), it
> > > > >>> does not seems board specific.
> > > > >>
> > > > >> My original intention was to move as much as possible into the S=
oC dtsi.
> > > > >> The problem is that the memory node is somewhat board specific d=
ue to
> > > > >> the DDR. And I can't move the firmware node into the SoC dtsi an=
d assign
> > > > >> the memory node in the board dts as the checks for all boards not
> > > > >> specifying a memory node would fail then.
> > > > >=20
> > > > > What is the reason to have this memory address different on vario=
us
> > > > > boards? Can we have a default in the soc dtsi, and allow the boar=
d to
> > > > > override the address if needed?
> > > >=20
> > > > There is no real point in having different addresses on different
> > > > boards. But the node describes memory that is physically on the boa=
rd
> > > > and not on the SoC. And I think that is why DT maintainers want to =
have
> > > > it in the board DT. It's the same with the memory nodes for the
> > > > remoteproc drivers to communicate with the Cortex M-Cores in the i.=
MX.
> > > > But maybe I'm wrong and if there is a possibility to move this to t=
he
> > > > SoC DT I will definitely take it.
> >=20
> > We are talking about reserved memory, so this is highly board-specific.
> > So for different hardware variants with different amount of RAM you hav=
e to
> > go for the minimum anyway.
> >=20
> > > > >=20
> > > > > Or can't you add the address in all the boards, and keep everythi=
ng else
> > > > > in the soc dtsi?
> > > > This could be a possible way, yes. In that case maybe we could even
> > > > create a generic dtsi to contain such defaults for all boards.
> > >=20
> > > I would go for this solution, we could have something like
> > > `k3-am62-ti-ipc-firmware.dtsi`, include it from all the boards, have a
> > > sane default memory address, and have an easy way to override the mem=
ory
> > > address from the board dts, if needed.
> >=20
> > So what is a sane default? At the end of the minimal possible RAM?
> > I'm not really fond of something you have to make sure matches to your
> > hardware, but won't raise an error if you forgot.
> >=20
> > How about providing defaults for the SoC part and users have to provide=
 their
> > memory on board-level? Similar to the VPU nodes on imx8qm/imx8qxp. Ther=
e you
> > have to specify memory-region in your board.
>=20
> I am personally ok with both solution.
>=20
> I think it is easy to have a sane default in this case. You cannot have
> less than 256MiB in practice, and this is just about the offset, is not
> that you are going to want more memory reserved if the board has more
> memory available.
>=20
> At the same time, having the memory range in the board dts is also ok to
> me.

I'm just saying, because we had lots of problem with assumed offsets/length
in code/DT for NXP boards. They usually come with big/huge amount of RAM.
This breaks for all hardware using a small amount of RAM.
So it's better to not have a default than silently breaking things because
the default doesn't match.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart3424428.aeNJFYEL58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmpWLYcACgkQaS+g2M0Z
/iWINAf/TAzAwTQA+zKmdhL5w9TllXM6GKTvgTinOPm+2fkvr9SXHxClh6uLoloB
Ox0kLVveoy4uOLMZFeYU3XC+DK4bAnFskikhXJobAk6M0iOOxCWEWmqVwS9iggTS
TS+iedIl3I2MKKoTFRAbBgomA3B/SCvHQa9It040eB6Sngif+GaHOXZAiKQV1qVO
a/VbmJ05D6hHAGv3hRGGyZw5x8+IT5AVI3QazV3+yFJ1tUtCH6RUTEN7J3wT25dA
Un0UIhpBXI9r53gkrJdE6Hm8gosLEjvBY7T65CYbhvoping7DAxqzUEK4yclyGkG
yVNLMfvuBcYtRr6u5yQR0D/6j2weZw==
=WgXO
-----END PGP SIGNATURE-----

--nextPart3424428.aeNJFYEL58--



