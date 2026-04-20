Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4926A39C00E
	for <imx@lists.linux.dev>; Mon, 20 Apr 2026 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776687932; cv=pass; b=ELNd9jOwWi7GXm/BoAaikHJkA6qvmWhdz44ypAn2EeFjhHp6TrLdwwPDMhYe2XZ1MLtHZjsL03aTI+7AHNvwx11rbT+iDgd+aEWIpKLuPAorw356lvO5EGOk4lMQvAkfbMcOrkOO7xruc1h9vf08JkZxZ8Kfy+g3olX9EQWJ61k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776687932; c=relaxed/simple;
	bh=x7limQPZ9fbfVmUFX6+p6BilNYOm67GKW1SfJR896uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dLZxEgXZrYI5jLFo0xLFqm1vZnlfC84K6MO/p75o+0r1wlx1Kohw8Vmu8+JVmvgP5cVsZemtJsrdzrHpZknaAIma80vEB4XbjF7YBURXBvURUrSYLWv3hOkAOUl7OwNL/6Co0d3mGueq7XehYVlPIQWZPulwtO0BzpdoDKXPD0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FerBRf5G; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FerBRf5G"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-672c23aa064so5513093a12.2
        for <imx@lists.linux.dev>; Mon, 20 Apr 2026 05:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776687930; cv=none;
        d=google.com; s=arc-20240605;
        b=XajXvDx0gBbK9GYVtBDS8N4XpLTv1eoPA2GtnoeTc65TjF9HSLWCcZ+1vuTFGjGDIs
         xteopQMOo4OmWXsCGZYfigLZ8SC7BwWku6Pmg3DtihRa3l5Xy1uPJyBqw4d7LZLZLOkW
         SMnNBAJhgbxmOJg7vvBLvwWwtDGukua+P5iVO616hh5Xx/SvafHa9F/7inYEf6ahtz54
         e/tXnzowFaxvypPz6MbYqLQ4narU4lGsvA0LphN4W0aoLFtq8+5kkHAbqkA1MJreJL7O
         sfwE+MFy5AaI49c0WsTYFMLnPphDyTidsn/Lo1YTX0356KAyER2dZCDuex6MkdOzNsKY
         0HIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Y714/gi63AqvZzcusny7bswWgS5XNqcnWUmXP/JprI=;
        fh=HrnfOEIm/d7Kis7vJ4vPs3/eiVSBy0jtaCL/wX711S4=;
        b=cQmtDnbdUL+5yo/NyHpANz2x1SMrhq5Kg93Z6pNxfh0mLrOyXbtZEC750NigryQz4F
         JisbIFEpy+6U5zVGi/2hrc4vNV4rY7yxeVBswn3y9d26P2rGyAJLzliSEqiwvmHRj/Ds
         jV5mF+pfXdvEz3UQWkLF7a1laHoc108qrb4+gaxmiLSP0rmlA6tSN+TLP5+Rhqt6Bp0M
         /Bc/0QITCe/z7tZjkexY8nMyTT+YcZchp94HyfpxNaQrK+xFsWje83aPTfl3VeV0PjKU
         UO/JPVcBunXmroZp9uecHl0eS/N4np949CuXuUhjI+zQsY0NsH8DTXrLx2iQPTTfcFyu
         5PQw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776687930; x=1777292730; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y714/gi63AqvZzcusny7bswWgS5XNqcnWUmXP/JprI=;
        b=FerBRf5GZ6/as1agI+0iHvCpt28PCH3BziwnqG2mpvBloD/8s4pWz31+n4gxTcwlUw
         /+D1YFtXnQIYPoV/88Q2ERTBWYmZgBWs/ycS6Iqs0hoYwBoymkmzRW7kt/g0dGCZk/UO
         Uiq+tTj5NQJQwvnYUQK7F1qfmkMytas9co3i72M8tx4Mrn6WeYFu2JYtNeXIglwnpXmd
         l+JuTh4cRslQEauECI8sKFQV/0IqmBz0/fZwBD6xZUpdYQiCBcGF0l3RDe2snQsgV948
         xXhswgPp9NJiBZDvzjvmOwMETZQh6nBdjVaqKlih+rigp0u4OJEE5uvvcJeioLxdHa0+
         Owsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776687930; x=1777292730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Y714/gi63AqvZzcusny7bswWgS5XNqcnWUmXP/JprI=;
        b=jSmIZBP4trdf93QupL2MnXmUtQYDJCNloXt2uBK0+KxHFi3LI3CXBELI3Z6o/TCk2U
         DfmNVaYXDwG1UCzsvstVgvPYyrj2x4ryB0sPytJv8mYUggPgnaMHxpuzco3jhXeCO1jX
         TBf4B2gFQdDdJB0p119dIPwDkBWEKREZytbt10/n0ktjkb2+X9GBHxzg3RC1p9qDLaqh
         aUO2ONejkXKuO28ZBl2gU9+U93bf1ggvzQzkBdvsN1Y7n/VygC7GsMHbBIyJK9DPKIfg
         aWpJ5M6VWbfiIX8Mv00U/K+DUJY1iLF6dm3ExtdQnShQqjlQPxPfY+Hy/CNYjr4c8iRM
         /0Mw==
