Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54105320CC3
	for <imx@lists.linux.dev>; Mon, 10 Nov 2025 19:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802811; cv=none; b=OgQwmh60yvSoKOU9warnwEgEw549HTUZjwkR0EDUp/7R/w3S/dslpmEKRjIAdnwt0Z+G/Wbj+O9mrdAZkbThptecMppT07uX63iEGP87gpUcIc9FBQwXoFP82tSGGQe7v9qnX1qsXx2+jQqd4lgh7v1aHjHK38A+Ugj6gMgVccY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802811; c=relaxed/simple;
	bh=g9bEAE/YGJuTa8tU+8eyGnc74pewsjnI08OQO2NlOwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SiFo2r3h37E1cnRdQWz2eTxyETvqGOjWQsElt+1XBReFPm8FmjQPICbBA3Swt/bA5X7lPH4B1Q9EOslND+xJkooxCaryuF1SbzHaPXca4/VRhigyxg4X35AP6vsT4YnPixxKcE7OAIiHhyUmkwBzrt4l1nJtbyYfttUTalkXnjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIHP5lQL; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIHP5lQL"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-594516d941cso3758294e87.0
        for <imx@lists.linux.dev>; Mon, 10 Nov 2025 11:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762802806; x=1763407606; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGP8QREMcd/AaPsprMdpu0BolksBxlVcRR5B0xb1iVQ=;
        b=TIHP5lQLPBsw1ZyiKNkZYO3VMcsvpgfchKjYmmxbBlwzl3gzY1tweG3OekYACUg0Sg
         6EBlCq9In7FY4ZIpiHN5+wOpGjd0FZwv9Z7tWF6seC0mVjtXS2IlRPzbTZT4SWVwVM0Y
         ohRPRZz/sHDTNFJLF79QG2AJZGV/c345Kx8zCMbJcRNEiqHEhV9me1dBzJmwWEkgV3he
         krlp9eJjhLWuaZwjnb2FrkHtQ532PlqMd5vDhfDAqnCTQQGc/A/p0G0UA3gXBVRl4Mpo
         SPK3Cx5n3rDUuipb0ke+zAvpQBSxeTrTSzYuRFM0Xot19iuSgdz+sD+a/r/XWj8/yfH3
         8zYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802806; x=1763407606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QGP8QREMcd/AaPsprMdpu0BolksBxlVcRR5B0xb1iVQ=;
        b=FA7Oe5yObq0gLuKJPp8Yb3Hijpwl6OePoowTyy6QLR7Bt7Phly0D00vh8NKJp0O739
         mVcJun4BiUCWt+Dn+lnOeogbw1NE9tn9tT6J9/5rso9rIsrhK5QaC3+tCNVFJaMAl+Gh
         4iFAaVEd+53etUaAxQt//2m3gPSPx0UDXnhGDbg7160bvyqFgWGUtYNyQGSpnWRyVLLV
         toWNXDcL0ubhgp/tuN+u/+z8FAc/Tyz7MPt2YY+s8LIk1T3d1LY8Tv4xYyyQeDLV860j
         hGwkiekJtfTTdWV3uRa/ZGotZ4NWMSxURlgC0pI9m0DUu4NJcVi+2YpeN9Ft8TDGgx2h
         iL2g==
X-Forwarded-Encrypted: i=1; AJvYcCVoHFJ3W8/+KI116aF7dzJYE6ZoIvI77hxe7nWKjTfXrZ6GqpY/DvrivbQFZwNDrcdB6eM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqmBAsC99wyq53KfFJ2i7Yx0KaaHNxGmHbmMQ1MOnZWhCB+FCQ
	NCcUzM7qZnkYPiB3uuTfMFg4k7nIYlysE5TBCAxQtXs2JDMxlA4js1mX3UGc5HfLSiJbiNMZiJ6
	LgTsVwE/3ymrl1dB/L+UnKbjBo6FvsnU=
X-Gm-Gg: ASbGncuPEQHNRiVmBzpr3TBO45/aKkkNdRFCBKKZdCz/uSngaETYKWGv2CIw/hihudh
	qVZ1Fn5nxyBq1yZGGyXriAjLzt5x/aNRANtic3ESMIsMM2B44+OURY3lQ6XxvqrYQ97EDNS+2jn
	FOq9OBKZ6uOOqKTJye/KQC+vfWyLuRVFn9qZJ7BshRDWgvCoMRfHb06vO97EqgHQq7Sx9yMTpQ0
	sum4Vt+J006D1e8olLAoDxTKIw9KHjjT/3WZcPTRDML3FN7ssF9yd44ScVtr+BpTB/Pzk411FMo
	tR+A2D0NMTPGQZem
X-Google-Smtp-Source: AGHT+IE2w++hbFBecmu0ldyA3GzUU/nItyyDdlyoL3af2e2XPwUQ48QHaBgbQkhDEsXF284tkIFknJ3Bm82utQZyrag=
X-Received: by 2002:a05:6512:3d9f:b0:592:f3ef:19ad with SMTP id
 2adb3069b0e04-5945f1c0a0cmr2748942e87.34.1762802806159; Mon, 10 Nov 2025
 11:26:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <aRF0++cUigbETuPs@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
In-Reply-To: <aRF0++cUigbETuPs@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 10 Nov 2025 16:26:34 -0300
X-Gm-Features: AWmQ_bmb7MnvX9j071Ug1e9S416TAObVP1qyQuyove0FFDmd8l7EUQKS7aibrU8
Message-ID: <CAOMZO5AdcR_fT_RV5-NWu7j51_TA_=Mzzi-Y3Y=HpH+pu=mrvQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rogerio Pimentel <rpimentel.silva@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, alexander.stein@ew.tq-group.com, 
	dario.binacchi@amarulasolutions.com, marex@denx.de, 
	Markus.Niebel@tq-group.com, y.moog@phytec.de, joao.goncalves@toradex.com, 
	frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>, 
	Justin Jiang <justin.jiang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joseph,

On Mon, Nov 10, 2025 at 2:15=E2=80=AFAM Joseph Guo <qijian.guo@nxp.com> wro=
te:

> > +/ {
> > +     model =3D "NXP i.MX8MPlus FRDM board";
> > +     compatible =3D "fsl,imx8mp-frdm", "fsl,imx8mp";
>         model =3D "NXP FRDM-IMX8MPLUS";
>         compatible =3D "fsl,frdm-imx8mp", "fsl,imx8mp";

Why do you suggest changing the compatible string?

"fsl,imx8mp-frdm", "fsl,imx8mp"; is correct.
