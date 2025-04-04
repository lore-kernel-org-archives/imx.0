Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A90F1E1DE9;
	Fri,  4 Apr 2025 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743766338; cv=none; b=b8ay2hGUoZpRnMafxinXV4ExCNt73+RbNiBMeCHpzMIeEn2u2e/gBi0wh8glolA458vdjeDh+UvfAx0wG3qWLAMf1f/TSQ3CgjkINq80wfattLzOCfwTgdo76ds9GLBpNzsCb3p0uMw2kWKZHOIMxKqTn1oH+D8gNkw3DCmJF+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743766338; c=relaxed/simple;
	bh=7ro02tI4QOXGzdStpWGlX+ZgeJtEMwipR1RCkON1Law=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gVJsMScN+A6w0DiblJTLb0Y2EVhZCoWYaXAVa7W5Xor/mei8mUoY47z8J8pqmmkKZLokpijU4JOkLgvpQdOddZcuwKtvvczQzejijFi8ZdZWUPqhgJ4Q26et7hw3yXoJuCoJn6DcwU6ckimPnyAaFuBUzo9wg09CBHdko99ya0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DpZaC4An; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DpZaC4An"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743766335;
	bh=7ro02tI4QOXGzdStpWGlX+ZgeJtEMwipR1RCkON1Law=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DpZaC4Ang2pBxxjmTz68g2C7ibpYHZpQh6M1Vf54ldz6Gdj74ETP0av4qGoCb/ZLE
	 Nd8AggnN0xOivQCv3RRa6fUi4tBVfF2x3DzzzOGG2grt8rNvhOOkHge7mFCFX+t6Za
	 PVEwNsWgnGUJqEYiXE1bkFT7+QLm1lXuCtguq+z0aersqXj/R9Nwm7q/Lh60UJifPD
	 fvkkpnRm7HihkIPmz7RoHJFMHc6n9qkvDcTDSk8+gNG2xtpCfoGo+Ve20jQIiWIbSZ
	 OhtlgUsxflfecAZAqNlLv6M6uBpC9jDo/tSHTaNjFijVjLM1CyXO+HY82Ey/eXajOU
	 E2bLKaqY9B3rA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 27B6717E0FC3;
	Fri,  4 Apr 2025 13:32:13 +0200 (CEST)
Message-ID: <236b31a6-3602-4705-9d04-48bdff719cc2@collabora.com>
Date: Fri, 4 Apr 2025 13:32:12 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/19] dt-bindings: cpufreq: Drop redundant Mediatek
 binding
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
 <20250403-dt-cpu-schema-v1-19-076be7171a85@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250403-dt-cpu-schema-v1-19-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 04/04/25 04:59, Rob Herring (Arm) ha scritto:
> The Mediatek CPUFreq binding document just describes properties from
> the CPU node which the driver uses. This is redundant as all the
> properties are described in the arm/cpus.yaml schema.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


