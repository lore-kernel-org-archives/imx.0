Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150241922D3
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737360005; cv=none; b=QqqNOVJ6T52YY9rTiXImQMhJauGtnahFlwgSDnvxDFylOW1iyybiK5i+QE9Knbq+EwPlRXMFoqrv+x5rJGA/eGbeZnV6yGuRluYO9NpMsqzXfVN0B++XdgKJdFpri75+csZtnvB+DP1lR6WXQqKiF9YHDk9z3N+boBMAbUD8f9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737360005; c=relaxed/simple;
	bh=FOXOsUjR7gvwdK8ldDgZaWaiaUUbUav8J6+aq+oYVe0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ad2iY7O4oqRd5045217rvBMzTPDTt/t020fc+FOCAnVblWFmMXPGHI3Rm1Bgb2VhYh6kZ189yb1uT0kfsggqcbLoWyG1XJp9YJYaEWTb4hNyolBJqhcXPI4oO7TVpZ8xO4lzHhpKWZFRWyUEWL99GYB98QBDsZk1U3S8/Po4jrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=UUKnneBu; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="UUKnneBu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc
	:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=opwsPCXQn2dl1A894h/TzouZKT6y1266fbtoD7Nmf0I=; b=UUKnneBuOGLaVE4DE9jKD5m7Ep
	BzPBy4eDSFnCTRkIdgejrkLmxhRG3rNAKEi0TJG+Agulcu469iERSdDcmSPYq+VczU9cChkosXiAE
	1zzVq8e2Gx9L36zJyf16bu9hCL54jNxXU/ccvO36cN3ia2oRqwRNPZvq7FeP3QaY/2jawh+b7Oo+6
	5aye7q8TqDt/bhjCjENmlWM1AeivWtrkA85QN4ZqKcAjMtcntk4yDbBSVO/AnoMU6UB73aeI2mz8C
	w3ANFFk738Leu+QlN2GmLJtG0qrnQHjKcLrWLp7hfRbCNSFBUffwbg6XwjE4qnle1GUFFiNy+y2PO
	ZIGH2gEg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:33680 helo=[192.168.69.52])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tZlmy-00DgMu-1L;
	Mon, 20 Jan 2025 08:01:35 +0100
Message-ID: <80d6e493-dd79-42e3-b064-d1feeabd7180@norik.com>
Date: Mon, 20 Jan 2025 08:01:33 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] Re: [PATCH v2 13/15] arm64: dts: imx8mm-phycore-som:
 Add overlay for rproc
From: Andrej Picej <andrej.picej@norik.com>
To: Shawn Guo <shawnguo2@yeah.net>, shawnguo@kernel.org
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20241202072052.2195283-1-andrej.picej@norik.com>
 <20241202072052.2195283-14-andrej.picej@norik.com> <Z3Ie8GO/GtoSkIr3@dragon>
 <221c8216-ce71-4ba2-9981-8612ff33ec2a@norik.com>
Content-Language: en-US
Autocrypt: addr=andrej.picej@norik.com; keydata=
 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
 xtT/8OxBOVSHvA==
In-Reply-To: <221c8216-ce71-4ba2-9981-8612ff33ec2a@norik.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Gentle ping.

Best regards,
Andrej

