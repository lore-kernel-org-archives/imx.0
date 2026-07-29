Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9F538AC6A
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 15:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340232; cv=none; b=YW/Uzs9QOUqTss9u1tkdVYqUtOilAENaRBfm0/nftYTf+AiiyOJ2N5W95oMXs2dLqrWgKDTPw1torze798imt6gh6TSUB3u5Y+cDwXsXgF5bFFYN7K0ihGNDEv26M549FgMLccIoCEv/CwGrqIlQ8Ds+tavtoQHh+H4UohHD8ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340232; c=relaxed/simple;
	bh=cM2pR18J2PH6Yu5st29VpeXA1ndp8QExna32/s0Nb5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EFqHLawqXQmM2Tkt6R3QFVKWahdqEaPeeX5zrM3UOU7dyA2gMXrkRm8h0o3pjl88/9VDG+t5YM+j/BrDVtk8zlpkWzfzFWkD/YQ3Ps+EY4u2BmXkXpCGcnpPobTz3QVJxzQe0/h7hFg0LLrdqcwFwhJEM08UOqo8i7tvCczH+PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=fG5GQFr8; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="fG5GQFr8"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94C4811B5A6;
	Wed, 29 Jul 2026 17:50:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785340223;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dTvSDJoOFtJYf3B7nrlUED5jT8s+G45mEsRbewh02LA=;
	b=fG5GQFr81j0+VDOkcR/TWimmki3bY3S6Bhyi/kXVV5NGtAnMoGXBRPenHZNx9phX/rzurc
	e6C7rbOdqQzfiysZ4e01n87qdoZ6/5jFz0geyRQ9KFV/Q77c1GZrAP/uA7M2uVcGRVfgcq
	Xy9MAJgYNPauGRxXtMoyVAR2zUWvG13Hb5y26ObxVG+HyId28QbQl7fRhOm7z9HTXP9fDF
	qUfB5v3UuNmZR9WmhVtZIGkNi96FtWT2wTXzw9/2X5J4iby8xa83x+v2a2ryGAuJXDsGwP
	fwqqpBH7mn6XDBjnKg45xBdBmo3acZ7HqD9TY0/fNKssvrUypj4P3Ajt9jy5RA==
Message-ID: <59bbc6ec-e01d-4656-a0a8-bc81c3cfbbe2@nabladev.com>
Date: Wed, 29 Jul 2026 17:50:21 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
To: Frank Li <Frank.li@oss.nxp.com>, linux-arm-kernel@lists.infradead.org
Cc: Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260727195244.78199-1-marex@nabladev.com>
 <178526691528.3668106.10748099183405791163.b4-ty@b4>
 <amoclu5c3bQH2zzF@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <amoclu5c3bQH2zzF@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/29/26 5:30 PM, Frank Li wrote:
> On Tue, Jul 28, 2026 at 04:56:42PM -0400, Frank.Li@oss.nxp.com wrote:
>> From: Frank Li <Frank.Li@nxp.com>
>>
>>
>> On Mon, 27 Jul 2026 21:52:16 +0200, Marek Vasut wrote:
>>> Add DT label to SPBA5 bus for usage in board DTs.
>>> No functional change.
>>
>> Applied, thanks!
>>
>> [1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
>>        commit: 697f6889aa50996de067a8d170323535570052ad
>> [2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>        commit: 3eacea24d258ff5169d84a419b07cb5828e91718
>> [3/7] arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>        commit: 81a2094bb922290e4b52a1467037f8d2ac07ad87
>> [4/7] arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>        commit: cfdee13eba802665ecd8751fefa754a759f414c4
>> [5/7] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>        commit: b26192de5d0f4635d73ad2aea43e3e83a9ef5f77
>> [6/7] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>        commit: dca8d10e97bd121494106f54f4577291a9bb0f13
>> [7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>        commit: 8ea2fa3fdc65f2750718aebdcf912cccde5913b8
> 
> Sorry, I have to drop these because met build error
> 
> Failed to apply 'arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo': FDT_ERR_NOTFOUND
> 
> Failed to apply 'arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo': FDT_ERR_NOTFOUND
> make[3]: *** [scripts/Makefile.dtbs:94: arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtb] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[3]: *** [scripts/Makefile.dtbs:94: arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtb] Error 1
> make[2]: *** [scripts/Makefile.build:549: arch/arm64/boot/dts/freescale] Error 2
> make[1]: *** [/home/lizhi/source/linux-imx/Makefile:1629: dtbs] Error 2
How can I reproduce this build error ?

What is the command I should run and which branch are those patches 
applied to ?

On current next 78bc8af4affb ("Add linux-next specific files for 
20260729") I get this:

next$ make W=1 CHECK_DTBS=y 
freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtbo 
freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtb 
freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtbo 
freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtb 
freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo 
freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtb 
freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtbo 
freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtb 
freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo 
freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtb
   DTC 
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtbo
   DTC [C] arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb
   OVL [C] 
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtb
   DTC 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtbo
   DTC [C] arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb
   OVL [C] 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtb
   DTC 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo
   DTC 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo
   OVL [C] 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtb
   DTC 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtbo
   OVL [C] 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtb
   DTC 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo
   OVL [C] 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtb

