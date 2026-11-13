Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572562;
	b=DWNcQjKTw5vJEDqNDegKIRHChaFjKGj4F334jU+Fz4EW41jVU66JJz0U2Kmze8LzdrgT
	 guBlirfn59OtLA67KYCYC3u/26fA75UYZwfa2U3BKsT8JP0+ac0g3aVjCdIqYBVlXwA8z
	 qG68xcLMXMAseLsaQmaCxPYRnW5kDYIZRVccJQbE98Cmx9G61d7HuwMGjT0koRnazfs2S
	 rWKfcOSonqcyVVVR6BjZ2zYgtyegF7u/7SuKLDBmVnHUkKFs5zCKPNtqUthYGeGSXnpj7
	 dtm4LgvmA1wQv2B0e4LWQ7YABJ438D3L08QTaRqItVdDBhY2Yr/Sn4Nx4zNGlgN0iOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572562;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=LILqZ9d25qxhyozULVof4EbcCGZnSzSqiXpRZ27wbGI=;
	b=3eVQq8leFGjqsZXMe3ExUDC25R62lDZHKh5ewq8JvAGtzhm8jlJiUexBpDn1uahmPzHU
	 gIprPT6vPW9yLzcbAhkmjXOadeV+iB7bL1NtWNR7W024DsZxR7cbEyM+9Sti6si3z661/
	 OiI+ZsFvvFBsQQlrcCY77zkoSt0BlUZj3qrQn7bh8OeTZbK5ENH9iX4/16fOabCxU6QDG
	 RaVZYD8bvsJ+yEKas+sFOI3aKOD7RqtUWGoN+/NH79x/NdMWvtw7ObsW6albx8FtsqF3V
	 gYFkbfVvdDKs3ya/B/NVdsrPTHWOc01gEv0aYXSGdX+OTEygwmmvljreXw8rCCeF5bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=J61J2RlG;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CB6606A8BD
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 12:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40CB6606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=J61J2RlG
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B2BF10D083;
	Fri, 13 Nov 2026 13:22:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794572555;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LILqZ9d25qxhyozULVof4EbcCGZnSzSqiXpRZ27wbGI=;
	b=J61J2RlGRjEsEE6mYDlVh+W6EKAnBwQMCIPUPIH5V5wET80lOO2qzOauM2FK9+G9Ag2g68
	ZG7JTelmpH6iJOVn9HTxL0Mgx9L/ZigrBjyVjAOARyMJX3IHawEJ2RJ5XZIFWmhSqDSr7E
	Um+kdq6zBt1rDvK5Dk0ipM1ckQrbNb11VBnxQfVBqtabkue3JvwfWo37SoCP8fHA6/j1I2
	YoDoMVPToxUZcDexRhB2EN4JIgKrBeRW6IX786drIaxGM92xezYHGchkxe/7GiDPx7vdnx
	7ooM/pj4dc9GKdLI8ioQzBXjzpYhLma8ZJCf6IwyvzjCVEbfO4KAYo4DYMACIw==
Date: Fri, 13 Nov 2026 13:22:31 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Daniel Baluta
 <daniel.baluta@nxp.com>, Jonathan Cameron
 <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: Add National lm77
 temperature sensor
Message-ID: <20261113132231.631638ad@wsk>
In-Reply-To: <c6095d41-09a4-4928-a55e-f4af7a5509da@kernel.org>
References: <20261112163703.3358164-1-lukma@nabladev.com>
	<20261112163703.3358164-2-lukma@nabladev.com>
	<20261113-roaring-relaxed-oryx-5cfa1e@quoll>
	<20261113120947.6c9fb820@wsk>
	<c6095d41-09a4-4928-a55e-f4af7a5509da@kernel.org>
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

Hi Krzysztof,

> On 13/11/2026 12:09, =C5=81ukasz Majewski wrote:
> > Hi Krzysztof,
> >  =20
> >> On Thu, Nov 12, 2026 at 05:37:02PM +0100, Lukasz Majewski wrote: =20
> >>> Add "national,lm77" as compatible for the National (now TI) LM77
> >>> digital I2C temperature sensor.   =20
> >>
> >> Are you sure this is a trivial device, not like LM75? No
> >> interrupts, no VS supply? Datasheet disagrees. =20
> >=20
> > In my case the T_CRIT_A and INT are not connected on the schematic.
> > Moreover, the V+ is connected to board's 3V3. =20
>=20
> But they are there and binding should be complete.
> What's more,
> existing lm75 binding does not require these so there is no issue
> adding to the existing binding file.

Please be aware that internal operation of lm77 is a different than
lm75 and hence it has its own Linux driver.

It seems like I cannot re-use the lm75.yaml and will need to add new
national,lm77.yaml as lm77 has two interrupt outputs for hysteresis
(lm75 has only one interrupt).

>=20
>=20
> >=20
> > Hence, the conclusion that this sensor works as "simple" I2C based
> > temperature sensor. =20
>=20
> Only because you posted incomplete binding...
>=20

I've posted information which is in sync with what I can test and
validate, but I do understand that I shall follow the policy from file:
https://www.kernel.org/doc/Documentation/devicetree/bindings/writing-bindin=
gs.txt

> Best regards,
> Krzysztof



--=20
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic
