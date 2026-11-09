Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794189793;
	b=KUOJHEpClYWkECl7bCjuoCp7tws6YABqsr5M2OghDHCBkSAkIl+35tUVIWDIl09bB5/h
	 1hWb9ISthdALBqxU7jqXM5KjL7GU2xsxwral7vJdbJ2Qm5n9vye/MSXMopIArPSOKi7DK
	 HAnAPD7j3vIylfnA+knqknwECZSpQwb4qIpVDKplj4/6xnT9KnONUP0rpWTTUoznYr48g
	 J1FgVPUXl3LQSOL2t9BSPmptMlpQ5IcavfKMNx+F7rKuZ7qz++moECIEA6LUn1qJKeNxz
	 HNmGuycPMRYcLHsRTRH5Cp/Xsv6pc2Rcn/+U2Hde92Ab0URRvJNbYIqM6BnM+dLteMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JHVLOFSLCv9GVsq054d9bMCs6jEJnblXl1piTel5GUI=;
	b=HoRZlRI9ESGjKGyhIRgvj6PIUudI7WzVxPDAzfAae/sJA4vNVpDjKRKXJ3g5LjhsCXqs
	 qnRujAinmJlMAvBWl+HfwqDexLgf3atA4mmcGYaxbAZzZAS+rS31OhXUiDWB4t1mYc3S8
	 X5wS0aHGSSEOfqUlqsaK4b/Ot/Az1ZfjcpndBOFuJRxXbh67hYOG7xVmklAEbSeZKKPwG
	 135NYRa8C/F1ezEM4Y4HkKk766+dqpmljotHZzREdpjCD4ubq/hXoTIK1sXxUf6kCQJZe
	 MlEx5pRLueme3PdpQtSy8MSnSrmKinQYNbKp1TJf7uKnKfdEbf+AgHzRPRGy358Ivug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y2yIaGm6;
	arc=fail smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E39606A320
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 02:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67E39606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y2yIaGm6
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c10dc41270so283461e87.2
        for <imx@lists.linux.dev>; Sun, 08 Nov 2026 18:03:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794189791; cv=none;
        d=google.com; s=arc-20260327;
        b=FSs6tbvb/XQ96iR9PaPbPH9moOUVnNENy77A0/wXSth/w+OPD2dTxUMGErYl7IbSiw
         AM+8VTiZsh4Tj+yeZgOQXwUmtqnrti+iDrvAveo2m2A7ibLcA3Lxe9xMqOiJTh7lsM7b
         YGort/QbjgMOIQ5qMekKdcjlbvuKsU8qr+oaSAs+jzfRWzoBDaqTxlfQBF0ZPxm7A0sH
         IdgErctDWrImLiEtitqZ8y2wrv456FSZLNdAMi0+fYptrhDjFekcjmcKcy3/BI41Y4Iy
         Gh2L6F1gYhnjfsLrWJqQ7vgqUeGD+OCtRpbGPfUx6eGcuUr65Dq1dv5ZfajP6e2wGtMz
         1a7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JHVLOFSLCv9GVsq054d9bMCs6jEJnblXl1piTel5GUI=;
        fh=sFcm+S3+kaxUXp37MkePSd2gMs6m9BGg/cksDS0PhRA=;
        b=c7/Gya4jKGBR3xg7jtIR25tv9Cfndku4xFX/K5wdOdQn30yrt9BD3nq9SEpYiz7xvw
         on3lJMsMu1BlyON3kgyglWMqBfVkbnMe6YSLc8G+E6YUvYxhRybglAU4n/m2WdrA9OXA
         59LsH1UpqJl7y9KeircedTSkQQ7qzccCa9+Xq1TYLwQkrcP2W6zGfoxKkVjAvR4z2BGY
         4U07vNRy0p28VKrfwVcc45ucej13Vy/qrj38DolntPxI82CgcyrW0oRNVHEI/TRJVxVy
         g9m7YNHrmML9O75/DIT26/z89c5tCUZNAekV1IRjR0Zceh0Si1LZYqHXqSUvxgk1ua4X
         +2uA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794189791; x=1794794591; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JHVLOFSLCv9GVsq054d9bMCs6jEJnblXl1piTel5GUI=;
        b=y2yIaGm6GUL0DVAZz3yCM4gy74XNV8/Wqf61Oi5pkfZQRezV9crVQL9gqw13CRHZi1
         udvkbr2uVW4cYjLugPcaqYNLskk9a+phL5Yuc7i4ECHDoi0m5FW8o4jyauGx106oBpta
         iGMnzMZSvVybdjfjybssI+VT3Gu5RBKqvTkBHpMa+H7QDjGl/9ZgTtjL/4Ys71HBZFOx
         5smf/zi9VGNQ64tBeL4WFLShHgLAT0aUU8iSAS9suRfmQt6o0DtBUUyEni6BJfah13jU
         Iul/mFMu7EVMWkEPY+VW4yeg25WAkjQxu7H5JUJUW8VZ90iG8PQz7mdnfJRROU0Cc/2s
         9ppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794189791; x=1794794591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHVLOFSLCv9GVsq054d9bMCs6jEJnblXl1piTel5GUI=;
        b=pgxQ/aV03aVdeTHuHlLtypTrY+hHnuf9Jg3rvL7jQaE1KYJXbKIJj9HJOuE6EOcUFZ
         iqKWjRDDV3H3a/knLFaEVSkWSDDNBuPwjH5Q7fwnsLj4m9b3U/KkdB0wnbKMknsquIwM
         9z2vqcImkTT4WYdPu0QN9LjW7HkRVcVN34Cy/MAJxC67eGWZ83VzaZYnYvHNzBuVb6bk
         tHwSXjFkvzvDfnEU4Wpq9qS9WBw47QGqMEbV29AO5uaR+d2bMQ7jgix0J2PPBAHANwbo
         r8KW0P1liz6b0WXni0lBNZWP66z8dmRLK15k7r+2lHGvuqNUWA92GkSMYCY4bg4vVGVW
         B9Nw==
