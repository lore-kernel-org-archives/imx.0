Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5294052B5
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 20:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985087; cv=pass; b=qXzJzD8UAxQE53jmBV7q2HHeDg98f4FDXA76LHM8bg3N8zv18s++5k1vOFFUZiKB4nh7UdM7Z5iTiq0cuCfDpXycCprvGrF84uV+nPyMsbMzbFj9uI0ZkJZ7cD5wS9yMOcDM8VZ8Bka7HZpDi56cebHVgFpUk4sas7iOx4SQOwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985087; c=relaxed/simple;
	bh=r0SYPe6/MLvVhiIoMkAkIXOuQ6dRGOznaSyuFqfT4PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPgSQYfRDUDPeyae/udINMWGW1qNBBXOPTw66i/TY544fxApK32CNeiqMAi0Qkn6nG9x38oVeKzCfH5GZ+9AzvSdJFQze0l5cZnvtq1USrB6nqn5h23qJLGrGsYtkQglLdDJtOtvsM+lKyGbCL0G/nOR+PtQDVKgGCIRtK67CqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YV905v+R; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YV905v+R"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b6188a2c0eso262383e87.1
        for <imx@lists.linux.dev>; Wed, 09 Sep 2026 13:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788985078; cv=none;
        d=google.com; s=arc-20260327;
        b=bTNlt2BM3zLp9bzYTKRdcyrqOexzc+Sm1b4PdieNkr58r4TiQzVXOWebGQ6sjSgD0l
         RCkaCJ2Y8cj55ID8jSaz6dtHnIAqihBSWWO12lL095aF+IbFHD46kBhR9Dlm4dmFLT4E
         5qcVNR1Rvpzs3dAm7eSc+e2F7sGY8qwFB6GbGFNqdgpNuUjdxvgNTttDsmMfhkt+/bcP
         y7/33YLBWF3IpvgyyMqFy0jp30vkkOrH0+Mhq2oTrHQWMtQ4oPXOVzlQ3ifG4MYl7Y4R
         3/wU1v05utqZns+6icpNfqRp8LDa9S/VEvCppNNvBqAbHy3EWNd5PdTsxDa/3NTUoeSi
         tN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rU/edVWvN0al2QuqioTnSDLV4+asJJGA8jcDggwnG3A=;
        fh=oxhiPzRkMSd8LBbI5XfNUwhp6tbD2vYi6up2pb/yOgw=;
        b=XDgGxlA3OnMErOO/WuO0lMddRzipQF1BqmajAkexc7DKIUws1RrNDcs+ZYLwMHs/16
         uQIAYM1h7x87IiOMQX1YEq2n9leSn5L9j7LcFJVxQ6Y3v9w2yfJu+DwzDZCTPtlxjAr7
         Ywr04psuFajmF7Rxelgfxo9G7xrFaHxmESl1MgnngivJ0x6ZzBdbZpQ+XJ744OkhuGgQ
         yDarcriSqC06eIV7t99xdQAPYzK+4W+/UrI0/7k7WtK8exx+OVwUVqjwCjtVtDW8l6RU
         okVfCVORVBOVCSrzUaa04pOOExMjuM4tlJeFp5qsU24uZltdDkLOme1BBvHf6b/kWpNx
         7lWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985078; x=1789589878; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rU/edVWvN0al2QuqioTnSDLV4+asJJGA8jcDggwnG3A=;
        b=YV905v+RUYIp6hapYiI4Wl1y56pgxS5REPj57OMTYOTplVi7l/39TbheCqphg0POYG
         MZhQaE0GvXdK7yKC0xlwMlbFceBDlKNjxPyiRc5jVqclOaD8IMKKtZf+POz5X43pNVZl
         V60Ok66yCErb811Ac2Nkgnx/vSq1XY+rJSa+x+ruBuisltLO3rFauN/3RUHYP3O/mcIl
         cScHVRH8Ky7NQvMFYEGolo2L1q5svBTzkl1VQgkOJgSzkeZ+TzB7hmS3KYiLlOmi4FC9
         nvUAqbFW+P/6DYLe27+uyqcDpyz1g5WRgMjMEigdNVWNQgyMxzp/N27G20H5+smB4cFp
         eceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985078; x=1789589878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU/edVWvN0al2QuqioTnSDLV4+asJJGA8jcDggwnG3A=;
        b=nlTbGZrF5Ybhmc4ejBBjL1v/R79sWj/X5a234EsmfSdWkIbFuKxmk6EUsqGyjVz01k
         JaR6wKryjRqGK6p0fMO3VUEiPauft/pvUq4ufKYjng+NfXtcNDgd0G0N7GyK9PS4+10m
         L5IYGgHH+wI2Ler9j+tZGYowIn0yQ/SfAMB0EZA0VBm6ZMvpCmpMiNZFw0lXEzbMym5d
         zSp3QEG3zcm/fY6+JOGrW7CeFnLSVIgtdc1dcrXacFUavL8WbE5rEWVkEOVSsAlyCRSE
         K/YHolLmjdDHxWj5te6K0aSZV+5HeAUgMAP9tFYqUqpJ8or+PQ3TaioTJUI0zSmDPv/B
         7DIw==
