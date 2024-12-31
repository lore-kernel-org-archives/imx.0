Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA24218D621
	for <imx@lists.linux.dev>; Tue, 31 Dec 2024 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735632006; cv=none; b=KFo+mmVDyLnZermLijd0ergFQH+Fp/qTLd/3fOPgtn9nJSagi1JvoFTabVGdVEQPnky+ORrZhCBVn7R9RMS4JW7SUGj03PcXJ4Mw1WGu9MYN9jxxGcmZ1r0mABHqT4v8TpSjzVMEFfBaExgmtO1QH40uNFRetbchtqBm8TzOr6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735632006; c=relaxed/simple;
	bh=f4eqZ22p8rFABM3kr+ddX1OTP7W0ySWpc7lyVEkwb9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p+G29iJESxv9CQGTSYFAyzrHYsx4AXRdCtwh7RgQwoPUbh48fjFNuE7tyxgOZoNt9TyeX/SjvZn33OYWZCD10LUCUVt3tsGmNDxi9Vy/vGA7KBmk+r44q5WDrX7e03s0jJcAXRVnnvNyGXV2So2cpCfFGLNy6tky57p4t74AmxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=VgIqJ8o3; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="VgIqJ8o3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Wcei/jjicgVQNialufWSNCo6fuHs9KyY0+NSZYlZuBo=; b=VgIqJ8o32PpjO0vBjSWxN1B62s
	N5fj/Yq13iQy4mMUNz+KjGEdiKkgPouC8BB2Cu3TOcm/EHLlKpJ/g+OqTUgGTmNTLm1kT2eEayQ7d
	lsJvasH3gU2sgVWk0j0Lb8DLA/aigKQj9UHIZtFjlV9eIEzTrI/jelK2k9/yshIcZcPVztUAsnbko
	dPilFZmk19V9s4gGeFqjLyao85IqOTmE2DHQcv1BNFMdVY1wM63uvr2JqaGyXlCwtBf7g6shPa7+0
	nVind6eELLK/L68C4/rthi1ZdTYvvuxI38BuGvzWw5A+R2jBQ2hfdTcEfKPXuJD2AjAHy91OudepP
	Nqcr8h5w==;
Received: from 77-38-14-103.dynamic.telemach.net ([77.38.14.103]:53894 helo=[192.168.0.15])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tSWlx-004GS5-2G;
	Tue, 31 Dec 2024 08:34:37 +0100
Message-ID: <221c8216-ce71-4ba2-9981-8612ff33ec2a@norik.com>
Date: Tue, 31 Dec 2024 08:34:32 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] arm64: dts: imx8mm-phycore-som: Add overlay for
 rproc
To: Shawn Guo <shawnguo2@yeah.net>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20241202072052.2195283-1-andrej.picej@norik.com>
 <20241202072052.2195283-14-andrej.picej@norik.com> <Z3Ie8GO/GtoSkIr3@dragon>
Content-Language: en-GB
From: Andrej Picej <andrej.picej@norik.com>
In-Reply-To: <Z3Ie8GO/GtoSkIr3@dragon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Shawn,

On 30. 12. 24 05:17, Shawn Guo wrote:
> On Mon, Dec 02, 2024 at 08:20:50AM +0100, Andrej Picej wrote:
>> From: Dominik Haller <d.haller@phytec.de>
>>
>> Adds a devicetree overlay containing reserved memory regions used
>> for intercore communication between A53 and M4 cores.
>>
>> Signed-off-by: Dominik Haller <d.haller@phytec.de>
>> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
>> ---
>> Changes in v2:
>>   - no change.
>> ---
>>   arch/arm64/boot/dts/freescale/Makefile        |  2 +
>>   .../dts/freescale/imx8mm-phycore-rpmsg.dtso   | 55 +++++++++++++++++++
>>   2 files changed, 57 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
>>
>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>> index 99be36a04db9..5bc083a7b778 100644
>> --- a/arch/arm64/boot/dts/freescale/Makefile
>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>> @@ -125,9 +125,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-rdk.dtb
>>   
>>   imx8mm-phyboard-polis-peb-av-10-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-av-10.dtbo
>>   imx8mm-phyboard-polis-peb-eval-01-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-eval-01.dtbo
>> +imx8mm-phycore-rpmsg-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phycore-rpmsg.dtbo
>>   
>>   dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-av-10.dtb
>>   dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-eval-01.dtb
>> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-phycore-rpmsg.dtb
>>   
>>   dtb-$(CONFIG_ARCH_MXC) += imx8mm-phygate-tauri-l.dtb
>>   dtb-$(CONFIG_ARCH_MXC) += imx8mm-prt8mm.dtb
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
>> new file mode 100644
>> index 000000000000..0c61946f0cf8
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
>> @@ -0,0 +1,55 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2024 PHYTEC Messtechnik GmbH
>> + * Author: Dominik Haller <d.haller@phytec.de>
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/clock/imx8mm-clock.h>
>> +
>> +&{/} {
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
> 
> I'm getting this:
> 
> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso:16.3-10: Warning (ranges_format): /fragment@0/__overlay__/reserved-memory:ranges: empty "ranges" property but its #size-cells (2) differs from /fragment@0/__overlay__ (1)
> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso:13.18-43.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/reserved-memory: Relying on default #address-cells value
> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso:13.18-43.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/reserved-memory: Relying on default #size-cells value
> 

I see, missed this before, sorry. But I have some problems fixing it.
I think the problem is that this is overlay, the same node put in the 
imx8mm-phycore-som.dtsi doesn't trigger a warning.
The only solution that I found is that I specify the default 
address-cells and size-cells in root node:


&{/} {
	#address-cells = <2>;
	#size-cells = <2>;

	reserved-memory {
		#address-cells = <2>;
		#size-cells = <2>;
		ranges;
	...
	};
};

The same values are used in imx8mm.dtsi, but the checker fails to find 
these default values.
Not sure if this is the right solution, though. Your input would be 
helpful, thanks.

Best regards,
Andrej


> Shawn
> 
>> +
>> +		m4_reserved: m4@80000000 {
>> +			reg = <0 0x80000000 0 0x1000000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev0vring0: vdev0vring0@b8000000 {
>> +			reg = <0 0xb8000000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev0vring1: vdev0vring1@b8008000 {
>> +			reg = <0 0xb8008000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		rsc_table: rsc_table@b80ff000 {
>> +			reg = <0 0xb80ff000 0 0x1000>;
>> +			no-map;
>> +		};
>> +
>> +		vdevbuffer: vdevbuffer@b8400000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0 0xb8400000 0 0x100000>;
>> +			no-map;
>> +		};
>> +	};
>> +
>> +	core-m4 {
>> +		compatible = "fsl,imx8mm-cm4";
>> +		clocks = <&clk IMX8MM_CLK_M4_DIV>;
>> +		mboxes = <&mu 0 1
>> +			&mu 1 1
>> +			&mu 3 1>;
>> +		mbox-names = "tx", "rx", "rxdb";
>> +		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
>> +		syscon = <&src>;
>> +	};
>> +};
>> -- 
>> 2.34.1
>>
> 
