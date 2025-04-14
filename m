Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592DE2D3A6C;
	Mon, 14 Apr 2025 13:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636382; cv=none; b=NW91nL0KdIfn5/IEsMLuzdL+ztcJpdk9JrvGl368+XxDbRfaFNvPT4ap+T70TiZaTI8Zlv4sVqqUv/IzMOzsPSMb2AQOOL4JThXifXK4nJQiRaF6jMdZTelitbfrlohJUgOY15qcirQtm6OeHLNy5IJWYgKNSKoBgHLXzkWOHGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636382; c=relaxed/simple;
	bh=PYtZof1JpAgYgjbf7Rfsjlu1zvZsWl5iqqO93SvjAxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GpjH6aVdGGXm5Yg8aSYskJXMSj2mYoySuPQe6i5eWalBUOtfbTrXihTzGRQNNkwjmtWbixlDAeld9d4iAO+9/yHve2mHNIC1XY5gkQG/QuPCMlMe+Dk2FTIxd9Sbif24rSjxi4hSi5k9bFJ4PtjfVRCDM6r5Ogi28+nOR18K/1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlWkqhAk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlWkqhAk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC660C4CEEC;
	Mon, 14 Apr 2025 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744636381;
	bh=PYtZof1JpAgYgjbf7Rfsjlu1zvZsWl5iqqO93SvjAxA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JlWkqhAkffqQUy7ti9hPGnnhvDvKTOIcBCWG5k12bTxqHOWceJcjpt5DeZaOX9rw5
	 k+O9UNs2yN2I6WSh2xKCbB4XVsecud69yS8bjL5Y8UU9gIARpwj73EyxX7g4ig3qCt
	 ZGkzxEHlqjBXBzdCQD9Ko6UrhuiLbOKl81GrD/x2+OSzK+V/nuktrJv/jg741qEMwZ
	 RD8RKyrLwy5p2AlJdFVY40Ijv1jkSEbec9JTX0ytX9dFaVkfdTswxHvU+BOvgm0E6A
	 GeKI7tyrJs2Gvgp+z44jolI6wm3kaWUT/y4B8GJgV5v4h4KlH9bVHS+6MCDetWtoeu
	 /Vf69sMXYQO+w==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so5547939a12.1;
        Mon, 14 Apr 2025 06:13:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMXJhN2cI3fVS+pv2ll4keqzarQ3uJC/kGIaCHoR8HCB0wCc6pLijn4ui0xFC3i2qkVPs=@lists.linux.dev, AJvYcCWSPMWd81XgtOqHbH+LrtCExv1/95QgF0H4kA2q3XfvKlP1zWh2hZFMx10aGvKPUM7SvpeohHdZZAqJrjI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxenzlJ5qxLECjnrSp9/je/o/6IManNOCYAPngzEs0IDUJPjZte
	rYipAXVqiVGsEXai4yUY6fHyBVnoqk7T+ge/GAcgGyapGI+K2ZnjD01a7pS9Lw6j1iBOYeDLWcs
	I6vViTbpkENv97g1EUb4qSM2gvw==
X-Google-Smtp-Source: AGHT+IGD1RjwJGslsl4TZQ3wfuNijXDBc01yF9Y4gnZ5DJt+B5EtvoBjX+ECQxWRz+SZvCEqXEVdeGMo7Gts//oS3Co=
X-Received: by 2002:a05:6402:1d4d:b0:5ee:497:67d6 with SMTP id
 4fb4d7f45d1cf-5f36ff1c023mr10307363a12.33.1744636380328; Mon, 14 Apr 2025
 06:13:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
 <20250410-dt-cpu-schema-v2-2-63d7dc9ddd0a@kernel.org> <0ce8559d-5c7d-43a0-8177-7704969fd334@gmail.com>
In-Reply-To: <0ce8559d-5c7d-43a0-8177-7704969fd334@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Apr 2025 08:12:47 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJi+8-WdYEyrGjb=cQXPEb07Lkcj90a32d38ChvYJAA-Q@mail.gmail.com>
X-Gm-Features: ATxdqUHJKQLq2A74uSC_bdg-o7xbFw7BNZs9YlgJy-cREnL8L5s0aEVjMNnl6WA
Message-ID: <CAL_JsqJi+8-WdYEyrGjb=cQXPEb07Lkcj90a32d38ChvYJAA-Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/17] arm64: dts: broadcom: bcm2712: Use "l2-cache"
 for L2 cache node names
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 6:37=E2=80=AFPM Florian Fainelli <f.fainelli@gmail.=
com> wrote:
>
> On 4/10/25 08:47, Rob Herring (Arm) wrote:
> > There's no need include the CPU number in the L2 cache node names as
> > the names are local to the CPU nodes. The documented node name is
> > also just "l2-cache".
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Not sure how you had intended for me to pick up that patch without
> copying the maintainers.

Looks like there is a problem in MAINTAINERS. This matches what b4 runs:

$ git show cca91c99fe14 | scripts/get_maintainer.pl --nogit
--nogit-fallback --nogit-chief-penguins --norolestats
Rob Herring <robh@kernel.org>
Krzysztof Kozlowski <krzk+dt@kernel.org>
Conor Dooley <conor+dt@kernel.org>
devicetree@vger.kernel.org
linux-kernel@vger.kernel.org


> Applied nonetheless, thanks!

Thanks.

Rob
