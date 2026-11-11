Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794381369;
	b=LF3RnTEhvZ5uv/I9mMLhE3j9ty2y26yY0DMkaOOCcExKQAKXcGxo/iS7cIVTp4E+sSZp
	 XSA7OXr9EpVibL/HAgLVCkV77TwPNT5F8MTA+YcUlIhvdeMD9ZP4SstAxJoy+h/SLy+OI
	 0kVKMFdomJhXBG+dWmH2zsEfjQl3MwmFXpGZ6HzTaGqZRjAO7rIiYnZ086/HDzTvmztgm
	 /oJN0VT0B7rDbp32hWTVfW0tfUwsq58jBx/sJzx3IEJ9/I9WsexwM+Dqd3IDbweQG26NB
	 r4xMQP+JmUWEaKddJ8CITPyN3sMm8eLDvUQUkvDAAEp6OqF444aBRVa3fSDNl9xo6aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PS5LMiKFzIUnURDmLwbpwh2C/rUlEP4/H22PiA88mjc=;
	b=bagURhEMxw941cQ6xzdjXPPEWHESbw1bAt2EcdkR1JmVjRWKC8XjDMlGRB6Z3CBsvKKw
	 +bS2VcvbxNYf9c1PP/DAKzeB2tOscgWoFXFTNdWHIRfKHCB0Btwcuo+gjkN/eWDKaX3jl
	 M+K8QO9zeifNwqG4D5OTq1xfREpz3UnWsPY91o7nd9C70Mi1xAMshRocrTYmxEr4+yDeQ
	 csOFZIDdybVjc2ngHn2zvdhFRAJE9lxXUYTuBW5vBZ0qzmL0RbJ5Tamp5stmJposKUgaT
	 zftvlq5urP20nKsxZkOoAP767iA6iLq30K7+OefX33Cn+WZcI63Da6j3taUr8ybAI0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Hh1kNipz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F983606A321
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 07:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F983606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Hh1kNipz
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67bf3c6654fso3272715d50.1
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 23:16:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794381368; cv=none;
        d=google.com; s=arc-20260327;
        b=ssxgLEiYSoAj4Z3kS6J/IoBe4xQEhZs2RJ2XfXdC/5unh5oHemno80WMbvGaBz5Vpw
         e4n1vHiEALcSrGYU2Am6UetuHsbR9COT6zebYK5aox6fl4lxykgiLrhLSsab800hkTDL
         y81pEbslREDoRDgZ4ezPPOqscC067ekYXsCXRLO9BRbN0GQN0YLagBeX7jfoBHWhWtgA
         TA94j/0ZTbb2I73+GZxSeFCZcfPaAsnLNFxe/5JkQluzBWtryjHw8n8ESJtcf2KXnUEc
         wQWpwmu8fWWiWXHRb42qyy236bMkozFrPFwqXPUB1pTlgxyRmpJylG3j1VqLlojq7LPE
         gRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PS5LMiKFzIUnURDmLwbpwh2C/rUlEP4/H22PiA88mjc=;
        fh=+E4pEldhztjVm7wV52RlUVj/F/2FCJeQ2OWaA7GwEbU=;
        b=EcHk5qkzV9+pberbGG4X8Pj1TEdn3oC4jtWt7h+/wIzy4J82EDx2jy9+bfnDe5C26w
         zmkzLOI2PugGaZmYxl8doDAQHTNVJPMR1Ma0KdLFXO8dRieRG0Y2L0f4EM8ytLtxWOnR
         X3HmFBVX0lrAOs5VsPWwHG4mX5XW8ySUHduUPE9bL/BQRPAKbtOnGjfO3Zpa3aQQ6Ux7
         wzxbu8zJe8vF5x0lD0JVlfuTfErbvNPIOcDq6FOYtDH3/mgPxaJfoejXDaKz/doqbuEc
         FHFXCtctkw0fU5pAuSomcjokj7phZQDCXlXb0gICWd7Ctutja3enEdDDznUaCZoawjQU
         IYCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794381368; x=1794986168; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PS5LMiKFzIUnURDmLwbpwh2C/rUlEP4/H22PiA88mjc=;
        b=Hh1kNipzn3g8fzXP4iBlyCHBMCE7/6xLYTPQoBv6/Qphr7FXAKvF+Bbj9xImqZseFh
         8YW5vXW97J5cQlthJJUtxTBAVPOrHzDuN5YDZK2Hy5XdD5m/WfSPA3bf73rlVZCBb80+
         yTbiTFliZYeeXwLBSmtpvUVgob8aJZwRbb1oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381368; x=1794986168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PS5LMiKFzIUnURDmLwbpwh2C/rUlEP4/H22PiA88mjc=;
        b=hI1don3AT2w+p0P5+vBzDUhEDQyRTpgvcJQv/u0NjHUy9ahpVD7Yip0geTXEMoJPaR
         8Gx+SdhYwkUyThDXauTTwZw5GmvwNOMCTgjtlEy7k1zbD0BKhMxcdr0+CcjQxdQJ0h7G
         gtFzB/I4O88Y/jvsyayaqez3+lyA4SlgSzrR7M04NGJHudTczWi6E5/rwdu0R2yB03Me
         NQtHpGNvC74WzFyMmyirEcEG7OBGClufBh7llBRlnOIrb4/Oa8GCNB9KjXVcZt8tY8xn
         rej9j3EKbXyEq8TZbxJwYyYxFPxDNE8GzImycJt6nbfbc7oJSFycq1mCmohatLxVWUe+
         Ca5w==
