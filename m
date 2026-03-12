Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DB539B96A
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 06:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773298484; cv=pass; b=VKKt3zJRbnJF+044cr4skhwn0K/GJou4fcuUdDBAqNoCrKP+5Bt/9UQ6qZa4ycj8bkvr0q5BbbV+MztX316T6DraUi8Upsvs8YTGgN3zVF0AlZ8CfibRSM1H/Da4u+Loa6eRivqqyU+npS4GzmVwDAt5f+cNJtW6zzTzUxJkovQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773298484; c=relaxed/simple;
	bh=Be+DWSJxXaWd2h3oqz8Y4RWZIPdhRhtU2hbnzD1aDuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DC3yCK2rckVnA5/k8nqBeGr55xqp0wk2QbDvvMVqv1QEeFHSgKqSVmYeQ9J1t8+eExuqnIA2FcnpJDatNRp4Hq8t2x15wjRXzGDPTpVQAIl5HebSIxi95cbIwogmQe6a0QlafkCv+9K62w5G/4tuw/hPVvHx9Z0RnY3uaLFIrLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neopUCwg; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neopUCwg"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ae527552acso3223775ad.0
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 23:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773298482; cv=none;
        d=google.com; s=arc-20240605;
        b=YO7rJqBWX0JL2uVjnxlJXpfy9pCaVVWyaLcyWtBeJETVI94JCWHlIM84v5LYh7/7C3
         VMaMfFLOgJzhWS4l6TzIV1foygxnxYBoI1oOkWLnFAnjqw+pA2tJjx9kf0g1i6aVqU4N
         z63QGaFda5ACXW8yhP9oBZvsje6onSNyCgcdjn2x4lf13rk09hTaC+Obne3L1Nb7x3qE
         QqydvOlvEv88c1eGnmzTuSQayMprmhlBJgp92KmPRZ/+BZazEWSNaRHGn8JWHOlYWyR8
         cE4SavbEVQAg+V7v8RF0htvI+hGDrfF7cuPz9l/FSMTQd/Jayryi9aLuYitXOxUJqKZE
         KPCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wR3lTNQ8vtyMXtspr3IFVrmuZOG8EcAD0Ru8ues67mI=;
        fh=XYlzP3dtfzi5G1ju7vlvxfhMdhgVeWPgIP5HQnAB6gE=;
        b=C7BEAK4QR/VcFrDWgs30+RPtRMh0f8MLM0573BGvXexnhgZoSbWtXmRe3xgUWfoXMV
         59U7SpSjvgvyjsotk9cv5CT8lA1V8tvNId4CzcFP5GkYxP2Pt+bJfzCnzhd6TfHVWsZL
         xYOYCpsJX041Q/X1UdEPc8qwYF4XDR3e+5fOIaxOMt7h5Aw/rNYiIj3tSq+RRlqmWR7M
         rvsrCwuS6W2f8FM8Q5RtNmMpz7mzj5jZrLPInknZAAGcKfltGG3j0C1TpuZNaFwZcZ/j
         uTZDvTK9/0nLaxbEGgy/EA3BMmk6oGDTNW8fsK5jaNOpaJrvDmjgIOUIJFUjjTtm7S8c
         vgvg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773298482; x=1773903282; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wR3lTNQ8vtyMXtspr3IFVrmuZOG8EcAD0Ru8ues67mI=;
        b=neopUCwgF6Fl7cgsABJ6HY9BpknlcMpUKcsBKz+TSHxWOunx4ixST/3esJFZ0GpOvB
         IYxh8yYrrq19DECS0JNqxgJeuXwz9SoGiXEp/qN038EXlheoHJVUZkxbfeJaL2NrHavv
         UB5L2oZH8TV3vtuPzpC0gKX5XiOBlyAtVJ6fDagAlV0hGG/S9ttTYN/jNo8ycsbZANXY
         A3bQmaMBQZdad+ZBo0BUvI4fyx+OyaDEU0cvFcophPZPJlQ5NstXrea+yxZs7TAyPVJv
         Y0KcyW7f2TlW9xcdZrLGq7/DH88tNWnWkOnIQhN+6u+KRRbK44dYTb5nOy2lX/vZGlo+
         WLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773298482; x=1773903282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wR3lTNQ8vtyMXtspr3IFVrmuZOG8EcAD0Ru8ues67mI=;
        b=JoLxKBz6p1vb/OB6xFAkC9jIqSWR/bTyKXmRf/ylb/ZghlB5EuYndvWmI2Zobg9u7N
         p7ZDl7ng5DbIQLrAlwE5OpykffAYgiCqtVioZ+f8REeikxXGAgzWmp6aB/KGjDnME/rz
         zNBjZbNo7fMKxiXK4/xqnNIHggllL7RdQ+nvB8oP7dkSsrplbEJU3ctI7sceZ0MiQEqc
         +PQG4xJkN7qWL7SJhtc/X4y8equnEEvAXuI4DvvCo4iikKDjD9vkdx42kaK2lYp1/Xl8
         s9pVmxybCEhKb0oYbf4azPYGXVm1nqOLSHpw3nJQun/xlRhUfLU0BGpDzJcnoEegdO+m
         r7ng==
