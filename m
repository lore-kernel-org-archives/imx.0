Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF002580C3
	for <imx@lists.linux.dev>; Tue, 25 Mar 2025 13:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742909896; cv=none; b=FF7yfFQpBhZ9hUbJIn4lpO6iM+0/UPSIGQKcqLnjwP8iMp7qAE0ttQ+4dGwewOOM0eQ/RD1Ku81boJSg6KV3elQclLqaIBDTwXisKj1OHmxo2BW3wN62KtoR26LmbRU6/AquoZ09cEtTsOTnYU26HrpYg3zdlipmWEMvGdUDRKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742909896; c=relaxed/simple;
	bh=9vJQXOVux1nsVJWDEzTcb5/Ceg70DOuWGdhP5xFpo9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATJh/6jNDyKBEgDaPWlbfjGTJIQVhUAloLB8QNhmHGeCjywJ3W9b1YkoHxAKS/M6lk+stSI6O4R4eeheLmoVikfdEskAS5O+3fJH8qAuHqZeD0X3oidjkhsdP5EJOAeBSan33ZVnsetKXWh4t8eE24mIzbFIkrGl6nE+ysO6DlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jw4/3sXK; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jw4/3sXK"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30c461a45f8so55846211fa.1
        for <imx@lists.linux.dev>; Tue, 25 Mar 2025 06:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742909893; x=1743514693; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJcwO6oJh/3y1WM8EogHyJVWkUsi3cC2Ve5E14+wX6I=;
        b=Jw4/3sXKN/sNL8Q2Yd8cCfVg5EnqqQYXEDS++sFe/x7iXze0Lm7okLFk+Dsfffm0gg
         S2r2RUgZKN64tF1hqNgadLfjF8Jxw+m6Yq/5/8kKdMsvhigoKVpPHAumO72vrYNXs9Nv
         N9Uxr7D2hzRnvrsZ0wtScUFQxhQXJPqAEye6gsND8Uc5WOLcJy/MpdsFKt7TPzicYe8U
         NW2Uh0Ging/CNz3u8uaKQuugFoi/baxgqfsOZ4f3VVoCgadpUeGcQWcGSobUTEtxON/l
         prpohPdiMnuPzKA9xFnqz91TDmvkDuy+2YLuqZzd+tSxY/+Hr2f3WTh81tlJ4raBKgkS
         Ujdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742909893; x=1743514693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJcwO6oJh/3y1WM8EogHyJVWkUsi3cC2Ve5E14+wX6I=;
        b=tuZfSQ9KBAqOrYCT9IG8rQxrPPtjetCpmo3QmG2c9gZi/dBlHDA8+6w+0Sokk6wjaZ
         VrcI3npxuyErWjVnNBI+wvKoeVl7/KWKiXJ++NQHkJQkr/c51NR7qBYat9ZAgvQoi85B
         dRHavzWf00fSMFfooISCWsGtvTY/7oNHs2xPmg4K8lU9YulnYUaVlQBVgng++AirjBVS
         dPXI1GPcCtRjPNzt1W2JvFxhlkNWhJCFV1UtNIQz6Ffr+I2fwHW2dqnDicgtk5iI0a7B
         8JB3Yj4uAeSoLiANOavz/S8pSvYSXx1LPncrJjHbt3u1OuZyRvgSIqsaT4YlKXXQLZ53
         j7RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNo+1TV0EwiRIq+xLdnV7F/ptWOSnX7cfqq7I/DEqNdOvEBjpGjmAnU8S0dclLIJ92oZ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJdealHXUcJSTRN5WirSkCVHA5+UZWMrJntt+awjDCuKhLchW9
	AzwtymEFnShNFq6wP74+JDZZ8uH+QHqYfJs546RT1/kAJXptSEIW42qd7uNsURJFnA8beHVLcAq
	gRg27MlzKTvmfG2/jrbw8yPtQ9zg=
X-Gm-Gg: ASbGncvjshj0f/as79CC2NZqWHpmQDNvZK4Gp/0eweIlVcbewhfTSOYlHq8MNigcp6k
	W+h73EwN3ereD053mVQLaVvFcog3torDMIse2ty+YSd3cQ9PYiER2gf/JousD7BNOtJmobrbINP
	rAIOvlbuHxcfkd4ims1bABlgOmHhp80wp1uM1zZtMWF9dIthjYz+kK41XI
X-Google-Smtp-Source: AGHT+IE2jBJpiBJtfwsHoNJN87YabNIB3Bk17olZpd4dKi/GPoInYLNljjvK/5Lld/OJTFfbkolpcu+ArxWQkLCWGFg=
X-Received: by 2002:a05:651c:39e:b0:30d:626e:d03a with SMTP id
 38308e7fff4ca-30d7e2be3eemr64314551fa.34.1742909892678; Tue, 25 Mar 2025
 06:38:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250324234013.140440-1-marex@denx.de> <20250324234013.140440-2-marex@denx.de>
In-Reply-To: <20250324234013.140440-2-marex@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 25 Mar 2025 10:38:00 -0300
X-Gm-Features: AQ5f1JrOTiHA3zEWxRMp40SYF5x01ogmRGkPujdxnIUlw181i_K13kaKiIhlIDY
Message-ID: <CAOMZO5AVRZBNntXD4p+esOFMrex4a84p12xL509Hg=cVpRnO8A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add initial support for i.MX
 95 Verdin Evaluation Kit (EVK)
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Hiago De Franco <hiago.franco@toradex.com>, 
	Joao Goncalves <joao.goncalves@toradex.com>, 
	Joao Goncalves <jpaulo.silvagoncalves@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Max Merchel <Max.Merchel@ew.tq-group.com>, Michael Walle <mwalle@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 8:40=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> +#include <dt-bindings/pwm/pwm.h>

This is unused. Drop it.

> +/ {
> +       model =3D "i.MX 95 Verdin Evaluation Kit (EVK)";
> +       compatible =3D "toradex,verdin-imx95-19x19-evk",
> +                    "fsl,imx95";

The compatible string could be written on a single line.
