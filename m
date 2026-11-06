Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971728;
	b=xNaYvOTTXGqV2In8L/ac3hq2c6fT4zqF3WOcMqWpzA7CUli/Y9SBOebJ0vetma3N5/zx
	 3zE0MEkkc9q8B2iJKBO9SlduIojwRMi4B3AGM2ReHZJlkPJDXUltDGtb1Vn6TTHFipkKt
	 wt0Kg3hwc1WEFxGy69/vK3dvU2DWITW4K2jlvwAjNkQXJZY7qDRdxsBY9Foef/Yng4FZv
	 hy2FQjLFWj97F6MqAjGWbHGkRUajMRDCPyeZcl8Icp1d8QpdEvj6kGRMKNoBAmlUPDh5d
	 aVVxGKbHgcWRl2uakowcxj1b6LZN9Bpn5vLc8gry3rqCs9shnKuU/ihP3fluTpfzy7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971728;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/oknbUn4S13Tsp1GjEbyztprp/5ERIantWGXpvB95Ak=;
	b=BLN65zfEbyfC66R1LJrxQKwE8OG9B5csX4a23PWWSKMLdLxUMAR2ntXn4o2xxn7I/JbE
	 1VIvhWcmCsPlEbDyXSQ+g4CkM8BoGJJ5J1bDyfn1D2wFQFtif0/5V0ge4gYT4LygCn3Q5
	 VA77jFYNeI62wADAjWUmK2/e3m3+HAqH4lncoBA+KwgvxRd7JOA25+79vKC+sLF9i8iFV
	 Afm5D9h8R2lW5GsEH0D5l+icEKYQeqoMFSqqJsCkgiNhlJPAoKBFquWL1I6wtazh8BAHT
	 KoVmQQpeyPI6NRy4FuVXdb5ErFr/SrBTmhd/QZNcRk2fpyg6nL7QA4LbA3OIG/N12/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xsk6b2WL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91682606A331
	for <imx@lists.linux.dev>; Fri,  6 Nov 2026 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xsk6b2WL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDA51F008A2
	for <imx@lists.linux.dev>; Fri,  6 Nov 2026 13:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971727;
	bh=/oknbUn4S13Tsp1GjEbyztprp/5ERIantWGXpvB95Ak=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Xsk6b2WLdMAU4byOQXFsAVBOCMsOww4BdhGplRm2sYAjr/aOUAyDyNz0ENwDFmdpJ
	 uQ35GT/ceuesF256fWfT72bhDVA2Xo7RVVLWBeCGB9XrI7E0dZBe42LJ21tWZTpryG
	 +yx6o4Gf92UH5BXPyE/Q+uiJ5l0/vpchGTV1qJUY1V+Eh7xVfdbhFwGx0cJuk76Yqv
	 +SVB1GQGmj7DTaEGlhBgrBsTLi8hze80HFgUX8yjUbPC9MrSV1irN20Ydlvam1meBF
	 CyxDANeYjqi47U3dX1cqrJHuMHLjCq+2OoOnnt8mTsXSdeY/gN4F2+h5CxsscorroI
	 j/ppankneYVhg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bfc9154ceaso464365e87.2
        for <imx@lists.linux.dev>; Fri, 06 Nov 2026 05:28:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzA0kwCwl34cg/JfCxV6EpQpKEWmnXb02OnCNaDke8wEwJpQH7oaVuAggna7n/A0QozitE=@lists.linux.dev
X-Gm-Message-State: APuU4Z+4ovyQIviwyKjtZH5o9z0Ii4Xhnt5LliahmYBk3QZFzcw2d23g
	qozzyflixpQdhRVfguhxDfWCMH+VnoLLP/rcYNRfL34MXEV+bAWE6+Xs4Qvypm3tvLMLBe9KoUq
	3H3lqSj1LlHxCM+rXCXLmbhYaCKo/1eo=
X-Received: by 2002:a05:6512:3a90:b0:5bf:9fc1:3938 with SMTP id
 2adb3069b0e04-5c003b0477dmr712282e87.38.1793971726003; Fri, 06 Nov 2026
 05:28:46 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com> <20261105-gpio-vf610-fixes-v3-2-504e19de5ad5@nxp.com>
In-Reply-To: <20261105-gpio-vf610-fixes-v3-2-504e19de5ad5@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:28:34 +0100
X-Gmail-Original-Message-ID: <CAD++jLkyU54qmoaLSOBdXay1oecZDiPQJds94wCiZbyXyXrowg@mail.gmail.com>
X-Gm-Features: AclHuK9EgoyL3Lf6bUzcYEkXfVXFNufjNdYyDc_zbikouVfosUjqSHJJBS9wocU
Message-ID: <CAD++jLkyU54qmoaLSOBdXay1oecZDiPQJds94wCiZbyXyXrowg@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] gpio: vf610: simplify with irq_set_irq_wake()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:56=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the manual enable/disable irq wake logic with a single call to
> irq_set_irq_wake() to simplify code.
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
