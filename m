Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9984A1A76CC
	for <imx@lists.linux.dev>; Mon, 11 Nov 2024 19:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731353377; cv=none; b=e2BzvC8LBUguRvy3428riu/BofgskmsWye+KySqikgwSctaXzsii8gI3k3Zt4/SKVPOIC2cySctSgnocyUoX5yd0IJhSStHYgoiBy59v4ZeoXs9D9JBY+N1/tznMjPdByLu2AB5j1zkpz3GMm99nXDcn1LmR5GTsKfPW6oshUmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731353377; c=relaxed/simple;
	bh=MGrDoVZBKCJUqSFuDTy6drHVcYGi4i0VUnifK1k48Fo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODGRH0q9+cb9fF7nkLF/4Yvpqc5qrU2XuF/EhO5dODsCZXUdHyUtVnGCYnttSuX++zHCsm/Jb1TxxRnGuJ6rdk2KOqeNJJMIiNWPEHrmDWcJ3NStksDo8FFmsUXQM54GGDWExWfVxreFD0/sXLlas1pxz1IH7izzN5YxSF3gMxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TD7VyqUE; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TD7VyqUE"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-28845df360fso2343440fac.1
        for <imx@lists.linux.dev>; Mon, 11 Nov 2024 11:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731353374; x=1731958174; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1vUWXu4zDKdaSJZeWtM1voreY4yk9aTKqi7yYAqNXw=;
        b=TD7VyqUEwA1jyTtYXI+dyHrixhSpNzPCC0HfCVIAbzwVDlQDO0tqpGmh2LoFynELmS
         wCEfqDJP5+l3dfLOK1Xmo5BQza7A5+cRsya377a+/m1lB4FoFAAjD3Zj1Ac7m1rOfMml
         AcbNc33CQG1To828i2auRWNOlSQLVVABZRDJJDD/wR4+ZoYVAeI29Pxi/3dkV2iyoLXw
         nCHjRGNeFM1+aBjqeEnw9dLk3Fdd45tDXZVnNKii9OAOlRUnD18BgGMZ4Qsxhx1RdJXf
         WVZdpDDIPSiaryydNIRaXqFzZsp3HiAyOtU5ztlQ6Dk/CyIRBWpSweR9Xvv/oghb77SD
         D0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731353374; x=1731958174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1vUWXu4zDKdaSJZeWtM1voreY4yk9aTKqi7yYAqNXw=;
        b=TBG/pEcT7ob5WjIFLIcQ1lWU0P7Vi+YEs4r5ofIvdCzxi94zZqc5yVyk0euWn8Br5Q
         7utiLzrdPBl1oC2nUOyYmiej0gi+zQpPZak6BfCjDjulpiLVOb2MKMtEbmG6d/Unakxl
         HwYt2uauogcrevXGwBWN/xa3LduI//ygItamaFuobk2XCWbVo3/wONTZj0MKGrjFCsPI
         MEM/iW5U3aOfYe3385vkqhnrVkcmke0bYZWQgiOrnh2KO/+sUx8RAf9Ls1dXz8j2nHbX
         9mIea2wDmoEjgqL6jt2zLdby1qi+SeeqlEoc5F46AojrEC3AXAzwWLniXHRO0EPmKFkA
         qqQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuoYSOiOx2ZMt47O1+b/WlsaXcl+xaZeym4ZhG6Z42Iz3TTotuETw/py74ZJtv0BzSfzQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4o7exBV3GdAfU287GPWuMy0/zUXD92tWJRxYwReTwJWAY+n9v
	HRHgcDqlkUbLZaYsL7e0SQBlUDHHopYXG4i7yw9UNfwsn3MUKZ4Nuw2SNvuS77uie2msUNUfkQ7
	1JehXWhGcLMub+ObNuTFyj1J440w=
X-Google-Smtp-Source: AGHT+IGHBbFAE824Z7ejSxwNuhavp9mnBTJDMnAcM9e5ShF/vhmJU9L9bJA8yQotfmv6no01sHmmXUuBPlpSARUN7sc=
X-Received: by 2002:a05:6870:b06:b0:288:4eb9:5541 with SMTP id
 586e51a60fabf-2955ff9c48cmr8070771fac.0.1731353374567; Mon, 11 Nov 2024
 11:29:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com> <499869db340b2d4c257e12d20e15c200d0f815b1.camel@ew.tq-group.com>
In-Reply-To: <499869db340b2d4c257e12d20e15c200d0f815b1.camel@ew.tq-group.com>
From: Bruno Thomsen <bruno.thomsen@gmail.com>
Date: Mon, 11 Nov 2024 20:29:18 +0100
Message-ID: <CAH+2xPDip+mTxhMUHVXQfmYN5cROiMyFxMb1xzxT54y9cP5Acw@mail.gmail.com>
Subject: Re: [PATCH 0/8] TQMa7x DT cleanup
To: Markus.Niebel@ew.tq-group.com
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, =?UTF-8?Q?Jo=C3=A3o_Rodrigues?= <jrodrigues@ubimet.com>, 
	linux@ew.tq-group.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den fre. 8. nov. 2024 kl. 15.03 skrev Niebel, Markus
<Markus.Niebel@ew.tq-group.com>:
>
> On Fri, 2024-11-08 at 14:49 +0100, Alexander Stein wrote:
> > Hi all,
> >
> > this series fixes some DT binding check warnings as well as removing
> > duplicated nodes. Eventually IRQ support for thernet PHYs was added.
> > Additionally add CONFIG_JC42 to imx_v6_v7_defconfig.
> >
> > Best regards,
> > Alexander
> >
> > Alexander Stein (8):
> >   ARM: dts: imx7-mba7: remove LVDS transmitter regulator
> >   ARM: dts: imx7-tqma7: Remove superfluous status=3D"okay" property
> >   ARM: dts: imx7-tqma7: add missing vs-supply for LM75A (rev. 01xxx)
> >   ARM: dts: imx7-mba7: Add 3.3V and 5.0V regulators
> >   ARM: dts: imx7-mba7: Fix SD card vmmc-supply
> >   ARM: dts: imx7-mba7: Remove duplicated power supply
> >   ARM: dts: imx7[d]-mba7: add Ethernet PHY IRQ support
> >   ARM: imx_v6_v7_defconfig: enable JC42 for TQMa7x
> >
> >  arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi  | 61 +++++++----------------
> >  arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi |  3 +-
> >  arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts  |  3 +-
> >  arch/arm/configs/imx_v6_v7_defconfig      |  1 +
> >  4 files changed, 21 insertions(+), 47 deletions(-)
> >
>
> For the whole series:

Reviewed-by: Bruno Thomsen <bruno.thomsen@gmail.com>

Thanks for the cleanup.

/Bruno

> Reviewed-by: Markus Niebel <markus.niebel@ew.tq-group.com>
>
> Thank you
> Markus
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
