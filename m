Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC81382F0D
	for <imx@lists.linux.dev>; Fri, 22 May 2026 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449315; cv=pass; b=ZCs0Gqabm7GtwPSCBWl8cgk82/Sk4fPze/F74R78L6ZsX5u4c8k7e9PbK8rtBGK4oB2tjGWLr7nB7KCJvLcB7wjcuKL5K6yQX4L1QCQ0iOwIyTQfTruRZEC/SVYgk77CsslILyVToNVUtcYdUMfAO3I++g8qp1I6BI18NP52lcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449315; c=relaxed/simple;
	bh=5j8vE3+rn+gH3FCAT2MjUQthiUdN953EbDZ0iABy9ks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNPwyKfPXGROvxsR3GjN4SSJ65HQZ94hNQUaBlDtgEBOuzzx3SvqWI5wxGJvLp0QervLLDDlMiyCF9J0QemMux9Rpug07f0w50WrTjEdWnN2A/8moLeii+aXDFX5euafTgMiKZr3ECkZsTiq41LhFdzPnViYxHJzmOS9ccYEcZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+LaOIEQ; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+LaOIEQ"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-394095009beso62388771fa.3
        for <imx@lists.linux.dev>; Fri, 22 May 2026 04:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779449311; cv=none;
        d=google.com; s=arc-20240605;
        b=gTrtyXZcPtTwXWGyqfsKRqxHQYuJrNs763YMn/9CyhZV/b2Ru5YMDw/dCrdXEsAK+1
         aLLD8UVKskO3tLSJOwGHK88aZmQ8yP6rMw0isclI1XuqmORZWYVwWBA8CNGM0KJ2fp9L
         nBvu+EJZzQWaP8Nn8T+olkUIokv0ELz3jUGgFt8lFHX48hlKYLxTTD+khiRkTnfUj5VD
         Tv7BKdL1OAfRcn6zfwbjrvUj8k6H2sDFX9URAPMq1kpmeMCYyv37u9Gd2EIaYFgQpbmA
         5RQanU+gFZixpfYYXFRzHRFLXWWC0UM2vyCBc2uGBsn2EyFXEE1/XcW7EHXYF6wvGc2x
         RK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fa7dC+O8YGHKdhROB6LlQr8p2/+2vxZ+5YIvHDJ13XM=;
        fh=NjWCWT4+5M5oZ7GT0NVPxrfvwPMpFbBJI9mKJ7ZtLK8=;
        b=e2k7gm18PBtMznusT9xWZ7/W4QaN+cGU1QbcJOo5eGeALwJa+B3WMEHNopg66rF82e
         XeLJeOf2FayvNhdVUKo3vHRwKqkq5XHiOLm3bXxJcNRJahvKqCVqC1I/3RQs4BbnvG+y
         XALCO/hAnGsX/Vw9tIdGeU0XEXLqsestlDkHL8bzRjq1moUneNzkeOpJr0vdNnjFqFIx
         CmI5TxXeQ0MUZf0V6WnScYkJQjhbtQeaiLdVOzWZ5l8r0/T0SXu1FNbvETbHFEm9y61t
         q0JuYCl0lTG6RIrkq7J8y7hAWIm894+Qo7ltNv+0MiSXdysRwJ2NFIoypj+EO2KPq1y8
         GzFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779449311; x=1780054111; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fa7dC+O8YGHKdhROB6LlQr8p2/+2vxZ+5YIvHDJ13XM=;
        b=g+LaOIEQXnu9IoZTpii6dQfpBoFkBte73Le3QvdTgYpj0dBL7Xe8sLeYZSUpCSQeGf
         jT/420L4dqC0SjJda6z9ud5j5kBZsh3CNXriwWfoUxjeVFOe1TAc1MFJdcUsXGy+1bfG
         zmKEv0lzE8vKyBvHao2NRREA0uS4kCe6jTlAszfiiTJjjH1xptOZABwaczgpvRkd9RxN
         JdLOZJC+UdGuLpGWBIG/4TRIQu+Gb0xO81OmLIcY/nqV/HTsf/fz44xu9jFmjBUp+NU6
         TxIPC//+Zq4uHRKURlv9shEURvXWhGH33UJNP8U1dQmAY2ojHPC2Co9va6GgOKG4m0mt
         zBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779449311; x=1780054111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fa7dC+O8YGHKdhROB6LlQr8p2/+2vxZ+5YIvHDJ13XM=;
        b=lNtKNrkFTaOnMDLOXOh8eGQtJ9fdUZ/lq1kXVRu+EqKhoBUWq3OLejtRukqAG8Qu4W
         p0b+v4BgwLRMa+0GL/cz9EfGolTAE0Kz3Sm0HqiS7WHwV3aY7UNvuuRNzRBPV9Axdg+K
         uOCUAlbxtC4DCU5Nre4G9Ln6kcpC48/C+kG1QDJ4w5x6htoAbPfYGkz2MKXwdznG/IpK
         JmNlJ7DIO9mK3LOG1OM0ik6CU9zpjLoMoAi3ORzj1C5YU0mHlzZ+i3Anmde4RJcn40Z1
         tBnec42kzG0NOvyczoV939ijynUQdjCWKD+6xMb7lkttnRUgWI9s0zPMo5KDRnd9oIyC
         AV7A==
