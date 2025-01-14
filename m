Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01336225412
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848316; cv=none; b=TAVNMcF7Z59PiFDvQOugyD3ncFYeOrVdBQtq0JG2YpM0Trwkc7FVDYmjBwu2gdFGKxqBmQtVuDPpFucxtKpggiiH5GJ6SF+vGb7+SPRG7Z+vJGL6vIPThqBHMR00OZ9hu6KrIy75S6oPmp7Z3jf9Rfy32POh00eePecOrbODrAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848316; c=relaxed/simple;
	bh=4vhKhJFrC6JYbngxiOyCcDr7JeL3UGoiHu/Elu/1nCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icT9dv4qCyLVm/D7gqDOsHHjubRLSHvarX/3MfnR1I+EsVhQsWGsxg/qgPOvvkcmTrucgZWVxZLGhJLnyGWUsor8MPU/IBnxTQf2GnxxHa3Cj3imk7KuHlygo4TsQrfL6f9JjK5Xw/zudi2d3iVySkyfwo7eVQx/CUky31Biwfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMvEceoL; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMvEceoL"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaedd529ba1so747411966b.1
        for <imx@lists.linux.dev>; Tue, 14 Jan 2025 01:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736848313; x=1737453113; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vhKhJFrC6JYbngxiOyCcDr7JeL3UGoiHu/Elu/1nCA=;
        b=TMvEceoLS9o9JTYQxSEWW+Bri99pUoHRklmFTu/3u4eUL6AXgsEjUo2avncN9ofxdS
         lnO5Xpxq5biwvlS/BnaHAuKLrgIE/L5HK5KtfM8hcw2gVsD0pvrb1KSHZ2g1Y8w8kCR+
         14tU6lV2QNnxUAzsCXytxtrev8CBJGOEmV3isY47VC44PaJotkLQNch07fUw0aFEbdl6
         KF6nGEvpiGuiAi8/M9RprZgTVkBTVTkEfiX/DSj//1G3h2GY5AhlsvXPXx6mYcsCazIn
         EFBoqWfOPwFux8g6qS12MWBkraPV6Qehi4igsxH+xxOflua+SAfDGfbai+OZUNnCHx6F
         hxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848313; x=1737453113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vhKhJFrC6JYbngxiOyCcDr7JeL3UGoiHu/Elu/1nCA=;
        b=MinV/fjQtkTGSxaM1YIEjB9yGrW06WJfD3QeSsd6Jgm6mjlI1HXY8JF9YVf19wNXgk
         hTPqd1hm6K8iIojwki/L2fdgdKmx3OHON2yehr6jWCDF9XODcidLLf5c7hB6wIgjaM8S
         BGi6MnTtbTPm1sr3IzQeuPhjlyKKLR/qr2hT6lTjMRjX2nWcv9aSGpp9l/xdsAZ2Bagr
         Y5O/7Uo47aiwDRi8UiTPFIQkLcZARYRnKEgz1MCG07Va+kPv+F+oSd8+j60mk5xi/jZ3
         QJDV9wKi+xhuCtGcYxVn8wJhRwE277BERFtgNEGof+CDNNjr1kkL3iusM8Xyf8VXcpz5
         XuFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaQwe7VI83ni8wGiwNwaydaFQBGEVIyBYC5/z6Fu+B57jgkhW+G5Inr9pOn6iWoJRq6jw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDG/V7RybzZaYlAq7kAa3LtEALsBvzZWO5Z3Hz0f5ZUqzWT6jb
	0iCdewSEPaUC3vUsOJ+G8aenvoV4Oh+upRF+xw6HG7VqIT/T6bJxjr8sQnBB0n3+gO0O5gMhONr
	6qfBVbKN164nreo8+xJZ4IOYBmAA=
X-Gm-Gg: ASbGncsRIQGAiw6N18rgWBPjv2aNOpaTVccZ18dJT7Ioa0pnm0WY6rgxZ/jzFt0Y+r3
	+xXKscoy2KlZRGbD7yXfakig6jtyKFdiTlLG0nQ==
X-Google-Smtp-Source: AGHT+IErJxrzE/fPLNIE9OFTXNlcCjKKB7eMnozUt0cKWjd3vc1cA5OjHKMV2NdK/m8kjackNKlo5HDJSzrjCAOUsv4=
X-Received: by 2002:a05:6402:4415:b0:5d0:abb8:7a3 with SMTP id
 4fb4d7f45d1cf-5d972e000c5mr61231608a12.6.1736848313193; Tue, 14 Jan 2025
 01:51:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-3-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-3-0a28731a5cf6@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Jan 2025 11:51:17 +0200
X-Gm-Features: AbW1kvaodGOQwkiNEnvsBKGVicOgrqCop4aPxft-hJqem49G8vNcWLLBKL5YFKM
Message-ID: <CAHp75Vf9HyLioEe+tN4VPMCMNveS1KODZSS3E7pH9a7hPyDLdw@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: mxc: remove dead code after switch to DT-only
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 12:19=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> struct platform_device::id was only set by board code, but since i.MX
> became a devicetree-only platform, this will always be -1
> (PLATFORM_DEVID_NONE).
>
> Note: of_alias_get_id() returns a negative number on error and base
> treats all negative errors the same, so we need not add any additional
> error handling.

This one is good,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
