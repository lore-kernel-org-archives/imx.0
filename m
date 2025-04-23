Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4328C242D6F
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745401231; cv=none; b=jJvfxl8YwFwgIyyaduUIsHJwQNTi2aaaUPAn3pEFcsRMPbf1/oMkdMnFku34Ycz2PNvwTGmZwC5nBXRIJYmTe33FP1aPvt1ToSC3PiP0rctGfxjfyAXldITWXzLs7Hlk5bRktP5HiFI/QN1I+qsLSqFT4KjjBhPQAe9EZRt2WWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745401231; c=relaxed/simple;
	bh=LVlgqXd3gvp4F7q18bWvwYeGJMUd5fToVGBXFyLMIe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c981dU9Xn/jC+SfVWVb5wzfbcwzHwuCcMpnDN14+YpXkRQp/RgYrLlEjsQ/A3sOw3JgF2kxyOf0KlXoH1bQ06SRlv7+4SkmXJd7SU9atw4Eq3bg6P/wzA8Y+WhdJvLQBFrG0yoaWPEvy6QVYyvLBFx1g75bOHPTynQBkETgLFzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=BZ3uRgbp; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="BZ3uRgbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=LS2O4ijWT/954gJ7Po+mrl2ivjfcfbbmblMAVvot+M4=;
	b=BZ3uRgbp605ujwLLQBhqu5ElSw+xVo5n2y2B6jE+oPMPqM4aKIl7RHWKVjXPe1
	W8gQlbfD6MkOSG2Z3l6F858HMS2S/ZaPp35goiWk7G3AxjyuKpHIeJDwjVzuxKV1
	ghKBAcKzAnQtttY9ccm6lGt2iLY7YNZsdMGaG1vYGMW9E=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDn84o_tQhofGK5Aw--.10993S3;
	Wed, 23 Apr 2025 17:39:14 +0800 (CST)
Date: Wed, 23 Apr 2025 17:39:11 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
	Conor Dooley <conor@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 10/19] arm/arm64: dts: imx: Drop redundant CPU
 "clock-latency"
Message-ID: <aAi0tkNWlvwqIBxM@dragon>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-10-076be7171a85@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-dt-cpu-schema-v1-10-076be7171a85@kernel.org>
X-CM-TRANSID:M88vCgDn84o_tQhofGK5Aw--.10993S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr1kXw4DWFy8WFWDCrW3KFg_yoW3Xrg_ZF
	n7K348Ja1rCry7J3Z8trs5XwnxKryUWwn3Cr17XrWkG34aqr9rAFWDGFZ5Cr13XFWagry3
	A3sxJFs2y3s0kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjQeOPUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARM4ZWgIqUAwhgAAsw

On Thu, Apr 03, 2025 at 09:59:31PM -0500, Rob Herring (Arm) wrote:
> The "clock-latency" property is part of the deprecated opp-v1 binding
> and is redundant if the opp-v2 table has equal or larger values in any
> "clock-latency-ns". The OPP tables have values of 150000, so it can be
> removed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm/boot/dts/nxp/imx/imx7s.dtsi      | 1 -
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 4 ----
>  arch/arm64/boot/dts/freescale/imx8mn.dtsi | 4 ----
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ----
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 4 ----
>  5 files changed, 17 deletions(-)

Applied as two patches, one for imx/dt branch and the other for imx/dt64.

Shawn

