Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6E03A1A34
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 13:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126981; cv=pass; b=Dtw+cHlj3Vs1pUsguKw+xTAwR29OX9Rre3FJ+T5TpsPvs7tXO9c/8SaunISuod/bCmCGgFIFBVRrAuxgdUEB9DO5W4BqRqxTAsArsywIJRI7lOVdSIdjxLPzcUrA4fvXxGOsJX0X1YXRV4z5d0DI80A6/QmBQYZPkwfASBzE2EA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126981; c=relaxed/simple;
	bh=2kJc0/oJx9J66cb6iheE4k1eLdyJmqswDf8bzyH50wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Icdeb7JjvCuqsAltZfSXDnY+JzgCbRy2V5UQ+yDwDNIsZ7GbwL+T65LY1b/2T//5sNbaFEqC4TQzNoSFbaxUidUVocw5d1lK4+a7GHUX75WZ2CtV+K5Pa30DF/bRB2OfkIsDVQndD0KcCn1ZFwaukt9x4r2JqnYUK/hbaGKzMlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahKs1MHo; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahKs1MHo"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-124899ee9d3so680362c88.0
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 05:56:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770126979; cv=none;
        d=google.com; s=arc-20240605;
        b=ZAy2OeWocw+y+i4Jop8oSdOBRxHuyhJQ0Jx9DFERLxoJk9TY0cO4IVpkW3tLCRAN+C
         v1xzIdgYJjgwuCWtz/LhYXNRJiOSNa7npQ1xEfD/4pD6NLGtzkPAooUq2NuKSBzKTBUH
         r1JfkLHi7a6Me9zxXNr5NZuJ47MoDl5NrAh6HLusX5l2dCVAk3398EVyCig6tJAGMIv1
         8pv56NElDWtFNG/IIGbm8pHA89MTqnT39DJORf2weu0PADul8gqnunjZw/sF54gvKocF
         Lrl3EzcI7DvJrkvQug7lKyydeYFRyqUQuhcHsm6ohdSXY0BLiNZmmmE53lR7xtryUdUo
         Ph5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oiDNEn6LPf3NNMPn5SjpOYR+1H1anFvHfyh9Q60C1l0=;
        fh=cdIz26noyPo+xArcSOTtLs6EFDStF8vAM511FD7ybYU=;
        b=Jm9/Ma3FI4s7l9rIDRc10TrYBmGPYSsEGaO42yMmzepS45AzDuofQsk5cg7HA9Hxwe
         168FzncC3EfoEE1oiXZU5ORJpJ/c5+vpDJyC6XItj4+BZuVF4zDRGV/ncjWlvtpg9nN3
         OISf0BRekdEHKHq5v8VRXNQj0Q4Ekt2k7DaGoo5NYAS+f30vqB+2ZOp6CScoh/DU1hB5
         gJfAwodLysZcjG49sOiez0+1Of5lr7I2iQgAzs2mr78/OdclPmL3tlOf0NhxYhtGJqix
         f7l3bi0UG2A4266AnQgB/1JnXtrTlH4rt4+rPtax3ubgAi1vSbR1LIhvGKcK9/CYR+h9
         qk7g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770126979; x=1770731779; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiDNEn6LPf3NNMPn5SjpOYR+1H1anFvHfyh9Q60C1l0=;
        b=ahKs1MHosK5QS6PTKvF5RqCGvWT4l0xHK7KLBK6i9L84Y5RftB9OMW7l5LY7zl4QPz
         lZndGrfc7vipTteWLf8DGlduv0h8LY4a66S0Xi/NHETg8JpuHqmLsG+k9B7h+US3i0fr
         +morZWHJJZ7Mpe7CfkDxhZcqYbdQwmjicpGT3kDritLAvFsv5WnUIOweXLq5cTbVpLaw
         kokA4j42la1W4bxG8ZFBb6IeeCQIoOz2dnuDHExBdo2ZQiC6aX2vjvZK8mzzhLf1R6Yo
         nHCgAzgF3pklvGnGihdizID9hl74mowzM+bRtdEcxNVRz6rYn276MBGws7DTkafYDOXa
         ulgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770126979; x=1770731779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oiDNEn6LPf3NNMPn5SjpOYR+1H1anFvHfyh9Q60C1l0=;
        b=B4M3qQ+ueFyjiBEzJIDpUkdrT7iw0bAmj8Cvi8c08nMVYbIl1Y41ZYpP+V7K+phjy/
         MiOGYWT0KYWpcGNavcT5l1gft1NSNRBrxG0q0p0D5FuBXVdB2L5Bavc/xSqNHofXY7tf
         mxdjTrDaswitTjNmZUgmyAp1PcWpuEtjK422M0QpBZoXkUritXEwfd6RVf9YQzWJIsY5
         yfX0uETVPWcDmcbSrC5mwSMJ0ppSfEqsW5hQXJ7QtVmdhZ/nd07J/ST3LoUfAIC0TmKE
         SCHcNKRYp9Upo/nJvand0HGu6ZGcAF+82Lomgj9fIEuTGFzO7GRT7ZnaW4GRX4GPCV9z
         pOaA==
