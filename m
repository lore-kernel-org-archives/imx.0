Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702BC2EA156
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 08:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766134586; cv=pass; b=euzMAAV0T1r7OpY9ynTwlR7WVdDBFPTgGb+yRRIy/Ql4ISlxIaPA7ift65Vpt+fjlsfsiys3US2Ro8RoLx/2RAH/suAydss5Ag5tR1hrekk84xnbdlZX2OVxcR3oILhQIN7lEI1CoxZN3BjbGmvhCxI4kO10IfRqwQ3NREL0/v8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766134586; c=relaxed/simple;
	bh=p3q8028oGlh4nUIcsvZ5k6M9thwqXIeyBKTiW1fadvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NExtCGsOLqG+inlswXOBA4pB+QJhx+1puEvoriVeWLI4UztGs+qL0qLSCS0X2pxo4O0SU2UYTzyP1eQDOEzdqOq4reBOpJvqlQKW/wYslWp7ncpj18chVJR9CluVOh+5kqO8EaDar9a8easiVbkME24oDJBO3MOR5Ji1PwcFf9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=QwQ2Hd7F; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="QwQ2Hd7F"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Lj43oXTOV6UJEnGkyony8860gGIeke9NpD8hIRJrkD4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766134546;
 b=iGhGu0SXvgdHEQzAz0rVBAq8g9wlhCRUjOWMt3yAzkpKaH3mWrQC9oUEHeQFWV5Ggq1u+1DA
 JtJ6kePNpHwlVNur2Q/ARCO9zlSMfy3/CgG0ACYPMtKVCvHN6U+yixBRbxS5ln6RE0FG8fjwzQi
 daXARWaZIx2LbVjS1zcn5r5HKNuye9Vn4ZfwlC9JKgrTickGitOYMbLPCkTh1WQy5wlJ1clVESO
 u7LNjl+6+FfelphNjKcX0bVjbziwxDJ02Lb1WUq8ChBCNEQopqMlGl+8sVz37R1FCg1jOcUVAsV
 jHFv4S/ozVIXsWSI60waI2tgoixWiwZ54bq8l9wYghWNQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766134546;
 b=Bf8+UAs6ixDJ9si4mY4syfzjAleA2/6dqTF7x1p6liP9HAo13d3670QsEQ2pY+jHzriqusiw
 bYYS8z0qI9xmtgks6hNH9/dRsO9zu3VSBtnA5juWLsmO7neqohbEJrsnkNg5B5lxGCas8d7u+Ei
 jksSPSujRr62qv75jREnPP8k881VRU5Dz7HexzlR+gnaWFJS8CnFATQe1eGKuVQO4HN/1OkzBzG
 lH7B6tHj9TBBY0kDOWOAnFbC+WO6nDp28NAWxTjYZ7sUqncbn2fmbRPxIRbFGLhNUqxkGcfzrTN
 MElTBkXxJNbx3bhDo0Hx97JuTuBu6yhGQJbg9cdTzclnw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Fri, 19 Dec 2025 09:55:46 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D2D14A4134F;
	Fri, 19 Dec 2025 09:55:32 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-usb@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject:
 Re: [PATCH 2/6] dt-bindings: usb: cdns,usb3: support USB devices in DT
Date: Fri, 19 Dec 2025 09:55:31 +0100
Message-ID: <4732491.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251218152058.1521806-3-alexander.stein@ew.tq-group.com>
References:
 <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218152058.1521806-3-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7530110.MhkbZ0Pkbq";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4dXhFf09TXz4MPFj
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:fc1b38920f4cdcdd93076212dbcb4bf0
X-cloud-security:scantime:2.397
DKIM-Signature: a=rsa-sha256;
 bh=Lj43oXTOV6UJEnGkyony8860gGIeke9NpD8hIRJrkD4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766134546; v=1;
 b=QwQ2Hd7FGBWrc4JlcV+85DbjHTZAle4H+KazVc6LsEHkCvEY/QIYJeAnTOiy5+DJySz6bumc
 hpEZfjB+r9sTPUm1npQnHXPeyqyAxJVLsgkeTaujcFSWOrexd2vjqNlOK/BAFXBwyEu5OBl8fy2
 voQKUvn3OWqoazt3NIdouWcc1BZJbapqg8iA5ob8ArGHI2sgCjKhWJ/6g2skIz2VqELQRuQvPRQ
 GdGHF8IzsKNnfyY/4UyJI4By/hpbfsDVuK96o0QcsJ0SYu+SRLedxw/HRyUUZ4OD7CCfa88De9c
 XTZ5jOpAOKz46lE34oMnaE8KiAjvj4N99tKXpGPzrGShg==

--nextPart7530110.MhkbZ0Pkbq
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Fri, 19 Dec 2025 09:55:31 +0100
Message-ID: <4732491.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0

Am Donnerstag, 18. Dezember 2025, 16:20:49 CET schrieb Alexander Stein:
> Reference usb-hxci.yaml in host mode in order to support on-board USB
> hubs.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Docum=
entation/devicetree/bindings/usb/cdns,usb3.yaml
> index f454ddd9bbaa6..1f7f0adc3b1ed 100644
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> @@ -85,6 +85,17 @@ required:
> =20
>  allOf:
>    - $ref: usb-drd.yaml#
> +  - if:
> +      properties:
> +        dr_mode:
> +          const: peripheral
> +
> +      required:
> +        - dr_mode
> +    then:
> +      $ref: usb.yaml#
> +    else:
> +      $ref: usb-xhci.yaml#
> =20
>  unevaluatedProperties: false
> =20
>=20

This one is actually independent of the rest in this series and can be
picked on it's own, especially as I won't be able to work on the board
support until February. I just wanted to give some context / usage.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart7530110.MhkbZ0Pkbq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmlFEwMACgkQaS+g2M0Z
/iUbXAgAhl79VULQpYWRy4jkIxMY+8oVkk+teNBcCC5xgQy+udpq222+0AUAuHMt
bTeVvx5CZg4BTRrKkhWp+8uESiqCMmddsGZU/5VYApPaiymyWDQGJqx2JbmpJbWU
2bYnSnvzY5pT3ETFlIpmxDchfAqhj/m961P82Tz+fqPDd/PQQvYdrntnp45JUwyo
2JisUxSCi/K+hBveATGMjO2hB5rQGhSccTOiE5VBa7PuEo7Jh8nHl0HRtEabNAUK
QdC+6TE2aj7V4Xq+sCzGNDgMkFPRV2W9gndo6NslrDR9o7QJOzNuk+pMCtVpeAMv
yBGSEMscs3ucjqkcdiJF97ui1BcEHw==
=tHiP
-----END PGP SIGNATURE-----

--nextPart7530110.MhkbZ0Pkbq--



