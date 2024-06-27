Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D3523BE
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 09:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719480357; cv=none; b=U3cVu72QaFQtDVX+wExX95VzJ1k7XHqOnIHtJLc87NtOWpe/RrRqSi2zydKCnIpzhD6T+cl+pQPvi2wsDtcRgyT9vS88nFezFD7z5MKjEpijekGTjRD/HIzYDogxNb9eBD0fQYgb1T+5rKCdxRbrNGGUlVAuvgcEdNCoDRt1VDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719480357; c=relaxed/simple;
	bh=yms0dvcM+cOFXF/b3rgL4MfeUvo48xGxAXWzQPcm+CE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dc3awmAlDC77dtMEXAFKdTLHuAobzNNKt5bThc0oid4RnoeWcE44Ss8I3GF4XH9ynvwueo0X3/6x0Fp+kptZXTQt3DhtTv7GU1jzV/Zt70ESPbVcVeNFMwvjtCGZpI93POWt6fhE4Z34TWeXP+hOHimNbJfSGkEAA2dM8TN46Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjsAZsOz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjsAZsOz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42138eadf64so65524515e9.3
        for <imx@lists.linux.dev>; Thu, 27 Jun 2024 02:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719480354; x=1720085154; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yms0dvcM+cOFXF/b3rgL4MfeUvo48xGxAXWzQPcm+CE=;
        b=JjsAZsOzE8Sb3JxKNNH21JN3ZIpu4i9ndI5Fytz6RYLFHIAXK0XTh/gZ3tJCnmdd2P
         mUlPwSQsOjkWwRGohyvy3YbfHMSVrer579HuAIjHps/dInj6ROk4fFVh32Lv242LlPa/
         e7FTtEz0gBSChjVtSp6AZmJ8b3U8YUIxDiQH6A8hrRO6wub6xan+H2Kp1OtrnE7QLd2u
         U9+5Lq+k24JYQOHT2I9fqiVF6g36ZSgKG868so548MF3/o4riwVruRq5L0SDB1btShhO
         HXk1ou1F4YVBjdQ7DgcinhvXglmVb6zuD4G5P331FNmHUOwkdG3uK/fu9+NV3z/TK2Y2
         p5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719480354; x=1720085154;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yms0dvcM+cOFXF/b3rgL4MfeUvo48xGxAXWzQPcm+CE=;
        b=IQFzWEU5um7UlfjODauEWrqCA8QL0bUMKJuWUYa2ozLZqKNKOwVjOclQn1/lWdI15m
         2P4SemtOI4FrnZTaN5d+kmrdCOKbsAnrSN7Zn6sjSwat9IMeYkMZ9iRv/Tbzx2gE2fb2
         nW3nvvv6P6XieL8Vruw2Depvc+NJDCHBOBhl5R+oZhWSF2Hnpbg0K5FtEIGvbygM+wvN
         4FY/XPnC4ss1DBpEKznsOEQGf+7Ur4RZMqoophC+E2KfE2VwG+FlHEOdPf00e8feMrE0
         XpDqhyADBGegb4ZFYlsZYOjk1nCbRWQxnSL5ppQW9xms+MbClcAcKKA+cOX1BSZ4otOH
         H6Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWtQ5XjXaGjYHnolpz4jXdRE91Y0jeqr1QfA3xqkGrmFKICNb+fWdyXangzJ6OIAeundDomSfI9UKRqZWaq8Lgg9S97
X-Gm-Message-State: AOJu0YyqDNfLoqNpIvXvjU2P/eYpPWakv3NB3DKAI7UftZZawfTMMXyV
	hE89Q0DqcZOzoKJRIj9tGNmKXdNPH+lUMw8BKHeVmPxYvQX8kwAu
X-Google-Smtp-Source: AGHT+IG3qQJOlsPSb9mrwiN19TVVQzBmbUDyKeJiSJmR4CM0XqDUNRuOzxKANhLRTTCQvEJ+h+D2cg==
X-Received: by 2002:a05:6000:184f:b0:366:eb61:b47 with SMTP id ffacd0b85a97d-366eb610bafmr11187920f8f.8.1719480353838;
        Thu, 27 Jun 2024 02:25:53 -0700 (PDT)
