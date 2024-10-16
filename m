Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BD723A6
	for <imx@lists.linux.dev>; Thu, 17 Oct 2024 00:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729124685; cv=none; b=gX2UE7RprO5mr2Q0pn/DFr2UoWIYIKZcYZJ0kw0NZc4z8zS5mRKHV5v6pHYWuI/nQF1jxDQG2z68UZhSithN9MTHaz9NfFZ6Edr9KCimPCMzCWNzBZ3lHXzhrBTL1yqp0efNQ+SGj1drG9bSoWZ1plJsT8XLqSfcwCXCTr9qZMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729124685; c=relaxed/simple;
	bh=S6xk3KTEVhY6bAWjK44TBxfAGGua3/k6U07RZx+0kGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXqqX/3FAXU6XfPJwJZuRahcXK63VVkBc6ILSSLnqk7TjgandK/aAA5oOWAr0t0IZJQS6e/sl1Z15+AFpg28htw1RvSfXj66tkj0KPTVxlvQBwKaviY5Eib4XKT81pDG3q1cxkj41TqEPZOTj/9tZjGawX6ixR+eM/TiMLjD54Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=bPp/qMLO; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="bPp/qMLO"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B548888DE6;
	Thu, 17 Oct 2024 02:24:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729124682;
	bh=vtLESTNVUfNdc+GE1WO1rf4aioCJeinbP3+V6+iQ8Ow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bPp/qMLOSDFgy64+QKaCk7OWgG8M0dWjBncfo1SCjhgaxwVYyjebpQRjOst3PqPrb
	 K6dHGe/4PPi0eezAGqUM/JJKgPr0cH60WKWJFozdYydWf/Lm1CzHCjng0N7CX+3fbS
	 dmqejYTX4o8QEA8RWUPC3rkUucZ/5Hg1m1H4IIN7yZypRhR4BVlrYb/sNywaPxjntG
	 ukBxhduQktMlJ3zAvLs0V41VXX977hKU7dnl4qfdO/GF6Lf4M6n1gv7hDg+kaZtxiV
	 1R7byNKeEkzP25wDFkdxTZK61Y1TwBQg6btJequ2tdy0yjhMwEKXFESUl2Rl3orkC0
	 bzroeWvnIj2rg==
Message-ID: <b82e55af-6b6d-473b-9b74-c0f0b26e12f8@denx.de>
Date: Thu, 17 Oct 2024 00:51:38 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Document i.MX6DL DHCOM SoM on
 PDK2 carrier board
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>,
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Gregor Herburger <gregor.herburger@ew.tq-group.com>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>,
 Parthiban Nallathambi <parthiban@linumiz.com>,
 Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
 kernel@dh-electronics.com, Max Merchel <Max.Merchel@ew.tq-group.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 Mathieu Othacehe <m.othacehe@gmail.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
References: <20241015235926.168582-1-marex@denx.de>
 <172909288999.1676333.15859258003756492401.robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <172909288999.1676333.15859258003756492401.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/16/24 5:38 PM, Rob Herring (Arm) wrote:
> 
> On Wed, 16 Oct 2024 01:58:35 +0200, Marek Vasut wrote:
>> Document the DH electronics i.MX6DL DHCOM SoM and a PDK2 evaluation board.
>> The evaluation board features three serial ports, USB OTG, USB host with
>> an USB hub, Fast or Gigabit ethernet, eMMC, uSD, SD, analog audio, PCIe
>> and HDMI video output.
>>
>> All of the aforementioned features except for mSATA are supported, mSATA
>> is not available on i.MX6DL and is only available on DHCOM populated with
>> i.MX6Q SoC which is already supported upstream.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Gregor Herburger <gregor.herburger@ew.tq-group.com>
>> Cc: Hiago De Franco <hiago.franco@toradex.com>
>> Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>> Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Marek Vasut <marex@denx.de>
>> Cc: Mathieu Othacehe <m.othacehe@gmail.com>
>> Cc: Max Merchel <Max.Merchel@ew.tq-group.com>
>> Cc: Michael Walle <mwalle@kernel.org>
>> Cc: Parthiban Nallathambi <parthiban@linumiz.com>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: imx@lists.linux.dev
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>>   Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y nxp/imx/imx6dl-dhcom-pdk2.dtb' for 20241015235926.168582-1-marex@denx.de:
> 
> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6dl-iomuxc']
> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/bus@2100000/i2c@21a8000/pmic@3c: failed to match any schema with compatible: ['lltc,ltc3676']
> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: gpio-keys: '#size-cells' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: gpio-keys: '#address-cells' is a dependency of '#size-cells'
> 	from schema $id: http://devicetree.org/schemas/reg.yaml#
> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: panel: 'power-supply' is a required property
> 	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
Most of them are missing DT schemas, the last two are fixed in:

ARM: dts: imx6qdl-dhcom-pdk2: Drop incorrect size-cells in GPIO keys
ARM: dts: imx6qdl-dhcom-pdk2: Fill in missing panel power-supply

And once the LTC3676 schema gets picked up, the bot will also complain 
about this:

ARM: dts: imx6qdl-dhcom-som: Drop bogus regulator-suspend-mem-microvolt
