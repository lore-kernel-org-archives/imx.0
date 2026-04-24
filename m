Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA297314D34
	for <imx@lists.linux.dev>; Fri, 24 Apr 2026 08:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018500; cv=none; b=iIpN+0gObni0ElrpgBneb08dfgnBBMFFKjH3Ryh8Is5OpWzVKga1/yAkD1lTMY7kS0jUirr6Soogp2RP5vzQ7jJ436mVGpFAuW56LEDwRKLcouLON4SDzEOhfOr011b+Q9ZKkDWbF7a2Xbb7VZ2NZUg9eaY/3XKGGz4KfFfAiUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018500; c=relaxed/simple;
	bh=9fyu30Oftn9ohfIUdEzIbgQz3LjGLQmWulU0txjr59M=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqKbR6Yq3K+T+q8ii3wUIUDJInYriAvq+z/rGofutMbJvtmNUveCS2dM9Cp4B3e6jKCknwjTYBwGFBmDBd8TbCvkFiQKjDxhHn3uOi8gCv4WvU819oBmV5bNRycf3ovdXRNVyLqBCvwFQFiLeDBXGWUdeV54W6zxFALs94zVkGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eApoQHjc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eApoQHjc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92891C2BCB5
	for <imx@lists.linux.dev>; Fri, 24 Apr 2026 08:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777018500;
	bh=9fyu30Oftn9ohfIUdEzIbgQz3LjGLQmWulU0txjr59M=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=eApoQHjchj5JBxhPcsli/ymo5qto9jxKmoRTtSM1ZfaKlGQ5p3MGGgwvIw6uVzybd
	 2UfN6JnLEjhcKNd2jtlSVmRf+HhvSy3PFuHgzAwhMsggZNpG3+KZWqsEp7QNgFddLL
	 zFxQ2U5bUmpMg2staGmksCrSaq2JpGgA2mudYitwJ64a+ekUltDi50D6JU0dxFIsYO
	 tIasFL8q53DHSebCqKLcdHyoNvdRpEabVTJElAW4mni+0k2Jro0SBvc4zYsVwUuFsB
	 eOKqt7I9YVmVr4rSfnF9Yh+T/8lBNt73MFZvqkqdfIe27RqW4yAosz5WELR0B+z+n6
	 sMGxAYI3FmPmQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e7b8e3f38so63307881fa.3
        for <imx@lists.linux.dev>; Fri, 24 Apr 2026 01:15:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+hwLaRDx1p49NtFvV2S1oiI1YjyVrfxGz3Y2CrEM6HQ04aQ8i2r613X/BUFADB8gN7/h4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaMY5gmNchHY6vvKLhlTvl8iCPZ7iycHlxPRmezANwrXNvHe8b
	pSbQZk5jn9Qj9Ro1wjqcsfwXn0SuUpuJonoq10S2gN5pVGKVq/1gVfQjApySfOAjmg+CHxtZQrn
	QmGy0kZlUy9thvhZExtevsADA3cJP+3szKHhOaPSqag==
X-Received: by 2002:a05:651c:41d7:b0:38b:f632:e0fc with SMTP id
 38308e7fff4ca-38ec77f6762mr94772331fa.1.1777018499076; Fri, 24 Apr 2026
 01:14:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Apr 2026 04:14:56 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Apr 2026 04:14:56 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260424-ds90ub953-v6-3-7a84efbab316@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com> <20260424-ds90ub953-v6-3-7a84efbab316@oss.nxp.com>
Date: Fri, 24 Apr 2026 04:14:56 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mc4OfNV5++4qAFsqqLc4DUeVK7fyZqHYtZQvSwmZnbnuw@mail.gmail.com>
X-Gm-Features: AQROBzB5gvtfuPCI7WpxRRoySyjcEEuN-HwXoxfW5uWOp8T7YWLltn6XjRSIokA
Message-ID: <CAMRc=Mc4OfNV5++4qAFsqqLc4DUeVK7fyZqHYtZQvSwmZnbnuw@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] media: i2c: ds90ub953: use devm_mutex_init() to
 simplify code
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Guoniu Zhou <guoniu.zhou@nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Apr 2026 03:42:26 +0200, Guoniu Zhou <guoniu.zhou@oss.nxp.com> said:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> Use devm_mutex_init() to simplify the code. No functional change.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v6:
> - Added Reviewed-by tag from Tomi Valkeinen
>
> Changes in v2:
> - Move PTR_ERR() in dev_err_probe();
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
