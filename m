Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E153905E6
	for <imx@lists.linux.dev>; Tue, 12 May 2026 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778593448; cv=pass; b=JlqfSpm8P1sL7ZIDlwTt5+orfu1vjxFrGVELEnktlyB7rhqls/L4cAKCdrOKhQ2k6FJHDb0KHSj2lX83ltJdXCOcYPCRtS8hf6ptODJIng9hxme1SWg2NaMXVuIlqeb6Zke/u+1WsMg8DA2JR0XiOkmMY1mt6lgCI1M7RNpq1JQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778593448; c=relaxed/simple;
	bh=UIBbDdY/6Vl81uBfM5dEV50W8t5LzE4VYm82dl6aad0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/FDEfb7MeQwhi3zu0Vwxg6A1WWSLfDwtN06qQ//MPqYNSTyBnbjAhjdPhT8e37W2+5m+dG8KClpu+Y6aOaZmN1cL/4bEnKVz14PWOu5mzdfASbDCQ9xIdvjs6T7T+bCRHzMOy3F90PUtFepmYwlaxBQYWHAAsjFUSrnabjdrr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pxhVg4/4; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pxhVg4/4"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-394421230afso4038041fa.0
        for <imx@lists.linux.dev>; Tue, 12 May 2026 06:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778593445; cv=none;
        d=google.com; s=arc-20240605;
        b=LpMbfmm0GPSiEA00hsZ+gtZa3wCPUlBQABXOzqxBNFdhq1+ndNXvtCyGETOSWeT7Tf
         xlIDQWs1Bfo5lL7TeZj8LTBwUNJ9q5vEJZx7DG/az4Vg02Dh43PGlt2rv5iXM7LCHBia
         4QE44KO8IZ6cuKzoAz2k1x//WpWqM4uvWoWLCXaZX+izJHi3MvSdulIquvcIlBbUtTWr
         i1ohw+OSYUwSnVSwwAQbzOPdNBwNQkF2uIYuplgHA1AhFNVG2gtLeyO/+3a6H+uJ1n50
         dSB20m+fIAbB7E+u315AoS7GbzPwU3Ny1g+oK6wZYanaVBEokjpdMOW7zkgJp9vR2cfW
         OdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UIBbDdY/6Vl81uBfM5dEV50W8t5LzE4VYm82dl6aad0=;
        fh=Mccr+bDGiHsmvIdxZD+loiHcvq6YDxnFEGID+zDrAN8=;
        b=J/NbF0etdvBRL4ZMknNUhlrPbSbNMPT1pHW+I8vS3lcqoYAC94ReRitKNJ8LP2TMCt
         hSSbSk82aFmZPLOi9MBq9jaBA0S6gSbmjzFRhvRQtXLO3m+OndBN5gOutlAaqEdpb97w
         gLL6ASGDkCcbP3qzMvFgSVVW8LBT7L58oVmyEmFMVw6+PTcVseUYbxj9kxj38KJEZkNm
         xdxecxQUVAd+Z6UaymwvIoARlaz/rk1/UxccqdDTVJ+R00ba5fSyJDu+3/ID2txFp+g5
         gEvM6Qqh0bpwrKnqCOhcFiFl2ndhXaFQvNG1llueKJsGDrG9dQ/mFALBPpVs3y/QP3Kv
         5S3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778593445; x=1779198245; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIBbDdY/6Vl81uBfM5dEV50W8t5LzE4VYm82dl6aad0=;
        b=pxhVg4/4DxuC5BDsOr2qkdEMX6rkS7om7Fz8SGusihqz6tTfyOW71y+huE4i7bhHPu
         hHXjCbNPkggZpOlM1qX5CIuxLF4VdKpuT/BS0/r7nTHSuUxikDxRmb4ugET1RUmVRH60
         SfMBIYHpG4T1JGEd/zT08Jb1tdIWl7qWJRvWUs2GqLIIg/J5eNAnhWGjqI2X/CTSuCxa
         8MTW5bDA35IFZceXOdOYyVGUVWHDH8nGf96NGnd0dOMXmWKijZFDSx8c8B4oI1CwGEXY
         NKcszKLPvgPLi0boVE1A4vJDPPFPuVz8himxGwjgd6uxaANT51w/wpSitfW799L+lxG/
         UiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778593445; x=1779198245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UIBbDdY/6Vl81uBfM5dEV50W8t5LzE4VYm82dl6aad0=;
        b=WUx9YXLTFJMLLNbjz04P9oSn1ovf7+Q22GMA63aRJKXa/hqvvP0z1p+x+Pwupzm/Jj
         X46AHWfcDdnRemc41eTsqd8CNOqIgRiRz0oE7fwRZjcJ44krO1+Li1EdVy+VOJ+yd/8F
         DEuGmAIa4CgtumNHMhTBLY128Bif13Sesu25rHN4/9x0R8aWXUiYLC+85BakMGYz4mb9
         DUolrs4DrLjgDUWfsi/G9vXFQQxRII51rJje0FqTQoLwF73OHJICdQvCAjN7I2DyKM0/
         rIKmc7uM0GT6gVzQLSXr4ppnFxJXYCvo/crGj4as/ni6J7jJRZxn7FfQaCSDiGEli1bY
         TxaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mnctZLiXNt9mZVWnsmmmIoFNGrV4thvBgFLqoQ+exEc0uQBcitJBaGAhZDrt8zHSEfbw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBOFBCC+VxNO3fc6e6hTluzMt5elXIm+8uTjASFviO/B1o29k3
	w4Gp4vtU47BcY9itG11NUGtmSQVl/uxuIinnEG4r5DsiyyFlej90jBAMRwsKrcodsnrclWorv4o
	6uGSjecKtbepk4hctoOKeUBTbIINRF/I=