X-Forwarded-Encrypted: i=1; AFNElJ+l45SeAr5PzYWgO8FhMfKdcpoNTvFjvOmfOx7PRpxSDUXhGd7i+TbajAHDdZzgj6zMOl4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNhe3FHHC21D0czu9C+l2niIqay7aGuzkvNGpPPPrzA3sJcvG7
	0lgDOIlFx4xT7h0vhAp0dvCjTRzTa1C/gbEKHITFOL9OSi6r3TWB0TDTm9ajXftMreqfVTZdYiL
	C591C1CMoBXdQSUZDsPow7DDc8RMaboo=
X-Gm-Gg: Acq92OGMtMkGoL5+HLsmMJB4dFxle9tN0e4R2wIwD+YSG7SOkH4fGPjs+yu/WsuSu1h
	I0dnwphI1C2qiZhtPxvskx2Ata9Wxs2l2Ol8Iul+y7GGfWmGDTR7+Nm3dnBjo9uZKIobL5sy+F4
	GCRJEFdzVe7gilvXEbX/xrIBpIUrnzO5ijQVvufo1APo80Khu77CO/H4uXx6dzAU5qEfb28HgDa
	Nci87y4MK/Mn7kmFUPoGESdJ4p1Lx1nN/hBVCJr4AVjkYBJtOb6wya3JAyvKVp7iYulARotSBBX
	YLbf4itAgecy6LuVz6RcDjsQ2c62ezKQTZVREE7zzqYoVApxirkoj3yIgzFyvUd7db7kdW4f
X-Received: by 2002:a2e:a9ab:0:b0:389:fa42:b266 with SMTP id
 38308e7fff4ca-395d891aebamr11019001fa.11.1779449310900; Fri, 22 May 2026
 04:28:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <20260522101653.2565125-15-paulk@sys-base.io>
In-Reply-To: <20260522101653.2565125-15-paulk@sys-base.io>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 22 May 2026 08:28:18 -0300
X-Gm-Features: AVHnY4LV1-i2NLucbS2YgdzZXBX26-Ma3QP1bn3Gx38hCGfG5dS4UR0F3rTTEKQ
Message-ID: <CAOMZO5B+vaoXM1F+avtcdo=_tpJ4ZZfCcNCqaUo=KiQUw49caA@mail.gmail.com>
Subject: Re: [PATCH 14/14] arm64: dts: imx8mp: add VC8000E encoder node
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Marco Felsch <m.felsch@pengutronix.de>, Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Thanks for working on this.

On Fri, May 22, 2026 at 7:49=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> From: Marco Felsch <m.felsch@pengutronix.de>
>
> Add support for the Versilicon VC8000E multi-codec stateless encoder.

Typo: Verisilicon

> The IP integrated on the i.MX8MP supports H.264 and H.265 encoding.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

You need to add your Signed-off-by tag as well.

> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index a3de6604e29f..4e63c2b16c1a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2290,6 +2290,17 @@ vpu_g2: video-codec@38310000 {
>                         power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUBLK=
_PD_G2>;
>                 };
>
> +               vpu_vc8000e: video-codec@38320000 {
> +                       compatible =3D "nxp,imx8mp-vpu-vc8000e";

This compatible must be documented in a dt-bindings yaml file.
