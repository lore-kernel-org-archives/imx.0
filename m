Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1121DB34C;
	Fri,  4 Apr 2025 11:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743766337; cv=none; b=emYfkN4PrqPCXxtz2A/eTlq/twKL7uUpaeLDNW4rSivf2TnjbAkbXQXITp7KOSQKRozfZzL6ie/lykRTtRmHEcXVzXKVoMNTk7F2pxeExYeeVmWnDMglxrvAOfqFHOxyu++FxgZc7YClOR0V0rIJpcJ20Hy/U4Mv7egdZhte6dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743766337; c=relaxed/simple;
	bh=Jw1FPz6DF2WaJMktgqsDpD5UOieABbNHs5cz1OQV7+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uirOq3aTMffg+QpIMqVvJIvuyNF6VoAwzWEyC1bv9mW5Mfc3z3wb7fcGn7+Gj8hYfaqMTT5mcDkoH3GVfzJWe4fozWo7kaPphnqI8575L+lqfGCaYZZa3dMBg5eVBVMpJ44Wb6W2gLLcPVyXml3tcRyHvqGiXSNihSss4PSjsjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LJPXaVbq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LJPXaVbq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743766333;
	bh=Jw1FPz6DF2WaJMktgqsDpD5UOieABbNHs5cz1OQV7+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LJPXaVbq60/Cb5k5MJ7zBEKHhcJ/RJ2XOeSUfeGVa9B6t5StSeJpF5Rh8VSpyV4OG
	 6qvbZA+DJiPKvA8oZmtxELP2AOQ0sZld5CamuOMDVdPFj6a78TccHaPK4Tvrr486vK
	 jdSaxZDfwi0ncvAB9XwcoOY+tv9gv16LHwc9o8cmvTeXa2UskaGu4S1VKAfK8nGrZE
	 vct7UyFGwVmWVCvZDCSClpfCMUyShZvHciYs3+sipjVjXeruKaQXsGVaHfymqTd+Og
	 mPFSiSQmlYOjLNoHLs/SMTb/qZ/5zrPp+oAQM2P0hEj8RVXesY8cFd5/XQBtMb6elN
	 Yrr95JBG7PAJg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A836E17E0C50;
	Fri,  4 Apr 2025 13:32:10 +0200 (CEST)
Message-ID: <547daa6c-0ca9-44c0-9317-02e006926dc3@collabora.com>
Date: Fri, 4 Apr 2025 13:32:09 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] dt-bindings: Reference opp-v1 schema in CPU schemas
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
 Conor Dooley <conor@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-16-076be7171a85@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250403-dt-cpu-schema-v1-16-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 04/04/25 04:59, Rob Herring (Arm) ha scritto:
> The opp-v1 binding is only used in MIPS and arm32 CPU nodes, so add a
> $ref to it in the CPU schemas and drop the "select".
> 
> As opp-v1 has long been deprecated, mark it as such.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

ARM//MediaTek:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


