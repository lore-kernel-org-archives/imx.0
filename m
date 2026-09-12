Received: from mail-qv2-f9.google.com (mail-qv2-f9.google.com [74.125.230.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9F136492A
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 03:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789185579; cv=pass; b=hNbvbE0dOa3tqItvgCkt02n4HJuBxSJeMsmIILCT+VE+xpq8IZqNPHsyUl76JiWZzpGug2ghRg9HfMDmW6E2oc7kZz47cxN5q095rXYQA/8nfXq8wUqOio5ZIl0KW3OWpJU4dD8X18TDT5G00/tte1K9UuPOfmXgYtJuSkprjgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789185579; c=relaxed/simple;
	bh=BkL3lGBHwiEi97Q6sw1wqPYNFpmHLpnVSD+N4L8TFo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKQt89wZoKxL0BYySeybbAVh/CnFa7BytkA/xriUGcMEdv98QzFN+JXvhCp8o3TZ138qxEJh+6O3Eei1KSZXGXFgGSEHV3Yzu++1mwX37ZXppg9A9fet6qhnee7jnkMx8D0R/7OmUv/wlo3ZAsZRTXqpVXGLb6vg8wdt+CByaZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J29NpaH/; arc=pass smtp.client-ip=74.125.230.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J29NpaH/"
Received: by mail-qv2-f9.google.com with SMTP id 6a1803df08f44-91033ce28ceso6983156d6.1
        for <imx@lists.linux.dev>; Fri, 11 Sep 2026 20:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789185577; cv=none;
        d=google.com; s=arc-20260327;
        b=iJG789Z++XR2WIX3gcx2/kfgInw8L4oAsDRWA4VQyoSSr+SgwAsBflOEySIRYzVv9P
         11zITuO9bmgm+4Wa6cma4a6fn9vmQ3QDuvIMAr114ry+5Y6jeb3nZsRW9iZ3lekPDp/r
         DKcZyWFNEfDk/eZzUIyc/+nDNY1ZNwpDgsRjH5dWbpknks9EfPQezCQIAibeuaXWTH15
         P/nfFGdLx0LwL0YIRJKhDf0u+/8JVBTXlQKV66oFVwp84npaD+pK8C5f19wasUcGUeMI
         yWp04rjZ5xWKL/tWNvPAAVHMV4RtPPRNGCgBh5oSuzODmH/HTjwTbA9n4c4C7NSkMu7D
         pasw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BkL3lGBHwiEi97Q6sw1wqPYNFpmHLpnVSD+N4L8TFo0=;
        fh=4a9SCJHuLeBWhGwlH+fI0dw/Yqb/+MFht9+8hyDZnYY=;
        b=db/tdXY/xI8hz5Vb1eCYiNO8fdvHFcC9T6ttDNp5JUCJvjRyQYyZIxU6E/u0+xCY5C
         UpNqdrgRYxQCoTxfg4zqItkZVyVnDv3y38PNDf2MDwoHfqAkp3r++EpLTAbEuApoO7iA
         3RzL9HNk/rsURSi75yBjxAcYOFnrebRJNrMl3anoiBwdJuIlrL1RmVQINdGrbp6k17U+
         8QWO1xY5D34Fs+UcCC8iv9sJ8c8ACtreSw2kFN27Yz1K4HwNh/CQFfSUesNVK+2JEibY
         O39XuT2nZb8H9qPlizKO98nAwjyW/hP00Yj+XcxmYmqDg95hQcrC8Lqxvl/N5VBI6MAO
         uWcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789185577; x=1789790377; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BkL3lGBHwiEi97Q6sw1wqPYNFpmHLpnVSD+N4L8TFo0=;
        b=J29NpaH/kOctqydnjUz7C747chfZbMrhww7RJ8LW8Iiux653VXiEd0hgarIJq2+P61
         OzVQstuYQZXEBWkr7Qux+mjJ0K4a5HM8bDq9mBLg8i1UPLwH+KWtbjpSKK21gDuq/THF
         yYclB9BmDu4O7WyI7ajGkqCMV3zUPCKy+CYef86WuR3G13arfOSnjjS2JMNxDl/eJjx7
         vVfu3o8nsFVCMRM/f0jfbh6VmEgQ1OaSL/KAkrHaY3lqK+99MwZkmgVropNFQhjYMpbB
         mKhJVOAy+F6emsuuQeFLizUitZgS26Y5yhkBU9hPi+J8rYs9Evsqkx9W6SwVpx982gFt
         21sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789185577; x=1789790377;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkL3lGBHwiEi97Q6sw1wqPYNFpmHLpnVSD+N4L8TFo0=;
        b=PAFnl6cG85gth9kTErfuwpfGGPF6r+JymvAndmWZ0MPjX5pXqEyKxgl/6Q7dGNoQAn
         Vj3nhkgbi/8LnLy+17xyZ173ieLh0LM10YH+1l/4CwawF4Ep3iQpcGQAm3bNOYCYMbHK
         tzte1CqU7kP1hN1OeTLsbITflWQQ5+xjBWLzJ5gPaNqJezfuHcKL2KCiQLjlVq/YC5sa
         T2Obmu5ptKKokRz1K30P5pLkvzSunjJTWgrvINBd7nlJbYWJi8xI+9k/V13YKsBSVxF6
         udzkerh6X3iR/rhXgBWBKM8NJTYEADDl4yLCrdIJ5KtHmKVR+DOS/Ap02MpQsfwWYaBP
         nKhA==
X-Forwarded-Encrypted: i=1; AKwUvBz1lVuKCdqStWDaSlZ3XssHSQlPHxW4G66iGyuudBvNez9OgmN8Te4Tm+rHPFxfYChlwwY=@lists.linux.dev
X-Gm-Message-State: AFuF++lu6/mGcV4v/O8CGk7AbiGmhhoU5SapM1hQuIn7HFOAT1yJkOTo
	nkwcFfx+Es9jxSuKkHvKTLEs6TuBNP1M0+4BbETFW3RaLuuIKrGSOtlAyhwka5XC8dQWf3HMubu
	6dNvcOW39jkAy3dLEwl/+f9RjuZOPeVc=
X-Gm-Gg: AYBFou1rTmpW+euru/VdD7WBoNqzKSzy5zW6mebNPQoO9pXZpvhJ8wZR2Jn8hZ6VzlF
	8ONfeSpCHj946fuY4i/DgsNkBG2Jx0gAtBWAlvda0nbFg0E8ShK8jQNJeu3fiRA/qrIPUQGSTCs
	ViQub6a313pytPsff/MOiaeX0UZuP8MU+M9rKsFg+hBqNWaIhUE4/S9HoHyLFDlSE64xaBzfxRO
	Do/z7DlkexeLQGw5Wznjh27JItj8MZExMZ7CpDirZL3iETpz4aNuUkcxavMP7J2S8NaWWWbI7fe
	sSYOqfI1run82H3WME2DQkv0kQ4YhUaHAPgae4SZoKzVBdiBra/1mYcSajwLTjWFQInVLxq8uLU
	hrFUmFXmhkGucz5xY5p9XlG/KEdL9Cncs+KaaTJRV
X-Received: by 2002:a05:6214:8446:b0:912:15a8:bd9f with SMTP id
 6a1803df08f44-91215a8ec1dmr55956796d6.7.1789185576987; Fri, 11 Sep 2026
 20:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com>
 <aqRI3N5FPX1dpIlk@gmail.com> <CADkSEUgkPyikkhqLBOVEeS-H8L7CvUN8VD88=dUuTeFB8pUM5w@mail.gmail.com>
In-Reply-To: <CADkSEUgkPyikkhqLBOVEeS-H8L7CvUN8VD88=dUuTeFB8pUM5w@mail.gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Fri, 11 Sep 2026 20:59:26 -0700
X-Gm-Features: AcwNN1VfZ_rXL-z6In5wMRJEgOMU7kPx8LknulegWooIebA5av8sYgSMw6by5S0
Message-ID: <CADkSEUhpe5sX=C5NfUrFMoP9fOGNiFaJ5QmEAVJ=80p8H8S9HQ@mail.gmail.com>
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

On Fri, Sep 11, 2026 at 7:08=E2=80=AFPM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
> The Risc PC and NetWinder lost their audio drivers when OSS was
> removed in commit 727dede0ba8afbd8d19116d39f2ae8d19d00033d. RMK was
> working on an ALSA driver for the NetWinder but never finished it
> (IIRC it is in 2.6.0-rmk2 but probably doesn't work).

I just remembered someone wrote an ALSA driver that works on the ISA
card version of the WaveArtist, which would probably be easy to get to
work on the NetWinder:
https://lore.kernel.org/all/1440445816-28593-1-git-send-email-linux@rainbow=
-software.org/

Ethan