Received: from ?IPv6:2001:8a0:e622:f700:9537:8d85:b9f7:78bb? ([2001:8a0:e622:f700:9537:8d85:b9f7:78bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367436999f6sm1225086f8f.72.2024.06.27.02.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 02:25:53 -0700 (PDT)
Message-ID: <b2fd7ff9b848d79da2cdf484f8c32f2dd136d99a.camel@gmail.com>
Subject: Re: [PATCH v1] arm64: dts: imx8mm-verdin: add TPM device
From: Vitor Soares <ivitro@gmail.com>
To: Francesco Dolcini <francesco@dolcini.it>, Shawn Guo <shawnguo2@yeah.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Vitor Soares
 <vitor.soares@toradex.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 27 Jun 2024 10:25:52 +0100
In-Reply-To: <Zn0QUJ9wR1zzFGyC@gaggiata.pivistrello.it>
References: <20240613134150.318755-1-ivitro@gmail.com>
	 <Zm+gjpsGhzjbEgP8@dragon> <20240617071842.GA4832@francesco-nb>
	 <Zn0NbIvFdfpMPHAx@dragon> <Zn0QUJ9wR1zzFGyC@gaggiata.pivistrello.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2024-06-27 at 09:10 +0200, Francesco Dolcini wrote:
> On Thu, Jun 27, 2024 at 02:57:48PM +0800, Shawn Guo wrote:
> > On Mon, Jun 17, 2024 at 09:18:42AM +0200, Francesco Dolcini wrote:
> > > Hello Shawn,
> > >=20
> > > On Mon, Jun 17, 2024 at 10:33:50AM +0800, Shawn Guo wrote:
> > > > On Thu, Jun 13, 2024 at 02:41:50PM +0100, Vitor Soares wrote:
> > > > > From: Vitor Soares <vitor.soares@toradex.com>
> > > > >=20
> > > > > Add TPM device found on Verdin iMX8M Mini PID4 0090 variant.
> > > > >=20
> > > > > Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> > > > > ---
> > > > > =C2=A0arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 16 +++++=
++++++----
> > > > > -
> > > > > =C2=A01 file changed, 11 insertions(+), 5 deletions(-)
> > > > >=20
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > > b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > > index 4768b05fd765..c9ae5f0bb526 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > > @@ -227,15 +227,16 @@ &ecspi2 {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pinctrl-0 =3D <&p=
inctrl_ecspi2>;
> > > > > =C2=A0};
> > > > > =C2=A0
> > > > > -/* Verdin CAN_1 (On-module) */
> > > > > +/* On-module SPI */
> > > > > =C2=A0&ecspi3 {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#address-cells =
=3D <1>;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#size-cells =3D <=
0>;
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cs-gpios =3D <&gpio5 2=
5 GPIO_ACTIVE_LOW>;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cs-gpios =3D <&gpio5 2=
5 GPIO_ACTIVE_LOW>, <&gpio4 19
> > > > > GPIO_ACTIVE_LOW>;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pinctrl-names =3D=
 "default";
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pinctrl-0 =3D <&pinctr=
l_ecspi3>;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pinctrl-0 =3D <&pinctr=
l_ecspi3>, <&pinctrl_pmic_tpm_ena>;
> > > >=20
> > > > Would it make more sense to have tpm pinctrl in node tpm@1 below?
> > > It's the pinctrl of the SPI Chip Select pin, not something about the
> > > TPM, I think it's correct to have it into the ecspi node.
> >=20
> > The name pinctrl_pmic_tpm_ena seems confusing then.
>=20
> I agree (this is coming from the schematics net name, let's blame the HW
> folks).
>=20
> With that said, let's rename this to `pinctrl_tpm_spi_cs`. Vitor?

I will prepare a v2 with this small change.

Vitor Soares
>=20
> Francesco
>=20

