Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB0938AC7D
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 01:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774490000; cv=pass; b=UQOObItiVMj28ZZGGvAj54ClldPJ3Q2O8+CfWqRuW5seYiWKU1HBzo2cKn/5UwNVMFrkwKacnuOb3b2+q6ejnwMzTDs3iebCMNuWLHAAjj8I4C542YwLHJWU85FqNqffVA0vw743qK3op6vGRYrV+XG4tj3V16z44jGCnSNjoY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774490000; c=relaxed/simple;
	bh=OkQDhqxdu/VghGhiJbxfiIKUvNi36C2xoIdqMy2/5jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=khcvtwF3gASVIuzRnCa8tOFXp87UKpoefR/DcdUs6vKhkT74lIDKotoHwVo5IfwozJgMiBSTQ7R1pyODOwHdkY+zkTNJJJVaQNNy0cI9m330XHZoqENyrNyQ7Od61lvQtsVtayOGf0VGYb98MDRRENozvd3OtbkaKDhbfRX2Y24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tKllO8ot; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tKllO8ot"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b97f9587e6eso59372866b.3
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 18:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774489997; cv=none;
        d=google.com; s=arc-20240605;
        b=YOWz6Ph0Pi8RenmAfb1WebfOKJ6N6JM20d64EqxVhdy0YJo9d+d0GQyf+S56LV93WW
         F99J96U0psxUvA+KoCYcX9q8U0md2H0qpsSjqJuOdt/H8y/At/R49GtCYft8jA/vE2N7
         qf7XFFHD+1/cJHMlXdadsOR2to2OxVirTfVeV7jWLX5Q7Uo5Vk6RoIo9Ur/IdVVQni6U
         0P2i8CBX8SDBp5wVts/7ng/638mUZ8M8Sukt0ptiZO3GWKN7MuNFTt4yn2SNHBBM2z4s
         1TZisL6Q3XY71nxIjySyoVTuZqZg9kM3K5hEFInAKPf8YLoiAaBU86qeqa1fjoybkWMU
         MfOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OkQDhqxdu/VghGhiJbxfiIKUvNi36C2xoIdqMy2/5jc=;
        fh=08I401Bj9hGwf8BaJk88buDQNLYPwfWLTFsv64/kgZQ=;
        b=ESD+e/P0MoMfknSFKx8NEqtFPM/kJeQQRn0OYuUb5QoCYynkWRTKykfOYz/nU7L9wo
         rdco50C8siRWoAjVFWTpXIIMobv3/bb0sZbuNcmC25nO/KJGw7YNh0fX85jaBX4GIpNX
         d3Qe/lSr9khTVXdoZ2KV9mm+FSadLOmY0FooFbRJ+kc6eF/rqqGedA579wHYq4gdskoO
         d+ylu+RjsHgnJajfQhmSOEtQO54rIEGVGj5zyU41OrXG24aM01Pd6kEKn0EzYvJUBi2d
         sv6j+VJai69orWESbtkrgW/aP6SaCMrRTy7hC1KOdSvMBv0FH+ctyJSJ4adLH6VcyAZV
         uvDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774489997; x=1775094797; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkQDhqxdu/VghGhiJbxfiIKUvNi36C2xoIdqMy2/5jc=;
        b=tKllO8otH5AgkpAk2lCB9tDaATkcvihTf5Uw6WAZjyk3NtiUZbM7Rbvm+L5r2tSXQQ
         ECBPQ7ic/S8Lu+6M3kTkptRxdRtr1n3adLSFU3GrUDXuYEXKGaGun4OD+GB52cJC7tAn
         6u7D2fGAWpIoVGU+pz9We8sfARgO0e3tyVvR2S3WBBN+yLVy9KLqathWPtJ6mTt+cIwt
         vt+TNOEZyep+R+aHvAR0rHNN6Ge9bgXYyJOhD2KQcJOyo/1QbfpR+BvMmsuYYKKKoGTy
         z6dY3GfuNQaqZYgMbGr5193eqR8OjbbKsG2VkWr+XFvaYGVjhZuPrGkszbkGAFIPxd2m
         lGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489997; x=1775094797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OkQDhqxdu/VghGhiJbxfiIKUvNi36C2xoIdqMy2/5jc=;
        b=pS1m+EBL9KbU363mutuLwOXZF2Xph2wBS0VTKGPtf3WvWcAfNmne1PiSGUMchBJv3S
         euvr6TZ9OYWCVaVrL1fBUBaqbhJHUIHQjMu9aDVuGY7a2VCPgPIDStJWVqnRSxTAWz5a
         YSueAk/lIRYk+reipmMdVG/CDASHEXNGOL+28W0w8ZXBQlKhMh5rSP4dB4bTiHrH5lLg
         b+s8LjasRahmEslS+ksW8cT7K1vnZ4ynCJRCQXGqmo5NNg3eIXEAApR16Iud1fTNY0J2
         mPBfSCQR6csgI/AzYcvQB2a/W23JbZFAhFTq8hjTbKa3z3V1vz4qx03/HCQpHB9pPT7w
         DXXg==
