Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794335954;
	b=1WdcLAhzq92E+t+ec79qUepElLLvQniRMvd9jJuWoT8oL+uow2k7+WFMymPdYZ/FPACp
	 kSSjZo/V5gu0QejGfhPZhTSvj9ETk/vcV8QaqLxLTvvwjJ11OglOuD/d2Y0VbztU8cHB0
	 M7KKc3DU9cJ5lpMWNp6gobMnKXACcIJU0oYAarxupDlBLI+j3h2sXEzvJsO60vHPBPcnh
	 TyM0yBSZUI37svftaUr9z+hXE55iEKsvgakckh27vBc3y/mvRNfHm29McwvakG4EzB0AD
	 I45cDaOjDA5VeI62vIS1feuKfiaclVsrz2eDgyB91de+2+66VAmwUJUD9OQD3TTi2QA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JmEY1Uike6JX8cO3a6s3fXhYo6n5w8yRovxQQfIWojQ=;
	b=iheSKH1aOgJ1Ubi4itX0RRdgiiz+0TerW1TzxFsxuQoMFtYCbJgAIxtW96Ub+B2WSrND
	 NrtfsGL2MZnH9U0k1lPIdvHHVT4LbnEh7TNmRPZmhjCtizABcR79WK2eESdk0pM2jfCRl
	 OlD5HgCv0NXmpfOuR9TAEthAxU2u0ri5E+9xBPWQOZYJHGn4mg/LYvD3HEYrBu+EUoCx/
	 OMFsPpIHcpxbokSQIcMG5YcBTPzLVWqBAk8KZvG/kyLi2+Lr0qmET07n2hgdzCRmag/FW
	 H/0987c0r7PoKCMAWAJAEsooUUk7DSuhu74jo9XJM5yfuWbbgCB75+1xqtp7KG0nM+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BKZ8UShD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBC8606A320
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 18:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DBC8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BKZ8UShD
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ace304021eso20916681fa.2
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 10:39:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794335952; cv=none;
        d=google.com; s=arc-20260327;
        b=C+7nZ86eytOrbUAX92hXL4RA2I4g3Jh5Sw7s+q/l7kGdKvt2vVSoJf4BVSaeFNqdXl
         +t/LCytwWuXGjgsVRHpWq3aGlghiO+5ILbQZVB5n/QHcCDKFZ3tlX5Mdy1GVBT8JtTOS
         2ZpZtga3sWhmtI5kkUCbZLcbDq2IhNuMD3F4aHQfIF+1zoAve6irXZSFgffAK17QEly8
         0icx/nqxYdzNMYxLuphOllgJ6i4s0jOGQjInCOt7W+HFVFwB5XOTvndsnOypqECYPr6t
         mC9HVb2kox11SwdrpETRpTqMzx2EEklKKdLbFAwBQUBs3ENWdBvGPHnPzN3gakfHy/Qh
         SZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JmEY1Uike6JX8cO3a6s3fXhYo6n5w8yRovxQQfIWojQ=;
        fh=miYDeWw7ji1UdEAf5UgWn6doAqmsJod0XCo10rbuDU0=;
        b=HwoHpTmTn++Xdl6++8jnR6OiW2K7EEkPwfcCzrmuRtqPma8OBrJ/+8xLy7h8CmWdW0
         ISr3D7aEhZ0U/SpeK3xzLehURr6lld8Sd/wfSBrtPXs5Dv8oPqCL0lSzE37e4/7DdK8Y
         HATX197FpHEpaQEyV15hwHSDqByfjjEu/YAL9EGW/EohhvOxu1b9KMKzVp30RMIx63i3
         hpKg3g5t4DlqdKaCJebdaoKZqx2Snw3EbvXL4Dwe4Rnck/Zhxilb9xl/as5gpj1g8muq
         J62Uf3AgkysraZ+3YNyUj2JOdeYreBy1p4KixfUWDeNbLnaFdRzMXJP2WbG6UQSJyjz3
         z6rg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794335952; x=1794940752; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JmEY1Uike6JX8cO3a6s3fXhYo6n5w8yRovxQQfIWojQ=;
        b=BKZ8UShDJppmwfV0PVXXsPKiCZcljcV+zlcUCpkEfg84KfZX/bNKHOFOov9f2wcC8e
         N3RtqDHj5bFi6Vw0IQZ8BRxtAjKidrA8knJN1WUDi/XI7iveRF92kDKJSgYF/nCTmD1T
         kNdy1TVy+GMt2+JfggTykI8Dg5G1Jip0NdWZrR/Vdy+b7KJ6mYEsw/T5QzY/DGBIrEOi
         bUN08OWVQEkOzQ7mR44JuYJRc6+kv+KLCZjiDpUH6noMDY0x2v86/hzbIjRi9sRlsoO0
         C8jY7qySe3M3Ikmu5R0hPy44zgXQ/kWuvSrGteAyCqxmIWjWjWkYRAMKnqKzsWhWvHqj
         5ukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335952; x=1794940752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmEY1Uike6JX8cO3a6s3fXhYo6n5w8yRovxQQfIWojQ=;
        b=mhtdACN2mMK5ON82MCAewhuOEqZIQOZ9TYvYygo7+KvbIl60gjhNUeHOCgm3j+oV8u
         xZab1dDbIgkkcMmHIl/ep44GlNMopPTrDZQXSyrHzlOty85bxfyPFF3G7yR8pI7n1gre
         229Ah76/g1A3ol4x756e5rQDbWgJJAX2cD3I26psdykUY8m4IyZ4ETnULO6AXfKkBiUc
         BRIQmXtN2+GdUOOmFfKQVjgXUtpUBi42SGu17BSGZ+hTj6LKchnAu4exH5SRfICSehRb
         25/2whPqkSKmpMqxY83B+5f/FluJTqyP3kPX2wGij6I5TN6lZm1KObie9v/ZyXOopi0l
         kodw==
