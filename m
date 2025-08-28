Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FDE2882C5
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 20:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756413506; cv=none; b=K8tZUr44zcKUrX6P/EL3zw3rlqqqjn/lQ4BJC7v3WWLmKdy8UDqsFSnChRFWR1zGPF8yTcycbZ9WABDR6KYTzf3vyDwPE3YKBfNNvK1d5FZY2xYO4m0TlkAoWvTV46Ri8hLPYC+KsC+KXWsAJaxRz9dcZB7lWKsSeDNg7noPBcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756413506; c=relaxed/simple;
	bh=oW06lVNEVHDH08IVfPjhIMr807RG24V4E9Stxt2ZLtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYsucSnJoQos3TL3HayX8Zs7kNZgI6Thyp7aBL/Knv5R1EpswhIGc5972/qze7K2ymze6PV4/TbRJhMwRdWzI5qATz2fcX/Zul4IlkMHlru7AuZRAyjKCxpYvt1l3/Q0/Ag5SK3blHvY53YEesynQsTqGaWy02z+DCZBxXcMXrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qzOTNiJV; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qzOTNiJV"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f3ec52a42so1527913e87.1
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 13:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756413502; x=1757018302; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oW06lVNEVHDH08IVfPjhIMr807RG24V4E9Stxt2ZLtI=;
        b=qzOTNiJVh9HJCyyh3u35Qt5kooajNcd7LWI5YnJEbaFMSE/y3T/pPNSudQDRrtScuV
         h3iFncrcrJCF3OOf7FonPRbvrkLUTkOO5b/Nl1XG0H/h3kWw2xLJcVk2SbOQ3Hq8x7qx
         EIT2DM5n55QoyxLaQwco7t/GcovB1TuEyvqSQWUR2oNAM7KPRsORTWFxGWDVBUklb4jW
         77Eay9QEV7JLyMKq7Z3n3ljAUPI6aZl7G1WuZ2gMSaVBh/7prkuKzrO+v/9vb8srV1YZ
         xcsCg9BcrrUvdq3aiKBZ+Z8q+3wbTrIVgtc4AcjTi4sf+o80E4k1YOvK3mefj768vkqG
         84eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756413502; x=1757018302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oW06lVNEVHDH08IVfPjhIMr807RG24V4E9Stxt2ZLtI=;
        b=KBSXaPj7Jh/41e8h/WTnpES0yMd03Jx+3JZ3euw28ZlVpclxTYjtaxDK5AOnRlxuAL
         TwALjfVPDlzmKDPDMtBrg3sDtww+SP9LBSTT5LP07vWUcPu9nDkzpQJio0aocGGeGrWv
         rFt3oX12c4my0ztBChzIoNKwb/+EAeqQbGBjYO0fzW/9oZZMdtooYgUMR6cQzwB4v9sX
         KTwqateNv3MueQl6FKWjRkSTQlvOmZo03+pQfWXD7z+3tpElQgm4i84Zhg6SAlfm5oH1
         SUd4ue9Olr8LQxaw5F2KSYzjKhLSt4jTSdtr04P7A3l6lj++MIS5C0v3t50yfW1U3pC4
         EgXw==
X-Forwarded-Encrypted: i=1; AJvYcCVNMJ3m0WqG1u50SrpoW0+k66UMKUUlbyOPEdCYMBHyMyLQaeYnmWAs65HFYZQjLW4VRgY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrUobHNXqmlWD6vebOd97P7aLvsZSmzwNC0GRzWmV/H7SrisUU
	2yU6PyH059wouSaASa66bh8l5EnD3753bxdPBLvAqwnXJSIKLs/8KVlU9Bx5gP7/n2wjBuV4CFK
	wVHlqvS8BRIO6JaGtd1gxz/CgblKH1ZDX4bVrtWIz7w==
X-Gm-Gg: ASbGncvAjnv6zLVRvbAXqO8pDVvAhvI5oBDJ0yfEbb+tu85vXDLjTXy9nTxSzombkAp
	12ulIx30YwaXG5oP9XA4c7nSD2sEIFXP+73g8xCAcMccpU/7skNB0685VW4n1BQScIW9jLg7C4c
	/vekXqBy4E8aivW27sHsjpM4inMsXK0hbkl3FEuspHC659bnYodDvwNgxXgxeUfZG6k9v8P9VPa
	4BcW9EnNMbYlMbPcQ==
X-Google-Smtp-Source: AGHT+IGFctSS9xIvuPsDh46p14WQZ80AJsz61TeaeY863j+AA+52SQqM5uWJISSdTvREAPPmDBfGMmRKqf/htgUE6Y0=
X-Received: by 2002:a05:651c:1508:b0:336:b4d1:a304 with SMTP id
 38308e7fff4ca-336b4d1be3bmr1583191fa.44.1756413502286; Thu, 28 Aug 2025
 13:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 22:38:09 +0200
X-Gm-Features: Ac12FXy-IwjUULMJvRyUzt8VKPtHqknlXLB_SFxBVFF1kcuFfQ2Q2i3x0YxAaf4
Message-ID: <CACRpkdbcWiq0xCVUwh9VZ+_JU9XOu=SgVKHr2YMSuv3Bnee+tw@mail.gmail.com>
Subject: Re: [PATCH 00/12] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 2
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Yang Shen <shenyang39@huawei.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 11:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Here's another round of patches converting GPIO drivers to the
> modernized generic GPIO chip API.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All patches look good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
