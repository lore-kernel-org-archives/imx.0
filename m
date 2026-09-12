Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE77E36B923
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 02:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.200
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789178956; cv=pass; b=edg7W8/8m7I0ngSd3eiJH4XypqOLwDNmPFTSdkRZGD7fGP1ndjyLfIK8QLmHSioES2fvvyldUdXs1ZCJbaHDkuak+b3i/UDClMfnIjehXRoF4XLkDXVFUV+Ri+RSGKAZzaEv/zu5zip3VGDulyOFOGhWUxErwmtC1WQNR4Y81NY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789178956; c=relaxed/simple;
	bh=mdT9ENWPEzBfkyRK8P1a2dUQlY39G8cEaKSfK8TCWpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxuCnWyJG7YINksmecQICLefMToF/nR83HGeP0vO9/AIeteUlvi8XQXlvciBPUjl7wkSI1rGFlLoC+YhEg0P+BCixLUhHHGn4foa5lx98vFGv9VGdIejKeLpk9sCV6NqL9yH3hGKe0Vf9nXrCLNunquPX9+QOJIeCSCr/IJo48s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0MURO8l; arc=pass smtp.client-ip=74.125.230.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0MURO8l"
Received: by mail-qk2-f8.google.com with SMTP id d75a77b69052e-530e2f0c0a8so4153591cf.0
        for <imx@lists.linux.dev>; Fri, 11 Sep 2026 19:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789178949; cv=none;
        d=google.com; s=arc-20260327;
        b=S/TDXBzW6IsesT6RiSfuoqi0JEOnIzOksVn9mvv0FYzlrAkGOysZfzM3zHWuQsLRwA
         +C3i/vXZXXzHYeFyqXiU9wWkk3xHDx0SfFvSqbYvBEaxuyEbbVVWE8iQM+qxLjr3tMjX
         8L/Ko1pNt07zTx5GzJl52Rme1gnFRm58/YvnpgNXYdXNvketKa0SVzX9+L0/cGTbfJSP
         vvbV7GIRcW6I11dqkr0q121NceqF8LSb159gP8MFUj+CDu7Gfb9HxGuYpo8U7i2qtHI0
         LyFQr9CsaC+tIuJpb8bE7FG6dZr0Ra6MTVrpmXC1kKFnnK3Plildf3CX5OduBD94pg+Q
         3+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mdT9ENWPEzBfkyRK8P1a2dUQlY39G8cEaKSfK8TCWpw=;
        fh=3gioXuUIXcHE1oLOhsgWC0jINS8FMfVcNNHFqH+Dudk=;
        b=TwwGR69djolqvDGIPt4sPFB1zQtv/2aSEsEeA6osxdcA8Bifs495Yhx1xKImmypIkq
         MlfmxX45LBGD7BLinLO2cPXzFvGD99rPQQKmP6DD0bxwrtXmU75UYmIkzYr9dII571Ys
         O3GL01rKj9+J8sed42m0luJgdAjo2xc6wVuNHOStntIUJl9Ro6bRB+Ct7hH3Z6rsezCC
         O8pjmt6XycMQfdDTYRFaVUyqJ7QFUDvz4bdb61J2GArf1BP3kSJGTnqJAftsi1/jj4fT
         qsJHdVoWI1hftMcl7JAQLr/lRjBVuPQZ3a+NNDdSuiuAddlAK2dmwFEU+3qA/Nlh0jV+
         +DAw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789178949; x=1789783749; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdT9ENWPEzBfkyRK8P1a2dUQlY39G8cEaKSfK8TCWpw=;
        b=T0MURO8lhUoNjOyxE849xg+N+QONmq3Gp+oeY8jPrfD7w13czcehbFBVb0tsoDk73e
         BESgy/mMJCDj7UYX6lV8ARqQ7RbkX6wQKfG8kvyNkIHaO46uVvyINc9sikRFbT/IG/9M
         HTEJaF3AYu2dThW8n8jcpj8Lzfcjo8xsLtsKQoTYvECZLXZHa2+pjYwO/r4EhBVaRzwF
         M3r0n5iU5L66Iki05tqAYFujOA2Lk3K82FCXfG7zToSfasi6Li3a80uRN/ZbebvuscNF
         vvKcKC9sKaF8XbcHMigOeM2F/MKME9lZzeforKC7bHYeSH5oFLatnWM/jAfieiYBnH6E
         Zzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789178949; x=1789783749;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdT9ENWPEzBfkyRK8P1a2dUQlY39G8cEaKSfK8TCWpw=;
        b=T0FNQKWt+MO6fD1Bhd1N8X6a0Q1MUUWRXqmToUAEtfVPUmbdei7XzS2fjBv+jGlwPA
         bsPW+5UpaQsCUlf+pjZdBJvVoryhhVP+iR7Xs0whSxxmF5iPCWb9KVpuqiFclhNWE4js
         f80u3u6HAbBKrqpRJOTBh1jGBcF0hMiB1hAO+UFHpWkA1oOtcMilnMlY4IOdODQyjFB7
         y1F7CB/sWw9j9RfZyY2YqQagkxAdgOwNk40SO1sG5TSixe8NHVZRCFh8ta2WkEczIvM+
         98G9HjniQYGmSbAPOCVR3zj8O0I+GUKglGMb/HyoP97MI8w6CCxyKj895vhLSxTMyQWT
         n3Bw==
