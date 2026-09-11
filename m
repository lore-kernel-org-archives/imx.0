Received: from mail-qv2-f2.google.com (mail-qv2-f2.google.com [74.125.230.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06A83EC839
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 03:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789098289; cv=pass; b=GVFfIq2DXlufSYltpy66l2DQjxs7LKiVyzTHN9ttTUCwBNHrAwlQDqnXrBH0hFsELjrXJ6S+55ZuZFWtYPqR+u2zCu/13dqTXyaywXqXCbj1+bP0CkVYxjFSPuAyVBEYdLUz8rH7HENW+WJttlIHSGWQyxGys4/UJ/TUjJB8ayU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789098289; c=relaxed/simple;
	bh=9MUCzlT67j02Tdxv5MkPUdx0rDyVjNu0IwYTyNrltgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7jg4JGao+BXfqrG21++Q9CLov1Uf019Sjq057qEXw9fjpSwRUyBuhxXmnDjCxEzNPKRoYfW3QZTpz1O5Ef3eJBuYAmC1rAQXjajGboutCynu1UxJ9AuI/SVDIYjFvHJ2tMxk1RTJZO28LHHzRNhM52QWzz6zemUrF9GM34NWt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AoiuXMhb; arc=pass smtp.client-ip=74.125.230.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoiuXMhb"
Received: by mail-qv2-f2.google.com with SMTP id 6a1803df08f44-90cbfa89a42so2802706d6.0
        for <imx@lists.linux.dev>; Thu, 10 Sep 2026 20:44:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789098286; cv=none;
        d=google.com; s=arc-20260327;
        b=YgnbkwKAeiLtIheL35XgQQElSKoWJkC0GAbjv9DkuyYQK5o8nQSI6/xBw+6NWvpZ7U
         GOCkl8LL57PDV0uv5pTQw53QBWkp97yPRnf+UGTi8DyboKVuINouJY/eM4Z4nAIo/MRa
         3sNbxR6mQTbOqJEfj1NuqzGvRBkS9j8S7RZVBh6UgrJnNIWn+cXKx2CXE8jQGTakhtX9
         q/Q9Q0leEFUq8QYwScXonchfKXjupQPyNEMQqj1Z2NaEGYZV90Nqr1RcUaQk34ROATG2
         jfNM+eVG8sAVhsf/moF4HcCGQIVYVlsH5zLi7UckGSs3WmB7ooMYEO4r7CwrKFpi6oqr
         1V4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9MUCzlT67j02Tdxv5MkPUdx0rDyVjNu0IwYTyNrltgs=;
        fh=cU36hXt+5G631HmCASqnF4xb9Tq3so55eK5OlrUgRgw=;
        b=HgTrFGIEZ4tzigEa/M+BGY0mUvFf0LlC0yx0GY6L/casYucBDBDjdELkk2XO9zI87F
         x8NRjxF8hAiyMWhcFQEmJ7rLwAvjyPFmsMhC4w/A55IsrN2BtKyTyXTkwljyjMsJylKc
         PzqpMbePKPY6GHgTAMIayfVb5aNfpjUvJ9osIzHgbyUpMCxRQlQ412GOWuxFPBfrsr2A
         9kDOerf55zo0l+Mpi3H3RNBrhZNrm1D5J17+Dvx5oFforrOVd6GV6wKN40uEj91PPJuB
         pAbGBlNJf4IEZuvM5/mz446hSD9m9grYqCDD0J7S3/PIZetcpaZrnlIBeZjMfTu8LiWM
         DCbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789098286; x=1789703086; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9MUCzlT67j02Tdxv5MkPUdx0rDyVjNu0IwYTyNrltgs=;
        b=AoiuXMhbvbMqIxLwlgfHuRBfyGIYE31Jre4x7Ek6db6s2WW8Hhbm7UtnNgVBQU+/BE
         X2uarvPAW4xR9HB9ZzBktIWhvda8HaXHpGUEY0bxcUh74NH58BhU7L6COQHcjbUGfdEx
         qUrZWFM7xHPtMc0FM5xFZedRNI+G11S+WMEB2BWdxqrmicqNmAxt6LJ2SAXE14dijnbA
         udNqYjn+syCiE11STU+W2ItWJzC+N2+1mJNo+VuebpnNY7VxqMgr2GFa2vnZ2noBJYLq
         BMeoVBVgQr//7NIKjEwT5YDConnSb9h/Snp8EsaDP41X7l4IYaqw5cv3T3ALOzR69b9K
         7gCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789098286; x=1789703086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MUCzlT67j02Tdxv5MkPUdx0rDyVjNu0IwYTyNrltgs=;
        b=jcqFWXoNePYoJWNQt88oCnYzj+kYQL4ghrz6bAMRg5bO9nVoNkFDOUxHavHJoVtBCE
         CwJ5+mZVNao76xHS5Y73vCHTSING9EgrIv9Nxa+Sa7vFUI6hoCQ/WVFKolSaAZlHs7wJ
         Cc9fI6QZp9FsmKKmM/YS+10ZtA9zqGzIK5xJ/N9WpOvzaMHXlu7f2qDT37xoI4A9ViPP
         77+kvQ3FNx1snaDFSZDGaZLsm0RZlQa99nRx4MckZa4fgIvIWC1lFyUZ2WzPIYibeg/O
         LvcQa9KdkLfmXQtkymKUi6Okz7NO+3JDL6ketptFFOh5ItpJTrwaAxvDYX71XFaMmF7K
         3OKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqRkG9ETsbCvHLoB8+Rzc+z2IpYq6cuE4PVNIqz+PuZR3iFNLU4RfXsFcQwmpumz+m9dM=@lists.linux.dev
X-Gm-Message-State: AFuF++kYsLpbqXmF3tW9JIwrIEnng6FHcAGTdMofekrZhedUU4G1nKxP
	h/ulgADrbNszGjArQLIsd/br/BwiUJPK7gerglKRaJe8301wD75rccvTISZvn3nG34LmqWnEHc7
	oC587M9Zme5cARtXS3AlAy6X53PtrUyM=
X-Gm-Gg: AYBFou2SkdVezKoSoME+yQESbCTphstq17cyKN/pgF/ZfbeFkE6E5yw42efy0zLA4oN
	5xPEiD+J/UCaI1mR/CYbFau81FZgMJiadIGv+6NvFO/OPP6MdNiE+eXfdQ+D5S8+MEkW5wTGL8Y
	g2hUUTrYbKtyXyfINSUpmfyD35DkFvbGX78U7J2Y26Zt+3bLQp2XvXbDfsv+xkY7AVmUdDd8HGL
	cv11DZaMirUv1X8Fw28Zp5DSq23rcD+mZWgP8dBl2vv6QbaKoAtSjxvDaY6DCYRAAz8Es4kNsMg
	OfjjDTSs7y6i0emqt6vxGBAf1xMPAJFp3+qXcbc+dTiTicyPSbSillFbKTGNVAciGVabVk1EJjy
	Rmf/kUoYc6l3NW5n7xCLE6MjXH7JtXcOgGBmV3KGd
X-Received: by 2002:a05:622a:5987:b0:52d:918b:92e1 with SMTP id
 d75a77b69052e-530c84f326bmr40390581cf.5.1789098285727; Thu, 10 Sep 2026
 20:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-4-arnd@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Thu, 10 Sep 2026 20:44:34 -0700
X-Gm-Features: AcwNN1V1fOC0jmd_i5r-nVHD_ZWN_P0KCiZNA7MUoO0nuGcjQ9okMtkGALkOIWk
Message-ID: <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com>
Subject: Re: [PATCH 03/13] ARM: remove riscpc
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo <shawnguo@kernel.org>, 
	Karl Mehltretter <kmehltretter@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Ian Molton <spyro@f2s.com>, Jens Axboe <axboe@kernel.dk>, Helge Deller <deller@gmx.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, everyone,

On Tue, Sep 8, 2026 at 8:29=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> The main limitation here is the CPU bus that does not allow 16-bit
> wide data transfers and hence requires the kernel to be built with the
> -march=3Darmv3 compiler option that was discontinued in gcc-9.
>
> As gcc-8 is barely supported for compiling the kernel, this one
> will not see another LTS kernel release, so remove it now.

Because I think it's cool that the kernel still supports actual Acorn
hardware, I patched gcc 16.2 to restore ARMv3m support:
https://github.com/EthanNelson-Moore/gcc-arm-retro

This ended up being surprisingly straightforward - only a couple
hundred lines changed - and it would be even fewer lines had I not
reverted a commit that adds a use of ldrh instead of fixing it.

It is able to compile a kernel successfully (once you update the GCC
version check to check for -march=3Darmv3m support instead - I can send
my patch). I haven't tested it, but I am fairly confident that it
would run, because the assembler will reject code the compiler
generates with unsupported instructions - this is how I found the
commit I needed to revert.

I am working on a clocksource driver, which uses both timers (to
hopefully fix the awful time drift), and removes the dependency on
LEGACY_TIMER_TICK.

I also have patches for several cleanups to Risc PC-related code.

I am aware that this has no actual use case, but it was fun. No LLM
was used for any part of the work.

Ethan