X-Forwarded-Encrypted: i=1; AJvYcCUxHm+8Qn7CPilFoHMpZWo7rV5wslkP8UlBSRVn6IQvl/hipM+Fk+ueuaAs7TMehRpFjpI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXhoYG/tRjGeN/ZFsG5pFcJM5ySVF3oyfXUt3JpMX641Bjjv4h
	iDOSfV1Cw9Xrc3QGNFXtbp8yUAfKd1eeAboWXIU/k11PlgT0C7vc20+92d+RiVAuW46+l+Kg5EZ
	35NgkgEWhN28477NbD1S2JM6HIkU/SY8=
X-Gm-Gg: AZuq6aIraLXKOMk4iOIvClUBKZ3wn9dIA5wPZsmC3W3ihFFl0504rgy8ioNKTdLJdIe
	7XmSF5NFHUJT8wH8GwHTMEGWQye03R3COcnipezA6w/Cc04E+3na5lA2XgARAhSRUSPAyaGaM8T
	IHPjTeM79iCnSi117RSMgxdIp9pprAN6EfV2CLgjPphlVoCAPsozUcyrVN7uyG1yGFGsEDtwj3e
	5leQ6knSqc7lQ6MMo0wMcrJBMOwRvQBYoFVKMFSpgN6pAD0rq/RAMDmSyrW0VAk5UX22Yyr3ox0
	cDOlfImsRCFTMOqToA3zLIYfwa7R/yDfPNetMKbbvqH87jyLOkCkT3cTTyywVOUDcfG7ScF6Vp0
	9POacYkkouQ==
X-Received: by 2002:a05:7022:90c:b0:121:d898:edae with SMTP id
 a92af1059eb24-126ea91f3e4mr1123936c88.24.1770126979199; Tue, 03 Feb 2026
 05:56:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com> <20260202-imx31_dts_warning-v1-5-434dd2643c3b@nxp.com>
In-Reply-To: <20260202-imx31_dts_warning-v1-5-434dd2643c3b@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 15:59:04 +0200
X-Gm-Features: AZwV_Qju5F7xT8vnmaZowdmwJ5PbMdVnDwBoeT5wIv_XHgkftgb91IXvaA8NXhI
Message-ID: <CAEnQRZCWcWaDGSFVvV0AT3rp7pO+iPXNnXW+4Dum9PwOFy3nQA@mail.gmail.com>
Subject: Re: [PATCH 05/10] ARM: dts: imx51-babbage: rename at45db321d@1 to flash@1
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 9:45=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Rename at45db321d@1 to flash@1 to fix below CHECK_DTBS warnings:
> at45db321d@1 (atmel,at45db321d): $nodename:0: 'at45db321d@1' does not mat=
ch '^(flash|.*sram|nand)(@.*)?$'
>         from schema $id: http://devicetree.org/schemas/mtd/atmel,dataflas=
h.yaml
>

The commit message should say *why* the commit is needed and not
focus on fixing the warnings from a tool.

e.g:

ARM: dts: imx51-babbage: Use generic name for flash node

Prefer generic node name 'flash' over the existing specific one to reflect
the function of the device.

This fixes below CHECK_DTBS warning:
 at45db321d@1 (atmel,at45db321d): $nodename:0: 'at45db321d@1' does not
match '^(flash|.*sram|nand)(@.*)?$'
         from schema $id: http://devicetree.org/schemas/mtd/atmel,dataflash=
.yaml

<snip>

> -       flash: at45db321d@1 {
> +       flash: flash@1 {
>                 #address-cells =3D <1>;
>                 #size-cells =3D <1>;
>                 compatible =3D "atmel,at45db321d", "atmel,at45", "atmel,d=
ataflash";
>

Thanks,
Daniel.
