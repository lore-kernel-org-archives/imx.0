Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910821;
	b=D/Bvj1dAAHCBQbbv+18OAHgTwoYPimRZE/d0g4zkWN71xfjOYytLo/QD1hgdP+RaBWj2
	 4jHfVMHANwvjXRSGIkF1+NaVf6OnGY/TJt3m1hgH3BfMjmdbA23F/0sgvpGe5f40QcbKo
	 2ow0d94WW03V1Io3QEJqY0uustbJOqXWzGdiI3gLmToy/2Pgcwdt0nkfC2jPwMou953Mv
	 qA0TKNMsUcx8XT670TgCXdzLxFRvM+UREvXDO4y/23P31UJqQDuCawo6MRZ2RrKph5jtW
	 9likdVsxbMo127E8ffS6Wf33Uj/SdpS+CshSjdoXsBklyZge2WyGQGaQnrAw3DqUURA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910821;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LYjA64OY7mzK30+EmXCloZ1d2MnMctrR1lEa4XYe6Og=;
	b=q0e5q3z66YgNtwfsHygrO6pTs5YrmbFCNcHRWPk4jwBiepOXLm3h+RvSZWPFw2rBhBTp
	 YAhs1lXFQGj2YehYk54EctPuqtfWJrsz5V7yK0hk5dmgd+FKGWYri8esNkFAlCB9I+Orr
	 MnoiM7O+vBqKikchsp6KXnhf5rCwaXukTLNtsE5HNhiGEyZOKeMiADFdf/qEBMY+xXyPP
	 vqpZuPypxayzsFYhHKl8jWyTDjvwsVIez5DOO4fr4OoNRciFWXIHYwmP06x00STvBdMZ+
	 PyEdb2LaVO/DhxRztTcAQjYbM4Fabv+qJa+3kebvw1m0rwubkqmq02B977WG/oXqUuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VY+cEPzz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C851606A323
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 10:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VY+cEPzz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED491F000CD
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910821;
	bh=LYjA64OY7mzK30+EmXCloZ1d2MnMctrR1lEa4XYe6Og=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VY+cEPzzOeQl350iSplr3YTbz/NtmEMKg6hNuwMjP304qeTNTNVYjYn69bfPeDIrr
	 lS7RhvYXF4dCg9CZ8zAIS1K9t+Ts2W6/CwaJXt+xpLSgkZ0KkEjPZXcp/4WYY1aOjX
	 KgvvCBalfuTh7MDTCxX/lqDxO0eqA51GFCKXPRmVhjH860W+HS8ZWHfZiUv4Pdg1Ot
	 NCKtr9f/uT0p7JoxmLwfDWgnAn25r4zqaX1A+yEahv/mz5de0wAQrWh37dAKryhSDf
	 cNDA/Jg4XwFcxwYpEWDh98BL5zveMpdl6T3nP6EeJ1kkzMzwF5iA0j/fkoFcXeZHyS
	 WTgYOuBxjFWFA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c151178f0cso4265894e87.0
        for <imx@lists.linux.dev>; Tue, 17 Nov 2026 02:20:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG055VBrkPgRvwT0ysMyrDL8tOZWagTIEqtzzClrVeulQ/mulsMIsndAVQKweUWWJLQ6Vw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+HKxFTLZNja4wRlUW8PMfAO4qlZLTCja+K2xltzXTtSvpwR8f4
	P1ou0ZymtUMBlUSuLZjkg0DkrbeuU2dawt+JZUSE7IXSiZuKBnp0V9Is1OvIEfYqvE6gHaADDy/
	lJ7mbX9SXYuPNP8ZzZuivGtMCURJeNP4=
X-Received: by 2002:a05:6512:3c89:b0:5c1:57d3:efd0 with SMTP id
 2adb3069b0e04-5c170b45aa9mr4736734e87.35.1794910819929; Tue, 17 Nov 2026
 02:20:19 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-4-3aad0860b984@free.fr>
 <CAD++jL=Np+_+wTkuLCiqjNY5EBqn5qq8zKTJB6F-=1G0R+7=Ww@mail.gmail.com> <au9YgytCc4TKfETI@l3017727.home>
In-Reply-To: <au9YgytCc4TKfETI@l3017727.home>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 11:20:05 +0100
X-Gmail-Original-Message-ID: <CAD++jLnWcVDbh-vf20w4nfvOSZik619XqoEjXTBZ29sJkX-bCQ@mail.gmail.com>
X-Gm-Features: Aa3M54rAvJrdH2ioBjmTcd53sA32PoIoppu6eV1QG1zyBMjvlTxU-cDEh9WFtc0
Message-ID: <CAD++jLnWcVDbh-vf20w4nfvOSZik619XqoEjXTBZ29sJkX-bCQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux driver
To: Vincent Jardin <vjardin@free.fr>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 5:58=E2=80=AFPM Vincent Jardin <vjardin@free.fr> wro=
te:

> > Can this be applied separately once reviewed?
>
> I do not see how: this 4th patch needs fsl_guts_rcw_read(), and
> few other fsl_guts_*() which are from the patch 3.

OK

> Could an ack of Christophe Leroy be enough on patch 3 to 1...4 could land=
 into the pinctrl tree ?
> Then, patch 5 could be managed apart.

OK let's try to do it like that.

Yours,
Linus Walleij
