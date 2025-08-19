Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A91D305058
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 12:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606521; cv=none; b=FDDPr7wQOZNrp0lJblhbZD/F+xoaNe317Fj2C7qzWQGoObHs7Frxq9JH9uDbb8gE+S48WOJJGHYTE9BTtCnL8j9KHAUZHNxZaw4MAG8D3ODswRnzjZU7E+8tLz1nL48+c1P0b9wEvRKH8w2xmSh2LCUV0Vl9gflM3bmurl6Kews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606521; c=relaxed/simple;
	bh=73NLA3Q5TxwI++kTf2HzDKfU8xX1fFXua00XcnHgTMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFyZq1iZahYpO5RV/KyA2tu56K7VG9lQoTs0xMQBdNt60t1XBOPHBPHi0rR+XQxDF/GRSisYqLI3hNDIMLKKvwan8YYqGN9f1wNBk6ndyripSiq4vl0cl4I5p790gehJKBUjylmzmVUUM3ObFnau8lWpmvRZI9C9QV30lQ4mjks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXAdIvh/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXAdIvh/"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55ce5097493so5058911e87.0
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 05:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755606516; x=1756211316; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73NLA3Q5TxwI++kTf2HzDKfU8xX1fFXua00XcnHgTMw=;
        b=mXAdIvh/J7YXndL3bAdDy2iGeO+igYdX0H7wdUo1/dqf1EdyDciYCYacDu837bIDRU
         F/YgYsj/X7YEWqV2ltxHKryJcBeNHaGd8jOir+dkb3I/RHRfA2Qx9qwatGUtnQDPrRNH
         9EkgL/CnV5VmnDyr3Q6Fo6XTQ151oTK2w5QIQqDyh9rtLbP39CHQ4ralIpI/9x94a/mq
         FQjOogO9g0gGxRSgN8vJ0iUNvFX1bKJB4cOEpFdmRWe5REQRao2/KVLJZuC0j1Z0dEM+
         u7/59tjqi2B7V9anIoQkvilbgDk8dbbcm49XHfzoOXBfWozJ9bOZaszQLBWXT1UpXmIh
         Xa+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606516; x=1756211316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73NLA3Q5TxwI++kTf2HzDKfU8xX1fFXua00XcnHgTMw=;
        b=vPcJgbIZonXrT8EkH8Uf6trLSgNGvU2rN5lJlIQaLPhA1pz1d4L6NnZ+fqQ3qc0TgY
         Gg7lxj+Vg0eY4HJ+DKkYgnqkXFn4SmSg3HzSPj6jH+7CZ91SgUZFs20wU1kwFYnix1nW
         roJX75VpJxyRrUvssZ94I7YcN05cFvw3hwPidgpb8u96jMoQ19o2nTa96dTQ/F+3akS2
         DysmbUTKG6O81yq3eGCvLpuvuOVDuaQbGjki0iUSRmJ75GWPnoL8TmyedvSLfSuKDbaR
         rBxdbWw0igpnSkcc36O27JcXVBE0HwGpfxt7wI1Zn3dR1oL9zD94N8Pxkn11dQiSzltK
         kb4w==
X-Forwarded-Encrypted: i=1; AJvYcCUOhE7AYXFxfi37dUJ+94EoBi1q4CZOjTbFldRtFsOh7tt7MndRCBQtGWrCCo/7J1V+s9U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZN/wojACJ4vw2YCwnfo8ecLiSfuu6/dqExVqXCdhmxGsazyEN
	/Kktz8YrLd7Ebp7b9YkgIkBYJbB9xaqd9CWvQAEnc7fnog2RTuMbbWKoHhHRd3uuyK/Av1o1X+e
	1vqfq0ILpt3A32SzBnjHFIxo6LQlJWEQ=
X-Gm-Gg: ASbGncsT6ImddUkL7QiUD41LTuD/Ph6XiYOUhP635MeuYX5rmdhGCGBqsRmeAwShW0q
	AThWFSVa7IG6gwkHmNZFVG2iYP4YG7V+94q87+JPmcOvLSiAqAgWzSnNk5rZubblUrCpD4GCdlI
	O9o5iMIDlZ3AE4TlpPUvJKqvRJr5NKLACUC89g1MJT0581VnVATjLZzMvz71h9apxgifCK3WF6u
	crEvL6rJIpWhdLe9vyegGBTnDVaYmOjecTaZ1c=
X-Google-Smtp-Source: AGHT+IF3FdZF8lxL8RpNSUh6zxATY4SIt92cNJtcaia124EXxHOqkJg6/HCXrud0DRgssmpwJMmfWsjfkko12V6DytQ=
X-Received: by 2002:a05:6512:1349:b0:55b:8e2e:8cc7 with SMTP id
 2adb3069b0e04-55e008538e5mr661274e87.42.1755606516081; Tue, 19 Aug 2025
 05:28:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com> <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
In-Reply-To: <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 19 Aug 2025 09:28:24 -0300
X-Gm-Features: Ac12FXxqW79wXsLJzEF9Uadzf5uAoXqplbY5O5fWW6-5y6AnA9c00um3MEHlLP8
Message-ID: <CAOMZO5D6m3V2ZpFOtabrkvf6+SGE+3-xpAE=PZo+Ak=49ozyLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: backlight: Add max25014 bindings
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 7:59=E2=80=AFAM Maud Spierings via B4 Relay
<devnull+maudspierings.gocontroll.com@kernel.org> wrote:
>
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.

Typo: integrated