X-Forwarded-Encrypted: i=1; AKwUvBxyb+FZBInlZr+WHAJNJkbnpna04pW2zfHjfav221edIfhVpPSyP8mwwq/J6S0Sx2HhdIg=@lists.linux.dev
X-Gm-Message-State: AFuF++kQGRgFYJcUg9ni2WMaoOj303RV28xfTGHefHx8r6UAMa9K0wlR
	xfn9+8kBfQrHqDKfjbvkSJTG9z1o8eBDJJqQ0bi++VqOR2+XoQfMaCB35cHvVVpOoie2Muu0CSY
	axmIV9siieYq6hGNPbhB3d+HHt6H2UHI=
X-Gm-Gg: AYBFou04jGiyN3XdxAyKi+y0fr95vMX/vmpztbnaPk6MMvDNucJIWsm6ydw7CGvpjJB
	INynT94xQJkUzNRpkNbzvpAdHsKHP/G6lWtWoBfdvmB1XuCF5Sudzw7x6QBUo+QNczS3dmYbdfl
	btQGDc9eFub6XlItZpPAMU9LByn305HumM1w19m7UA5S+KdiwrUc5nMOjKm/+6ErxYdJ4Dnb/F+
	chftgXgqJvilKu7UTZ1tZg+WbM5uJGHUpt0I94WHotittSE+CzjT7oxS2eIPFCeUf27FDr59sni
	iVVCWaugue+VCuzYg0XxTM5Eu2s8mtWAI5jmGFr01uu3mWLqk7uONy1fD8pX7ene5nEWKdEET4W
	DJU8tYv4/ZHgPEJaphUJzsgArjBf3wMi5WpZtd/KI
X-Received: by 2002:ac8:5dc6:0:b0:530:d1d6:792d with SMTP id
 d75a77b69052e-530e7dd8ae5mr13590681cf.15.1789178947506; Fri, 11 Sep 2026
 19:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com> <aqRI3N5FPX1dpIlk@gmail.com>
In-Reply-To: <aqRI3N5FPX1dpIlk@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Fri, 11 Sep 2026 19:08:55 -0700
X-Gm-Features: AcwNN1XgIQzd6k50BFzIHmb9Q0P_yN5Y-RnB_uEDdmfcLkrtltvi4fLr_oEAXtE
Message-ID: <CADkSEUgkPyikkhqLBOVEeS-H8L7CvUN8VD88=dUuTeFB8pUM5w@mail.gmail.com>
Subject: Re: [PATCH 03/13] ARM: remove riscpc
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo <shawnguo@kernel.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Ian Molton <spyro@f2s.com>, Jens Axboe <axboe@kernel.dk>, Helge Deller <deller@gmx.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Karl,

