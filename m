Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19991D9587
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 12:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739966502; cv=none; b=Xl6OjbfDPqW8jAah/ymhLnc/Dr5Vr127XtuJGo9NxCbXm8RknGoSWbanUaKyqIWYp5WVR1q095V8oGGTyvhesFHdoME4Rlqug6hZyHOuiXFL4lxwVV0o8XFCiAefg3kM32Dwh2tX+OE1Dsq1dIQQ+yFWEgXmw7IKso9pb08cvzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739966502; c=relaxed/simple;
	bh=wcsXtdgQQL4VCUgznJrOnipwQmYIc9S+M6D4qteZ+tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itLAB+KxMf4tHk2ntXTS18hBMO7p4Pp5UB6hSkIniLS6O9eSUsZpWL0UkezijJdPublpqJ6xC43kSHcRe4mH9I6VMGO0DQ4nzRSQmnIYFbLZGEYnGbn2VXSkyS6GgKxxx4vck2rdckTgZzAFMRYC0aytmi8hw4OyX/bOtCEAc+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DqnDhmVC; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DqnDhmVC"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e5dab3f372aso705454276.1
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 04:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739966500; x=1740571300; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5xe0n90tbsq5x/xPm1Llh+2RuD6r7msq/tuY+Ym3TsA=;
        b=DqnDhmVCauwY5DL8Ldco324qUI5AZo3ckn/QI7Fy3q9/S45QbY77XyA2O3an4amART
         9kxXmEpGzyNVZoDDirA00Z5JgEQhyq6YuGPs/8IhyyZ4jsNWwE0HUQ5qf10aHewDN/DL
         CCehugFpveFyN39ssB603CWaJww/llJWByweP4+P3rNRegukHo+NsxnwqJU8I0V7HVnK
         gr9Oi5gFuWm0V54IHQeqkMrLK8v94G5Il0KKsnmQVH6eutXawvnOtoUwZYQg4eu/FcqD
         dAwV0fhWUZhOYcPNmuaiy9nYR94kLkeYAxwBYTxfhiYACh39/HqSjswGlfjBfhyKJuhe
         bINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739966500; x=1740571300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xe0n90tbsq5x/xPm1Llh+2RuD6r7msq/tuY+Ym3TsA=;
        b=CSG4ZtebfgNW6gM1sZwuQZ6up5NYIHMsJXDkSrpDDlfsS5aweG8N0CDHBpzV0GeB15
         ILSKGPsp3gDfb/DmeKacwG1BHQCZl75fnEoFHF3BV4Rs9wiNBa2Qmuz1xzkH4b+15v8a
         5MLRTRxPfXL5tUcONw2pRO+xzFKgHoz7qCVWTkG6F9+UN9V0bvkCFL0psb5bFdEUnOss
         QG2nGmrcZ699RfYWDKm3EB+LTcs+Xz2vyJxOE9A6LCG6VGA0wijWaYB/Rs6PUDZICJ3O
         PVpQPVdkgSyRyjv3pxXDqYsv+X6ueX1i1XrSUFYsK3C7IcQIGTqITg/Xf47IfzLO+Nj2
         xohA==
X-Forwarded-Encrypted: i=1; AJvYcCV2YavufuH7l28FOalfBXsGaGMeV6vNeonUGRCic7FmdDYQhTIcpBVK3yzEry5Paa9O03Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YyK85Vhx7Sg06nTCuOcDEnonsdMpZJd6lr05W1i9gNbvDYpoaUm
	FcD3/dZy+dYCgGBVa/zYuOLW8ldCNmElFmNkCQ+rl5ikUACOEMVXmPTmRM32yp3Lx7PFn85kPRV
	qOE4ovt/PEeVov7y+8wZZvLPIdr6phmNLj7zLPQ==
X-Gm-Gg: ASbGnctUoR/VHGAYpeYWAKnLswII0yB683oWDjimCo1mTRXkw1jSvcWAl3Lyn4x+q5I
	VKPX/gqyMspGEyquZj7bM/NDE67qkvXc8q9JRrMcHMySy9G0NmzDzggYWGS00tw8fZmcc/le31Q
	==
X-Google-Smtp-Source: AGHT+IGZ/+8xQ6gwL9boFRNAF7KVM22iCnqEax+j9Sk0drg1U/1wYEwbpzOiKk0ZPA6neRnIXD7xoQxd3GTjDpsqxfA=
X-Received: by 2002:a05:6902:1027:b0:e5d:f98f:6f33 with SMTP id
 3f1490d57ef6-e5e09a34021mr2671796276.10.1739966496117; Wed, 19 Feb 2025
 04:01:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250218-gpcv2-of-property-present-v1-1-3bb1a9789654@pengutronix.de>
In-Reply-To: <20250218-gpcv2-of-property-present-v1-1-3bb1a9789654@pengutronix.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 19 Feb 2025 13:01:00 +0100
X-Gm-Features: AWEUYZkq7YJtxfAEssq6nuztkZ1WzoS_qm-UMarQYj6y8mBUO7XjlBb-t9JXEpQ
Message-ID: <CAPDyKFrEHXhb42rnpjv0KqaUtRzKhX11w70ZoTM8+u9rYDJyuA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx: gpcv2: use proper helper for property detection
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Feb 2025 at 20:18, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Starting with commit c141ecc3cecd7 ("of: Warn when of_property_read_bool()
> is used on non-boolean properties"), probing the gpcv2 device on i.MX8M
> SoCs leads to warnings when LOCKDEP is enabled.
>
> Fix this by checking property presence with of_property_present as
> intended.
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/gpcv2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index 958d34d4821b1be68d730ad345037b8f0a56c45a..105fcaf13a34c787b2d568bc64e7fee9bfc23393 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -1361,7 +1361,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
>         }
>
>         if (IS_ENABLED(CONFIG_LOCKDEP) &&
> -           of_property_read_bool(domain->dev->of_node, "power-domains"))
> +           of_property_present(domain->dev->of_node, "power-domains"))
>                 lockdep_set_subclass(&domain->genpd.mlock, 1);
>
>         ret = of_genpd_add_provider_simple(domain->dev->of_node,
>
> ---
> base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
> change-id: 20250218-gpcv2-of-property-present-158f8dbfe2dc
>
> Best regards,
> --
> Ahmad Fatoum <a.fatoum@pengutronix.de>
>
