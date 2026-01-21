Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E840413242
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 16:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011502; cv=pass; b=CHOjIomF7xKkfhoZ+hA9c5/mKalzNSbED2zwsgZR0jWqrUoerPrQInCfSnq68RRMHcIC603hVNOxHusdfDxHVIqRlF16Dggi/rYtmKl0fPds6VkMk3UBIWE9IhQO2LpyEMeePDEH7sMcHBx1U4BgAi/Xc3TvOlrQv/LKCFXUiVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011502; c=relaxed/simple;
	bh=9WOiqQLpe14jHkn1GS7iuJPEZv0ij0GieIC49FmEKNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hcm4vls6RyDSY7q7mVMhtXAvcwktlPJYMfVqqIOXcNqAR2ZlKmchHQOJz5FwiGwAyEIVj8ZUl1/DHSRxmRXMjlp4VU+66JwMku8LzDmGhDH/jcwPknFDa3tB6QC5DvObhn/+S4zoVEDEidlmG239XntIDZ7Oxf3CdXsUkdAEvLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ee8tYc+w; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ee8tYc+w"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-385b6e77ef9so3271fa.3
        for <imx@lists.linux.dev>; Wed, 21 Jan 2026 08:05:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769011499; cv=none;
        d=google.com; s=arc-20240605;
        b=PJprGBpFFc6/ShWF89S99RwIgvc3fChgVKeM6t9kjcOe2DiOlKz1XV9TgBjv2dE9cf
         VMUwajHNnE1cKXuto/KuWqEqDsa4MVgn6+rBnTSihd0FzF2EJqRJoB4qQ11K5v+CmPMa
         rLxjeuJTaBsP4cEdqcC4aoUscMIol1J3ufiCfoGzpz3mYq/EsKD/rQOILiGvmaniLb2T
         oWE5q1iYitf2cQT7SdJjfv58UV3QCTDULDliXjL/Jd/ojRqd1a1duP7XdjwxtVCiU5D5
         YQe4xJQS74b7ozjysleL1iICS17ll236l67OlbgT4+58sV+B3pTx6nr6Y3Kx7XxVgAwq
         ih4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aRe4h42gYYt55oqZ0VJMAxvd6IK2mO4/T1aM6Skm7C0=;
        fh=gZF3yrZpEVbQVHDxMa8LJNB4FR95lmgYz7JYir649vk=;
        b=JpmSMchtir2xUDDrYgB4gv+axjSWIPuIq/h+it2F1g0agTbKFQGSST1qNOCyrYgG/V
         dwCamcXtgfI4zZgYzyZxmgVM0nyYXnCYc2XxGsBoFdYM/EamJII5u0Jl3SHkPbppoXuo
         dd7Or/HkYT65ZUgGBnimqhN5FO0cKg8uNiTAngNZNwqAeclJlK5g9uvGOYBA9CSkyvIx
         OyLyeT8Qxyt4qHT/K+TmH7Bve53dr9ZJm5lT/U4isaFUWZtAtN8T+YmrldPdstv/8/bI
         lRMp18ItM/LSNV+kSnzNkxKpGZyaM3zZaDCkuxfWerQ26RXJZ8cisXZijrgh/JphmMsg
         J8oQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769011499; x=1769616299; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRe4h42gYYt55oqZ0VJMAxvd6IK2mO4/T1aM6Skm7C0=;
        b=ee8tYc+wB0iq83xt8MF2yl9uUz6ip3qDXEJoFCgljp/5f8K9YUPtRSBZhx3/+YXUXI
         s4J1iFiaxrQ+0fgq1JJOQZJJiPHYRUshKARviW4vL8Lhmy9agl7Z+3XeLjGNTR1iNBdc
         DIglVC+MT/V/jfs5tPPmHQFDUGiqh/JhqwAr/sa+FnNMttIpNrzDDolfX/OzLRH8zkZM
         0/0cQBAUTIk1Z3I3T+bVZi46Sj2A5QKobmf6BgmxakBG1AF9X6rPvUpNteS6S86Sgi3W
         dTQxLQbrAzn0tiq5GsyDx25eIpaS2aNRUIlicQUiYWPCjvE80G8bM19x+NUzdGHbshZ9
         j7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769011499; x=1769616299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aRe4h42gYYt55oqZ0VJMAxvd6IK2mO4/T1aM6Skm7C0=;
        b=Kvo1UN6FpXlOeQpEZ/uAQxHeo6j+9DVp7n9e5qCPzhfzqgcoCrvxb4AeIeFuUX6Ui9
         QHv8wz8K8qtXNLgcIt4HQdP/N4V6FuftCn6lveVQxv9qe7PfF9fgzp9VzoHJBkK5rXGR
         z1gQb0l10H5/7kDXRYNUtZ+44SKfOq8Siqx2XsnqBufkH0AT1z02PtkXXArJYGViDeS0
         8A9qJPLSfE1neFh+wmOFJfEgWgMBam6Kg0EYNZusgI10MQPpLHVrv/fDOHcdjdjW0yYa
         gSyAvO39MgNFKu7fSbg1+BXoAbgwQlK8cs2Up1iu+ABOPJ0ekglf2w3dAa7Wzaqg7cDZ
         gD+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWx2JLbHU5NZLk6t+NqiiQMmWnogyKullXz+BGDKLu9niCkg0pJBMY0LibSkNRnrg364jc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc2l8bRxDpp4+YGzyYSgZUZWkpZaYhnNcPI3DPMHjZkdAEy/+r
	nPbN7tuzV87OuvBTOVFhqr9SHTuEAobS4g2zEBO2VILBUyJdys1mSBjAEiib7Rj61YL1oWqwJw6
	Xwln6oEf5OTKGvnRjXCNDsQQXO5TxpnU=
