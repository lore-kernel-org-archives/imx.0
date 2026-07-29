Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02173E173B
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 21:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785360334; cv=none; b=ca02TDRDo6xpDqgvhGSZE6MU6nViSKjEcDfoyobUI4C+zkxoPHYHHCFVlWF4cHRYEB4xLA0h1/Aay55okehbul/I3JZlZopWgf/aHk7whmPUTFP9dhxCrfHwNSRkXwsyUlYAbvBWfoc0VrhnXMfqhqeI5psmfmm9JBXbD1VpWRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785360334; c=relaxed/simple;
	bh=mAZ8xvJQ1noKP8NU39VvfEAzcQ8Ye5Hxy2tDCwvbS/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2s1rTfhx9Pdq7S0VshOBKGWogmzMLnu0PaLwVsbghJ2Jz4oNzQMCFGP8ASFyN1PKN64ddBptHU8ZFmnKMiw87DG7DqdTveHW467CJM/kC9mLnBnDynYtEObvvOFKKoPbP7uzYNT7yGHemwKf9B70rkrdpNe6uMM9L9NFjta/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=XK4YLob3; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="XK4YLob3"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47DF411B700;
	Wed, 29 Jul 2026 23:25:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785360326;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZoMb+2U4HmX2tz3eN2n4VIXtSjD5srK4Rp9AxU0PyT0=;
	b=XK4YLob3pF+mVAMBaL/NfYuezShIK7BcFQq1MdkpSjieKQIBcuHN6NdvZIeR5Nc+S1+n5t
	XknesjssUy8Avx1rkmgFgHwWIXGJjFLkJQBQ7dFARcicvRnAKtqvuhnx4p+70xr7lunjwX
	9DbjLoFAPZI6ksBtRt+mIYztKoE14WW4tc6pnj4ZKD0M3teO2PSx8PIPW0OjKP8EU9lT1a
	9gxK//4Aky4TFPcErVkp7Oka109OGEruGoe60dSrDui07VAauZmIlfcPOptxDLk6w/dN2q
	hoNrPP7LWiQjZAG6OAGZCzTRL0wym6U2VVvqAUwmywfEOnY9TXlS+bRJzyBVTQ==
Message-ID: <d73c2ad1-c25a-4b31-9b0e-b38099d27d81@nabladev.com>
Date: Wed, 29 Jul 2026 23:25:24 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260727195244.78199-1-marex@nabladev.com>
 <178526691528.3668106.10748099183405791163.b4-ty@b4>
 <amoclu5c3bQH2zzF@lizhi-Precision-Tower-5810>
 <59bbc6ec-e01d-4656-a0a8-bc81c3cfbbe2@nabladev.com>
 <amojcXE2di_lwB2v@SMW015318>
 <114bc96c-459b-471c-8852-36309cca10b6@nabladev.com>
 <ampkUinVz4s2sMEl@lizhi-Precision-Tower-5810>
 <03143ba3-e589-42b4-9221-59d9258e7d21@nabladev.com>
 <ampuAiIUR-1FUxV-@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <ampuAiIUR-1FUxV-@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/29/26 11:17 PM, Frank Li wrote:
