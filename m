Received: from mx-relay48-hz3.antispameurope.com (mx-relay48-hz3.antispameurope.com [94.100.134.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840B932D42A
	for <imx@lists.linux.dev>; Mon, 15 Dec 2025 07:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783941; cv=pass; b=sIfhgyLFbZWbtVgznNwjexBBuFpoZkffINtHTEB968p1uGmhzgLB1hFpPIZIH5o+0EASRre2gRL9hZxRh4//PZBVdi6kwjupyM6eDiguEyZnrJLe8yFng6ALO7pyWFX7iJJwLHk7AccIsZMKBo+UFuBWKhqPEww2C4syUmKB3Sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783941; c=relaxed/simple;
	bh=LxwfukKEtaEzF6hRFU4Ia46NIWYQyy6ZORVSfsThYJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W0Bn9x/S8roemmY00gaLz0apMUi+zHJKNozV71ahAs/yRLT9TRQ3HiusvnrrB1JJA5rj+fRLDKl59WSAI2AQLt19BH0Mlg+EwS2VGelDdNXoj60yZN+G/dTU03HSatEZjQLcMgSeF0JsOLds5vpQcqBUFrBIMooCyh4mlfdVI5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=UcHNd91P; arc=pass smtp.client-ip=94.100.134.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="UcHNd91P"
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=M/3NQ1ZFlz91mAO+kwIn+vkLcFkrkUM1n9uVSSYrHYk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765783918;
 b=AP6AnSdy/1hO1MUbABMtaChSiHo/Cq+yhN110+UAZeTfLmyp+XURf0zHeO7cam8dh9ptd0jM
 gp/cujQaht8YjC6xtVCzY3726vucy4/7XLM2T8MNmhSyNJgcY0o3nicu2b5EoBp76OnliWDfKjL
 p3pImRpemzzlWhgXNfdK/aurmM6/hhLeRU38I9q3DmVSRsH8ahtLUeZiAt+1LpIkk8t1IxqwiAP
 vwQ8dEfLRwOdAEM+7YfkPnLlsoAa9IvoJaDFexBN+5O181Zhwer//GIhMDs+W3TdhwVjyzF862R
 3JYOQ1qsplmbirZQxJBXjtP0wBAtN+qGFCv+FHshRnsuA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765783918;
 b=kRYybrU2WbWd/O3SCQTHf/oAl0eljbOzIFXVEuhn2xYzIvNi010SQgdz6qi2ifTN015mX3kV
 B0Ub+dz6Y+dDF5fzLv/fXq8TuuIB6XABJEbxcUshz8Ds/2fpWNyWEgYd/diSMKha6DtntrHF1CJ
 SM2G/6FOYVRoqHPWIJUfXGlq3/cspmmJJ4xw6h8O6tFBNGh0ykm4QxYElTbmH8ZB8aopWfoMpGq
 Eu0fCg0r6Rlri9Y0tlhqnzvGajvzOhJKVzyDq8xf2Vu9sW8hzwRMjyKJSY5Um8hoBo4bTZCK/i/
 2LxTQ4uvUoVYQfmKT+fSKTrJ4vJgEjlPFPvKTwkQNCUEw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Mon, 15 Dec 2025 08:31:58 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 55309220CD2;
	Mon, 15 Dec 2025 08:31:48 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/2] dt-bindings: power: fsl,imx-gpc: Document address-cells
Date: Mon, 15 Dec 2025 08:31:47 +0100
Message-ID: <12807757.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aTxKqPqGdiHllLo6@lizhi-Precision-Tower-5810>
References:
 <20251212085902.103507-1-alexander.stein@ew.tq-group.com>
 <aTxKqPqGdiHllLo6@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5957622.DvuYhMxLoT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4dVBZs00wwz1kNkWZ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:fbd490092935c18b4ac3a78bf74f2ef7
X-cloud-security:scantime:1.933
DKIM-Signature: a=rsa-sha256;
 bh=M/3NQ1ZFlz91mAO+kwIn+vkLcFkrkUM1n9uVSSYrHYk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765783918; v=1;
 b=UcHNd91P9/qFFTP8YtuzPz1pK4LsJhEOk/OOpPQLT7nSBcRsrcCjjUFrwiTfGm0jkTdi2Qam
 4T7CE0Vl9YhAxGhEDQZWZGjEK/I6dwUUujL+q1wJVFLecfJIRca/9ARZ1uotFm5wKHkP1rzycvY
 1/1vEUG3HG9ZOL4OowjZE3KgLI8IgOH7cZpWK5+j5VFKiWvNrMROqhMrdf4hdU89FPtOrVZ83/e
 81AgW8xJ0blLL9+XTv64HZEzgL516okYRyieDc5F8vD1sD3GqJinPoHoO8ypTTsS1a+Vi2wFSFJ
 ACN/EbPutTkX8cubh07C0+aUz9fzcPLwuoZzApfnAzcXw==

--nextPart5957622.DvuYhMxLoT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Date: Mon, 15 Dec 2025 08:31:47 +0100
Message-ID: <12807757.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aTxKqPqGdiHllLo6@lizhi-Precision-Tower-5810>
MIME-Version: 1.0

Hi,

Am Freitag, 12. Dezember 2025, 18:02:32 CET schrieb Frank Li:
> On Fri, Dec 12, 2025 at 09:58:59AM +0100, Alexander Stein wrote:
> > The GPC power controller is an interrupt controllers and can be referen=
ced
> > in interrupt-map properties, e.g. PCIe controller, thus the node should
> > have address-cells property.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> Strange, there are not #address-cells property for gic if there are not
> ITS node. gic is widely used.
>=20
> Does gic node also missed #address-cells?

Yes and no.
Yes: see commit faf183a02ed6b ("arm64: dts: imx8mp: Add default GIC address=
 cells")
No: AFAICS this is only necessary if an interrupt-controller is referenced
from within interrupt-map. But on imx6qdl.dtsi 'intc' (GIC) is not used tha=
t way.

Best regards,
Alexander

>=20
> Frank
>=20
> > ---
> >  Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml b=
/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
> > index 9de3fe73c1eb6..d49a5130b87c7 100644
> > --- a/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
> > +++ b/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
> > @@ -38,6 +38,9 @@ properties:
> >    reg:
> >      maxItems: 1
> >
> > +  "#address-cells":
> > +    const: 0
> > +
> >    interrupts:
> >      maxItems: 1
> >
> > --
> > 2.43.0
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart5957622.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmk/uWMACgkQaS+g2M0Z
/iVnFQgAtjzww7A+HPJWD5saX8fzUaqaTzrhRCNP2SsX9ckRMLEBGbKr6E63A/2c
Bu2V3Z5tl0ICUOp9Av2WYKt0OcBOUNTn/mkFDNimQmNEreAj/03AVtiSc9ttg3l2
1ceKi5iEoZk3F3ndOaPrYVvr1Nn3fdtnJzg+VAuAMi5oHLUrz5orL8MVSeH99xSZ
YvTZoMwnITg0+84bwfDykq84sszqZqnHQD9JiCJjElJOOyUvbdQshTU5BV3IGSPP
TGH/6eg0nxo47gT9auWk7VL8uVmYDVWvWf6C5hEAqwJ7WY8R7Gz78CFEuf4d8xzv
0i8/vBDEL3ye3nFT4lYFAje/rlLZbQ==
=oPa7
-----END PGP SIGNATURE-----

--nextPart5957622.DvuYhMxLoT--



