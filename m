Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7037A34CDD
	for <imx@lists.linux.dev>; Mon, 29 Sep 2025 00:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759107132; cv=none; b=u6scqEQWszYYvtsXErM46Bjw39C4Ojnu5NrAzPP2IrXfR9sCFm0yztK9Biwu8fDUCbbMTlIJgZYh+e3vodbCmOv+tfavlvJ4y+0b6GwfeooC8RuPjipPhAEALrbwxyJKTPNhp26BhfgGcUqCfL69osEAs12IJMHlwjOIpaJ/57s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759107132; c=relaxed/simple;
	bh=nH4cEwe8UHf4Me7m6iollgu+m17Z1H7oxF0wNNyn+d4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HJwHN4hgFbkIZCppnLJqceARVaa2BbBRaYzwsLOgwGpNCzZb/woy9CbAd7Hk9WaCqRcatJ+4nDZBqvOaphqr6iR/3gpmJzwS+4pTq2canvrhOKU0IevWUh1WusGZHcWzPQMohLZRN9UInJxaGYt77hS+qoOnwDSdDw7v89Iu0KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TQlEZ+Tp; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TQlEZ+Tp"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cZjM51BFTz9sm2;
	Mon, 29 Sep 2025 02:52:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759107121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Djnb22vXs0nO5rPbjymOk32EmHdD+HDxTwWNm9+Bfns=;
	b=TQlEZ+TpP5RCDXXFkZm8omA8mNSEamptg9t1ji7874wLDbDSnOwUQmzLS6d1uEqPUm547X
	C9/i75UD/4Rgk8z8Hg8zU7zzy5/UzAb2TtYPQCXi3u6XVooBmpOlEldYK6nFo+8JOcbCmZ
	IA8UX8et4qJzg4DrMAmstnMnjGfFcA91ueGLlIvVrdMe3YZKAKBKfBKPCVA0QG16u2wA47
	GJHg9Rjn1dycE8tH7fk9dVIssucguMHaCSOorXR/f8gJomjVg4uBEfl4bRaA5s5n2Wg3sT
	ADrJxbIscWHmRtSXpRa7V/YYIV0g7Eg6ifjM2GrS2riYhGA4pTb1xFqGj8ABGQ==
Message-ID: <8f4ed393-f94a-4abb-9cdd-60dd693f3ec6@mailbox.org>
Date: Mon, 29 Sep 2025 02:23:01 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, "Jiyu Yang (OSS)"
 <jiyu.yang@oss.nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Xianzhong Li <xianzhong.li@nxp.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <20250926055701.GC8204@nxa18884-linux.ap.freescale.net>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250926055701.GC8204@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 24eeff4a72bf94b4f8a
X-MBO-RS-META: kgs4shqh8jgam9h18x7hnwfqw7yfhu9n

On 9/26/25 7:57 AM, Peng Fan wrote:

Hello Peng,

> On Thu, Sep 25, 2025 at 10:38:31PM +0200, Marek Vasut wrote:
>> The instance of the GPU populated in i.MX95 is the G310, describe this
>> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
>>
>>
>> +		gpu: gpu@4d900000 {
>> +			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>> +			reg = <0 0x4d900000 0 0x480000>;
>> +			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			clock-names = "core", "coregroup";
>> +			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "job", "mmu", "gpu";
>> +			mali-supply = <&gpu_fixed_reg>;
>> +			operating-points-v2 = <&gpu_opp_table>;
>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>> +			#cooling-cells = <2>;
>> +			dynamic-power-coefficient = <1013>;
> 
> Sorry for my ignorance, would you please share how to get the value?
Copy-pasted from NXP downstream kernel fork DT bindings, see:

https://github.com/nxp-imx/linux-imx.git

11495de7c24a ("MGS-7621-4 dts: gpu: update devfreq para")