> On Wed, Jul 29, 2026 at 11:14:08PM +0200, Marek Vasut wrote:
>> On 7/29/26 10:36 PM, Frank Li wrote:
>>> On Wed, Jul 29, 2026 at 06:49:03PM +0200, Marek Vasut wrote:
>>>> On 7/29/26 5:59 PM, Frank Li wrote:
>>>>> On Wed, Jul 29, 2026 at 05:50:21PM +0200, Marek Vasut wrote:
>>>>>> On 7/29/26 5:30 PM, Frank Li wrote:
>>>>>>> On Tue, Jul 28, 2026 at 04:56:42PM -0400, Frank.Li@oss.nxp.com wrote:
>>>>>>>> From: Frank Li <Frank.Li@nxp.com>
>>>>>>>>
>>>>>>>>
>>>>>>>> On Mon, 27 Jul 2026 21:52:16 +0200, Marek Vasut wrote:
>>>>>>>>> Add DT label to SPBA5 bus for usage in board DTs.
>>>>>>>>> No functional change.
>>>>>>>>
>>>>>>>> Applied, thanks!
>>>>>>>>
>>>>>>>> [1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
>>>>>>>>           commit: 697f6889aa50996de067a8d170323535570052ad
>>>>>>>> [2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>>>>>>>           commit: 3eacea24d258ff5169d84a419b07cb5828e91718
>>>>>>>> [3/7] arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>>>>>>>           commit: 81a2094bb922290e4b52a1467037f8d2ac07ad87
>>>>>>>> [4/7] arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>>>>>>>           commit: cfdee13eba802665ecd8751fefa754a759f414c4
>>>>>>>> [5/7] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>>>>>>>           commit: b26192de5d0f4635d73ad2aea43e3e83a9ef5f77
>>>>>>>> [6/7] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>>>>>>>           commit: dca8d10e97bd121494106f54f4577291a9bb0f13
>>>>>>>> [7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>>>>>>>           commit: 8ea2fa3fdc65f2750718aebdcf912cccde5913b8
>>>>>>>
>>>>>>> Sorry, I have to drop these because met build error
>>>>>>>
>>>>>>> Failed to apply 'arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo': FDT_ERR_NOTFOUND
>>>>>>>
>>>>>>> Failed to apply 'arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo': FDT_ERR_NOTFOUND
>>>>>>> make[3]: *** [scripts/Makefile.dtbs:94: arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtb] Error 1
>>>>>>> make[3]: *** Waiting for unfinished jobs....
>>>>>>> make[3]: *** [scripts/Makefile.dtbs:94: arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtb] Error 1
>>>>>>> make[2]: *** [scripts/Makefile.build:549: arch/arm64/boot/dts/freescale] Error 2
>>>>>>> make[1]: *** [/home/lizhi/source/linux-imx/Makefile:1629: dtbs] Error 2
>>>>>> How can I reproduce this build error ?
>>>>>
>>>>> Apply patch base on git@gitolite.kernel.org:pub/scm/linux/kernel/git/frank.li/linux imx/dt64 branch
>>>>>
>>>>> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8 dtbs
>>>> It seems to work fine:
>>>>
>>>> $ git remote get-url frank
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
>>>>
>>>> $ git reset --hard frank/imx/dt64
>>>> HEAD is now at eba4724641990 arm64: dts: imx95: Add dma, intr, aer and pme
>>>> interrupts for PCIe
>>>>
>>>> # https://patchwork.kernel.org/project/linux-arm-kernel/patch/20260727195244.78199-1-marex@nabladev.com/
>>>>     -> series
>>>> $ git am v6-1-7-arm64-dts-imx8mp-Add-DT-label-to-SPBA5-bus.patch
>>>> Applying: arm64: dts: imx8mp: Add DT label to SPBA5 bus
>>>> Applying: arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M
>>>> Mini and Plus eDM SBC
>>>> Applying: arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul
>>>> i.MX8M Mini and Plus eDM SBC
>>>> Applying: arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M
>>>> Mini and Plus eDM SBC
>>>> Applying: arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini
>>>> and Plus eDM SBC
>>>> Applying: arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M
>>>> Mini and Plus eDM SBC
>>>> Applying: arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul
>>>> i.MX8M Mini and Plus eDM SBC
>>>>
>>>> $ git clean -fqdx
>>>> $ export CROSS_COMPILE=aarch64-linux-gnu-
>>>> $ make defconfig
>>>> $ make -j8 dtbs 2>&1 | tee /tmp/dt.log
>>>
>>> Missed
>>>
>>> DTC_FLAGS_imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01 := -@
>>>
>>> did you set global env variable add -@ to export all symbal?
>> Sure, I always have DTC_FLAGS = " -@" set . Do you want that in Makefile for
>> those various DTOs ?
> 
> Yes, we need make sure kernel pass build by other people.
All right, let me retest and sent a V7 shortly with this one change.

Thanks, I didn't realize this DTC_FLAGS part.
