Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E212868B5
	for <imx@lists.linux.dev>; Sun,  4 Jan 2026 11:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767526687; cv=none; b=NDocWgfcGNTn91iXux32OLrUxc6BNsiGe2r9TVHc2gem2kJuZw8TPWNW6mgvwTnXpAtqb9lizgyZlSNhyHk3mEydUe5uHdR4Zec7t0lSYcyWV2+lY9avr8tKJjyImv2E9liNtWzACZV3QeMFjQ9s36twKBrLIm1cOcBExJIHMIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767526687; c=relaxed/simple;
	bh=zzt8nsTReCOrFFimHSYnuwYVhyLibD7TXrGiySpB+f0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TYLDmR7NJ/gkqOIUHaftt6XDnaUmaExwVcKJ6m+O7tSZn4Hus0VjnXE9nGqqknEV5LnK3WQEyYQy3wE2k3UoFLKmNmfT/ukZJ2K8rSJ0b3ltCiZXSKW9vETMMaAbq8L2J5J1wRT6iLFx2MtfjWSB7vJBXzJFW+L1tKtRA1UWlVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+Ry6+QP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+Ry6+QP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE05C19423
	for <imx@lists.linux.dev>; Sun,  4 Jan 2026 11:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767526687;
	bh=zzt8nsTReCOrFFimHSYnuwYVhyLibD7TXrGiySpB+f0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G+Ry6+QPOkBBcBJbHW2neCD+lpxjvvgqlnRTj+dmLXWcbfjSaT8gwyYfyWm5P+1zB
	 dT9DPG65ISjbkZfDmBcfNYHvPRsAVnM/aCmTnMzRchYjUujLkjkwISZbT8nwKOWYUa
	 SW1YbPvOkN1KqBnlXU3Zx/M10hBkbqgTAw4Ohb67vGnOLDHJOwyDxzNCfvKFE5IUnY
	 nBG/A7xrdk3uxiCCwNqDl5DjAXpJHbTMg8PnBN1zEvh18g6q5OGcXngea5WpUhuJXe
	 r9j607+jokQ6cCCW396lYQR3PjV9oUCWhWLAoGnT9zxGY6GBRwl+1Z12BP6UjKlgMB
	 ymicPIXVjPheg==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78d6a3c3b77so10529887b3.0
        for <imx@lists.linux.dev>; Sun, 04 Jan 2026 03:38:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXeCUcRONquF3MnCOkihq+DXJ7WwYTb1B51ZMKfz2fXrKIQvV1Cgrfv/4wBp5yRGJ3Uvlk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+be5Rve83UC+PRqO5ylzRa7+OHjaQJrVJcqfe9ORvgTJmZIw9
	QWwdbSFadMm2wGu6oij2dqOcu4h3VDSwleW/e93nWs1GKhTt4I6QlKkQWVfX4i4mQFK7J7yqbST
	KgNEPBwNxQkDJgOCfyNteReicxRWuzoI=
X-Google-Smtp-Source: AGHT+IF4Orabbp+U3oU6DE4mJfK9KKnbEOxrcm3UcvoG3IBBIUd0oK3DmWjwYq82sAXiIcIbWSh2iznA2Fvf8inAirk=
X-Received: by 2002:a05:690e:b4d:b0:645:591a:cb5c with SMTP id
 956f58d0204a3-646e341a6cdmr3638468d50.23.1767526685648; Sun, 04 Jan 2026
 03:38:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251212231203.727227-1-robh@kernel.org>
In-Reply-To: <20251212231203.727227-1-robh@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 12:37:54 +0100
X-Gmail-Original-Message-ID: <CAD++jLkAaAH9_YdTGqHUcOp8PfW+1P=ZLZzS_QseVYWxA4kiWw@mail.gmail.com>
X-Gm-Features: AQt7F2qijkDXeXovdHRRQ5QEL33UZBQlEMiEIzun3p2-rj7cwfnP7kAmQfWhUyg
Message-ID: <CAD++jLkAaAH9_YdTGqHUcOp8PfW+1P=ZLZzS_QseVYWxA4kiWw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove unused includes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Yong Wu <yong.wu@mediatek.com>, Peter Rosin <peda@axentia.se>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-iio@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, imx@lists.linux.dev, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 12:12=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Remove includes which are not referenced by either DTS files or drivers.
>
> There's a few more which are new, so they are excluded for now.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Good.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
