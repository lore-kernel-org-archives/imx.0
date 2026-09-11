Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272C935F8C5
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137512; cv=pass; b=tDsxBVvJRcmno6lF4mI2Q8y3YGedfezQk/u49/uImW671hLB8oMCXj2weCGlBTnxZ+Rqz1ccsOssEjppxgID06/pJzj0sjVKv6SkHgAIfifwlpEyDrIJLz1xCzuzPcXF9zoLmHuYXRjWlOhvlKDJmdl9qKT6uA+h3RtnGb3iWW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137512; c=relaxed/simple;
	bh=XLpKjuu4srfrU1du6/lAaUzD7jl948KYiIqSg/FlWVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XxxbOXhKnNsgmDpapNxCO3K4u9vaWW2yfDgind/SacaOt+0RcR/E1a0wOYpILJev+ouoBYVzh2dPvH55xMokPgzcFfaMhNlsFjEjdVZIWFzSINi3dE4CZCXjXRfoi8pgJnLkbXmK6GnSDThxKHb05WIZsrxJtKq29HFskkryM+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=JDWSC6T0; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="JDWSC6T0"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8588583a7c3so9079357b3.2
        for <imx@lists.linux.dev>; Fri, 11 Sep 2026 07:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789137507; cv=none;
        d=google.com; s=arc-20260327;
        b=oaU2gSA87S0l+dCmuQfKZg6W6uiBWHqcvVfXw+1HF1ySYo6/ImCnT+arGxRfqpfaMl
         cmt7a8yVBhNfdXsvsxqNRQCx0fuBCTfMyr5W6cipD1eiOgdpuTFDKoGu/dCgWu/65S0g
         TlXAcRAVrQ3C71hV8qSgCR2ACxAHCrLZrVIyEepOsDC2Fwcd5uA0EZe1cGeERwxiYwco
         iAVTSlvW9rdtC48XfBY9WcpyoLHsuqTHfIS6+A9evSsb8Ws2pS9JbFZWzBWQWt0gF8mm
         w0X9DUFlhZRrmn7jn6a3LxsEtNkTQb8yLYqIjA3bZhID4dBpW+A8HWNRiUgzNODNLH0X
         JGOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jpJbb5DSDD0uOBnoN5sYAo9U83labpJz6g7jqXOS7q0=;
        fh=wYNuuiC0enXWSERjNTxQruoCxnVIXCo13VmyL3PM4kY=;
        b=NuvkI7PKy8uVprQAHvezBCboTyxh6rWqQVvvdCC63JlER6vRyt0cDlcpepsdR/9vKd
         jvEUMIyFLe9iKWIr7YQPk+a4aGiMJggmpzOXuyF3JU6GWCHhDYEtw/+eZQe484dRwb8P
         /T39BUbFMhY9shIK1XrSMO1DHrCM9aTpSNZlVIGvCSZ4dFMz2kup5WF8wCsrXCHQWd3Y
         I4Ks9QpPp3wJKskb3Q6080q1o6eaVcrDFV6AYHrsikcnvtE3bWyunej9gJaQPdPv1X9Q
         y8NyvPq4uMfpFh1gaq5o78YaFYY4x04mcDu45DJcICI3m1+H2ba4AJlc8lZ2sMPk3Dzr
         ATTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1789137507; x=1789742307; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpJbb5DSDD0uOBnoN5sYAo9U83labpJz6g7jqXOS7q0=;
        b=JDWSC6T05iHIW2BGJPZ5BMO9MJYFl8yhNfptIDLzM/1aSq/KSh3FRbuIJFLH2lYMVn
         k0Xg8boaj+W4I8+f+D/Xtg7SVPqsqOjgWwejTH7b8J41soRRfE6T0phlfhXtzVzfbv6f
         UyV2WzBWvGwiZwe6SpKAKboLXU3tvE7Fun/SQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137507; x=1789742307;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jpJbb5DSDD0uOBnoN5sYAo9U83labpJz6g7jqXOS7q0=;
        b=BUko1UbBqukgKKdCiRxKGumuRALhnlV2cB1FrkWcUmNbpnIwciPO+8s1mWV37K6cJf
         Ah9pfpvvTP3wojql+YPKCR3bLwPmA7fz4bUsX2f2o4ArTnYZj6kQamc3RPybXNURDXbW
         7DH1KN6Ji6JUCgez4ySqRRuMEe4OJ0ypuzd62+zaO3pCGcmha6cIGty4bH9dZycjEdEk
         V6sDxm0fMaz+uyFyqJF9GWT0Xf4+8zMEChNUHFqEtO/e8ChFmkxKWWqmGXyCEOoFPAPd
         2ficwYRlEvqlRlpnRieltglcS92G83M2UA7tKWlh0gqOITF9SIYWeG9DYUcouqQbnG5O
         DjsA==
