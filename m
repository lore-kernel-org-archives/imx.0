Received: from mx-relay100-hz2.antispameurope.com (mx-relay100-hz2.antispameurope.com [94.100.136.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351B92BEC55
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 07:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765870272; cv=pass; b=nckZrk75/RTgyBZNJj/ls/ndq+0OzMJTawXkPshyKe6xMk07zjKgRezBdvotTeoNtZb8HUSXygcJ+1/UKALI5YhQtqFsJnrE5qgd0k+O6vkWtWr6EroqGRFNkDlLy7kAjEv/yVjuZjFwk4mlG/Vu2BYmm3jdk9g6/Pblzn+1DLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765870272; c=relaxed/simple;
	bh=p0SwWhsPnYB5QVMPW4Gk+n+l4avtLhr+WAXnjOMOQDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzO9tAk8ZICJKU86PzoWyrSC+spLdZUwsJFiceOqcaOL5lmxrY6/J5AFKpyE2MrOqOYsFbTfwwejvOqAQviGAnl/Vpb/NWCpM8gwAqIFOTSKoAfB6AZVyZjN6a29YecnPm281OHJ2ZYJKCbdF5w7gse3u3QsJQsLp5SS+La8hW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=CJIFgXxv; arc=pass smtp.client-ip=94.100.136.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="CJIFgXxv"
ARC-Authentication-Results: i=1; mx-gate100-hz2.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=2pyJv45tDjDKywJWeYp3I9ulqUEPqCbg6pglbJWo3s8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765870187;
 b=sPqBrVAGEZlzKBkoIwzTXJ0GCb3jRzJO+6CROrztvqGnaESk+aTITboZLGEDsttJI43SOZDK
 ic0OqvauBsTYK0k0DGHcW82Z3Wvy7CcCTnyJ8lWVfX5BE3pb8iXdYaCOp5/k7kjqHjkPqgqXSvk
 e7POcHtjKkq+stlkbRSsEWh6Za3e7SbehBumXvZblArCZCt1104ccy9tP/u79XJk1dNswFY3C2A
 Pk3e5QRKjWmt1A8NXBuLld+R7VWhveSgFVRCeWu/TZjTJQ3b40anePiNEStM7SC7fEhXNEUvcn0
 QW6i7EfkVB+yfsixGmHI7F8mUcr8xDxHLDTZwKgS3+8Cg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765870187;
 b=TMG5cMlziN52IU5hdafA5aBFIdHZhyalFlkzfr5j4FXlYraaecyU5EcFbL9F62PYpKi1i9ox
 ATjVkWgkuaUudDnaIclQqi8C4N6gA72juPj8cWd/4RP+Mdo+sSIryLndYcZlbsUpBnR78aeRqI3
 dcitBUG9s9sC8IKKVUcnLTkk9PUqKKT+J2qonFSpeueTcU/APYIztGn25T0xl6mAE+fFQic39zc
 LpRXsKaM1DPJtbso+9UGdFlLpxyzL+2/OFaZ8uloNjTsF/5LOaycx0oK7iZ0HVTg9LZG+r2N56L
 qRhTfTNR5nc4y0e6YuT8vLDsTCRZDZPO4N+M3+Dfjb1Qw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay100-hz2.antispameurope.com;
 Tue, 16 Dec 2025 08:29:47 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 61240CC0DC8;
	Tue, 16 Dec 2025 08:29:32 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Marco Felsch <m.felsch@pengutronix.de>
Subject:
 Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode
 to schema and example
Date: Tue, 16 Dec 2025 08:29:31 +0100
Message-ID: <3210190.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251215175436.wwlgzxionq55zu27@pengutronix.de>
References:
 <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <705773fc-5aba-4bff-b05e-272e1cd0262c@nxp.com>
 <20251215175436.wwlgzxionq55zu27@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart13198926.O9o76ZdvQC";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay100-hz2.antispameurope.com with 4dVpTn4rt4z3PJZL
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:7843bfe7f806661645c9883349bcb132
X-cloud-security:scantime:2.036
DKIM-Signature: a=rsa-sha256;
 bh=2pyJv45tDjDKywJWeYp3I9ulqUEPqCbg6pglbJWo3s8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765870187; v=1;
 b=CJIFgXxvAXP2DLs8EeBcrXanL3hXPn3EyoC1+Ylys+4bLKdMC76s3PFgoXDni7uzcz0k7UGh
 0fOUUGFyA3rXy53IdrPZSC6zhrg448IaVOvBiKMuriyRoX5V6Bdt8I0o4nCZQn8MKI/+qv2ozSV
 67TKZ4CW59Issb6+broLrGOl/SvzXdW230uEUmQjtZmxJ55TD+LF8wFar3Q246akaNaqhAbigpj
 Q2IaHBlxwP78+1ZzqHU/+RpwXdpBJBj/7Dt29k/fpyme0yy1KavbsnOaL870NQ455wDHs79RW5a
 QUUeR03+groFOtotX+NDVdVTONsN/ZMNLq2qGZ/4CiBsQ==

--nextPart13198926.O9o76ZdvQC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Date: Tue, 16 Dec 2025 08:29:31 +0100
Message-ID: <3210190.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251215175436.wwlgzxionq55zu27@pengutronix.de>
MIME-Version: 1.0

Hi,

Am Montag, 15. Dezember 2025, 18:54:36 CET schrieb Marco Felsch:
> Hi Liu,
>=20
> sorry I didn't fully answer you please see below.
>=20
> On 25-12-08, Liu Ying wrote:
> > Hi Marco,
> >=20
> > On 12/02/2025, Marco Felsch wrote:
> > > From: Liu Ying <victor.liu@nxp.com>
> > >=20
> > > i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> > > configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> > > field. Document the Parallel Display Format Configuration(PDFC) subno=
de
> > > and add the subnode to example.
> > >=20
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > [m.felsch@pengutronix.de: port to v6.18-rc1]
> > > [m.felsch@pengutronix.de: add bus-width]
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 92 ++++++++++++=
++++++++++
> > >  1 file changed, 92 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-medi=
a-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media=
=2Dblk-ctrl.yaml
> > > index 34aea58094e55365a2f9c86092f637e533f954ff..6e2d86d9341c75108b492=
bcbabc8a560d8e707cd 100644
> > > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-c=
trl.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-c=
trl.yaml
> > > @@ -26,6 +26,12 @@ properties:
> > >    reg:
> > >      maxItems: 1
>=20
> ...
>=20
> > > +            properties:
> > > +              endpoint:
> > > +                $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > +                unevaluatedProperties: false
> > > +
> > > +                properties:
> > > +                  bus-width:
> >=20
> > In v1-v5, I thought the output bus format can be determined by the sink
> > device(a panel or a bridge) hence properties like bus-width were not ne=
eded.
> > But, if this property is really needed, then reference video-interfaces=
=2Eyaml
> > since bus-width is documented there.  Should we reference bus-type defi=
ned
> > in video-interfaces.yaml too?
>=20
> You're right, the bus-width should be determined by the connected panel.
> But there are cases where a 24-bit panel is connected but only the lower
> 18-bits are muxed. I added the bus-width property to handle this case.
> In the end most users don't have to specify this since the correct
> bus-width is coming from the panel bus-fmt.
>=20
> > > +                    enum: [ 16, 18, 24 ]
> >=20
> > The PARALLEL_DISP_FORMAT field of DISPLAY_MUX register says this IP sup=
ports
> > below formats.  It seems that the enum here may tell RGB888, RGB666 and=
 RGB565.
> > How can we tell RGB555, YCbCr 24 bits and YUV444 then?
> >=20
> > 000b RGB888 -> RGB888
> > 001b RGB888 -> RGB666
> > 010b RGB565 -> RGB565
> > 011b RGB555 -> RGB555
> > 100b YUV -> YCbCr 24 bits
> > 101b YUV -> YUV444
>=20
> This enum is about the physical bus width. RGB565 =3D=3D 16-bit, YUV =3D=
=3D
> 24-bit.
>=20
> That said, I don't think that you need to specify the bus-fmt since this
> is coming from the panel. As said above, my itension with the bus-width
> property is to provide integrators (dts-writers) a possibility to limit
> the physical available bus width.

Mh, isn't [1] exactly about this? Not sure about the outcome at that time.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20250304101530.969920-1-victor.liu@nxp.com/

> [snip]
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart13198926.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmlBClsACgkQaS+g2M0Z
/iVQ0Qf8CUXPNQgjvninNpUlo9wHMSxcj70F/nwY4xnJ9mAHPkIcrl+Ye0RpxJvm
HUghMQJsn8g5oW1mw3ihaOEFFyjI2Nmpn839jZzyuWZFCzy+6ZArWMnhjAmU3EK8
axvxjC6n5kJ2/Dx3wih+X2Ub6IbwNIB01Xq368832yntOGHje3ucsFLNNV8RXaNH
PRwXcgrJ0fSDoEZPC1Eh59z+2sRZbA8rdLxHP+tqq71jwpBaTJUCZDSUfO1ZgFy7
LeiQPAchQ1p/gqgo9xvkM5pISy7hj0p/f1jRTroTT1VfHKsp4LDxb71VE/S+IKQU
dYOr28lQ8IOXSDJuSIAYKAynFx8akw==
=c8lD
-----END PGP SIGNATURE-----

--nextPart13198926.O9o76ZdvQC--



