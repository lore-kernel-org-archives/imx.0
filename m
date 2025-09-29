Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091D1207A3A
	for <imx@lists.linux.dev>; Mon, 29 Sep 2025 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759165821; cv=none; b=GqBqtLSLQwcDRfuTNqOJzo0cCK/RbzXQEF6RYG8UIBtLT+yqtQTEkYAknblA0ikMEmy/Vg0s7dY3hYYJI8+euovZJexxk1KRKJh9Vs9Cw+RkpiXuzmzL7i/srb3Pih6iiJAVjr7fkLHl3CC8Kz9qup3gfGou5Spq3bzm7/910LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759165821; c=relaxed/simple;
	bh=OiGpU7PnhJ4f6Knst6kdaf7sbJ/eWD9xxiqpMBXj50w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPE4GqS+C1Z8Q1Wp2A9scmlahXSnPomqSJbP+8jLehU1zowND9MikHPyqX1ZB00V7KlhC4xvrlaY+4XnnN4QPfFgPSAlPQifWqU92CCSeePstsmyyfYA3rK+JMwNvdBbr47lAgs5OB0sD6nkInTwoxmSbqnoX/3FTyVantwxSpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ufxi6mHO; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ufxi6mHO"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cb73q0D68z9t2F;
	Mon, 29 Sep 2025 19:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759165815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0n/n2aPG/kzPYvO+2OVEYL5klvnYOH3rxCzc5hQBZE4=;
	b=Ufxi6mHO2aR5i7X58ZBpLwHEL1pIEx9MUkoEvGNpNObkP7xQV8LyFtXd+zAp0BDCtSjssN
	oh3l4R5h3ZSSr8rHmiulD6gD7roOpmZj+8qTTWOdTuHN01EcIqy/F2sT6yNjxRRSL3JJoM
	6hlUATmJVZNi+HeQ7DnGYXjYvKQAvNEKDA7WcmlM4G9TzUvxCHx/gH9cnLziVGmgzs22sN
	NplepLhy45jkBrUeePGTyDTs2RefZgWdrzzhBAwPeATwArcHygRT15vwKggU/gGatN1UzK
	aF4Ls9sMYg2NPD9DakRPnpnPzCiC0KbXcam/xj78mXXAcOj1V1bJBLmlEtXhZg==
Message-ID: <86bc3866-4188-45d2-8046-da82e44333c0@mailbox.org>
Date: Mon, 29 Sep 2025 19:10:00 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: Frank.Li@nxp.com, airlied@gmail.com, alexander.stein@ew.tq-group.com,
 boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, robh@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, simona@ffwll.ch, sre@kernel.org, steven.price@arm.com,
 tzimmermann@suse.de, xianzhong.li@nxp.com
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <20250926055701.GC8204@nxa18884-linux.ap.freescale.net>
 <8f4ed393-f94a-4abb-9cdd-60dd693f3ec6@mailbox.org>
 <aNpYG5VITPmKkNgl@oss.nxp.com>
 <cc873c8b-435c-467f-b1e9-dc78ddbfb483@mailbox.org>
 <aNqx6XrUGBgUJ-pF@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aNqx6XrUGBgUJ-pF@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 216c242169d189a438d
X-MBO-RS-META: 694cwbhaseu15wsa8xaqtfy7753b3yym

