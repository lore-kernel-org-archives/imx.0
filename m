Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830535;
	b=Osf8KXDjNnB5+OGcAZO4gOvPgk1Ym61ChakdQagr5LmI75Dqmz9FXh9YvUkHqWcpXSFS
	 z5lLxIy0NYsuFYXXfz6Ftl9Wm2MXsIJ6LQ7M9dx3MUqH/yG4p/XWdPrRbqmkLCCZJ2Jqc
	 37yPsH1k5boBw4Q0nwvZq8AktIbBjgoEGqFPO+shx+k4+GuDsMjNj+gSRhHLRZFA2VBv1
	 LO/CL3crNn+rGRFm6KdceiddJCe1OPEhGJ7Cg/K2SSgFaIY4KhxWEIGzF81Inp+T2/zJg
	 smcBrJmkHxz2F72sI3k+iwXbifrq/GymB5zQwDLlc4PTrDwBBN0amlQpaSFuAOA2nuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830535;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SFdwpx+v1pyqeGum9kg7HRiy72iXwPjbsbDIR9DUzS4=;
	b=HrvEfYT94dQHObYtlaYmJ/T0afZxQ7TpBZde4zk08T075o82+Zdsqu6hc7lsBYg6ws5Q
	 ZcWOtxhxW+S7Ve+OiT8foAnLFSHpMrafgTkhbk79VFFxsIBYRG8AAefpNtXs5LlamX/SM
	 R2pTM9We0Wt9uivYxgq2+05UlcgCumQwo5DjSaRyUp+Pkzv4br5a8ssg6kQLEtRk4d4f8
	 nsx+pGcMimy1fsRKM2sp56qSTA1AVXpqE10lpj+9klA9Gf0+2lZZNLGRDbL8ku1mjR1VI
	 SPUU18QWcdWmJss1RqNhTcJInNGBJ1JYnRqaFpfiXkUDDHuUqX6H/6cAqg1RkeGL7mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TY8dC7dl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AAA606A329;
	Mon, 16 Nov 2026 12:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TY8dC7dl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DB71F000C4;
	Mon, 16 Nov 2026 12:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830535;
	bh=SFdwpx+v1pyqeGum9kg7HRiy72iXwPjbsbDIR9DUzS4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TY8dC7dluQBXunFU/5WndixWS2DCSmnJBKBVOvYPb7cqaks8vtTEAsTtL7XZw5Vmm
	 DupGwv7eZDc+X3OpIw8PF16breDJz3ioGpCZ9Yv+5vCHLpGukmlEA/h1uvXsVn8/z5
	 oTWe3rn4udLmtEa+elYqogiXOccC4mc652+fKWQy8i8/D7DFtN6cTMJkDlDlIgVx9O
	 xlJ/afKSf5fZ8IltSWnhOajG7BmnD7sRkKuCX23LNxFxe9VehZn+Q4qlCqY3KvQrw2
	 zIvEEdp0I9uGnH6oT1s3MCI1IAjfnl7bmesjvgEVJHk2FdbwYQ5v1BN/70hefF55Ae
	 Xdli2wwFyfqVQ==
Message-ID: <sashiko-outbox-216974@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] dt-bindings: fsl: remove phyCORE-i.MX 8M Plus FPSC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yannic Moog" <y.moog@phytec.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261116-imx8mp-phyflex-v1-5-4adcf8b4d373@phytec.de>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
 <20261116-imx8mp-phyflex-v1-5-4adcf8b4d373@phytec.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 12:02:14 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: fsl: redundant single-entry oneOf and yamllint
  indent error
--

commit f303b3d397f1c2b535993718e5b16c7dfc14c6a7
Author: Yannic Moog <y.moog@phytec.de>

dt-bindings: fsl: remove phyCORE-i.MX 8M Plus FPSC

This commit removes the compatible entries for the prototype
phyCORE-i.MX 8M Plus FPSC SoM and its Libra RDK board from fsl.yaml.

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 2d21a1949d949..ae823a7670b02 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1227,11 +1227,6 @@ properties:
> =20
>        - description: PHYTEC i.MX8MP FPSC based boards
>          oneOf:
> -          - items:
> -            - enum:
> -                - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK
> -            - const: phytec,imx8mp-phycore-fpsc # phyCORE-i.MX 8M Plus F=
PSC
> -            - const: fsl,imx8mp
>            - items:
>              - enum:
>                  - phytec,imx8mp-phyflex-libra-rdk # phyFLEX-Libra i.MX 8=
M Plus RDK

[Severity: Low]
Should the oneOf wrapper also be removed now that only a single items list
remains under PHYTEC i.MX8MP FPSC based boards?

In addition to leaving a single-entry oneOf, the remaining "- enum:" and
"- const:" sequence entries are indented at the same column as "items:",
which fails yamllint (indent-sequences: true in
Documentation/devicetree/bindings/.yamllint) during make dt_binding_check.
Dropping oneOf and placing items directly under description avoids both
issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-imx8mp-phy=
flex-v1-0-4adcf8b4d373@phytec.de?part=3D5