X-Gm-Gg: Acq92OH6RGWk2vxc3s6ff/359WB6251rVvZSnnqTsI9bIKy6CIJFL+kZyZ2TujxeXPF
	sKzKLnLChYZTMObiWqI5dxpV8gblwGTsJG133h4RwiET9hksINDda6er9MxwS68MxXtrMaWcQZG
	5ECfPMXrV/zBaQEfpKJzTxRICYyFMWUnPQWj+3tDlcPXTnEeNK3nowf1hLq0wgoMtZax2d+qWdL
	afGGGRHvO1QhvSePbwPShgorqOO3BVTU8FKe90GjEDoLqQe+LC0le8q+OcKhKPz0JLYDKqtWlvM
	28Zrt0gyVFacWReGijomvoyG/ZYtDedegtuaoKgs8RiAP9MAYTEDeXDWePQHdkXt3zI/lA5C
X-Received: by 2002:a2e:be10:0:b0:393:ca4d:2313 with SMTP id
 38308e7fff4ca-39408002f04mr46273671fa.5.1778593445018; Tue, 12 May 2026
 06:44:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
 <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>
 <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch> <CAOMZO5Dm8FgzOfyp=6ZuDc=528FiqCPVYF07PjMGVP0Paye6vg@mail.gmail.com>
In-Reply-To: <CAOMZO5Dm8FgzOfyp=6ZuDc=528FiqCPVYF07PjMGVP0Paye6vg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 May 2026 10:43:53 -0300
X-Gm-Features: AVHnY4LZUMkE_oZU8jhYuGqiMMJ-pFMt78stSfr4BKQ4Jreq-iTmwB4N5o8icjY
Message-ID: <CAOMZO5CscUL=uj0dqmUjoxXNvJHfH4hsno9-jLLrLx=09na5kQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: imx6qdl-sabrelite: add mdio phy address 0
To: Andrew Lunn <andrew@lunn.ch>, Gary Bisson <bisson.gary@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 9:23=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:

> On this board, U-Boot checks for the Ethernet PHY at addresses 4, 5, 6, a=
nd 7:
>
> https://github.com/u-boot/u-boot/blob/master/board/boundary/nitrogen6x/ni=
trogen6x.c#L287-L296
>
> In this case, shouldn't U-Boot fix up the Ethernet PHY address accordingl=
y?
>
> Something like mx6cuboxi does:
>
> https://github.com/u-boot/u-boot/blob/master/board/solidrun/mx6cuboxi/mx6=
cuboxi.c#L414-L446

And from the devicetree side, imx6qdl-sr-som lists the possible
Ethernet PHY addresses it can support:

https://github.com/gregkh/linux/blob/master/arch/arm/boot/dts/nxp/imx/imx6q=
dl-sr-som.dtsi#L72-L95
