Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787782;
	b=4Vjh4KFnb8LLMjQ9J7zlAmeBF4PJs4WW9axq2N1HcL3DSXEkIYM42rn3Jb9hBmwzv0ig
	 Z8mSOSX2pbPWkRXo5a+pbDo8Zk2OHb9PYAEMkkwQ0/39qybZfjphok3F5B0xlF8b9wIpG
	 ZBfdBZ4JYrnFI4iPdE+k9IEI2FUOBq4RVk3ECfukcJCOgGCQCOKtp5lfZJz9oPo6ttT0p
	 VHAWr6x77l+X3H9Fy5lVRO9M8yKVWT5Y7W8bSysPMB8YtGxwxnyRokrM4vmTj27jZJjlL
	 enfsP9oV1yX4OyzwHc90p3jk0nT7PtMr5ADB9FpWlMjCMeBsh6j80xBPwFWz9Q45XFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787782;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=r5Wml9raPfJITv+ED/CeZUQA4/guXxK3jW8vge+JZMw=;
	b=eLZvAvnx667TaR6RNSwFWIMtFAnjkqv9ECmupmgQBTJ2orTmEfQZ7D0RQuuaz11RzYB6
	 lZfaHhXuENWZw/yKu5kA1XcCV2KYp/cNesNqYKXyZKgeSAH4BgkXYQ+q88MUQu0e6NQV4
	 g4pm/xUo9lN1r1ULp4T6VrK2IuFE223VNwCdyIVJQYz9E3jPYD8ECdMHPfsdwzJaU3E3X
	 o1x/FhIriQ018rlCWU68EYZueLVbjyiIzwWlr/cJPFmXPIAkifXQ0rU7vUlkScRsZ8+74
	 NpZK91i7rMZ8wTNL8rbHNGkG4wie3/hON4vbRDnwMGPLiOGJwYKm6t40F8S6j5dWvOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dzuwk5qa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40862606A31C;
	Fri, 27 Nov 2026 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dzuwk5qa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A8F1F00899;
	Fri, 27 Nov 2026 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795787781;
	bh=r5Wml9raPfJITv+ED/CeZUQA4/guXxK3jW8vge+JZMw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dzuwk5qapKQi43h8O8uVGg3cqnQK67XT0Z98vFFKICGcy+r5JtYKxg22CR1HzZddF
	 7Rv1bYNqbdGGvL1GdYm0FZ2djOdqLw7H1iv0+ylDUCOPDLJItZtHbocoXamAyFnng4
	 Co79Qv9yv3/0ZcMx0HFfC8MjJMGY6ytEeM8bMELFq4aJDNPZvrlvrAlNN6ly1BuvDv
	 1E2KVtqzoFOqsftS1qp2yMrBsMsVenujsRyI14Ltft68MbXv+hW24U5aVwW0oi8K7T
	 Yy3xciSwrz/BUH+mL1irWjEiUmV9PkfLxDfK5MnhBLBI6G0bMFLx6ZYll1Iit2fJF1
	 t6ISWTWbLbarA==
Message-ID: <sashiko-outbox-237525@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: imx8qm-mek: configure ENET0 pad
 compensation for fec1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Baluta" <daniel.baluta@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261127135237.2153934-1-daniel.baluta@nxp.com>
References: <20261127135237.2153934-1-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 13:56:21 +0000
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
- [Low] arm64: dts: imx8qm-mek: missing Fixes trailer for fec1 pad
  compensation fix
--

commit 16a1be06255fa85636ee660e513ea61881c625f2
Author: Fugang Duan <fugang.duan@nxp.com>

> arm64: dts: imx8qm-mek: configure ENET0 pad compensation for fec1
>
> The i.MX8QM ENET0 pads used by fec1 support 1.8V or 3.3V operation,
> and their compensation control pad (COMP_CTL_GPIO_1V8_3V3_ENET_ENETB)
> must match the I/O supply. For 1.8V or 3.3V the datasheet requires
> PSW_OVR =3D 0 and COMP =3D 0b000.
>
> The fec1 pinctrl group never configures this pad, so its state depends
> on the boot firmware. fec2 already sets the equivalent ENETA pad to
> 0x000014a0, which programs COMP =3D 0b000 with no override bits set.
>
> On the MEK, the ENET0 pads are supplied from VCC_ENET0_1V8, so use the
> same value for fec1 to configure the pad group explicitly.
>
> Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

[Severity: Low]
This fixes a missing pad configuration in pinctrl_fec1.  Should this
include:

  Fixes: 307fd14d4b14 ("arm64: dts: imx: add imx8qm mek support")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127135237.2153=
934-1-daniel.baluta@nxp.com?part=3D1