X-Forwarded-Encrypted: i=1; AL+hErFn6YIc8jD1XRPm7it2GMd2e2KTXsbbBbjeeYt9OLSkE3OZVJdlwNf56+05sc8b+O9ysk8=@lists.linux.dev
X-Gm-Message-State: APuU4Z8cw5ALXbGjWFSFnPfnROXRashbPZGaX3tUfh8c6W82TrpbobFR
	w61EQWCS5qhTdB9kj/qtAsJJ1Gadb0aaRBHusPpGviA8ySGN5vGTZ8XbCPZiJlHWafLZ6HZSkJq
	B/04K7EM2tYACGE6oO8p1Ui07lLX2Vu2zRA3sVn9TYw==
X-Gm-Gg: AYBFou1+t9nLvc4k9VustsDkQyhPzRnLzvg/f/GB5z7zwdUF+lqebsec0a4yOm23jBD
	eloUCoGmBvC52eYH8pzwfAm90JEdl2dfOu8Ig2lt9rIJp0vh6KH4xuchzSTpte3+eD8qoV/CBrN
	ENT+pus+Htj8Dzl8fJmxKs4J2m8meqIoRykNEW9gfkArC06Ei/giEJ53412gVrmPPld6CVAVmzM
	MkMj429xzR3UO/2gNJHFfylwKvpfDg47gEOQEBa8A8vfECRsJI1l1ylnZ5XJ/T6jbtwjAZ2CXZS
	nupsYauAHYYQ9AxHbH/khyi+/JIeWtdV8l40Rz3s+Iu3kXbt/M654ILKegI4rR19hYRfih0ScvH
	QQhmKSluypg3w14IVFeAkIYiVzOgtQXztsuwpj+xa+ln0JrxCsW6KUfLhrraRiokcae0=
X-Received: by 2002:a05:690e:1504:b0:677:cbfc:be28 with SMTP id
 956f58d0204a3-67c67f7bcdemr1039946d50.75.1794381368118; Tue, 10 Nov 2026
 23:16:08 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261030171910.2822677-1-dario.binacchi@amarulasolutions.com> <f5ddf27a-9771-4967-a9d0-13c09f588402@leemhuis.info>
In-Reply-To: <f5ddf27a-9771-4967-a9d0-13c09f588402@leemhuis.info>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 11 Nov 2026 08:15:57 +0100
X-Gm-Features: AclHuK_y6USQFhQ1AriRJr3BWyE_Wi1fKklRA36_ipXu6i6f67Qj9RIWxt--J7M
Message-ID: <CABGWkvor=2AWC06iRvONAAPu6b8SS-JnJYmeALCYg_r4bh3wtQ@mail.gmail.com>
Subject: Re: [REGRESSION] cpuidle: psci: boot stall/hang on i.MX8MP
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Ulf Hansson <ulfh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Russell King <linux@armlinux.org.uk>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, coresight@lists.linaro.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Tue, Nov 10, 2026 at 10:12=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 10/30/26 18:19, Dario Binacchi wrote:
> > Hi Ulf,
> >
> > on an i.MX8M Plus Dual board (Engicam i.Core MX8M Plus), mainline
> > c339f4010dea sometimes stalls for ~0.9 s at boot, or hangs until the
> > watchdog resets the board, right after:
> >
> >   [    0.806123] ledtrig-cpu: registered to indicate activity on CPUs
> >
> > On a good boot the next message comes ~11 ms later.
> >
> > About 1 boot out of 3 stalls or hangs. With cpuidle.off=3D1, or
> > with commit 65705b18162b ("cpuidle: psci: Move initialization a bit
> > earlier in the boot sequence") reverted, 10 out of 10 boots are fine.
>
> Hmmm, nothing happened here. Might have fallen through the cracks, so
> maybe this mail will get thing rolling. If not, I'd suggest you submit a
> revert.
>
> Or was there progress or even a fix and I just missed it?

Sorry for not following up. I can't reproduce it anymore with
current mainline (b3dfbde62cf1, v7.4-rc2+) on my current setup, and
I'm not sure what changed. I'll keep an eye on it in my next tests
and report back if it shows up again.

#regzbot inconclusive: can't reproduce anymore

Grazie e ciao,
Dario

>
> Ciao, Thorsten
>
> > I haven't dug into it much. The stall seems to be in
> > pl330_driver_init(), so my guess is that it is related to the AMBA bus
> > reading the ID registers of the CoreSight ETMs while a CPU is already
> > in cpu_pd_wait, but I may well be wrong.
> >
> > Any idea?
> >
> > #regzbot introduced: 65705b18162b
> >
> > Thanks,
> > Dario
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
