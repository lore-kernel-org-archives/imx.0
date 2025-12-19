Received: from mx-relay122-hz1.antispameurope.com (mx-relay122-hz1.antispameurope.com [94.100.132.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DC5225775
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766134627; cv=pass; b=RaPVhApti+2dXxCCfRbyY+ASsVlBByeVvLIKmZbJeUJrmgxHvBgu6UbB+UGpivWVlllgCZLCJLYg/4cRrLPqvVTmV/MlBGZ0miHKKJl5OeNzr8lo9s+M0VdC0k0oobYyAsqxToFHzBcgoPbDs50WENXdqozqAun4liEQpsagytk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766134627; c=relaxed/simple;
	bh=BDiH1mpKIlJOp3ZxWBeYxiYLVyM0lqkiGH2JKubyH6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fs19IYSfakpDzd3A+hDnMFC/raW+U9Iose1W+gUYuL4Vp/exmLeGIq76+4QlUee38omdt+LLljfOrAynIfMsbKjV7s52SByfMJw9oopMRlDVehAjUh0rAnkqFuA6/I7cAhJjtcW4GTvHsy5ttuP1HxMfqngDsEQl8o0waMYGVG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=In/6TD1A; arc=pass smtp.client-ip=94.100.132.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="In/6TD1A"
ARC-Authentication-Results: i=1; mx-gate122-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=W8AHnpnpM3XjqYhTIhCiVYGeLezuM8A5xZRbfy0K3Bs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766134552;
 b=jNi4Qg8eLwz45e6/k/mZRdWjvpq5xPnT5eS8/x9MsoBIRxPK9/WfKGPe0usp8v+MJ2x7IL0b
 fNxLtXR0WiDTIWST/HwdzMQOEwHX1djy8+7S+rdgJzWaMH4Lmua4AqJDQk46jkjWClxv9ipVp+4
 SS35jAPGdQfZb4X3uF4PgGNRhXQyrL/dNB0TbQvBUNdNOlNDvc0avg/+EigdciD+sTgHYBtDVg9
 FF1Io/hBXcYnsz+abRBu2hIz16Fokzu8YdwdqTn4FvSYrgBs96myYgeVGn8ks9aXi3WTvvqqGr7
 jqHfSWelArCnf+cg1ln+3cbtC2Xpa3kp67NMe3B2a8udg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766134552;
 b=IUK1JuFmXBBqse6G5iSScwVS7FUOVVrAQUkIXXhFwUonyKf868a9xuo32Aix5KvkHhrOHtsr
 WeN3gMfNCbgcWfhEHg0iX+OKyExCiE7Go+XYDvfpAI7BqCf4izpxzzy+JQu7TLlXQc0LfD89hsJ
 CelJrBJyfv0CeWqVvIEYzo0Uhasfw0l8IPBgaoJdPUChKUP00UkpLr1OZTbfktZis6EBC/YrtVR
 8qcg4zcAo36xCuBLwNjqe81TLObTGdn+hZwEEMZwXp7JfyPXATKxzGLzByzWxCZjkN8bzJGzgiH
 ytnOKaRxivPjnNdUl5udusEob71biUj6zOFG9hLeE8fnA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay122-hz1.antispameurope.com;
 Fri, 19 Dec 2025 09:55:52 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6FEDAA4140A;
	Fri, 19 Dec 2025 09:55:39 +0100 (CET)
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
Subject: Re: [PATCH 3/6] arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
Date: Fri, 19 Dec 2025 09:55:38 +0100
Message-ID: <10076440.NyiUUSuA9g@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251218152058.1521806-4-alexander.stein@ew.tq-group.com>
References:
 <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218152058.1521806-4-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3460692.usQuhbGJ8B";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay122-hz1.antispameurope.com with 4dXhFm4fp5z34Lby
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:0c47e991cdd1e2cd38041c89430f069c
X-cloud-security:scantime:2.240
DKIM-Signature: a=rsa-sha256;
 bh=W8AHnpnpM3XjqYhTIhCiVYGeLezuM8A5xZRbfy0K3Bs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766134551; v=1;
 b=In/6TD1AhLKG/fPPEAsNaDpZJakcc+M+NLxhi5hKzblY0v+r2BjZweet/8ywbwmJicxpsaUz
 alsSNBp+WANptFxsY3giKQA5b4zjalx8Cwyh8+V7Mx+p1Hk/Bo9ynkEzp48SaiSjxylIso1CUbd
 9rwVgdaoLN/cszouGt7pZgdsB0Mq6afLzWlvc3KoYN8hhIoZpTfRHd55aKbVl7/PTAad2PJW71v
 zhzByvIh3RynvyR4m4iqBVriFvAom1BchILBifxoVwAv7cP789OHAu9uffHdzeVgx4f6KFhuyC5
 t3ORt6O+GBQ1qddt/YDBgpyjG4vMvBNIBFb9x/qGuPJNg==

--nextPart3460692.usQuhbGJ8B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Fri, 19 Dec 2025 09:55:38 +0100
Message-ID: <10076440.NyiUUSuA9g@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0

Am Donnerstag, 18. Dezember 2025, 16:20:50 CET schrieb Alexander Stein:
> IRQ mapping is already present. Add the missing DMA interrupt. This is
> similar to commit 0b4c46f9ad79c ("arm64: dts: imx8qm-ss-hsio: Wire up
> DMA IRQ for PCIe")
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
> index bd6e0aa27efe9..f2c94cdb682b9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
> @@ -20,8 +20,9 @@ pcie0: pciea: pcie@5f000000 {
>  		ranges =3D <0x81000000 0 0x00000000 0x4ff80000 0 0x00010000>,
>  			 <0x82000000 0 0x40000000 0x40000000 0 0x0ff00000>;
>  		#interrupt-cells =3D <1>;
> -		interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-names =3D "msi";
> +		interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names =3D "msi", "dma";
>  		#address-cells =3D <3>;
>  		#size-cells =3D <2>;
>  		clocks =3D <&pciea_lpcg IMX_LPCG_CLK_6>,
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
--nextPart3460692.usQuhbGJ8B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmlFEwsACgkQaS+g2M0Z
/iVAFAf/c5CwO26Ggu/BI/ZSuZzcaL1LqCQ6HXiIkEKJpXXjrmbMAJ6LFFIo9ARY
MP753fb/XeCGm0ozq9rvZEfe+MQ+SYFD3GV3cNRmU59JwwBNpErTOw/jXOC67y+Q
hASUB/UEN5V7UtxEUMARpH7N0PodmW0cIQwceQoO9T9S0n+g4OwjIJV+0T7/LHx5
LOh++EEOGH/KbeOtVKwmDY/mvlYFJcO5TxNbvYfo8OrT/3PltCu2awfi+ZSOac5l
ATtxTkihCWtUFHeXYtwteS0hDXOoldi4A1137WzS5MNWkCeq8TxB/F3Fk3sKSHJk
7U2L6kHUhAjtsnQPLnIQ4yuhF7BL4w==
=Pd9W
-----END PGP SIGNATURE-----

--nextPart3460692.usQuhbGJ8B--