X-Gm-Gg: AZuq6aKgcRCZsbR1wSKSe8GZqqUJhPuf7kJvBdn4l5qbvRLmUHU/5t6yfcVE70ed223
	JvD2X/LZIvhtMho9M/AaM0GqsW9dtyLm0hMZrs43VBZ0QOOrViwaS+AgDTZhc5hTIsJY70LtFdd
	0GN0j4Y+yHftJ8KhG2kMp+f0oVTmoww9jO18/S+S9h5rxzJoE4d77t8fNOYfZN09HCRMkaKseP4
	/1QXwth1BDVACo/RwkjME0Hq6zQrLCz6CA/bOxZwJZ6I8BIA+wYCtp9sy+U5hBRcSXdW+kEHhrh
	2eyU+dXSnYj29tR6SXgefPwp
X-Received: by 2002:a05:651c:50b:b0:378:e079:ecdb with SMTP id
 38308e7fff4ca-38386a5a857mr68389931fa.32.1769011498915; Wed, 21 Jan 2026
 08:04:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260121142047.10887-1-shawnguo@kernel.org>
In-Reply-To: <20260121142047.10887-1-shawnguo@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Jan 2026 13:04:47 -0300
X-Gm-Features: AZwV_Qho2JYpTZVHBYp5J2gwGqRpZGN_LJftzAyI3mmmYjQYuMr8IbSZPCWO69s
Message-ID: <CAOMZO5B7Xp0jXcxmD6zJeT2Q8QV_AiQhC-e3_q2viKNsek09+A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform maintainer
To: Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Linus Walleij <linusw@kernel.org>, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

On Wed, Jan 21, 2026 at 11:20=E2=80=AFAM Shawn Guo <shawnguo@kernel.org> wr=
ote:
>
> Shawn is no longer interested in maintaining i.MX platform, and would lik=
e
> to step down.  On the other hand, Frank seems to be the best successor
> for this role.
>
>  - He has been one of the most outstanding contributors to i.MX platform
>    in the recent years.
>
>  - He has been actively working as a co-maintainer reviewing i.MX
>    patches and keep the platform support in good shape.
>
>  - He works for NXP and could be the bridge and coordinator between
>    NXP internal developers and community contributors.
>
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>

Thanks a lot for your great work over the years!

Thanks to Frank for volunteering to become the new i.MX maintainer:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
