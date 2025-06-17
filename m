Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23E62EE605
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750176579; cv=none; b=IApHeU7E/A+LLjntUVuK0ggWY2zZTZMOEVH+7gpkIduuISWcPKetVUzUA9zpp4QRIUvrhPbB4haCJh5TofKJEijv4RZN/fhVWztifGL+Xo73hw/QqDb2+09HNVFdl0iKClgfh22Jh3LLjqLaNVSjXQklG370bRwvILHuB/tdY5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750176579; c=relaxed/simple;
	bh=6lRf39IOFGk9vChRDzG45TvkaiHToCiDTjoqKrr0L2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhMD8be9MEz+hhCqGsd2ujPx2LvDLX+pMacbAOGgULRlhPJRKwEmCRquddy8NCO9Y1BBWA8MbZyrV6f7fW0gFUw/RtKHohREdBRLjM+1M59uKbBxZDuOoPvX5RR6Gna68FjDJ7AvDH6YzekD8jPL7hXo4oL/esXvUyW4HJFWKKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Df6wsM+8; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Df6wsM+8"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b51f5218so4246243e87.0
        for <imx@lists.linux.dev>; Tue, 17 Jun 2025 09:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750176574; x=1750781374; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeAOa9AX6Slj4C7yIZpdSjzaS73WhA9Nhvt0jU+KKiU=;
        b=Df6wsM+8icX3pW2CfmpEeInAFtAveFIxl9O5TP9cYZfFCzJ6WwYcLM5KZgmaHQX8SG
         a83s93A8wRy46mLlVAe1G8Az+Wl5xS7UDBtyyH0SroVBxmGuvIAePNv8/ozjXFIU5rpU
         1ld2vka6P06HMDZIxYtfUJSGdIv8RqEh9CmWjUncN77iBT8f7f+l0oHY0pbJSPD7T8yx
         J0KR825ru1AWNxzdS2R0QSXCZjVYzKdZYDWdYrHJXgd8HBLgQvCukqar3Or1rOU33PN/
         KlloXg527tzV6G+dYxFNW7RxGFzkgJ5PjxdW3NdmEGiSg8lYRfDVH5+3dEqGR09OWmIc
         TnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176574; x=1750781374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeAOa9AX6Slj4C7yIZpdSjzaS73WhA9Nhvt0jU+KKiU=;
        b=C0la0483J/8VT+eYGkguZmblss0MqVB7Gor94hr0x6CIOKqPRbct9ywudpso6Q0qAF
         3BT4XwFFSg+ZAYgh9ogqpul/Phv75jyJ4oIZd+Vu7SUw5GrPKe19z8cF0RuBhPE7bYZQ
         IlvwGN1t4sNU8Ioou1MCnza5ovX8D0Hd9jClAuIqf76CCr7iVL/a9SIo21dnww9DrLiy
         444phrvGKbx10FRhUV7hsDSFKFqcJoxBaqh9I2LXnqAbq9TT3VzqCakGGYHMulEJdvJQ
         Vy+cZfKOo+IlAJo5UI3XAdkzmLSvV2fOn8pDvehJD/DPXlQRfTHqZl4u2EEXQl02q3qU
         Uq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXO7DPQtGENFZ9fASTdsYiaQgbkm2oT/5+KD9pblybXTvg4Ad7m5Xi9fSPuopyIO8PostM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjC9SmyfLOzpXkc85WBm3feu15AwCL27D7rFwCEma+Qsq7X+vD
	L/Ro8ZvYqgcb28C4NVBMMKfI8lY2+ARZ9j1BQbdSOLGtUwx1ca4baGhm98jLURGO7RXAtno/g0h
	h8dSBgKvhYN52ODCfr+w+OCnXBSsuNLE=
X-Gm-Gg: ASbGnct+tw9DiboA54E1yJHpaluHwp40Hsr1THE1GcLt4NuPrPuS/VgAoSSX0NKZtic
	RWZX/z4qJT3+LwKLUwNkg2Ivgh02o7A6qjF7QWP6mdBvc1gTnOYE61R/ao4YFirHpkN2IBJZGhX
	k7Wn5d96cI1oI9dhk0rl61AwQBRKEOWH+IQgd3a+ZYPVX8SbaE9bwiQsuT
X-Google-Smtp-Source: AGHT+IFKnarzu3vsVViFufKxgE6x2pOd5ugUq1TG2ycTridBUmhnjKV+d/pUZBbN2A7kGXCymCs76fD4YU1LGW/OB1g=
X-Received: by 2002:a05:6512:39cc:b0:553:3770:c912 with SMTP id
 2adb3069b0e04-553b6f42a3fmr3675159e87.47.1750176573453; Tue, 17 Jun 2025
 09:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250616184820.1997098-1-Frank.Li@nxp.com>
In-Reply-To: <20250616184820.1997098-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 17 Jun 2025 13:09:21 -0300
X-Gm-Features: AX0GCFuXOdeJJidoSYPc7Vhn4DpNd-OEuHgzSb7KUMF9M9ColJNBmTcaRq2M4-8
Message-ID: <CAOMZO5DwJ9bk26TBU46_fU0ydwQL__dxUoOULuKyZYWRdbJ0YQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] dt-bindings: net: convert qca,qca7000.txt yaml format
To: Frank Li <Frank.Li@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 3:48=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +examples:
> +  - |
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        ethernet@0 {
> +            compatible =3D "qca,qca7000";
> +            reg =3D <0x0>;
> +            interrupt-parent =3D <&gpio3>;      /* GPIO Bank 3 */
> +            interrupts =3D <25 0x1>;            /* Index: 25, rising edg=
e */
> +            spi-cpha;                         /* SPI mode: CPHA=3D1 */
> +            spi-cpol;                         /* SPI mode: CPOL=3D1 */
> +            spi-max-frequency =3D <8000000>;    /* freq: 8 MHz */

All of these comments are obvious and don't bring any new information.

I recommend dropping all of them.
