Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453243A6B68
	for <imx@lists.linux.dev>; Mon, 25 May 2026 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698739; cv=none; b=adOdU137XBIS3aZG6/uM7Co8GYcDr0Rvr/K9Zq3tPME2C07colUGArDoRAoHLA3zXg5ohUOioCdFCp9cNz2xW+hHIuanBNg0tsMiVQXGwqLltgszEKKU72rzhB+8uLtSX63qwxOO2yXOepujVre9VQSolQi9EsZarm/ekSNZGyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698739; c=relaxed/simple;
	bh=HzMY867DBTN5pjOSjRIUSRzjlYQe63UJPO23K/q0Zy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=twUyx0jgvRfoUFiobbXyEifyezmUBkmv5bD1zpvxeE69sBYKk7iWkVdIEN/ruKfJ0gejAJRY6WGzSRou9MBsfqqFRAfluZVIXPODKJS8Q4Rtd8Hx4lzyMG01FtdNiUn7PVHeoZkU93JzMScCVdpv6NihODkpQ4o2Ma8KJbrXBZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDlpKJe9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDlpKJe9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0901F0155A
	for <imx@lists.linux.dev>; Mon, 25 May 2026 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698738;
	bh=HzMY867DBTN5pjOSjRIUSRzjlYQe63UJPO23K/q0Zy8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dDlpKJe9ynN4tivU+0I/iVNXkmz8V7D8cY+DYo3vXqn1UYVshRJXYUhU9+Ggzr/rP
	 trO3grk83wo0wkCTxglQBfucaDHfctHTHb580BoJpX/OHzK4mljqCnxAvzi77zSsvh
	 ULf/bnWdghLs1mVRRxE0/+n4XlYuH/JD/kPtzEqOOYLjFcRdXkFID7j5sQqLzvYne0
	 AEC0IpDrGu/M2640NGZecMpy9+bbPYtf3J/2nTEDIZHhb/4ZMjehX7CQq2aq0fROxp
	 IEhrNH76zfunOn/96KhpiyzQkzzVlkFgnGNnC+YU7cpcRRWwcm6+2ynGgx9unWllqh
	 1VJWvK9b1XQeQ==
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7de431da8fbso8253322a34.1
        for <imx@lists.linux.dev>; Mon, 25 May 2026 01:45:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8tPyk2iTGsv5IziYTt5kYoqlX58KODthNJG7k0wA+4TqbKGLj+IrOY9weySpyGIXGC9Kk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQVd1ypVhfPJ22J9e+ICh07Jk88gi7J6CU6/0R17Ntmwch7vXJ
	SUSJRivxMBz1l5V8M2p+sx2l+Ivz79KLNTVuaqFWFtZydQL53gLpgz73Df9vd44AjRyI4SXDkxe
	9fP7rP7Gv46PqvT8eJGmOQuveYNwOjsE=
X-Received: by 2002:a05:6830:270f:b0:7dd:e032:3ce5 with SMTP id
 46e09a7af769-7e5feed03cemr8122305a34.17.1779698737336; Mon, 25 May 2026
 01:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com> <20260504131148.3622697-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260504131148.3622697-2-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:45:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLmhUPUxkP=RNqJGVJRfuGS2YXAYt7JH64sisk2MAMxFNw@mail.gmail.com>
X-Gm-Features: AVHnY4LfJIB0vsq8DdAkZL7tiUgsJC6U2Cr8b926VN452Ay9Gg3rU34cLJlAkLs
Message-ID: <CAD++jLmhUPUxkP=RNqJGVJRfuGS2YXAYt7JH64sisk2MAMxFNw@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] pinctrl: s32cc: use dev_err_probe() and improve
 error messages
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 3:11=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> Change dev_err&return statements into dev_err_probe throughout the driver
> on the probing path.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

This patch 1/7 applied to the pinctrl tree.

Yours,
Linus Walleij