X-Forwarded-Encrypted: i=1; AJvYcCVn1PCPzrvav2w5A32OeOQI2r6My9C4nYsp4Qz0fxCzKNIB0rgEx+arzQJvy6s+Bn115ug=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/tvQgizZwUezX34Quyw16AQjl3m+TURpEfhcL4AcZlFOGW8zl
	5B9mXvg9/acnsLLkvdVkGWYLsXEDOB2TeB6J5iAB3Iz+bsUPpt/BZqFmmdmWRZdHx4BYchQAwQQ
	5c06tHHm7i3jK/cAR5dJD70m06364fhY=
X-Gm-Gg: ATEYQzzxd8ZgIdfTJBdICDifb1XlVBkLz7Fgmpo+mFzwqXDaudQG5KvSovkSkL98d67
	E3MAnyLhClDABZu19xEOqGAZWZEE9eyLnb4AxdM6NC12smiXmU5AUfNmlgTfycz3xebLcFOqveh
	VATyfU97JkM8vtjxweTR/qECqkP3PcKEgM1PNa0sYpOj5E2GbIFiR4EO8l1GqwG+RiwOuwxY5X3
	ZvwGqu6ngySHd3To/MRt8E2MOTD8BY2awBVpEX1T5LuSQ62UuhtklL0pVUkAK3q15c/Qa7aYRO2
	htZBXTQ=
X-Received: by 2002:a17:902:d50a:b0:2ae:5426:da49 with SMTP id
 d9443c01a7336-2aeae88defcmr55291865ad.34.1773298481850; Wed, 11 Mar 2026
 23:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
 <20260312034912.4007057-2-shengjiu.wang@nxp.com> <af948fb4-4f63-4276-9368-9d41e80c3e7c@oss.nxp.com>
