Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738FFDDAD
	for <imx@lists.linux.dev>; Fri,  7 Jun 2024 01:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717724333; cv=none; b=WFCBoRPbUbKV31nMv+qBQAqWsYVxQQz7FKq6EiB9bo3ByyNBD9o5Uyw971pMS4E5B1c2F7bK/nN46Cvm8a4l/PkwWVTqVkFH5uzK0hnw745d00+OEX0T37KwnsRACgceXshg+xsN5lLzDca7BshzGvJ3iVK8Dy4njyMOWb3Y2Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717724333; c=relaxed/simple;
	bh=6bxlEeb4hb38QE3vXuSzO0xUdVng62y+HycXyjetSBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5ph7kX+1nlMrgZZs4H8p/6l8m2gfh3nhaCT8bQYb9u9gPHUMJsmFXxFefX2GbAdU9q1eyTr7H3LO4JdE7YxqIKuVmvMRUYgCX2USaXSTQxGZgXgLYDkqr4jVg74HFKFeTh3ZHkYBw/bJsTPNOIHO5rWBjaG2cDB1KrJdu0G1Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qjze1NF3; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qjze1NF3"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7024ae1971bso67666b3a.2
        for <imx@lists.linux.dev>; Thu, 06 Jun 2024 18:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717724332; x=1718329132; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrJtzXtCuRxEweUkMCnAiqcogNc07ylGEeZdwo2MLn0=;
        b=Qjze1NF3Y71Tu2KiU5pr+6BwvgOFjwziJrhk/3XyaneU/Bvz0vYn/V75hn0mEI1JTZ
         mPXGxwcCk0TJ5tmZ8cqpId6hqW1dtMn5YkRI4qCP6znRKCLbzyJtYgjCvyGQpU3bReaD
         SrWRWjbTjAAYHPEi/G9xTG9+KPAAj1y/hb/G7xZplzq7xH7BNzZo9UO6yix/dEQqXLWc
         AQsJVLQ8twZsENzRPeRJFw02rIGu321AYq5nqG+BxMUS1v4/O6Ga8QaOdyGFj47iEGse
         XHOV9M6WQI9xn1iXW19mpFMceoejE7dfxePN9eAtZOTFIPBJvxsAaOqd+vcNdI5q08x8
         yuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717724332; x=1718329132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZrJtzXtCuRxEweUkMCnAiqcogNc07ylGEeZdwo2MLn0=;
        b=laIe2ievA6FcAaKJDT8hoQbS4nz7bRbjvnHT/iX9nD7tL0+Q5fquNDP42nv2QzPAXs
         YHaLKVrD1FRb9QkFOxJUGyeErzZIcERViiLp+LYBSaEABMeMPdowasxhydX2k1qCGfOZ
         FOwvb6RrSaC+DjQ0xHxa3JU8XJhb4MaZJUZaa7nDO8QowY8j8JD1rIxkhMiH0ewQLgFJ
         7Rt30eKxEV5dyPc3SR+xymb3PRYKSsM/lIxvMQ7UqT/UjpUzL70vrBwKGz1nfUwaHHrT
         QxHEGU4qgcRzK6seBrR1DpyE03PoCmywGTGHtLVuF51iy3kZXv+mI8PpsdSrLawRGNQZ
         /a7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNpKFJOWpc/AZUebdXucXxXR26pkt8vFWR8HixlUEZN17mH3gVSwPM9sisPZn+SAwPPxWX9yhSq3r2lFNoElJBERNT
X-Gm-Message-State: AOJu0YxgPLEAePbtXK0pNe7YhdqtzNNi1lPJwXWah+gxQyJ4jqnpuzb/
	9uYU+alsHKBMI6WsqJPfsud8Irc292unpXmqgLLfKihcuxStysqiVb1M/LcLRqISgVNsRJWTVvh
	6XK8GqqFMYxfYx/5nilFdFfFYP0y1Ztc0xLw=
X-Google-Smtp-Source: AGHT+IHcZ6tSjJET+S1F8rqTj6jNBqUAkJu1y9qhZ7qLpSho5tRoH6yXpyj/NM9EYgmU0DW1AZiEV6bFvns3v6VLrdQ=
X-Received: by 2002:a05:6a20:9485:b0:1af:cefe:dba3 with SMTP id
 adf61e73a8af0-1b2f151f7f7mr1124821637.0.1717724331641; Thu, 06 Jun 2024
 18:38:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240606-imx8qm-dts-usb-v1-0-565721b64f25@nxp.com> <20240606-imx8qm-dts-usb-v1-4-565721b64f25@nxp.com>
In-Reply-To: <20240606-imx8qm-dts-usb-v1-4-565721b64f25@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 6 Jun 2024 22:38:40 -0300
Message-ID: <CAOMZO5BQ9zpSQn=m1RHLKSmYH=ZCq79cF-3pKKUxjcn6FfS6Tg@mail.gmail.com>
Subject: Re: [PATCH 4/7] arm64: dts: imx8qm-mek: add pwm and i2c in lvds subsystem
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 3:47=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +               brightness-levels =3D < 0  1  2  3  4  5  6  7  8  9
> +                                    10 11 12 13 14 15 16 17 18 19
> +                                    20 21 22 23 24 25 26 27 28 29
> +                                    30 31 32 33 34 35 36 37 38 39
> +                                    40 41 42 43 44 45 46 47 48 49
> +                                    50 51 52 53 54 55 56 57 58 59
> +                                    60 61 62 63 64 65 66 67 68 69
> +                                    70 71 72 73 74 75 76 77 78 79
> +                                    80 81 82 83 84 85 86 87 88 89
> +                                    90 91 92 93 94 95 96 97 98 99
> +                                   100>;

You can use this instead:

num-interpolated-steps =3D <100>;
