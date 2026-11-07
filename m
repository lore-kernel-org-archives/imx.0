Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049923;
	b=fIaA6oDSWK0hmP/RCXl4IU2QHBcbgfF11aCQNlF/77BtheO8hOt9D2rN9ccy2Wji2GzA
	 sl9igq2ujRPsGBv2wMA0XuAMLcvvwD6ChfJ9LB6vMcbwIooLqPS1NH0hQSl8Q2b1Nj2tx
	 ZNNYmxPVsKYrcVh9hUNogTXezbegMfZYnMIYqm4o6ImYxSSBqOgGrA7MhMvStTbn2xqr9
	 m8fwKREsa1Qf20joUDG/m5xsyL9n/q2mvXli4JWXUL/weKJ0qf1wFIUbuuYdIvPG8F7E8
	 jaYkxoNcDaux1R8VKM/v9W7+FcEcV7vF0dF5g88Qw39m7kyKmCBU1/KTfhwW0LiZlyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049923;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Sw35vxxDtezZG+zYUYhsLfPRtC0frNaa2EUgmwrfMNY=;
	b=gb8rBkdMfgOkJG6AWz6+U93vLYVZsg2gPmPBXBNoNXIhRJxdIKIcUvZaI3wmSoi7NybU
	 z8iu+646jQq0ZsiIa5pQuSUB5gDTuroea2Zswj5OFsRfrSrkNRKnWyAG9IBK4bhQw/VsJ
	 jQ31MxJzz8Y6o0crMWsS8lSIG3uB1B3KaGNM5fem3Gc+QJ9A8gVjXwhrpTcStWynL12NX
	 g4s/Q3NiJ+2dSHrLfIYuE+/P+7BY6MOPf2qv7rlalzu1zNARhXsTRrbz5kw1D5Q+WXndI
	 6quuX9wcXzGbuc8qRf6GdsTDUvspV1hteLHws68LfV87gjHwqX2E6+I17wxRnvulfiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QtOGy3ih;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F765606A32C
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QtOGy3ih
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333AD1F008A1;
	Sat,  7 Nov 2026 11:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049923;
	bh=Sw35vxxDtezZG+zYUYhsLfPRtC0frNaa2EUgmwrfMNY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QtOGy3ihgRf4tEsXDqmzZ4Sfb3F7Jy8Ty4CG4UZymRYG90Jl47xSFwoT/UZ1vN4CD
	 259f6mDqkJgdyUSsDqP/rBOJucLT5WS4jsgkPR8v/RLcrxivUZCBbW2CgKGj3knSg2
	 2ZLz4qWcoKB86YiIqZdFFmr2mGnpmFq1PavR6xPTwqqjeVKuBje8pJqpbmC4Z8pMTH
	 FN6uJkz7dssJ1Pzy6NcwBK+vk8sHlMZzRE89mCq2D+SUT2LWcLFYJwwY72PabUIUxV
	 4iSoNuJXTxDk1nJ0M4dN3h8nvSXFgdQPwMhBwtcRrRfedPUM3oG/6xZ6ujSvYZgfnm
	 zr0TilLcN2CgA==
Message-ID: <sashiko-outbox-202846@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] i3c: dw: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <crofts@kernel.org>
Cc: linux-i3c@lists.infradead.org, imx@lists.linux.dev, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261107-dont-use-autosuspend-i3c-v1-1-80a1546354ce@kernel.org>
References: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
 <20261107-dont-use-autosuspend-i3c-v1-1-80a1546354ce@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 11:12:02 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] i3c: master: dw: clock enable count underflow in
  dw_i3c_common_remove() [1]
--

commit 4f7b7a8b26800680d2cdbe5fe6acbbf1f93c63ec
Author: Joshua Crofts <crofts@kernel.org>

i3c: dw: remove redundant pm_runtime_dont_use_autosuspend() calls

This commit removes redundant pm_runtime_dont_use_autosuspend() calls from
dw_i3c_common_probe() and dw_i3c_common_remove().

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index d1119f203d1b6..f8fed797e0e4d 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c

[ ... ]

> @@ -1792,7 +1791,6 @@ void dw_i3c_common_remove(struct dw_i3c_master *mas=
ter)
> =20
>  	pm_runtime_disable(master->dev);
>  	pm_runtime_set_suspended(master->dev);
> -	pm_runtime_dont_use_autosuspend(master->dev);
>  }
>  EXPORT_SYMBOL_GPL(dw_i3c_common_remove);

[Severity: Medium]
This problem wasn't introduced by this patch, but can unbinding a
runtime-suspended controller underflow the clock enable counts [1]?

dw_i3c_common_probe() acquires core_clk and pclk via
devm_clk_get_optional_enabled(), which registers a devres action to call
clk_disable_unprepare() on removal.  However,
dw_i3c_master_runtime_suspend() also disables these clocks via
dw_i3c_master_disable_clks().  If the device is runtime-suspended when
dw_i3c_common_remove() disables runtime PM without resuming the device,
devres will disable the already-disabled clocks and trigger a clock
enable count underflow warning.

[1] https://sashiko.dev/#/bug/linux-2e78b07f-df35-42bd-b4ae-71873b79b67f

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-dont-use-a=
utosuspend-i3c-v1-0-80a1546354ce@kernel.org?part=3D1
