Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798C431354F
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 13:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770815259; cv=pass; b=DADRK6f0jz3vqOxzEsRqGTGAWXLYS6C5oNoegKfoXhsbkx47F8DQlIIXMp+IowKnCjJJ/I6aYpgWZ/Vmj5iPHX2jLhyR602+zicyiJoBmh/1HNx7uijd15NbAakZ4KWIM4Ipkbe0Zz1rzNCo3cyaXn7JZZS4c3zk+/v6UVFSDOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770815259; c=relaxed/simple;
	bh=3u7qEwIxFefCD9RIT8ZzGZntXAn+E3x5kO1a/WDdBuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l7tbuRLNBEv2VNIGHQXr9Ir47/RqmWGRg0ccNaxrCFkZLWbCYiNtAZN5j+kSYoXsXz9soCz/QYm3JrXDsN0JU9/EHnlP9EQzRBIGmBZKIux3D4Bw4PqttO8WCE+rkVo4UIH7qKGl1kjhBIf2S/s1AWeF3yBqHFENFUa0j6t7c1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=EkBkqv8I; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="EkBkqv8I"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=e3x2+YwwuhZsQSW5fmO01fXaVVeUQQTpRkaPQngxDXs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770815217;
 b=l2gxhEZ0uqQumA+hyoJo1HHANbVdMybdSYvZcqkQYPxL6BpV2e+bsuCeOSpXlQJWqvstmFTP
 68KB1NnYCiGmAG1rSxIA0HsAFGth6f5zP8dDUqj8XHGKl6Mj1w/Dfwtq6xu44xW9amUj8DRkGJP
 f2ALdoVH0J4kInfiPts/09SV3uohExConwUql3ZQP8/e4Z4Tz+2LOBNhR739CM2sPnWYbM8ah8m
 R/pzPKY2A8TgavF7iOqAK42mC6IMbks091ijHVz1WvLsuYVyRKFlBLHFwyCtVCDb7wNvKVWmCkl
 30GnWwOXwgr83VllloJTBMhV+5DFjMWZr6HwgCHPqlWDw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770815217;
 b=EzVBAA3Ma7b3Vnwg+fYoxiN3Z5o7TCUep1Ove8ZavqROFseCzlABmPPhuKb3lxZNoqNlfjH3
 dfIGgT16Bd6E+XgzZRaiUryP4c4r0J/XMQ1cZk36WZKQpK+Admso/HIRBaOk5ik4m7nzAieKzrP
 k3T3bfWiQ9kuDirb/W+VTihLiqyGLA+caR7KRFW2eU7CNK3/sKZ+6rNs9zhDI3W1z0sCaWIyCDq
 v1yeupopgFNWbfE/iqjudkkeds3qdu85EGXZ1E6VFOAzXlBdw0ZMJJJ/GzGPXcfLl/zQ+OIltQh
 TWo4Jex7YUrkgTSJ/i3h7U9X6eWgF8UFtdp+KGbsE0NfQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Wed, 11 Feb 2026 14:06:57 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6C818CC0D37;
	Wed, 11 Feb 2026 14:06:42 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marex@denx.de>, Frank Li <Frank.Li@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Subject:
 Re: [PATCH v2 4/5] arm64: dts: freescale: add initial device tree for TQMa8x
Date: Wed, 11 Feb 2026 14:06:42 +0100
Message-ID: <3404121.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260211-futuristic-venomous-poodle-3b2708-mkl@pengutronix.de>
References:
 <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
 <20260211123436.1077513-5-alexander.stein@ew.tq-group.com>
 <20260211-futuristic-venomous-poodle-3b2708-mkl@pengutronix.de>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4f9zGW4Rtgz3ycCd
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:6e6ea929ed061832352f734018e4b891
X-cloud-security:scantime:1.997
DKIM-Signature: a=rsa-sha256;
 bh=e3x2+YwwuhZsQSW5fmO01fXaVVeUQQTpRkaPQngxDXs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770815217; v=1;
 b=EkBkqv8IAy6eZiJJGcW4CVStp6xoWAkeji0iU96xed2Q9pUZVIb8o2KsrvsBjdsSbkOaOXnj
 3BjasnuwwZp0NG/VLobLOrMEES1mD03XueNZv6qeVYHY4kfcjCQWuYbA6EAMZdkqoU7u2huefAz
 +0IAS6rk8rc59HqF1AyXNc/du5sCC34qaBm/qbxf4+V7hO9PwzTp+/QhuPKjjxaVp2HEw8oaeF/
 oygAfgnaCClbFeS9Baow0gSTSrk0NkBd3mCTJarPoAUxXlxhSQF9v3PjxVG2m2JHPDhTezya8cB
 iklnOi8k7ddGeu4Og10O4RSf7AUOfNbHVVjWXLqJjSu3Q==

Am Mittwoch, 11. Februar 2026, 13:43:17 CET schrieb Marc Kleine-Budde:
> On 11.02.2026 13:34:31, Alexander Stein wrote:
> > +&flexcan1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_flexcan1>;
> > +	xceiver-supply =3D <&reg_mba8x_v3v3>;
>         ^^^^^^^^^^^^^^
> > +	status =3D "okay";
> > +};
> > +
> > +&flexcan2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_flexcan2>;
> > +	xceiver-supply =3D <&reg_mba8x_v3v3>;
>         ^^^^^^^^^^^^^^
> > +	status =3D "okay";
> > +};
>=20
> Can you use the PHY binding instead, see:
>=20
> | https://elixir.bootlin.com/linux/v6.18.6/source/arch/arm64/boot/dts/fre=
escale/imx8mp-tx8p-ml81-moduline-display-106.dts#L180

Mh, this doesn't seem to be necessary at all. It's an allways-on fixed
regulator anyway. I guess this is carried over all the time to silence
a warning regarding dummy regulator.

Will drop in v3.

Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


