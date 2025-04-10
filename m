Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BFE28C5BE;
	Thu, 10 Apr 2025 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294505; cv=none; b=BgblrwVmVPqFTyB/CfP3PgaQTpruFyC7ro8G9Ol9lQRxCNcV7+xxeFz2awVxyrJDqd6by26S1SiszKUO7AxlD7LY3nzo9ve23nFqKaXrnKOvornYWEJMDxIG++s/5tlcgMidEXL3Gg/NM09n5qseFtSxTn2YFvkTDsAGdra8fLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294505; c=relaxed/simple;
	bh=dEJNfddFbQgqgZyZJMMbg8KFOtcsawhyLbrR4L0XzlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zvm84wr4wTTPyCbB5Xs4vWoWk+gKQ8XtXRNQQ7oyMlFuGDubdRkqtPjlpm8M3SMkAbfieURdx9d3CLtRVxYBhT+uejjnijvGW+NIzyfGqRCER3U0dEoVidz+cBPzdG3tHhYzctQCqsbnmQM3pwhBH5IiphSm87lo5TS4ZXu7onA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxii+48q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxii+48q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD1DC4CEEF;
	Thu, 10 Apr 2025 14:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744294505;
	bh=dEJNfddFbQgqgZyZJMMbg8KFOtcsawhyLbrR4L0XzlI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jxii+48qL50pjdA7yqa78xcRpLVZKm5MG303M4J57PrxoYaKv2uhKXslZyLpRdn2D
	 s9Sv0b7pjKAomdPHquiYzoYa70yZ0/Ebgu6XrENWvfOhrkxdZvdApSz0IOXALevVdE
	 zvIfIEuQLhPC/wboYB4n1LGvsTJ7jEVwvnmoxQ0JZH/anv5czFd2INi0HmmbYzo5oJ
	 lPC5IcjIWbucKZmZ6YZW2MXP+d+JYFdnJqM6rRCnvCU7ECeNQOnzgEZ/zTXSusl5ag
	 /YNqtCkozcdHsvO+gZIRaAOzgBX/kI0M4nL2HLbV8vX4KsK1YaHDXhFpwI7IAjxHwE
	 29supMGICfJgg==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so1490708a12.3;
        Thu, 10 Apr 2025 07:15:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsPlh7a2I6oLoWJfT8GW8Riu4iBXRR0wn++u6yoPzHNu1heJ2WWwJKqDa3DLDy834SuQ55AmCocjQjo+M=@lists.linux.dev, AJvYcCXwHvi6f0o/TC12pqhWmohhZkk9P/zCATKmwy/jvs6WG1GoqmyrmZH30gqh0Fg1qvdYr7E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMfD4fNimpO6hIhGmNE1O4QT/W4qAsJiVwJ9kYJEqpcknSjxBI
	BaANyS8L+7fYMcIJZyET+iT0pVKxg8gsdvG6sBjfKlDHSeg2y2m7jpCjPTpIN+1DORd6lrQYkTh
	Vz3DLq2xOON3kZIrN+IPs/GF4Yw==
X-Google-Smtp-Source: AGHT+IGl0fJE2v0I/oCPQTdxQfr3609BfC3sI9b3/3//9E+h8w2umLSUMiDkAMTe1571fUmkVBDDE3jtTLXPBwQHP+4=
X-Received: by 2002:a05:6402:13ce:b0:5e5:dea5:3eb2 with SMTP id
 4fb4d7f45d1cf-5f32c45032bmr2461434a12.11.1744294503824; Thu, 10 Apr 2025
 07:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org> <20250408055718.4azlqljvo4qxhnu5@vireshk-i7>
In-Reply-To: <20250408055718.4azlqljvo4qxhnu5@vireshk-i7>
From: Rob Herring <robh@kernel.org>
Date: Thu, 10 Apr 2025 09:14:52 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJyi=sR9jtEy9_U+RLVorvZRfby8vsWP6sXV+_4NP+Gug@mail.gmail.com>
X-Gm-Features: ATxdqUHPmJEIuVKadhgZM7F7MHPh64iWIlM7zDUhgEaB8t8IKqn3FRU8YxuohGc
Message-ID: <CAL_JsqJyi=sR9jtEy9_U+RLVorvZRfby8vsWP6sXV+_4NP+Gug@mail.gmail.com>
Subject: Re: [PATCH 00/19] Arm cpu schema clean-ups
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 12:57=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> On 03-04-25, 21:59, Rob Herring (Arm) wrote:
> >  .../bindings/cpufreq/cpufreq-mediatek.txt          | 250 -------------=
--------
> >  Documentation/devicetree/bindings/opp/opp-v1.yaml  |  18 +-
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

In the future, please consider acking the 2 patches rather than the
cover letter because 'b4 trailers' thinks you acked everything.

Rob
