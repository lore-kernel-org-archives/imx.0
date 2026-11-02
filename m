Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641937;
	b=iXc6xWIOHGxjLyznZM/vFIA3+hS9uME5gXcgh2d6p1QpYFoYyWbXxYvhD6tqeUTYQsni
	 2L7oyahjRmP+3uGsOGmuasnW86ynqfJiEIb5WXgh9Z3R/6aDoBsz5uUfCSJS3DdZeoo3r
	 vbbe39qqQuMSqrqJUTVJxiKIfJh64zrsVfLUQByZ0pLjA241isF6xrK0iRiYPoRwF62pj
	 WtBJkWPII51wUEANRBWQs+xYJHxn2ASQKa2N4dcIDE3YnVcH2HdSa4WlDvDQ2xckkU8cr
	 v+112H8yOCZSIfzNOf73AQVGB9B9gXOyfx4vejXKMj79TqKcKrHG8HBye3MrHkISODA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641937;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=o/zittl1YaBbUeV3E3PuKcS6YPYwR/ISGp2VfizEb0Q=;
	b=ISR6iD2DZ2f4T6w/qbrhPLIVeQJRqyxmYYSsxnZz66vdiQykaURQZwhg0vTMph3CQEAR
	 6dSsCT93rnSguekojlgpmwu9LsDha5uUDS9Nh4dJ+eq/KqYcGvSVyWdTcZLypFD9uHgar
	 D6CgAWvnuUy/Qt/3PgqqR2LTqciNVJUMwJejUlFxMIqvtYbNtMpOASwy0X3fTFLtHJyjX
	 JV58cTcqmDaTe+26iiK+z4+XoAJb+DbH/godrPzb6A2MDGe4cVWxlLuTqQT8U3F+Uocd5
	 2NmWxlMbkCrwivsaASN8ybP92P9bvaJtZBK6ZWXC8fuMo4ztYdtSdkege/QJwYNQ2ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PN0fgx3A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B19A606AE9F;
	Mon,  2 Nov 2026 17:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PN0fgx3A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3251F00A2B;
	Mon,  2 Nov 2026 17:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793641936;
	bh=o/zittl1YaBbUeV3E3PuKcS6YPYwR/ISGp2VfizEb0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PN0fgx3AbKJTDfnZQkPYgs0OQuEvnycObdANFpmVxSuyUVDeDYktTbDL7R1LlKaJq
	 OjeBydmfsaJMj+wjaed+neQQd8KFXELwKgy3Gpz+n9VGrkR40CIEhfRdlWSicIIpJO
	 PF2Do5nSNTVFBRAXyG90lauXId/D2jR0TvASr5ABHEEOEbrCRiNSLOLb0Evz+Jw23w
	 88uVRsxEOZ3gnf8aRj5hn0IToAOqS4xnM0FlvvLaGkqk0NXAasmiTG6RP7ubShyHE2
	 cpMjWp+IEJFbjgdI/I6KuCatlgTyDwbuvTHWgOHW9MWNkw3jZNFhwKmox72YFJsrCm
	 8vpaMihZW0p7Q==
Message-ID: <sashiko-outbox-193875@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] mfd: stm32-timers: use
 dmaengine_desc_set_callback()
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com, =?utf-8?b?b3BlbiBsaXN0Ok1VTFRJRlVOQ1RJT04gREVW?=
 =?utf-8?b?SUNFUyAoTUZEKQ==?= <mfd@lists.linux.dev>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, lee@kernel.org
In-Reply-To: <20261102174656.3939832-1-Frank.Li@oss.nxp.com>
References: <20261102174656.3939832-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 17:52:16 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] mfd: stm32-timers: call to undeclared dmaengine_desc_set_callback()=
 breaks build
- [Low] mfd: stm32-timers: uncapitalized commit subject description after p=
refix
--

commit 90e59ce1010cceb53a7009d41c5cc59f1c853e30
Author: Frank Li <Frank.Li@nxp.com>

mfd: stm32-timers: use dmaengine_desc_set_callback()

This commit replaces open-coded assignments to the callback and callback_pa=
ram
fields of struct dma_async_tx_descriptor in stm32_timers_dma_burst_read() w=
ith
a call to dmaengine_desc_set_callback().

>     mfd: stm32-timers: use dmaengine_desc_set_callback()
>    =20
>     Replace open-coded assignments to callback and callback_param fields
>     of struct dma_async_tx_descriptor with a call to the
>     dmaengine_desc_set_callback() helper.
>    =20
>     No functional change intended. Prepare make to struct
>     dma_async_tx_descriptor private to the DMA engine.
>    =20
>     Signed-off-by: Frank Li <Frank.Li@nxp.com>

[Severity: Low]
This isn't a bug, but MFD subsystem conventions expect the commit subject
description after the prefix to be capitalized:

    mfd: stm32-timers: Use dmaengine_desc_set_callback()

> diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
> index b3dbc02aaf798..4f344f2a5a26c 100644
> --- a/drivers/mfd/stm32-timers.c
> +++ b/drivers/mfd/stm32-timers.c
> @@ -102,8 +102,7 @@ int stm32_timers_dma_burst_read(struct device *dev, u=
32 *buf,
>  		goto unmap;
>  	}
> =20
> -	desc->callback =3D stm32_timers_dma_done;
> -	desc->callback_param =3D dma;
> +	dmaengine_desc_set_callback(desc, stm32_timers_dma_done, NULL, dma);

[Severity: Low]
Does this break the build when CONFIG_MFD_STM32_TIMERS is enabled?

In drivers/mfd/stm32-timers.c, stm32_timers_dma_burst_read() calls
dmaengine_desc_set_callback(), but include/linux/dmaengine.h does not decla=
re
or define dmaengine_desc_set_callback() in this tree:

include/linux/dmaengine.h:
struct dma_async_tx_descriptor {
	dma_cookie_t cookie;
	enum dma_ctrl_flags flags; /* not a 'long' to pack with cookie */
	dma_addr_t phys;
	struct dma_chan *chan;
	dma_cookie_t (*tx_submit)(struct dma_async_tx_descriptor *tx);
	int (*desc_free)(struct dma_async_tx_descriptor *tx);
	dma_async_tx_callback callback;
	dma_async_tx_callback_result callback_result;
	void *callback_param;
    ...
};

Is this patch missing a prerequisite commit that introduces the
dmaengine_desc_set_callback() helper?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102174656.3939=
832-1-Frank.Li@oss.nxp.com?part=3D1