X-Forwarded-Encrypted: i=1; AL+hErEKzZWUBxvoq3tT1NZ2hS3GBvSkRYeS73UEclzv8LIp7345CdqxxmcDdb099rFBwVHys5Q=@lists.linux.dev
X-Gm-Message-State: APuU4Z95XqgIhust+LTpA/N1mAfdCL2zfPkRSJ+vU8eQLs3VDVFcJGHT
	F/uJg/EEiCkBKtrww/6ToJXgcSInKMzZlIKT5x5mYcTDt7PPx90qapuqhPzFabP/tlOKCO5mA0F
	NpQpUPXJXsoA7owqLhnpUjWvmnPmiYKE=
X-Gm-Gg: AYBFou0DCC63tZT2Mr3pyX8M1xJ6i+2ZEUNK9d3d+Ja2WPaLum4Hlqm965z/fFrUfY0
	Os/yViikzfwOtQJDXv+CwawGEhSTgNNcApGflSEUVbSUJ67F6lI6i2r+vtLbsctSthL2Z/nNJAM
	yAXxu87u66U2VNrNaj4E4mdWXvYI0Dt3AKpjE70OmajgcSiQdl6GUoHR65rsjiK9puIMkxubM+I
	EfU2MF/vlh2FaBn//cevK/nmkiNW1K1HG20bRH6K9uW7NqGLzwwj+Y0A4+azAus2yIiHyjqPUd8
	By1EUQmYCzKRjUCxo38RU0Ta1a2F4o6br46tBqjUVDCllmryTCcuGqXyV6A3Q7kvCjROgIhOmSp
	FJjs2l6xmpANPGzEJRYKw/UWqsGCiPtvxuYa8ipUe7varqxjBmDqLtr5kFeG60MgYjpR54SS6ZR
	MHqRj9OdGTAUiILnApj3b05Pnbl+0b+c0jGZy2k7VFewzQ2Kv8
X-Received: by 2002:a05:651c:b12:b0:3ad:de02:e9a8 with SMTP id
 38308e7fff4ca-3ae0967065cmr7621621fa.18.1794335952183; Tue, 10 Nov 2026
 10:39:12 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1794334398.git.stefano.r@variscite.com> <3cb427c8d5c6244cebeca5310bd03171f5685edf.1794334398.git.stefano.r@variscite.com>
In-Reply-To: <3cb427c8d5c6244cebeca5310bd03171f5685edf.1794334398.git.stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Nov 2026 15:39:00 -0300
X-Gm-Features: AclHuK-Z_-LDXVn1T9DAos8gp7iZX9KtLfARNWk7UgbNlE7ndGND8A4QqRcbfD0
Message-ID: <CAOMZO5AuK9coQ5m3h7s3teW-jrX6a268aLSsgVbt2cbndGVSbA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] arm64: dts: imx8mp-var-smarc: Add support for
 Variscite Echo board
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Maud Spierings <maudspierings@gocontroll.com>, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

On Tue, Nov 10, 2026 at 3:21=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> +       ft5x06_ts: touchscreen@38 {

The ft5x06_ts label is unused. Should it be removed?

> +/* Header */
> +&uart1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_uart1>;

Shouldn't you pass uart-has-rtscts, as both RTS and CTS lines are
described in pinctrl_uart1?
