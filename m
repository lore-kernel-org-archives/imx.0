Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC59E82D98;
	Fri,  4 Apr 2025 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772723; cv=none; b=WBHtB2gECLN3nVmSfJXc9J83/HAPpYVVBjX8KMq6rwFjjzOML+6+X+oQWfFFFz0jVLuZbcKLg4u3HT0y0Y0hkBWRMATV3ouW9PFjw/a5kgKGptbAuLAT8g136HS5KPZoSqd1DGYk4G3I7F6QwhFzkGxOMac3O82l0oPsWLRKsdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772723; c=relaxed/simple;
	bh=8p+c4MB2Vz2NLD+RiN8PNGA7Pc+YAFAuwCP+/mMX5Bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AWCGWZhp7YoZZlgfZZe7UyhWysKClJPho1HADKGbjANSYTkBFqmzFQld4lxkAbBOwONv07sSO6+tZzfMUODb+kb0hxWBoAZ83WEGFTBQrLKx0svUjuWeQu5oBQFfjuuGro0uWI3eBXKkQfven8hkKdEdmomw4MB/VqPEzsI6/dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKW8BkEP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKW8BkEP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72201C4CEE9;
	Fri,  4 Apr 2025 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743772723;
	bh=8p+c4MB2Vz2NLD+RiN8PNGA7Pc+YAFAuwCP+/mMX5Bs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eKW8BkEPXJzBEfA6eyTODP0H96m9hqR98uXmWJ+NQbzBwEXHrdYrjtSd1C8RWZmfz
	 2rcbpHdZXLJRVcFaE9n5Kp4yS8ugzHBQqGEDWJS2qXvoobc+wP2LpgFooZ3AZGa3xa
	 6bKGGVFi85i5+b/AfCt8XkZRJhnqVnGqQ0ftCT5vqRVzGTuQFelxLx7V8tqxC1gZv7
	 u1xcnhxGxabJM0V87wUWYVqmKLm/TNRviJGpd0rTUcnJlFhcHwhwwXhdKoE4G2UVgz
	 pjRM+2K+IxITVbj+DgcmSYFJK28J91/7Ppto2N1C+xXzQUFvu+zdmpvR8Gf7606QS7
	 J6mnKZPky2aVw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac29af3382dso320292266b.2;
        Fri, 04 Apr 2025 06:18:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHY3hVErVrbFzeFT8hqHf6hPGNsvzJkmpme4MLUnkSmsBHwKvDijJmEbwWUTG3s+kq9yacS74SdRQDorU=@lists.linux.dev, AJvYcCWK0BgazMPYcWoqbaUz4bpn/Eb5RJp9eXyrRR/w3LCBfBEwtGbmEF4D6wElW1YXHHK4qWY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8bsNlt2G19BiaJZLBqQoxorSOeJEvcT/D8L4Ap8AP4p82sjcZ
	DnNO7YusPYqQC85xAujZ5B/mprpj8vZhXnaj6HFoeqJkAwdqjj7LlIvB0j8BEiHxQLaAOlXHn7Z
	+Zu20zC4htDA+eAqD5lEv31FJkQ==
X-Google-Smtp-Source: AGHT+IGeMGvCEeK8AclL93nVBIzL9ZaOIe89VJXnsQlCY86LywWmTQFiXrpurfnLdBj4EjlXLbq/bSkPsN9UQIZ0bQ0=
X-Received: by 2002:a17:907:7209:b0:ac3:45c6:a1ec with SMTP id
 a640c23a62f3a-ac7d6d5dff4mr229454566b.25.1743772721929; Fri, 04 Apr 2025
 06:18:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-6-076be7171a85@kernel.org> <Z-_K2XDEcbtcCMVM@linaro.org>
In-Reply-To: <Z-_K2XDEcbtcCMVM@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 4 Apr 2025 08:18:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJT-0gwvJnMb63izy6WwJpBVsswkauL8OMLCrF08q9HYQ@mail.gmail.com>
X-Gm-Features: ATxdqUHOgMca65CFxOkpc1GwFhcina94zKtpSzj7uSzh0WZ2vI4WGj4U0KjYQTw
Message-ID: <CAL_JsqJT-0gwvJnMb63izy6WwJpBVsswkauL8OMLCrF08q9HYQ@mail.gmail.com>
Subject: Re: [PATCH 06/19] arm64: dts: qcom: msm8939: Fix CPU node
 "enable-method" property dependencies
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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

On Fri, Apr 4, 2025 at 7:04=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Thu, Apr 03, 2025 at 09:59:27PM -0500, Rob Herring (Arm) wrote:
> > The "qcom,acc" and "qcom,saw" properties aren't valid with "spin-table"
> > enable-method nor are they used on 64-bit kernels, so they can be
> > dropped.
> >
>
> The bootloader we currently use on these devices reads these properties
> to set up the spin-table, so removing these will break booting secondary
> CPU cores.
>
> The motivation for implementing it that way was that 32-bit vs 64-bit
> kernel shouldn't be relevant for the describing the hardware blocks in
> the device tree. The code in the bootloader is generic and handles
> different SoCs (e.g. msm8916 with 4 cores and msm8939 with 8 cores, the
> enable sequences are identical).
>
> Can we keep this in somehow? To be fair, I'm not sure what property we
> could match on to check if these properties are allowed ...

Yes, we can keep them. We'll have to allow them with "spin-table" and
"psci" I guess.

Rob