On 9/29/25 6:20 PM, Rain Yang wrote:
> On Mon, Sep 29, 2025 at 03:09:01PM +0200, Marek Vasut wrote:
>> On 9/29/25 11:57 AM, Rain Yang wrote:
>>> On Mon, Sep 29, 2025 at 02:23:01AM +0200, Marek Vasut wrote:
>>>> On 9/26/25 7:57 AM, Peng Fan wrote:
>>>>
>>>> Hello Peng,
>>>>
>>>>> On Thu, Sep 25, 2025 at 10:38:31PM +0200, Marek Vasut wrote:
>>>>>> The instance of the GPU populated in i.MX95 is the G310, describe this
>>>>>> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
>>>>>>
>>>>>>
>>>>>> +		gpu: gpu@4d900000 {
>>>>>> +			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>>>>>> +			reg = <0 0x4d900000 0 0x480000>;
>>>>>> +			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
>>>>>> +			clock-names = "core", "coregroup";
>>>>>> +			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>>>>>> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
>>>>>> +				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
>>>>>> +			interrupt-names = "job", "mmu", "gpu";
>>>>>> +			mali-supply = <&gpu_fixed_reg>;
>>>>>> +			operating-points-v2 = <&gpu_opp_table>;
>>>>>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>>>>>> +			#cooling-cells = <2>;
>>>>>> +			dynamic-power-coefficient = <1013>;
>>>>>
>>>>> Sorry for my ignorance, would you please share how to get the value?
>>>> Copy-pasted from NXP downstream kernel fork DT bindings, see:
>>>>
>>>> https://github.com/nxp-imx/linux-imx.git
>>>>
>>>> 11495de7c24a ("MGS-7621-4 dts: gpu: update devfreq para")
>>> Hi Marek,
>>>
>>> 1. this "mali: gpu@4d900000" label can be found in this commit you showed.
>>> please correct this to be compatible with the downstream
>>
>> No, sorry, that's not how it works. Upstream is not being adjusted to match
>> decisions made by downstream kernel forks unless there is a good rationale
>> for such a change. "Downstream does this" is not a good one. (*)
>>
>>> and upstream kernel
>>
>> All of imx*.dts* use gpu: or gpu2d:/gpu3d:/vpuvg: for the GPU label.
>> Also, variants of gpu: label seems more popular:
>>
>> linux$ grep -hro '[a-z0-9_]\+: gpu@' arch/ | sort | uniq -c
>>       3 adreno_gpu: gpu@
>>       1 bb2d: gpu@
>>       1 gpu2d: gpu@
>>       1 gpu3d: gpu@
>>      80 gpu: gpu@
>>       4 gpu_2d: gpu@
>>       1 gpu_3d0: gpu@
>>       4 gpu_3d: gpu@
>>       6 gpu_mem: gpu@
>>       1 gpu_reserved: gpu@
>>       2 gpu_vg: gpu@
>>      17 mali: gpu@
>>       1 v3d: gpu@
>>       2 zap_shader_region: gpu@
>>
> 
> Existence does not necessarily imply validity. Since a single SoC may contain
> multiple GPUs, it's generally better to use the specific GPU name as a label
> rather than simply using 'gpu', to avoid potential conflicts.

Does the MX95 contain multiple GPUs ?

If no, then the statement above does not apply.

If yes, then there is the gpu/gpu2d/gpu3d option.

>>> 2. the compatible string is different from our downstream kernel,
>>
>> See above (*)
> Additionally, there are still some performance differences between the upstream
> driver and the Mali property driver. If compatibility with both can be achieved,
> it would allow users to choose the driver that best suits their needs.
> Personally, I find it convenient to switch between the two drivers using insmod
> and rmmod, which allows for quick testing and comparison.

Update the downstream fork to match upstream bindings, not the other way 
around.

>>> also you dropped the "nxp,imx95-mali" compatible patch in the panthor
>>> driver, why?
>>
>> Because it is unnecessary, the generic compatible string is sufficient for
>> the in-tree kernel driver.
>>
>>> this will impact the mali property driver too, which
>>> has already been used in many customer project.
>>
>> See above (*)
>>
>> All the more reason to focus on upstream and avoid deployment of various
>> downstream components, blobs and so on. They cannot be maintained in the long
>> run, they break, and cause all kinds of maintenance problems.
>>
>> Upstream cannot be hindered by downstream blobs and their issues, sorry.
>>
>>> 3. the number of frequency in opp-table is only one, but there are two clocks
>>> in clocks property, this really make people confused.
>>> CLK/CLK_COREGROUP/CLK_STACK in i.MX95 are from the same source
>>> <&scmi_clk IMX95_CLK_GPU>, the other clock <&scmi_clk IMX95_CLK_GPUAPB>
>>> is always-on APB clock, which can't be changed by A-cores, and has been removed
>>> from clocks property in the latest release.
>>
>> Can the APB clock be enabled/disabled from Linux, e.g. to save power ?
> 
> please note that the APB clock can't be turned off on the A-core.

I think if the clock are connected to the GPU, then they should be 
described in the DT.