X-Forwarded-Encrypted: i=1; AKwUvBwzP6o+xgJO4PJXjFGCT4NJdJArW1zafqNwSqJE4As07FCok16dT1maMuCTK1jtBCqYt9I=@lists.linux.dev
X-Gm-Message-State: AFuF++kjLrVtSaecJC1OOHP2hrqgcMCKE26CRsKWKMdXPZJJrJUrHpz+
	v97IGeP2/8wO8BQCZCdd3PFWCmh/8ihRvcysIOYQY1Mr/1nFuGp3hw5wNVkLrUwKHuWCsz6R7QK
	pL3de/mk7Al1crAIcyUEh4n+uhaNOuJgPcfmI+4zzNA==
X-Gm-Gg: AYBFou1yOMh38M1pYpRF/G9YL7aRmBqFr38vcGs/1HvQdWG5l3U7Q0iT01r7KbkagX0
	sBtHn+9xLj8I64c820OijdatSUgvsD5lZ3kJDjcTjdYPzhENbWGkkyMFoNOgORKZPer9QY20hYQ
	viEYm1ff2x1D40MH6LxhTTIk5wcOD7kH2xJJu7g7grfyBfwSiAELX+dAvv//JY9kRjTmum7NLb5
	0y8kHvJ9Of7PUn1dkyFnGzUmkqc9x4nP4Hk6rD/7a9YMEF0R6zwfn0/hUoKNJaHVavdVOyqU7To
	XQWja5rtfzwCLrmOBYycXyK/46KyzzCbctyE9EOWCD/KaVXQmlt81KT26yR+0eyK
X-Received: by 2002:a05:690c:399:b0:873:5bb2:6c10 with SMTP id
 00721157ae682-884b7316b4dmr14810657b3.58.1789137507274; Fri, 11 Sep 2026
 07:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com> <CAD++jL=ysmPgs8yKH5KBobuv-eeCHHgZwvo1kvHOFuTwhkaOew@mail.gmail.com>
In-Reply-To: <CAD++jL=ysmPgs8yKH5KBobuv-eeCHHgZwvo1kvHOFuTwhkaOew@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 11 Sep 2026 23:38:14 +0900
X-Gm-Features: AcwNN1V8w1uOymS_yob5PvYfeWzm1NprI6fjxQoUm4Mlo3gyAoZUnypuVT5lDl8
Message-ID: <CAFr9PX=_FmMdR4TeP+tqURZdZCTjw8UYxAxeszs_vcpTbX+_aw@mail.gmail.com>
Subject: Re: [PATCH 03/13] ARM: remove riscpc
To: Linus Walleij <linusw@kernel.org>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
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
	Karl Mehltretter <kmehltretter@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Ian Molton <spyro@f2s.com>, Jens Axboe <axboe@kernel.dk>, Helge Deller <deller@gmx.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Fri, 11 Sept 2026 at 18:11, Linus Walleij <linusw@kernel.org> wrote:
> - One camp that are enthusiast like yourself. That kind of people
>   are running the show inside arch/m68k on Amigas and Ataris.

I have SMP working on m68k (dual 68040, real hardware) among other
oddities. I think some people would get a kick out of seeing it but
also I think some people would also ask why we can't just delete
everything that isn't arm64/amd64/riscv. I'm putting off sending
patches like that to avoid everything getting deleted. :)

Cheers,

Daniel
