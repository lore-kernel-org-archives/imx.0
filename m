Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891201;
	b=GOgEtlV2QBJSJuZIY4UDJ8yBIrbV5as9fRNmLNrR3oFRv+UrW8fjl7looS4aWAM1mkYm
	 NjftmKQgE3Lf/kaaeXR786ImGgqxI/G6Y4q3/o9CRc0NBgIoZUZ7SZhMZpFhwKucsHJLQ
	 BRwPyxa7AIjZBhzxl2JhNJqKBA7Aj1dSUjPZK0llDOhF5EDVQFwXNl/Vly0qzz3PrUyt9
	 N/haXpkqcE5N8Pe7gt/QyHC6dQDO7u1e8/w0XEX13xYRHYpdzXbGx0q8P5rb6lc2BPfsD
	 TJWWa0+vLWUe/2H9Mhg7fyt+354FdL4uaUBNxUjXz+wPTzsVzdl7anf87Q1r0dMpzfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891201;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lbu6CYbZmlg9LDpHvg31OE0O9sdelylvCrdhRi2mD7M=;
	b=5fnMOizpKbuVprrUp309k3jOsglCN4molVDJAU+a0+ca0QTFMsXMl7QgaroRIj2s8h5Y
	 GhDCXkZkIzrp0H/lNrDkpxCDEB2Hbu8kWu7rND+5bVaP4ifiIY6dBr6d4TuFjPZMunR97
	 RvlzXzKpChmYHm80/CdG7RIG0sBNQCoQek50s8PJASodVGzbkqHOWZQ0AGfuCCwVr/sQL
	 CgSkYRX+XlBNOU2LKDdypiCRyrJiHNLkmE45lPwvARU94PWnjosQaJrOUDX8MWKy1US/N
	 d5pcUSu76meh8WZw/QThP0Jl8jd7jK0sU0kZ3BkbAUlJYRdBGaooyypNv+et12cvYlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ln31vRMh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F848606A31B
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 15:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ln31vRMh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3CA1F00919
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793891200;
	bh=lbu6CYbZmlg9LDpHvg31OE0O9sdelylvCrdhRi2mD7M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ln31vRMhbFvxkAtvzVW75Y4HBOLjjrZC0SmEKIotyieRcq6ES6mnQJRuRutgvH4na
	 2ntrXnFKWKITMWAZDTiek9ZeFMQEUUB4NGEi2Eu0bNaA7hZoFrl3esKlIeoxQpstlP
	 KePk/w8r8S8D/uxBr+FuQ5L8SwZ+izhxnROeVnAgjSXp1NqLSl9MqJocmALEoO6rNX
	 zrIqZEf7SHMIsj1kXWMvhq75PgcbWCWYYrY3OtcMtIQuqevvJt3ppSSdrpSe26Cxli
	 WwCbuMef7RBXF2M9c5Qo5l8pNwwemhlpMcyMXahWz3nvCEa4pFLdfNv4nlc9T1WEB6
	 zv2yO2mIsvHyw==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c434376dbebso178408366b.1
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 07:06:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxAfECInivWfMRgGLaWkL6yZLI3PgBU/JgOOwZ5WOskZGdP5EZkrMAnsrfS4Oo2+eaiP3o=@lists.linux.dev
X-Gm-Message-State: APuU4Z8LrKWtWwpp6pN3HYJWHelIvcIkRd8oNjg/lkmq9Twynj///Pqw
	XGdFcVwLyDkBCGX0yiq7AyBZKl3LCCZMiTnKciQiqJmT6xf1x6oUyW7sjeB/sbm0K3bcY4eTPJc
	Qr9ZRiWsaoA8JEFTCNWZMuSjq1vInOg==
X-Received: by 2002:a17:906:c102:b0:c46:d493:47be with SMTP id
 a640c23a62f3a-c4d206aede3mr244770366b.19.1793891199414; Thu, 05 Nov 2026
 07:06:39 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105144920.2796623-2-robh@kernel.org> <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
In-Reply-To: <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
From: Rob Herring <robh@kernel.org>
Date: Thu, 5 Nov 2026 09:06:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>
X-Gm-Features: AclHuK9D1vVYdU6bP9ipfCUqtMD7cNI9yWkFwUZwsKz1kc9xgefpf4aNgPCbR6A
Message-ID: <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 9:00=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.d=
e> wrote:
>
> On 26-11-05 08:49, Rob Herring (Arm) wrote:
> > These .dtsi files are not included anywhere in the tree and can't be
> > tested.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > v2:
> >  - Rebased
> >
> > It's been nearly a year and these are still orphans. There was a promis=
e
> > to upstream something for the kontron ones, but that hasn't happened.
>
> That's unfortunate, but these includes are used at least by the barebox
> bootloader [1,2], dropping these would cause a DT regresssion.
>
> Would it help to upstream [1,2]?

You said you were going to do that on v1:

>> I will add the som.dts, please don't remove the kontron dtsi files yet.