On Fri, Sep 11, 2026 at 11:43=E2=80=AFAM Karl Mehltretter
<kmehltretter@gmail.com> wrote:
> I've made a RiscPC emulator in the browser using QEMU and WASM. It boots
> Linux kernels and currently emulates a StrongARM RiscPC:

That's awesome. Are you planning to add support for the NetWinder to the b?

A couple things that I didn't see when I glanced through the code:

* QEMU needs to model the broken ldrh/strh instructions for the Risc
PC (but not the NetWinder). I am not sure exactly what their behavior
is on real hardware (though I have seen forum posts where people
investigated this - I'll let you know when I find them). For now, you
could just have them load/store a random value (:p). It would also be
helpful if it could print a warning when one of these instructions is
executed, to help people detect and remove instances of them in e.g.
JITs.

* On ARMv3, CP15 register c0 is write-only, and you don't model this.
This caused Linux on ARMv3 to be broken for a very long time before
support was eventually removed - it was broken even in 2.4.18-rmk4. A
patch to run Linux on the CL-PS7500FE (=3D ARM710 Risc PC on a chip,
used in the Acorn A7000+) works around this by keeping a copy of it:
http://webpal.bigbrd.com/patch-2.4.18-rmk4-wp3.gz. According to a
comment in later 2.4 versions, that approach won't work, but I don't
understand why. Also, the patch fails to fix other reads to the
register outside cpu_get_pgd() (I forget which ones).

A few things I know about early ARM hardware and Linux that might help you:

Before 2.6, ARM support in the mainline kernel was very incomplete
and, IIRC, unusable. To build a working kernel, you needed to apply a
patch from http://ftp.armlinux.org.uk/pub/linux/arm/kernel/. There are
no patches for versions newer than 2.4.27, but the 2.4.27 patch mostly
applies correctly to 2.4.37.11 (I didn't try to fully fix it up
though). The last patch that was released was 2.6.0-rmk2 - it has some
relevant changes like the CL-PS7500 PS/2 mouse driver. There is also
an unreleased 2.6.4 patch - I should ask RMK if he still has it.

The NetWinder development team shipped patches to their kernel with
additional features for the NetWinder (and other ARM hardware,
including Acorn). This is the last one:
http://www.netwinder.org/mirror/users/r/ralphs/kernel/patch-2.4.21-rmk1-nw1=
.gz
I don't think most of those changes ended up in mainline.

The Risc PC and NetWinder lost their audio drivers when OSS was
removed in commit 727dede0ba8afbd8d19116d39f2ae8d19d00033d. RMK was
working on an ALSA driver for the NetWinder but never finished it
(IIRC it is in 2.6.0-rmk2 but probably doesn't work).

> I used LLMs a lot while building it.

I don't use LLMs for environmental reasons, because they are often
inaccurate, and because I like using my own brain and don't want it to
atrophy, but we are all entitled to our own opinion.

> Your GCC work looks useful for this. I will look at building the RiscPC
> Linux kernel with it, and at emulating the original ARMv3 CPU too.

Great. Let me know if it works.

P.S. I have a few UI suggestions for the emulator:
* Make the display bigger and able to lock the mouse/keyboard and go
into fullscreen.
* Remove the LK201 keyboard - the NetWinder used a normal PC keyboard
(if you add it), and the Risc PC used an Acorn PS/2 keyboard (a normal
British PC keyboard but with no Windows key):
https://chrisacorns.computinghistory.org.uk/32bit_UpgradesA2G/Acorn_RiscPC_=
Keyboard.html.
Just keep virtual keys for the keys that you can't input in a web
browser.
* It should be possible to middle click using a modifier key if the
emulator ever runs Risc OS, because middle clicking is heavily used in
Risc OS.
* I think some of the explanatory text is unnecessary.
* The skeuomorphism is cute but inaccurately represents a Risc PC, and
I think it clutters the UI unnecessarily.

Ethan
