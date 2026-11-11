Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385622;
	b=umVbEqBPjitAy/SpL7TPmbxNs9HdAcUARTwYo+w81Azf3fi2FtDPbmDVAsAAJDKOc7Ls
	 qdJeRF0vWiw7jEnYCgFSfQAM9sDeTOAo/NOkxRgA6PcS6wo4tPpSPF8+bQJJDp/8Mz2pl
	 QjqqPN2RO2QJd2LkwdI2oSelDx1SozN0HrUWUvUQUiMWBA4C0QoEA7C+N4nEeCz7NCCta
	 EKwV4yKc42ETqpHoLJWxnQ8I3XLcpGRg7oVfhwimNfuAcBkCgf6eVkXmIWzyjxDDyU8jB
	 7KhGYnKv+P+8aP3Ub1vVM0H33iPLylfd/Hd9oxV2JjpULI/a3d97+W3UDrYHaRxhS2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385622;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=RQwFcfL/S5fxoV5ZZP6bv05kdrQN64Lm0MhAqt2DEsc=;
	b=aY6H4e3W7rruhUyagr0ijEkJzT6rcAs/zeujm6aurh3cEsQa9aBjd9YegnokSIDdm9oG
	 GGaJfdB+BmW0U0wkM5eVRm84ikGLJ/Eb5UuPFb4mszToWw6ibthPZJkDHjnj5wmTpBqpd
	 PzVe/k8pq2H9c73NBaQ1FMNrfguuXNgh8LbPcbG+QGsiMuWHUIoReKgThMYrXBCKBhshZ
	 sIEJar7GUaXK0KK9txSOpPUaYPEmErzCOfKznFRyTzu47EPGmedXQAJMVaJq0VliPzcda
	 E9xsvreDQzY20SCWaMU2ziXYa+wxerzITYJ4sUrBeL1xm+Gg5/1sIg2UJqCOw3cZKPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=BannX8Mc;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9591460A260E
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 08:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9591460A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=BannX8Mc
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 369B910C661;
	Wed, 11 Nov 2026 09:26:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794385615;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RQwFcfL/S5fxoV5ZZP6bv05kdrQN64Lm0MhAqt2DEsc=;
	b=BannX8McrFBDBCC3NmFHLmcApL9Z1rk/kCc5wmDQFuuInZHQgQGXOYM/mk1K5OgmNBwbFH
	TtUsXsSvk9lTk84m3PMNUgJgEDSI7g1E3Lfgkq3woXurV0pUHDRCQYFCoGftni0H6uTYSv
	ziDKGqcLVVJB3g9Xm+KcVOTj5DsTJnVhg4OgGxEL5c6O+5PBgoXSWbzL3aB6nd5L0tTo3K
	5Fi50EH2VIqxCQu4OZazETRYvLYHoU9hzpvuCSMMFrTxKH+V9XIfFVlQsrjZJ2j/NI/02P
	pWzsLExAKOzlxRE3ZNxr/whxlsUDMA7kv9ePB6cbxoh1XhmTPCZyFo/BwzypVg==
Date: Wed, 11 Nov 2026 09:26:53 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: Add device tree definition for
 Cloos CBASE with i.MX8MM
Message-ID: <20261111092653.0df91d0d@wsk>
In-Reply-To: <CAOMZO5D0Eq0FDJq00x1aitQe1HoSzXk+DEfMo2Qv=nJB=Njdkg@mail.gmail.com>
References: <20261110150546.1535950-1-lukma@nabladev.com>
	<CAOMZO5D0Eq0FDJq00x1aitQe1HoSzXk+DEfMo2Qv=nJB=Njdkg@mail.gmail.com>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Fabio,

> Hi Lukasz,
>=20
> On Tue, Nov 10, 2026 at 12:06=E2=80=AFPM Lukasz Majewski <lukma@nabladev.=
com>
> wrote:
> >
> > This commit adds support for CBASE board, which incorporates the
> > TQMa8MQML module.
> >
> > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > ---
> >  .../arm64/boot/dts/freescale/imx8mm-cbase.dts | 577
> > ++++++++++++++++++ =20
>=20
> You also need to document the board in
> Documentation/devicetree/bindings/arm/fsl.yaml
>=20

I've sent a separate patch for it (the same as in PHG).

> Make sure you run 'make dtbs_check' and that your patch does not
> introduce any warnings.

Yes, this shows no error (at least for the board, which I do add).

However, there are some issues found by AI review regarding the DTS
description.

--=20
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic
