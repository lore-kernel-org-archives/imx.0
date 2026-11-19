Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079712;
	b=LSDP3t1VXEfOmi5qJEjtNB5yzwDXxPaRS3tmK1GpJo/DUjjf6Ws6gu583dnhlajuJ7Gm
	 vuwGqhXJkfu8bscbDulSpG37yblD6whM7+VfPyHz9gvxVF5RwMCa5GJ/tTW5CkT904+Eq
	 wOwhoLQKTinKgqgfW6WuyYwfHI80IN6pNEU9nht8J9GpZhr+L4NCt+T/32r1GtU5nYs/C
	 GqsMuA0gEl1aCCkDxEL8Hc5HHmIfbkeW0GSRmoub3S/3Uuw+af2sl2uYdt9pkw7UEMfkU
	 LFwoRaNIoM5lpZeCYBMpDZBzWLE+HcmtVfJCxklEfT/2k0hQ1VRAp5RwMCALZSt4ohg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079712;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=XQBhhzHd49eMecbJ9Ihf5iuvQwUvWADjs9cSukpLuKg=;
	b=PNaBBUWivVoPLDQod7fyEBQA14ddZxSdE12JpBrjvm2C5CaWKezr7OpiKfADfBTKq5ax
	 0HNhZ3tH/BlG3CM4yf+i4Gck3WpVokMZiyvji5JS/l8U6YM7CvCiRH3nQ0+EX2vdOgLCF
	 rW0VxDQVL3cio0o9XSBxLCktHzcK+ZHqHfm7Q20kWIiHbGDkHWKK7KGQ+N3vuLPPy+Tbe
	 hcFAZygnbhrlrcQDCCm0wofqTsoK+y1n1gG6o7qxhfoKCRQR9ZD4D4JrdOpXqS9DdboQC
	 POeHB7q0Lr8qhz0PYTl6XXLfY/SKQFlFD+AM4I9fCQy+jNO2OMREFmdzjoxr3Dyo0BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=ALNi8PxV;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A627A606A320
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A627A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=ALNi8PxV
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8B1410AF96;
	Thu, 19 Nov 2026 10:15:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795079705;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XQBhhzHd49eMecbJ9Ihf5iuvQwUvWADjs9cSukpLuKg=;
	b=ALNi8PxVGHzaIPABW2PNN0O9FhC7zhTCvQcqUEV0cdvuGmFjbU88QtUDCn3hbezbtaErH7
	yxi6FVSMW/+vUsUeQEID0QcdIYcEGmkw0iOsycZKNOhBePJLaGSrrDpTO+8EPcApzf8Xc6
	8HbGp1gcr45bva2CeBZx4WO5EWElso1ymyHGWVKc/OpgvHl0Qia4ciuiQb1+a5f4xyfzDq
	c/tlV1TWZ0O3xGy8VN3r5zaL88J0ymwHbzobsEBxa8uOLvbXRFB5sae09hBJjzl+CtTSCX
	slQ9nTjkP/nugILxuxaf98T7g+kRLsmOyDdUUiMF0zLheMUez7TURUilHDBzWA==
Date: Thu, 19 Nov 2026 10:15:00 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Baluta <daniel.baluta@nxp.com>, Jonathan
 Cameron <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: freescale: Add device tree
 definition for Cloos CBASE with i.MX8MM
Message-ID: <20261119101500.77f72411@wsk>
In-Reply-To: <CAOMZO5AiGRHNijfDcCXhsrQDwcWDwHNsxVEoHuEaGdVaR6JBWw@mail.gmail.com>
References: <20261116111802.2442456-1-lukma@nabladev.com>
	<20261116111802.2442456-3-lukma@nabladev.com>
	<CAOMZO5AiGRHNijfDcCXhsrQDwcWDwHNsxVEoHuEaGdVaR6JBWw@mail.gmail.com>
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
> On Mon, Nov 16, 2026 at 8:18=E2=80=AFAM Lukasz Majewski <lukma@nabladev.c=
om>
> wrote:
> >
> > This commit adds support for CBASE board, which incorporates the
> > TQMa8MQML module. =20
>=20
> You missed addressing Frank's earlier suggestion.
>=20

Yes, I've overlook it. Thanks.

> Please use the imperative mood: "Add support for CBASE..."

+1

--=20
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic
