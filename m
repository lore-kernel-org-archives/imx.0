Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8524C33E8
	for <imx@lists.linux.dev>; Wed, 16 Sep 2026 17:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789579304; cv=none; b=jyje8a5uUqm5rL4pJPTJdIzh/l/Q1qMFG7c/LNRaBHOdHzr2nibWEq+sCGkBQPf1tOASp6AJOaWlECHtH7cKg9seEKkisj4ffylhJVyrLztOQwj+r+6xpYm1bDDKPAy56bCXW6oEIQbGLCBdG3k8Ot6G+o2ZuUF1RoZ6Kbfph+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789579304; c=relaxed/simple;
	bh=+Wm8XztWe9cjSuQsXSOKuMkDzkD1yzW07KRTOyVgie0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AFuvu5/tmwJKBNM+z4mpL/h45P7TRhkEpeE0B7LSEmryPBq/nRsoJi+cKZRc7tK1Nm/4cXwcN6XO0/Suk13ipRH1+6LrmArhyYpScnA25V2116DD4wNn81QGZBaV05GwNtBYH5ribp98TWbKbZ8mt8CSNEYmf0LgjqFlJDehgnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtqPa6xW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtqPa6xW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A881F00898
	for <imx@lists.linux.dev>; Wed, 16 Sep 2026 17:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789579302;
	bh=F1UErD4H6r6whOgpoMHeGy/yiV6kGc+XBk8QJER2Od8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OtqPa6xWTvZHahphsBKsXSM0vVDuwyyQDfeMMeeEdCwWUcXyf9dlKeNLwgs5z44tQ
	 WrEw0/lFS1kR81AfTFFl8gO2WD8ymB6OULjtt3mMaSrQZ/BLplGiHqg2ZX64o9jZyv
	 lRQjurrPvX6EHDlo/M7bJ3vybpD2OkTMf18ZzfkBroMKIYFxdFYoOBO4SqZXkxmA+m
	 5H66Szm6FTlqa6jX0VplbsuV5ZZ89DhiviBw+u3aGEgpG3N7+v+oORv1usu/Fl+caa
	 0oDpvEUV/RUY8fvpDeaGcVR6CILUMSDmpvRRSbahMAfV/wEskXbF0UkH8q4fFAn5zH
	 6D4yaBy6bTqaQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b8b3c8c4bbso1317376e87.0
        for <imx@lists.linux.dev>; Wed, 16 Sep 2026 10:21:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxig3ml/LJ6mpz3jdaFr0VamPq43PLDRr1AWoQHM1vpYEp/JIP29Fc1UDS3CrYcS8gdUPs=@lists.linux.dev
X-Gm-Message-State: AFuF++msa9el9hsl5cuHJ/4tVmHLcoPaBNeYQ6rQjSb6F9HFMhcwm+CA
	PEdM0m85xqIo2P1x87iD0Ljd3brbJWP71PCpY8RX5sy5qSvi+4clAY9SrMR28YVN1eLgXoO3pOn
	bQRRd1e0pNvaYx/aZY2IWRkFlh6EyaPI=
X-Received: by 2002:a05:6512:6883:10b0:5b6:172b:7ba1 with SMTP id
 2adb3069b0e04-5b8ba5d1a82mr67749e87.9.1789579300578; Wed, 16 Sep 2026
 10:21:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:21:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLm2hQ=fHmLGL4KnaK-q2L95tz3P6__qx=dFCUeiMUz9tA@mail.gmail.com>
X-Gm-Features: AcwNN1WeMHFPjUODWxifW5uhfKTviiZfd6OYXXOq_JHN6cgG4pckjp0gwgbXDp4
Message-ID: <CAD++jLm2hQ=fHmLGL4KnaK-q2L95tz3P6__qx=dFCUeiMUz9tA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Use consistent indentation in the example
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Gary Yang <gary.yang@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, 
	Del Regno <angelogioacchino.delregno@somainline.org>, 
	Rahul Tanwar <rahul.tanwar@linux.intel.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Krishna Potthuri <sai.krishna.potthuri@amd.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 2:32=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij
