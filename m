Received: from mx-relay03-hz2.antispameurope.com (mx-relay03-hz2.antispameurope.com [83.246.65.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73D32EB5AF
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 08:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766134447; cv=pass; b=VAPi1ar/7I1GLw6UyG4Dgjm7D4O8dGEfApVyTQHI4ZYdIQplZuUQ/bxUQPCkhs8/bq4kUoz6nn4X7rws66dwvqza32r+0v5Z7hesZ9WS+Fa8JWsHu60IMcj5ptwPINeuZ8+5KQTJMtzVK9vH1R7UrYfJTl++2raJlnHZ5yRAhMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766134447; c=relaxed/simple;
	bh=7lPH8ZuwqrR0EPFMmGW3KMxzeLFRv6JnjvXAyllK02A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fnWDfuUBTc4uojHoOFECcd2V55maOUFPqTejlcvsXtidASiTX2lMhEEGzyy+5qK1DTsJU9nUPNGcySRthq1NcdFv7I9wAumXg6TLgmW3DHFzugb+PXhde4tK8HgQSNEXjLNdlO0Alm0ZQfztuNSh7iECMqTGM/Sp2Gcz0iAx2UU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ike06Yv+; arc=pass smtp.client-ip=83.246.65.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ike06Yv+"
ARC-Authentication-Results: i=1; mx-gate03-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=XlXr7igiWKsjjzIb+5AsG+BOhT+y2sXxD6hRFSbAez4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766134348;
 b=jYjRsXP9+ehunkoha9Mz6PhBGJzmPz6RjdVSLwr8y0MhQqDgkCg/xGJILCmi0ssIKTKWuXFD
 KT+zXq+5lF/SANGTWeLEYLBzWS3aNJn0cDrIjt3lnMqpd2a5WI7cYEWZVa9BB0uOXmbfkq4wfYv
 yGZiVmOybwfHe5o3SSXoQhlWpK5WhS6phYqC7H0rdBU4m3ake9R62a8DS5SyO7NswFWkQYZ7jDH
 UCLl8zGVU1V4lg3Kl7DfjwOqzqWPg6JMBtHE3YrER/xt6O0RP7cpnii5sFE3/QCnXFzQqSYSRGH
 pyJEnclEAeFhD97Ftd/UN5RheGqxi6zvXcO39oVDioCMg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766134348;
 b=mrbMBXAfk7GYElXGISRuJ+J/nlX9G/hFOYOBNLbMg/86IjDcKRhVclNfPCaVvJa8umtwi0Su
 nyn2i5BIDiJKosrhLStQkgXIypnXk1T6ghUgJnz5WWYPwP11z1b8cqL/fRYRO+dvxN9NdUUAsDA
 aBtpzqJ9hqW4v3pfutUhbsB4jDyZ3N332mM6qJI0Yj3l5oAULDkzaYmxB5iiWzGt9CfIgi8IDxZ
 qlVoppsySqVYSrNvZ60ALoyPamRyB/EMz8kwWOmdbAmbEdBCZYgM+KpRffi1JHDXYc3FcAO88Qr
 1bKhM/WQuGkwjyOiuWqT2dVT4Hx1Zwt6ZmOu0GqhXbauQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay03-hz2.antispameurope.com;
 Fri, 19 Dec 2025 09:52:28 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 4751A220D57;
	Fri, 19 Dec 2025 09:52:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 0/6] Support TQMa8QM
Date: Fri, 19 Dec 2025 09:52:15 +0100
Message-ID: <24355727.EfDdHjke4D@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <CAMuHMdUkghCNb96J38hbEZ8Jct6m2MPvnPumGp-y_dPfPW9eAg@mail.gmail.com>
References:
 <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <CAMuHMdUkghCNb96J38hbEZ8Jct6m2MPvnPumGp-y_dPfPW9eAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay03-hz2.antispameurope.com with 4dXh9s3M9TzYd7D
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:d9ceb68c40de01de860771274803b5bf
X-cloud-security:scantime:2.014
DKIM-Signature: a=rsa-sha256;
 bh=XlXr7igiWKsjjzIb+5AsG+BOhT+y2sXxD6hRFSbAez4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766134348; v=1;
 b=ike06Yv+blb8O/wWn3oULp47zb9fw1Sz9l2QmrZf4knmoJhx3N7VujfrexSwQYC17k7SoIVH
 nAuXmiWb3uA/phw4ESNfj9ydUe3Z03o4akebPMOf4GrEwdAvEep7QodWOzAwHMcwGXWQwsBniDW
 6nvJUR67DuIMqCAw82Tgz9BMknPFwkitpnvecyFewUUgzcEujFkBn+jjXkRRnQGCPYQ+PH2/6fR
 iJSVZX+wciqB6LQhs3XrGmU1rOpkBFNcMTJMek5llJEYsiw45mmzxqCm/A2Wr8rENRoxz5I7niv
 7YaW4GvjESbtlsjPWWZmx8urWfy5uNBt3DIK2+d11C/cA==

Am Donnerstag, 18. Dezember 2025, 16:28:39 CET schrieb Geert Uytterhoeven:
> Hi Alexander,
>=20
> On Thu, 18 Dec 2025 at 16:22, Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> > this series adds support for TQ's TQMa8QM. The first 3 patches are prep=
atory:
> > 1. Add support for clock-output-names for clk-renesas-pcie. This is nec=
essary
> > as clk-imx8qxp-lpcg.c (driver for phyx1 phyx2 clock gating) reqiures th=
at
> > property on the parent clock.
>=20
> Hmm, clock consumers should have no business with the names used by
> clock providers, even less so whether those names are specified in DT
> or not.

Well drivers/clk/imx/clk-imx8qxp-lpcg.c does exactly this. AFAIK not just
the ones references in DT, but also hard codes ones.

The root cause is that clock-hsio-refa and clock-hsio-refb in
arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi are setting platform-specif=
ic
GPIOs in SoC .dtsi...

My current idea is to use fixed-factor-clock instead:

> &hsio_refa_clk {
> 	compatible =3D "fixed-factor-clock";
> 	clocks =3D <&pcieclk 0>;
> 	clock-div =3D <1>;
> 	clock-mult =3D <1>;
> 	/delete-property/ enable-gpios;
> };
>=20
> &hsio_refb_clk {
> 	compatible =3D "fixed-factor-clock";
> 	clocks =3D <&pcieclk 0>;
> 	clock-div =3D <1>;
> 	clock-mult =3D <1>;
> 	/delete-property/ enable-gpios;
> };

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


