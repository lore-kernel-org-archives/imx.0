Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1D22595
	for <imx@lists.linux.dev>; Wed, 24 Jul 2024 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721818991; cv=none; b=p+G3e1TxXq7LpF4zbW2gCUOdFkeNvH9Oac+aApz0UJSYcJ9vDaioeiMyWiWGTbc4ruR5ujiMpb793JowThCWZ8/5w0L+ESXT1JE3+lRbWvC+6PRPJMUOoqoILCTlHuZqK8Ox4o6K9nWJckILXJavY5M4uOERBEP9oDd4RgdvSLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721818991; c=relaxed/simple;
	bh=ZN7NNcyU0S1YfbfqhcSpoRrSZCDKUwIk4FytmHMztN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcxSPi/fFOb8p5hFSB1ZbwRSEsWVWay1pGRBuMJ7wQmOucc24GPYn5TlryJ3FvVrLGldcFXluDuuErf24LPxwxVpqi1dvf8MrKssH4HDHDBCSSPVgRuky6rYs6z0t/rDtBk4BxQKTOXuWFOyzrfbnYYHKoldBLySmlEqof2CErc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/PuaHfb; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/PuaHfb"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52fd119f09aso45884e87.3
        for <imx@lists.linux.dev>; Wed, 24 Jul 2024 04:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721818988; x=1722423788; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyZGnPtusGipb+xlX5GGLVHXWIPkIHym0QAfrDKBQw0=;
        b=P/PuaHfbJiAnQdnphgnfoq/Gktr8XRHMrdntrgzWOGsJJZnQ6dKkXgnEsYiRnPWkZ3
         4LtP7vt5CfY9La92irtdRHXNEY3mpWpovUIxuHrk8+Q211L64jDQ1cIwHtZU/kmjGnLs
         AmeqyZWhP1MPZObZHj98Ts4IZxB9AOiLP/Y4/BKFjKvzyIrXSzq+Re/2zLIXHI63HvA+
         WvSciiK24o8cmxZ1303KrxKgfXfOdOMRMeygm/B12rrfB8HT1C81+zHkQS/jq2X1hPgB
         mm1/w8FR7+lLh6sx2CYuzBotgfpsLdIoS7aBIioVePy0dwGvpZzCV0cQ8OO8y3zCZmr/
         89tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721818988; x=1722423788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyZGnPtusGipb+xlX5GGLVHXWIPkIHym0QAfrDKBQw0=;
        b=GybXYWP5JXwrydkbNo4mQzok3HqVNj0uTR7wMeuIJbDKDS0Nba0WoJoSMlgWyPDBHd
         WIhXhblSXtjR2h+gTr/qkFYTjWAXEBsrlBtGKz0eB/cqY3gREmVeX4oJSkKqlg6/YmXt
         1uq7m+l+WXBoAGFBTFLB0s3TNdWEsbcta5fmVE4ZD8IhnVj7LF66apUj5S1rtmjhUHnx
         qw7XEYY42UzGDiOHvGVleBbYwuO/Y8cpRsblayrY/wyqj9ik8rTVmDklvmO6XFuq4jwP
         DTCvBnPjYVf6itlMvvrtI2OHYLeF2b/yAgiIHdXNEcnM5vfKeyxjmHoCtRrqDg4sXzmq
         phqg==
X-Forwarded-Encrypted: i=1; AJvYcCWfZnuG4eR2sagYY9dNMeXrPpmQQspTrspZ9aR6YjEi26V+PIrsW7liJKlRDr8nZL90NYE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4KNyigrmsqBC6a1YUh4fXPmcQPbS+DNa5X54lIkmkaQoRPuu3
	MtkRye/aEkhWeK9UhQWLyD71C1W88nTRVsBr3LQGCtHIQau8+D6JNP++PFUgusOzWFsp8LrinnD
	E/Pn2jrFYeBfx8Ulhd0DK8HDHezA=
X-Google-Smtp-Source: AGHT+IHZ28WTL9zR0J5KAqNR5wSGYqOK6qMP43wFHJpRsp/GYZIHczD0y+ox1z8i9Eixd7+YrYjgxA4F1tkro8kjh5c=
X-Received: by 2002:a05:6512:3f29:b0:52e:ccf5:7c3e with SMTP id
 2adb3069b0e04-52ef8db6223mr4997174e87.7.1721818987347; Wed, 24 Jul 2024
 04:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240724105847.46962-1-tarang.raval@siliconsignals.io>
In-Reply-To: <20240724105847.46962-1-tarang.raval@siliconsignals.io>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 24 Jul 2024 08:02:55 -0300
Message-ID: <CAOMZO5AuiYD4KBZcfELRZsjEYXpPi7zGprvC7vq0hxfp75v5_w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: freescale: Add Ethernet Support
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tarang,

Please mention the board name in the Subject:

arm64: dts: imx8mm-emtop-baseboard: Add Ethernet Support

On Wed, Jul 24, 2024 at 7:59=E2=80=AFAM Tarang Raval
<tarang.raval@siliconsignals.io> wrote:

> +       mdio {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               ethphy0: ethernet-phy@4 {
> +                       compatible =3D "ethernet-phy-ieee802.3-c22";
> +                       reg =3D <4>;
> +                       at803x,eee-disabled;
> +                       at803x,vddio-1p8v;

These two properties are not valid and not documented anywhere.