On 31. 12. 24 08:34, Andrej Picej wrote:
> Hi Shawn,
> 
> On 30. 12. 24 05:17, Shawn Guo wrote:
>> On Mon, Dec 02, 2024 at 08:20:50AM +0100, Andrej Picej wrote:
>>> From: Dominik Haller <d.haller@phytec.de>
>>>
>>> Adds a devicetree overlay containing reserved memory regions used
>>> for intercore communication between A53 and M4 cores.
>>>
>>> Signed-off-by: Dominik Haller <d.haller@phytec.de>
>>> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
>>> ---
>>> Changes in v2:
>>>   - no change.
>>> ---
>>>   arch/arm64/boot/dts/freescale/Makefile        |  2 +
>>>   .../dts/freescale/imx8mm-phycore-rpmsg.dtso   | 55 +++++++++++++++++++
>>>   2 files changed, 57 insertions(+)
>>>   create mode 100644 
>>> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
>>>
>>> diff --git a/arch/arm64/boot/dts/freescale/Makefile 
>>> b/arch/arm64/boot/dts/freescale/Makefile
>>> index 99be36a04db9..5bc083a7b778 100644
>>> --- a/arch/arm64/boot/dts/freescale/Makefile
>>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>>> @@ -125,9 +125,11 @@ dtb-$(CONFIG_ARCH_MXC) += 
>>> imx8mm-phyboard-polis-rdk.dtb
>>>   imx8mm-phyboard-polis-peb-av-10-dtbs += 
>>> imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-av-10.dtbo
>>>   imx8mm-phyboard-polis-peb-eval-01-dtbs += 
>>> imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-eval-01.dtbo
>>> +imx8mm-phycore-rpmsg-dtbs += imx8mm-phyboard-polis-rdk.dtb 
>>> imx8mm-phycore-rpmsg.dtbo
>>>   dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-av-10.dtb
>>>   dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-eval-01.dtb
>>> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-phycore-rpmsg.dtb
>>>   dtb-$(CONFIG_ARCH_MXC) += imx8mm-phygate-tauri-l.dtb
>>>   dtb-$(CONFIG_ARCH_MXC) += imx8mm-prt8mm.dtb
>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso 
>>> b/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
>>> new file mode 100644
>>> index 000000000000..0c61946f0cf8
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
>>> @@ -0,0 +1,55 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (C) 2024 PHYTEC Messtechnik GmbH
>>> + * Author: Dominik Haller <d.haller@phytec.de>
>>> + */
>>> +
>>> +/dts-v1/;
>>> +/plugin/;
>>> +
>>> +#include <dt-bindings/clock/imx8mm-clock.h>
>>> +
>>> +&{/} {
>>> +    reserved-memory {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +        ranges;
>>
>> I'm getting this:
>>
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso:16.3-10: 
>> Warning (ranges_format): 
>> /fragment@0/__overlay__/reserved-memory:ranges: empty "ranges" 
>> property but its #size-cells (2) differs from /fragment@0/__overlay__ (1)
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso:13.18-43.4: 
>> Warning (avoid_default_addr_size): 
>> /fragment@0/__overlay__/reserved-memory: Relying on default 
>> #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso:13.18-43.4: 
>> Warning (avoid_default_addr_size): 
>> /fragment@0/__overlay__/reserved-memory: Relying on default 
>> #size-cells value
>>
> 
> I see, missed this before, sorry. But I have some problems fixing it.
> I think the problem is that this is overlay, the same node put in the 
> imx8mm-phycore-som.dtsi doesn't trigger a warning.
> The only solution that I found is that I specify the default 
> address-cells and size-cells in root node:
> 
> 
> &{/} {
>      #address-cells = <2>;
>      #size-cells = <2>;
> 
>      reserved-memory {
>          #address-cells = <2>;
>          #size-cells = <2>;
>          ranges;
>      ...
>      };
> };
> 
> The same values are used in imx8mm.dtsi, but the checker fails to find 
> these default values.
> Not sure if this is the right solution, though. Your input would be 
> helpful, thanks.
> 
> Best regards,
> Andrej
> 
> 
>> Shawn
>>
>>> +
>>> +        m4_reserved: m4@80000000 {
>>> +            reg = <0 0x80000000 0 0x1000000>;
>>> +            no-map;
>>> +        };
>>> +
>>> +        vdev0vring0: vdev0vring0@b8000000 {
>>> +            reg = <0 0xb8000000 0 0x8000>;
>>> +            no-map;
>>> +        };
>>> +
>>> +        vdev0vring1: vdev0vring1@b8008000 {
>>> +            reg = <0 0xb8008000 0 0x8000>;
>>> +            no-map;
>>> +        };
>>> +
>>> +        rsc_table: rsc_table@b80ff000 {
>>> +            reg = <0 0xb80ff000 0 0x1000>;
>>> +            no-map;
>>> +        };
>>> +
>>> +        vdevbuffer: vdevbuffer@b8400000 {
>>> +            compatible = "shared-dma-pool";
>>> +            reg = <0 0xb8400000 0 0x100000>;
>>> +            no-map;
>>> +        };
>>> +    };
>>> +
>>> +    core-m4 {
>>> +        compatible = "fsl,imx8mm-cm4";
>>> +        clocks = <&clk IMX8MM_CLK_M4_DIV>;
>>> +        mboxes = <&mu 0 1
>>> +            &mu 1 1
>>> +            &mu 3 1>;
>>> +        mbox-names = "tx", "rx", "rxdb";
>>> +        memory-region = <&vdevbuffer>, <&vdev0vring0>, 
>>> <&vdev0vring1>, <&rsc_table>;
>>> +        syscon = <&src>;
>>> +    };
>>> +};
>>> -- 
>>> 2.34.1
>>>
>>
> _______________________________________________
> upstream mailing list -- upstream@lists.phytec.de
> To unsubscribe send an email to upstream-leave@lists.phytec.de
