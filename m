Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8803397AF2
	for <imx@lists.linux.dev>; Tue, 26 May 2026 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788781; cv=none; b=OWOsaxxv1PNMw78k8V9StiwNKCXhrruZJ8Tmz2MW6Ku8/3E5tl0VZuyQdj5W0YvLUdscNI1PQFrKnaTljRwguJWSPFE5EZmhzGtkZJ6b5kKi+vEp+kBCmJAqOj2srqpb+A+eD/hdrx0VnUhzMnYWzgkA4G7f8xHZvx1pBpGwCTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788781; c=relaxed/simple;
	bh=khYHto0da/rGsGN1yk7Vbe05HTgfzl5xI2TS8KPj3Tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ctSRdvijynXtPvWW/GeYQRGobC1s/Z0PVsyCuiDts1A1KS8PF73d6dynw1lSuPsDPAA055XSnZmMlgM1uUrwRbV0ad+0OEsRLPRtg7FlTItuKfgaTrfX8/i3pNnTr34NYVwAZyai7VDmMzBm9praxzOmOQ+DGcLVG75vCzU9JIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZC4nw5Rl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZC4nw5Rl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF911F00A3C
	for <imx@lists.linux.dev>; Tue, 26 May 2026 09:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788779;
	bh=khYHto0da/rGsGN1yk7Vbe05HTgfzl5xI2TS8KPj3Tc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZC4nw5RlVagCmmwh4piDdw1J2TtzBgSQ+gE2+/aAu4gq5Ues8ljzCh5XrVTRPMPAl
	 wQrjB+ZBvM+3odSH4XpiLeAErDAIbRLShUgJ2xSBGmAnFejCqUJJMHEbwIhMIkeAnN
	 V6IDBUtlQZ/q+YN45k7LpxS+1jBMMrq+tPTMwqP5ZZZhOHV7sfaTIrjZ37daUqn29N
	 FbWR2IY0/ZwxyOVioJM/6adNGD9JE5ucr8yJ4kNcWemjyQPWiBevgsATkU/FV0ZwO+
	 YA7Q3VnJbvVFECOdTok7R3VkgeL5Hb6um2GYL5R4ozYD09TUBXC9pysNClMrx8bXqj
	 vwL745W8zPYwA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa1b2327c8so11959322e87.0
        for <imx@lists.linux.dev>; Tue, 26 May 2026 02:46:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/9gm01+sVKAzFNTZocXJ47Y0TKE/oW/wxyVUZrlymXKLuevE4gVGrTKeWHNSwAr10IU4g=@lists.linux.dev
X-Gm-Message-State: AOJu0YyT67V4Cr8JNc8W7J4GI1uVjjfYfh12XXbnJMORgzLA9TMyoQKb
	Wv31ZMjzNif1xjUh9IND6n2avR9Qt5vIjKh09NVw6UA+mGdErNQ1uGMqH0FD2ounHM6iVUtxn2w
	xLtLiPH5ypD22vfl3IakLZxnpxntbcSA=
X-Received: by 2002:a05:6512:a91:b0:5a9:163a:9ebc with SMTP id
 2adb3069b0e04-5aa32328f6emr5890808e87.19.1779788778299; Tue, 26 May 2026
 02:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
In-Reply-To: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 26 May 2026 11:46:04 +0200
X-Gmail-Original-Message-ID: <CAD++jL=YqfDXE9OgKX4fbk0FgK8=W0gWMVHJ1icmHkRd4pN5JQ@mail.gmail.com>
X-Gm-Features: AVHnY4K6rfRItQ-L5UFwu1FlZNpnb2Hkdgdyqdf1qhLTp0XnK7hfhnYE8AoesZ4
Message-ID: <CAD++jL=YqfDXE9OgKX4fbk0FgK8=W0gWMVHJ1icmHkRd4pN5JQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx1: fix device_node leak in dt_is_flat_functions()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 12:27=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote=
:

> for_each_child_of_node() holds a reference on the iterator node that
> must be released on early return. imx1_pinctrl_dt_is_flat_functions()
> has two early return paths inside the loop that skip this cleanup.
>
> Replace both loops with the scoped variant so that the reference is
> automatically dropped when the iterator goes out of scope.
>
> Fixes: 63d2059cd665 ("pinctrl: imx1: Allow parsing DT without function no=
des")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

So what we got here is a non-critical patch on top of something that was
critical and was merged as fixes. (A minor memory leak is not critical
and not -rc material.)

Linus (the big penguin) has been annoyed of too many noncritical
patches going in as fixes recently so can you please resend this after
the next merge window? (I will try to remember the patch as well.)

Yours,
Linus Walleij
