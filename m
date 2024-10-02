Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE5B28689
	for <imx@lists.linux.dev>; Wed,  2 Oct 2024 04:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727843301; cv=none; b=iXNFAuAYXqqXeQPGwkfdRFJEqzMZin+wARIqreiU/Vnnq3dnChiu9Ql1vj4k/pHhvZD3C1aW8mcuG29SyzKXFwS9o9pSpPQ453SjCDu+zFGI5YwQ1kkDzozQSmkY/DDq2KE3mZbz8IWBLGD3Tp/HPc5JHanT5ybdZt+y93m3+Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727843301; c=relaxed/simple;
	bh=WqsCe7eAsOBGFyCxWPwf7fbZ1vWFMuVkWyLYEvUHKGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A4gkvkinac5LSwkwrxCmstMXxZRpSFSKwKBpqSUBwhspPSHGlsdl5C4O2qKTcwGsFHeh3awvTNWy2+EgxGn31IG+dE+suGC23Hq7gr4VAuMjW2lc/eNsC82LfFwqab1qZNst5YlNdV3NBMU0V5EBq5Sn+MNUOkv+FU54Ebbupk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=WIfA0abD; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="WIfA0abD"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 41DD888DA0;
	Wed,  2 Oct 2024 06:28:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727843297;
	bh=4OompmCVH44YK/Nzg7ncbvVCgkI1on4v/xTZFgrTnc0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WIfA0abDqoLr3RmJkQz9L763eY4PLnzjARBZe9oBpiKy1cdAUPbs14KgXyr+oDDEW
	 QMGwh1UrtGPOMbqSWYG6931b+6UrLSvbaerf2da6i87cspFQr1BHXDSvg7enMw7dQc
	 /VHLVr3/eF3n95bR9ImtaofwgT5BQFDQk/1nWdLdPmvh+MNoATZkJfqH4jlgzN5NJC
	 zoNX2bSAZPYQCVxtOiM2cA0ovcDC0Ggpo5OoXctdrAbXZ092xCELH1CnLc0rhjvpyd
	 +vxG4LRmx19sn462A+y78rao1Mv3NBwsYFQ47V+3SfoVr/pATlzh/k5PGvslgtil7b
	 0rV7LiRuhRIBw==
Message-ID: <fad8882a-b61f-4715-a2d9-318e7c98b611@denx.de>
Date: Wed, 2 Oct 2024 06:24:45 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Document DH electronics i.MX8M
 Plus DHCOM PicoITX
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, Michael Walle <mwalle@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Max Merchel <Max.Merchel@ew.tq-group.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mathieu Othacehe <m.othacehe@gmail.com>,
 Hiago De Franco <hiago.franco@toradex.com>, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org,
 Joao Paulo Goncalves <joao.goncalves@toradex.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Gregor Herburger <gregor.herburger@ew.tq-group.com>
References: <20240928234949.357893-1-marex@denx.de>
 <172784021443.525771.3308795793210058076.robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <172784021443.525771.3308795793210058076.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/2/24 5:50 AM, Rob Herring (Arm) wrote:
> 
> On Sun, 29 Sep 2024 01:48:08 +0200, Marek Vasut wrote:
>> Document support for DH electronics i.MX8M Plus DHCOM SoM on PicoITX carrier
>> board. This system is populated with serial console, EQoS ethernet, eMMC, SD,
>> SPI NOR, LEDs and USB 3.0 host used in USB 2.0 mode on PicoITX.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Gregor Herburger <gregor.herburger@ew.tq-group.com>
>> Cc: Hiago De Franco <hiago.franco@toradex.com>
>> Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>> Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Mathieu Othacehe <m.othacehe@gmail.com>
>> Cc: Max Merchel <Max.Merchel@ew.tq-group.com>
>> Cc: Michael Walle <mwalle@kernel.org>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>>   Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>>   1 file changed, 1 insertion(+)
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
> New warnings running 'make CHECK_DTBS=y freescale/imx8mp-dhcom-picoitx.dtb' for 20240928234949.357893-1-marex@denx.de:
> 
> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
> 	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
> 	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
This is unrelated. I believe the work-in-progress fix for this warning 
is already posted:

https://lore.kernel.org/linux-arm-kernel/1721634979-1726-1-git-send-email-hongxing.zhu@nxp.com/
