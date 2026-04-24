Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843E8221FCD
	for <imx@lists.linux.dev>; Fri, 24 Apr 2026 08:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018535; cv=none; b=gQyiHM48i/RiLhlHGITqQjxoNbYAECE2Oyv6BsZQGjqhjaEIx1KtD9oAJGDE4jyNUiplHsiZpR1VIFeXC8hfUs8U/HEysLxY+IS1Ea3wXe5UkL8moZ04REnkcY/SJCdGZ5aWEVYiWfqMx6dyouqa33PZq3F5OA2nt16TxPZBdyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018535; c=relaxed/simple;
	bh=LEr3BACJj6XVTWXMzO158BkhzDEhsWmibaO4W+U7Ayo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmdLmavITCSYXN2o3jHsN/0Hd6YAfEH9hYPqCCOj24MVaHlGyyOYTK7WNqV+ZYoi/GmDQnWwAlOsOuZ7uB0gIXYwyeeoqUWrIjX6ZTnTiaM8tTjIq1v3KBZMtPDQZQxOqElkA1qPq3fSWuCTb4eYazLkojJajnGG1HpJsvdjyTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ky9s8iVu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ky9s8iVu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A6FC2BCC6
	for <imx@lists.linux.dev>; Fri, 24 Apr 2026 08:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777018535;
	bh=LEr3BACJj6XVTWXMzO158BkhzDEhsWmibaO4W+U7Ayo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=ky9s8iVu9UZzUgz4oZHEGJal1XCbk1nR34hj/n4G2YB787ABWDGW9yr4caFjMHKV3
	 EzsSe2WUHLkCMuQP4ZP+BLxB0Tc6tS4vQUNNGjk3sHdJ1Eax44DkrMK9Nbswu2nMG7
	 qUqDXrk/2O03PsCpm5BpFoQZ9q5hVLiOPefbf89vQr/xCrkjDKiUKvPGheINmhKq4r
	 /tEKTRFGaU64Evb4WOGOQtK5up/C6rg2oIzAB330y4e6ygOOZmIkz0XWmy1lx5N3Te
	 Srft2132/5Uunok+EEcv2JJ3cewTDr+VvYue3U9oKfQYVMVb+5JCgSrSo2GzwqJ6EY
	 etS0q8s4vRkdg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a41099fa86so6692167e87.2
        for <imx@lists.linux.dev>; Fri, 24 Apr 2026 01:15:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ldh6V210bBsVh/woAJ+YfVmZoTZHHcIe+jAjfFtvB7j446TlVWZ6ZuxLCBeNUWbZLp0I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNX0NY2ZvoFAzCwIGdAPZo4Zawjj2Tuxqn+sLl2lIYfufApFhL
	RYPFQeEebDrrDWsaFFBg350Bs20UL6OPzqc5IDy7oISvX70sbwFp/Ycx2ufpcbFX89OAZ1aG4SY
	jyHYh6YLP+vdhnu+5Npz37FXUY9U7n7hl57oH+BCDVw==
X-Received: by 2002:a05:6512:3e05:b0:5a3:fcb2:c6aa with SMTP id
 2adb3069b0e04-5a4172bfee7mr10100360e87.13.1777018534026; Fri, 24 Apr 2026
 01:15:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Apr 2026 04:15:33 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Apr 2026 04:15:32 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260424-ds90ub953-v6-4-7a84efbab316@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com> <20260424-ds90ub953-v6-4-7a84efbab316@oss.nxp.com>
Date: Fri, 24 Apr 2026 04:15:32 -0400
X-Gmail-Original-Message-ID: <CAMRc=MeOaoqHp+gggB+6vL9KQw2kCuZs+5CUzJaK4y4UJuwjuw@mail.gmail.com>
X-Gm-Features: AQROBzDQRlOeuz04qHRMbEeBWKxIrxEsUKcpJuqxc4zbk3ccv1ESs0IjA9H62zw
Message-ID: <CAMRc=MeOaoqHp+gggB+6vL9KQw2kCuZs+5CUzJaK4y4UJuwjuw@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] media: i2c: ds90ub953: use guard() to simplify code
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Guoniu Zhou <guoniu.zhou@nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Apr 2026 03:42:27 +0200, Guoniu Zhou <guoniu.zhou@oss.nxp.com> said:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> Use guard() to simplify mutex locking. No functional change.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