In-Reply-To: <af948fb4-4f63-4276-9368-9d41e80c3e7c@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Mar 2026 14:54:24 +0800
X-Gm-Features: AaiRm51CB2PtkWtwvXXWHfX6nfM3hu2hh6z8jZbSHIx7_tLXIh1Snw9k9jw4XlQ
Message-ID: <CAA+D8AO2-C8kRiF3ymYd7fvAL_Op5ohwk=m8ZbfjHUWXCSn_3g@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: imx952: Add audio device nodes
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 2:40=E2=80=AFPM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> On 3/12/26 05:49, Shengjiu Wang wrote:
> > Add audio device nodes, include SAI, MICFIL, ASRC, Audio Mixer.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx952.dtsi | 199 ++++++++++++++++++++++
> >  1 file changed, 199 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boo=
t/dts/freescale/imx952.dtsi
> > index 0f86b5626cdd..5787c12e788f 100644
> > --- a/arch/arm64/boot/dts/freescale/imx952.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
> > @@ -823,6 +823,156 @@ usdhc3: mmc@42c40000 {
> >                       };
> >               };
> >
> > +             aips5: bus@43000000 {
> > +                     compatible =3D "fsl,aips-bus", "simple-bus";
> > +                     reg =3D <0 0x43000000 0 0x800000>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +                     ranges =3D <0x43000000 0x0 0x43000000 0x800000>;
> > +
> > +                     asrc1: asrc@43000000 {
> > +                             compatible =3D "fsl,imx952-asrc";
> > +                             reg =3D <0x43000000 0x10000>;
> > +                             interrupts =3D <GIC_SPI 376 IRQ_TYPE_LEVE=
L_HIGH>;
> > +                             clocks =3D <&scmi_clk IMX952_CLK_BUSWAKEU=
P>,
> > +                                      <&scmi_clk IMX952_CLK_BUSWAKEUP>=
,
> > +                                      <&scmi_clk IMX952_CLK_ASRC1>,
> > +                                      <&scmi_clk IMX952_CLK_ASRC2>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>;
> > +                             clock-names =3D "mem", "ipg",
> > +                                           "asrck_0", "asrck_1", "asrc=
k_2", "asrck_3",
> > +                                           "asrck_4", "asrck_5", "asrc=
k_6", "asrck_7",
> > +                                           "asrck_8", "asrck_9", "asrc=
k_a", "asrck_b",
> > +                                           "asrck_c", "asrck_d", "asrc=
k_e", "asrck_f",
> > +                                           "spba";
> > +                             dmas =3D <&edma2 97 0 0>, <&edma2 98 0 0>=
, <&edma2 99 0 0>,
> > +                                    <&edma2 100 0 1>, <&edma2 101 0 1>=
, <&edma2 102 0 1>;
>
> For consistency we should use symbolic macros for directions like you did=
 below.
> Use FSL_EDMA_RX for rx direction and also introduce FSL_EDMA_TX for tx di=
rection.

Yes, should use FSL_EDMA_RX.

But introduce FSL_EDMA_TX, it should be zero,  FSL_EDMA_TX =3D 0.
is it necessary to add it in include/dt-bindings/dma/fsl-edma.h?

Best regards
Shengjiu Wang

>
>
> > +                             dma-names =3D "rxa", "rxb", "rxc",
> > +                                         "txa", "txb", "txc";
> > +                             #sound-dai-cells =3D <0>;
> > +                             fsl,asrc-rate  =3D <8000>;
> > +                             fsl,asrc-width =3D <16>;
> > +                             status =3D "disabled";
> > +                     };
>
>
> [...]
>
> > +                     sai3: sai@433e0000 {
> > +                             compatible =3D "fsl,imx952-sai", "fsl,imx=
95-sai";
> > +                             reg =3D <0x433e0000 0x10000>;
> > +                             interrupts =3D <GIC_SPI 170 IRQ_TYPE_LEVE=
L_HIGH>;
> > +                             clocks =3D <&scmi_clk IMX952_CLK_BUSWAKEU=
P>, <&clk_dummy>,
> > +                                      <&scmi_clk IMX952_CLK_SAI3>, <&c=
lk_dummy>,
> > +                                      <&clk_dummy>;
> > +                             clock-names =3D "bus", "mclk0", "mclk1", =
"mclk2", "mclk3";
> > +                             dmas =3D <&edma2 61 0 FSL_EDMA_RX>, <&edm=
a2 60 0 0>;
> As I said we should introduce FSL_EDMA_TX and this will read as:
>
> dmas =3D <&edma2 61 0 FSL_EDMA_RX>, <&edma2 60 0 FSL_EDMA_TX>;
>
> Otherwise, looks good to me.
>
>
>
>
