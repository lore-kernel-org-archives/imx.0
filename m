Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E5D1F181F
	for <imx@lists.linux.dev>; Mon, 15 Dec 2025 15:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765813116; cv=none; b=qANXamSzkoKBvem2npMZf1xfAb32soyfK6B+G2vcnLr/Oo34k55yLL9B1hDwPuziXDe786MSqs+K4Nwp/TCU/c7zdlkH+JAh+ue1C76013GokTvQZ6mdSFRPoI+UmkP40yhDWFAFKyHt3Jpc0Nd3Ho5oW0yP5qy/+p3StYaSLz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765813116; c=relaxed/simple;
	bh=JTYMLvI4lDVZi60pNDdfZc568ZhAd5KMAoHJpV53U7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6YAPWLahJAmPhepudnatporNTdfqHMpzVvnRd19qjX57Px39dW3Jkh9h4HB3/ffUz7/odeloWXIGJpszjgQetuzIsOxc4gAkufKLR92iwhN4OhguIGJ5ZYDpSoaqKQViL2NnAzdzwo3uJ00nNZXECkxYSdyShM5QXJz0872jeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nZ8Wj6Ab; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nZ8Wj6Ab"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37b983fbd45so29149971fa.3
        for <imx@lists.linux.dev>; Mon, 15 Dec 2025 07:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765813110; x=1766417910; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eSwy3gowjltzcyphb4214OlyhjdppYeuXISkRTiuQCs=;
        b=nZ8Wj6Abt7AX13u2fHkip8TZGTEqHna4UpAmckvqi1J51kUfz5U0FmvTz7fKH/Txfp
         4fKl9ML6JTVxTwBc9kwPmzx9+rAA1j0f5skKioeIRKHWs88zIn5SuS+fFgQNfpY6KeLU
         gsThQFdNnj0dMypge4RFxQju5HDl10CPFT2JMVFzDg955v104kkUI71ekFY7/UzCGtp6
         7uyG2oRGdeXMzc8rzyDhIo1M6133mZEN+oupCFcLvNusWLqlrWo8PCD2Uz7eomUVeVi7
         boqAcFg/yIV2Um/SSScwSDtZvXsIBSAKQR/n9zljhUELmYH7a4gL8qu0a8xKpML/j6o6
         WTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813110; x=1766417910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSwy3gowjltzcyphb4214OlyhjdppYeuXISkRTiuQCs=;
        b=LuUWWKMQZGu3xaWzPtUNPmczXpWdmW8j5nwETGTbdY+2BZARn6OEUHj9qlngK7BuXV
         I9BB8VbiJ6t6yYrG5+3mPuucuZuWwGlrmb/dHtuPQUTVGP5G9CKp2tiAwpZiA5gcj3fn
         X3ftoVA7kJDknR/+6S7jCEYFSh56R3JC9dp9LD4ziw6S1teB448VWpUnJKodiH3HtWq8
         aY73Ee0USqw9TCfhKOeK0nRSZpz2NMQ22pkcy5B+gNJuLdBBzBcHlbHABPtaMIfNY+OE
         h494s035goBGPdsBhe/kyZ4yvoYRzyOdone0Fvnzb8Jr7l4MQCy03ti2SHaUBN2WQ1Id
         wzvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaoCQiWEzhEwwxT5x4Dh+pg+mWmPace/PWCcTeKwlahRUh/JcTn3oJBZzvaMNYS4jYp6M=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIa5aUhEtE5QPfhBA6kGESqAn5AzBf06qv80Qz9MV2igJTftNS
	/98Z7H1lpWZrJw+wVzbvM/y0WdyyDEmCZxE4KrAVruF0TRxKckbP9YC8cqO4DiUGiOOMkPkJnae
	A1QWKprOH0+4NFE4WTq0Lph9j6al10pD4TtStI+kEow==
X-Gm-Gg: AY/fxX6gGoWBT8b17q0rsCzD3euEV97hOXcSg/kbOZRSRSTPYvd/D9twHMcZ6X/lgU9
	UHb3/1fDfmg/4ccv2KWnRQDKC4BWncfzEz6ktECFw9mWOc+YXm8pxUUETqLSHPP9zgpJSG25KXL
	oMO3pSrV2X6DHKwsYrZB6U8g9/47CPxp+mFeUXtWaFbyJA2jPLtEc/WrulyWGJrIxlk3zY/KmQL
	eM5I8x0gQaz8I2TnamIhWgyAQH5X1Ho/Ux5prCX7j+faucK1x5uWt2NVMloasc8htE7D9RB
X-Google-Smtp-Source: AGHT+IFKTvH2UfCK5w9sAwfCQuEQbWmLk1A+0vBn+uZZJXSHxR0e15Tqwz9KJoHJBnQOLz6m42UioL9EMQ8sboz7KhA=
X-Received: by 2002:a05:651c:1a08:b0:37f:c5ca:749a with SMTP id
 38308e7fff4ca-37fd071a3c5mr37413191fa.1.1765813110403; Mon, 15 Dec 2025
 07:38:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251215102010.608421-1-ziniu.wang_1@nxp.com>
In-Reply-To: <20251215102010.608421-1-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Dec 2025 16:37:54 +0100
X-Gm-Features: AQt7F2qN24rvjd1F8j2ygBPZqZUhdStl6C5Dtd7mmY8Ik9glfcE5mBkVsUP7kyE
Message-ID: <CAPDyKFoLmo=qDru67rj63gQwMjLqVKS+wEQecukuC+3Pz_CjDA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Optimize secure erase performance for certain
 Kingston eMMC devices
To: ziniu.wang_1@nxp.com
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Dec 2025 at 11:18, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> This patch series optimize secure erase performance for certain Kingston
> eMMC devices (IY2964 and IB2932) that take a fixed ~2 seconds per secure
> erase operation regardless of size.

Well, that sounds to me like the eMMC isn't really erasing the blocks.
I wonder how "secure" this is in practice.

>
> Currently, a 1GB secure erase requires ~300 operations (limited by max
> discard size), taking ~10 minutes. With these changes, the same secure
> erase completes in a single operation, reducing time to just 2 seconds.

Hmm, is the problem really the size or is it the timeout? Why does 300
operations to erase 1GB take ~10 minutes?

Can you please elaborate what happens on the mmc host driver level for
each operation. What mmc host driver/controller is being used? Does it
support MMC_CAP_WAIT_WHILE_BUSY or do we end up polling for
busy-completion in-between each command?

Kind regards
Uffe

>
> ---
> Changes in v2:
> - Rebased on v6.19-rc1 as requested
> - Cover letter: terminology fix (command -> operation)
> ---
>
> Luke Wang (2):
>   block: decouple secure erase size limit from discard size limit
>   mmc: add quirk to optimize certain Kingston eMMC secure erase/trim
>     performance
>
>  block/blk-merge.c         | 9 +++++++--
>  block/blk.h               | 6 +++++-
>  drivers/mmc/core/card.h   | 5 +++++
>  drivers/mmc/core/queue.c  | 9 +++++++--
>  drivers/mmc/core/quirks.h | 9 +++++++++
>  include/linux/mmc/card.h  | 1 +
>  6 files changed, 34 insertions(+), 5 deletions(-)
>
> --
> 2.34.1
>
