Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E351D0E3E
	for <imx@lists.linux.dev>; Wed,  2 Oct 2024 14:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727879231; cv=none; b=R00S90bKOSVpvpdTK7EQhv4CPIOyawLFMV3EYnq7LEu42ZNtOOC0txNMSUVb6YXMoEQGbDXgzlyRUFhhCg05oqnjLONC5I6gBZT7cgcG2RSnBWsi+Mq0v6mqB5DPl9rulbwPJyr4tTjK2OXkXr3aJQa7N1nnYdtOVc1SzH6jYY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727879231; c=relaxed/simple;
	bh=mXpbdK7Sq0w2/rvqDMV4yBmzLIisStvdz6DZb3g+TPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ithwkx2WUne9MOJ3kAOpMQfKSGwVwts44OLYoi3ST6O1qLJ579d3wQL0n0yslCv6YWISMGbc92BSVeTjSSvinfB+pGFf2OdnhN9FwUby9SFsg04d/YVxs/PdaqfVxbEKyrHjlnOp+OQweJnLCwvUgSLvSdC7A+QjXb4ab779DAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUpAINU4; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUpAINU4"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fabfc06de3so46470901fa.1
        for <imx@lists.linux.dev>; Wed, 02 Oct 2024 07:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727879228; x=1728484028; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMQuC8eL5QcCXYaC5lzjaR01YW0PMzH7qpPYpr9RF+M=;
        b=DUpAINU4hEfG1Zmn6gXokgQAbXOuh+BANf0Q+mx4lQzcK1lpySGPSQ5yIsShlMQ2tg
         cDV4C0QkeBVuUVFRScEj6m0QJhK+3ErgzZtgwbGRLybp7Lnowk+E+MYGSkO7TAx3qOgV
         kiu5wj3H3W6EK6Koi6QdkMuASONn0xSKSF1jPFklWmqdoW+YTRM8u0+HrX4x3634s6HY
         wM0kq3HQH7lVuqED5A4bM7jS2JxODtlOgbpItaBUMruF0AwHMgnKj35W8HvJxy6jlrmu
         D+YIk3iGm3YPsJ4Y2WK9z6Wr6Kh3HaG6W/pgtYLTSag0ft0ab3ahZVqgvKaij6pbkhKa
         fqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727879228; x=1728484028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMQuC8eL5QcCXYaC5lzjaR01YW0PMzH7qpPYpr9RF+M=;
        b=v4e3tdFTBJr+0oI+PdDYWN/BpQORN9ysWA3igxUp7Z4cH3xWaln+CJfahmz+1+EQ3g
         IB2rdHPEXmHWrtkONeTqllLCYOcgcFth6MpIOrY286gXduB67LqT445MAGE0eXz3pWwK
         DXaxrbX8a/jlP0ObIQ6YY6AOL16BtGEg7YrMZg96Uh8hdiiIJ2ftfIxavwqwsgoeI6fh
         BEENKYVsAbW3jiMkwF4F3wJSFL9yJoKSdl9QaenwXMdmfFzRiUqY/HweW4a2Q8khbzwE
         mdKBr9F6adzIok1KUaI3y1FUidN0fZY6gXEZj1ohz0PuJ5X9ShHbDFMSHnkosXuMDTWn
         Uurg==
X-Forwarded-Encrypted: i=1; AJvYcCUqDQWC3hS+WfEARgcy+9gNdJM0j9ZhQmp79trjGvxSNOwp2YdgGmwmihAABAon24ZDoPY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxiVlQCun1hifFNKaqrLE7hYrfNbHG+P9AZ+q9pwKA9Q/DTXV7
	R7jfodngDtLHjT2Ja8h5Og8eG+EucT4bps8TZbvgRF3ZZFr0WqsHLzKzh9G6bEWFELLnNC9NfFa
	58CmtK8ReikF6m7JIQdtXbXnM7+c=
X-Google-Smtp-Source: AGHT+IE8qUOPkLOfKh5iV186CwCP2O4ajUyERQPCfMPnVnzucrFoCg/aLu/lkBR4cCrnFTNs6talv9ATZxZh06cXVe0=
X-Received: by 2002:a05:651c:b2a:b0:2fa:d345:18b9 with SMTP id
 38308e7fff4ca-2fae10b4157mr20508231fa.38.1727879227334; Wed, 02 Oct 2024
 07:27:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241002-fix-imx-pc-v1-1-95f8b89400ee@linaro.org>
In-Reply-To: <20241002-fix-imx-pc-v1-1-95f8b89400ee@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 2 Oct 2024 11:26:55 -0300
Message-ID: <CAOMZO5AijM3jQ9q3xAcPfP=duar+oMbzJJ561LsxbKscmEUyDg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx1: Fix too generic defines
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Esben Haabendal <esben@geanix.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thanks for the fix.

On Wed, Oct 2, 2024 at 11:22=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> The "PC" define is colliding with the (apparently broadcased)
> define for "program counter" on Loongarch, so let's rename all
> these 2-letter defines so they don't collide with stuff.
>
> Fixes: a55222b7a132 pinctrl: freescale: enable use with COMPILE_TEST

Nit: the commit title should be enclosed by ("  "):

Fixes: a55222b7a132 ("pinctrl: freescale: enable use with COMPILE_TEST")

Reviewed-by: Fabio Estevam <festevam@gmail.com>