X-Forwarded-Encrypted: i=1; AFNElJ9bPqmrj+YxY3SLuLmUvLxjmUTD6RbIoUKX3vwUCq9Dv0EyLBcjr1cYfKvcodleXPHNxGI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxC7chAFpVIqGBCYur0LLOKgkrMsZ0iqfktYySMxBmlckVbZb9z
	sAHQIc3XN10F9lGtRmRA5biwZqrYqAat9J65nFSb4DiQv6QYOzjksKLvpcRxXu88aaHSg3swAIl
	M8NcKAU5cr7l5tYHzoQ8jJ+5zCsOjZnA=
X-Gm-Gg: AeBDietPjpdCoiB/oWbg+MJB+5YSndM6aLpF77xi3c6kyMckOCKyviReLVPG+Knqzzb
	eQHhJzRH9Uwba2r81aG1dOpX4pIkyaul6V4O+drAD0aUzre579BA7V2f16AFic/37pfTSyOrRwU
	lW1iNUFi2ZbkprU5KWdNIbeUFUIC1RVrarWzHLhPW6JerhKUctZborPkxi5hhaepvNPZLKYcQPF
	y6nJYp9Razs7Ynvq/JE8PzmEkdLzaeatAA+eHMFOu6YO6lL2ux7COr3PVkqfGsKvFsJf+GM376t
	rFwKNbUYTqmnd8nciBVQJ+2F9e9sGLOGrZEQ89TmItSr1qOEoyAz+tz6tEF4Cfian2Erym2AznE
	DbYj3MWDkx3HXUUOSSweqZKgPfu0V/rQ=
X-Received: by 2002:a17:907:c30f:b0:b9c:bc70:e928 with SMTP id
 a640c23a62f3a-ba41a91d717mr643541666b.25.1776687929243; Mon, 20 Apr 2026
 05:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com> <20260415-imx943-rproc-v3-2-9fa7528db8ca@nxp.com>
In-Reply-To: <20260415-imx943-rproc-v3-2-9fa7528db8ca@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 20 Apr 2026 15:28:27 +0300
X-Gm-Features: AQROBzB0Pu-szzo1dJ4AB7xUuHS3a3UgZozivXv7bKFQ8_vmaUhxl3EQBT9jCiY
Message-ID: <CAEnQRZC1vtN9nsbR6zBD++VkBVcVxxOBmPfEToeg2FimmkNMFQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] remoteproc: imx_rproc: Program non-zero SM CPU/LMM
 reset vector
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 10:49=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Cortex-M[7,33] processors use a fixed reset vector table format:
>
>   0x00  Initial SP value
>   0x04  Reset vector
>   0x08  NMI
>   0x0C  ...
>   ...
>   IRQ[n]
>
> In ELF images, the corresponding layout is:
>
> reset_vectors:  --> hardware reset address
>         .word __stack_end__
>         .word Reset_Handler
>         .word NMI_Handler
>         .word HardFault_Handler
>         ...
>         .word UART_IRQHandler
>         .word SPI_IRQHandler
>         ...
>
> Reset_Handler:  --> ELF entry point address
>         ...
>
> The hardware fetches the first two words from reset_vectors and populates
> SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
> Reset_Handler.
>
> However, the ELF entry point does not always match the hardware reset
> address. For example, on i.MX94 CM33S:
>
>   ELF entry point:     0x0ffc211d
>   hardware reset base: 0x0ffc0000 (default reset value, sw programmable)
>
> Current driver always programs the reset vector as 0. But i.MX94 CM33S's
> default reset base is 0x0ffc0000, so the correct reset vector must be
> passed to the SM API; otherwise the M33 Sync core cannot boot successfull=
y.
>
> rproc_elf_get_boot_addr() returns the ELF entry point, which is not the
> hardware reset vector address. Fix the issue by deriving the hardware res=
et
> vector locally using a SoC-specific mask:
>
>   reset_vector =3D rproc->bootaddr & reset_vector_mask
>
> The ELF entry point semantics remain unchanged. The masking is applied on=
ly
> at the point where the SM reset vector is programmed.
>
> Add reset_vector_mask =3D GENMASK_U32(31, 16) to the i.MX95 M7 configurat=
ion
> so the hardware reset vector is derived correctly. Without this mask, the
> SM reset vector would be programmed with an unaligned ELF entry point and
> the M7 core would fail to boot.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