X-Forwarded-Encrypted: i=1; AL+hErGSE0VuwDNyJmIqhtw+IjBSOo7WmygDBzg4tghBahNeSbRJXeX7KxHnvTRJtsvYJ6nwu0s=@lists.linux.dev
X-Gm-Message-State: APuU4Z8NG9w3BmEaG5LP9qPMRCQ7C0eTaQhFlpCwEiZqh0PZb7PKE5/C
	VygBujk2QkZ1fDnQPBGKYICSXPrjJD+qr8AoKSM4gjtRzT8x9BvhbBnD75F+kPCKxZxWmnt+wPi
	be6GFqQfy56/ifP0+bpm09A0NpYKNIPM=
X-Gm-Gg: AYBFou2S9abJYm6gH7qmVOacZ+XRbV8bUPHSiXMobvB4OxIvvcU5j/A6Cbyb0bl9zF2
	JuZlf4Pf8B/MxleCJlK3B/zCja17+wkIwPwAH0veNym0f+7o6HJQibCLDA3x6NgvmtGCgzuuO9o
	+6v7EdR7iCNRjOa8/T6nJN+/050mWsrfCBgKy5CsRwyWNhHN4kpCVRG9yVrbWOX55aiwd4U+XDm
	DJI1PFMUdAxVnlEHaLEOISkalcB53xg/RIuOmB3XjjTUtb/gmSOuJw/Ke6PuXMw+2D4P/meD/rM
	wkz53g5tTqlhETd5Lq8Ey/dbdsTaod24lCfURgM2odCLom0NTUfiKtE/QBq6EZdIVExMu8pEEfR
	XFAAEj9M+l/2efwLHm7dludju9q/LHz7w0qQJdvyS0tJAjtOT3Ky99R3tFuryPTWywgxpAeCMQs
	AD1oZ1IPfhLqXyV3iIjYh7LupMf6o=
X-Received: by 2002:a05:6512:220e:b0:5bf:bbcb:509f with SMTP id
 2adb3069b0e04-5c14c02e15emr627836e87.37.1794189790992; Sun, 08 Nov 2026
 18:03:10 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261106090342.2601665-1-hongxing.zhu@oss.nxp.com>
 <CAOMZO5CQtcpb04Vp49Rg_+DHoozRpQthW3_YNAYQHqi=VOmpEg@mail.gmail.com> <GV2PR04MB120197A63428B4142714A8F148C732@GV2PR04MB12019.eurprd04.prod.outlook.com>
In-Reply-To: <GV2PR04MB120197A63428B4142714A8F148C732@GV2PR04MB12019.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 8 Nov 2026 23:02:59 -0300
X-Gm-Features: AclHuK-L3h5gzP6mZBeJdIsXpM-rka8mrZeT_p3Ww2YWyi1VobDmgIX4-64aPE0
Message-ID: <CAOMZO5BLAnXVRMQLz2pJuJfcGgDWiQcoZ+APfYkBd4UainfJrg@mail.gmail.com>
Subject: Re: [PATCH v1] PCI: imx6: Enable L1SS support when supports_clkreq is true
To: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>
Cc: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hongxing Zhu <hongxing.zhu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Sun, Nov 8, 2026 at 11:00=E2=80=AFPM Hongxing Zhu (OSS)
<hongxing.zhu@oss.nxp.com> wrote:

> How about to update the commit as below?

Yes, it looks much better. Please send a v2 with this explanation.

Thanks