X-Forwarded-Encrypted: i=1; AKwUvBxie0WQ4vc4aoNACmM121ktK40Tp5ewI23O3QLKdSLMAcXtn531EcLdG43avTRs5cB43TQ=@lists.linux.dev
X-Gm-Message-State: AFuF++lkXCZ6kWN2pNcjQfHUIkJc4lDPrb73DTSSdf9pxfCHUSMPe+9B
	q+AZIXFhKl7/j8F7q2j4fAxprvvG3XXMWFGuV+XeOD8B+GGXWNPKY07hYFpjfBX4HbUck74Z0Cv
	Z5R9fGHLs8/NL9JZgAGFZW4flGRVzu6o=
X-Gm-Gg: AYBFou2b7Bv5jDQM0dQuP8e+CV9kCzdZ1qa36JSz6FB4BvT1bDWgyrzKs2TqbU1nEs0
	hGTzq/N1CAOUtiuyYtqEpF0dzmRn/DGmiXon8P85KUKKOGAik3D94FaxkM/OhkFE+3UgPJU6QR9
	E2hD7qeC9pUl4S5jO4GtWtUythV/eRKnSYxxzH3hIpAW7taeJKR5HyUuswsC3qjJU18pKONtcQH
	7vZYjxQ7WZkrbmroixh2CPWGR79ru7RnL7QS/Na1nHa58T4cGKsr92YJVKkW2CVL0WIkqimhLSY
	oQsNo1f/6TPK5PlZ/mqpLH4Qp+Z4lMtktHWqxSv8MF3S7WB7YCXL4WglfQbbFRZDs4ysu2CkQbS
	bEmsKuXA7Th/6TCLu4SRn1efm8MUA8UGTXkBKHQQFmV5x
X-Received: by 2002:a05:6512:acd:b0:5b6:1a7c:fd86 with SMTP id
 2adb3069b0e04-5b61a7cfdb9mr6159278e87.44.1788985077633; Wed, 09 Sep 2026
 13:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-9-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-9-arnd@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 9 Sep 2026 17:17:46 -0300
X-Gm-Features: AcwNN1WKZQyaGADU6lkE-GsXnisq5MVghkNUlNC3CqrQiDAXJmgIgXPSi_5sivU
Message-ID: <CAOMZO5B4q01XRGRfK_LoR1SWkvdP-_fbSHrE4BYq7gVf7k0Xwg@mail.gmail.com>
Subject: Re: [PATCH 08/13] ARM: imx: remove nommu support
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 12:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The i.MX platform has grown support for three separate product
> lines using Cortex-M based microcontrollers over the years:
>
>  - i.MX RT1050, a high-end microcontroller
>  - Vybrid vf610 suppors running Linux on either the Cortex-A5
>    CPU or the Cortex-M4 MCU
>  - i.MX7D similarly can run Linux on the Cortex-A7 or the
>    Cortex-M4
>
> There are no known upstream users of any of those three, so
> drop support and simplify the platform to assume that an MMU
> is present.
>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            |    2 -
>  arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts   |   72 -
>  arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h |  993 -----------
>  arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi      |  160 --
>  arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h | 1561 -----------------