X-Forwarded-Encrypted: i=1; AJvYcCVZdYIuf+qO3cbsYyM/8XpYc9js1fNpHd8GkkG/+lbEbKPA5fIE5TAMSVD8OBI6hxN3ZfU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCHouwiRnpoPg7NwmPUIaLQNGJFfGhaGZmtTs74LuV0UqCKNn1
	cBQh7y+h2AJwKVJNCFkcClvfEsiptmT5P7yx8AssC9ORgCFDLt2b6SzjnDy8wdSo1TVyOuPfnYA
	6N9g2JY2lM4i97bzmBOizwZlBsb59dQM=
X-Gm-Gg: ATEYQzzdGlaDDkLjL8gEMK7u25CkA+8/uQGZXtVtWqRmPssAuj2XdSWUY+z9IbZRjHk
	70uEabJ/LMJRS0IdgWHLt6e5Uae2Bw1jrD19TBcDVMGkzik7QHRq+FpvgX3Qi/jT1E1D+Y0uLtO
	NM3IKwgSscJ7QYa1vVcSnYqQTlvpYbb0eUoWmqgvrej0p2vjfAta6Dt8r/YWq60RrW9CurqvEoM
	wK3gyPwa6QxdLB5kgGMJXMP9rm+3TJpvShmHhqtUOZT5eQyoPpZNS0u5GFfIRjr6ViuaRJiLlSa
	RzoGX6L3ricK6waJbYrYhEiZMHY5lj2/cDiUZN4UoxlhExHHcpTe1YvolKg+PPGX6Pv/izldAbw
	67LLUaw==
X-Received: by 2002:a17:907:3e0f:b0:b9b:155a:6f92 with SMTP id
 a640c23a62f3a-b9b155a77ccmr272420566b.7.1774489996810; Wed, 25 Mar 2026
 18:53:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260306044536.149204-1-rosenp@gmail.com> <20260319220901.GD950375@killaraus.ideasonboard.com>
 <CAKxU2N856yYXURRf3td-_RCpe9hyX=zAy3qtD3ki23RjgO+a4Q@mail.gmail.com> <202603201114.9A02FDA977@keescook>
In-Reply-To: <202603201114.9A02FDA977@keescook>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 25 Mar 2026 18:53:05 -0700
X-Gm-Features: AQROBzBSJyDOFvefMdXxKt78jroAsA-q-37591igukparmS24ZzPgm6s7TLFqAI
Message-ID: <CAKxU2N-eVyzunEC1PivSmRF9xctOF2NZHDJyoVUMYHHXCN6qoA@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
To: Kees Cook <kees@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 11:15=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Thu, Mar 19, 2026 at 05:11:22PM -0700, Rosen Penev wrote:
> > Technically kzalloc_flex is simpler but I assume a devm version of
> > that will be handled in another treewide commit.
>
> Yup, that's coming. I wanted to get the "first pass" of the base kmalloc
> family converted first. There are a few classes of "kmalloc wrappers"
> like devm_* that I'm hoping to convert to type-based allocations. devm
> is next. :)
As an aside, I recently noticed a pattern of kzalloc + kmemdup_array.
As kzalloc_flex is basically, kzalloc + kcalloc, Would a kmemdup_flex
make sense?
>
> --
> Kees Cook
