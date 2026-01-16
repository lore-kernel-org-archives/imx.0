Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E60347FCD
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 11:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563455; cv=none; b=bBfm0w0+dyYlkz58uXj2/BOy6Qj+Al07KC4s1ViSRyJiMRv3Zq318/jmEon6ut2bb4bcYr/4is7QDtp/gpGvYpjMPFKMFwRTA21xO4XumaG1Ui8Z/sV6MUyvSdCJR+WpUNzZeo7OLJROmdB8RCyMkJVPYtl83y521CT692WdFOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563455; c=relaxed/simple;
	bh=3EDZ6Hz1nATX+2jEFsTu5XSVR9O8yVNT5ZlhpnpofOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NkJyeDrSahFPJKDc/RylF7DWnoyYFMEjGj+Axr+iaJpRjFxrsJhA90gKr4zuLcg/8UvAcTCvFKzafhxQsdLDxUUN1wgwQ5oAp4JMn2An4UWfpg49SLVweBqeLQHfs45ypIOv0SoG6T+X/bRbbaY0ckwJZIDJ8Y8xNXbbRafZTVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAQs4IQx; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAQs4IQx"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-11f36012fb2so2864655c88.1
        for <imx@lists.linux.dev>; Fri, 16 Jan 2026 03:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768563450; x=1769168250; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tunLRA8cGG7n1tWyYGBPKMFj1K25wk5tyo1xF/Iy8M0=;
        b=HAQs4IQxbPa+2JqRrJwVnfS/EsI0LhCxrsd2qfNodG4wYmWvgcgZS46pAr6Z7RWpQ3
         tm/XDT6/iKKGhY4x9U+W54+aAqKw6nxVn0uL4T7pq4CTz0eMyZQHX352clksEpQYBQiV
         ImLpsnv/jt/S7/tddrXjAc+pcy3BeAedi7FNS7m2HQSBbXDv0UTnMW84IFon3qD9TCD+
         UDdM9Jg3JXXkeSVTZF/XLmhf2Rgfyo+HNpHs3S4KfUnnI9T6NL7WF+1ICgAqNFOXMWot
         z982Olvu22dYCyGudessaiY1uha2sx1Szts6ymTL+VjH0nQfnQGepX21Uktd2kok0Yvz
         A1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768563450; x=1769168250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tunLRA8cGG7n1tWyYGBPKMFj1K25wk5tyo1xF/Iy8M0=;
        b=OU2PN0BtkU4DVUFRomFEwIlgpaTCAsIsGjHz2ega0VbmkxFs1NwlsmegIVUcy7Gnkr
         rnIZKuaqXWNRu4PYhmCbH64r/K1wCtuUHKGAk05xvEpX54bl0EgyhlSzjcgAW545yUkr
         n1Ykz3z37XtJxgbXf5QUWGffvtmuZL1zNG/mOkOrEd5B8ik1T2p/fFg4TKiuoR0xu37V
         eu9EkhM+073IaReMHs2/MijWXY0QbieArpxhvJWm3a6wX32+/HpR/dLFdiX72dh2XzBC
         P/Udn5OBExK5VGUK+6zotpqF1TgmL+e0TVnm13SLHWAfpU+/E+D+SYSAyyOec2HVJNBO
         gSLA==
X-Forwarded-Encrypted: i=1; AJvYcCWTxl7jTZSyeXuyqF6KK4Q5T/r08cBjxGUjU8PzRPVFEz2MJQimrcqsveUWCm+oS/x/oYw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaPv6NzwLryN6kzSeB7iaaQRvoVzwjtfy5U7+Jd9OFjwKqXl7F
	EkofWbenpbI/WYGYso+dv/XEZKqMRloNw/fhLZ6yz3mn0w+q7ZtpiB9giHWUsUYZGutNUpPmUPp
	TfvM3AlYiIuj2+w+WCG5zcZDFaoJHZgQ=
X-Gm-Gg: AY/fxX6GE69LPWukTac3SKpTxGZnuFXupKzQB4UcSlI6lJaEVtNwkZfC5sRkghcuq8E
	w7ut+EZwTKvmcs6czcxuKItiYFL1qA+eNDA9jjCFkolNbIuKoHTKmxi97tjIl2a95YWK0kxt5gU
	TW8cSOTnm9Rxz1m+vcz30YfW0K9X7+AIFW47Ut0TL57bwJ+ZCQGK3Uc4I8OQ0wNYhbQY2a0fcip
	/6hxkHZQK0n0vM1ZggzDbsLcwzEoqRtljgEmqKUOYtSDRViWtaUMTGuxo0+DyYaGEBnEga1yi7q
	8cY1IR8iJHy1a2wKEVU+2+0+mHQTDeCQmC5XER9b4oTFvu/HdgZMiArK7aSotY5G0zLLNcXo+bT
	vS9+/r14SVA==
X-Received: by 2002:a05:7022:1289:b0:11a:51a8:eca with SMTP id
 a92af1059eb24-1244b32e446mr1719538c88.18.1768563449581; Fri, 16 Jan 2026
 03:37:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115-imx91_fix-v1-1-9351c3fac76a@valla.it>
In-Reply-To: <20260115-imx91_fix-v1-1-9351c3fac76a@valla.it>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 Jan 2026 13:40:11 +0200
X-Gm-Features: AZwV_QgCFWkT1XPJWiN6BK-of6XJ3t5eGCfI_kP4aEIqHxCE_WCNGhfFIuQiRno
Message-ID: <CAEnQRZD2CvQLO2hBDbX2H8PeeNkzQmLoK6jzeF6HKw8HHa8ukg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx91-11x11-frdm: fix CAN transceiver gpio
To: Francesco Valla <francesco@valla.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 8:25=E2=80=AFPM Francesco Valla <francesco@valla.it=
> wrote:
>
> According to the HW schematic, the CAN transceiver does not have an
> enable pin but a silent one. Fix the GPIO property name and polarity.
>
> Fixes: b4bf5e55899e ("arm64: dts: freescale: Add FRDM-IMX91 basic support=
")

Just for clarification GPIO 23 is connected to a pin named CAN_STBY.
So I wonder if it isn't
better to use standby-gpios instead of silent-gpios?

I am looking at FRDM-IMX91 schematic file SPF-94610_A1.pdf.

But on the other hand we have

static const struct can_transceiver_data tja1051_drvdata =3D {
=C2=BB       .flags =3D CAN_TRANSCEIVER_SILENT_PRESENT | CAN_TRANSCEIVER_EN=
_PRESENT,
};

So TJA1051 is not advertised as having a stdby flag.
