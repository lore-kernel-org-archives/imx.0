Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD1148C3E1
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 15:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553358; cv=none; b=A0Xvp/SpnfeumkQOemt4JVd+KdiLBVGgi7x2GBpXeaLmJqqE0WT60WyJ5969tHH9P91MjjsNdtKz+0uykGM2wUYOh9yiUb60ngwukzmSAS55sX+dRlYIwTMBZcblnkThRsbENOuckJPRAqCaYz6QBGtqFeFILYvcO61T3hflDS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553358; c=relaxed/simple;
	bh=08otPddaBSK/iJqaPlVYLa99pVemHYoMD+SbFgLpoVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFWByEmJZX++KGl7eZkdFs/wulnHv9Majy+yd7SygF1N0pZuW3YDDx8j+I58B8NKM/qePw3wCPQ7zDhJ11BKr2dXk+E732DCY+DLSQS9t0PfUuRm5L721QD416PcocO3nk79OG/xHkzikjO8EuYtkkYyv/TaNPaIQXeSIznWInA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pdp4ijtm; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pdp4ijtm"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4398d9a12c6so4610669f8f.2
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 07:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772553356; x=1773158156; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hCve6WB7p5HFK86K5uC4kN5A3SIG4RHj/dCOzJXHcas=;
        b=Pdp4ijtmN2x1EXmBXJoKJ8gQC6fXz8DuqtjbhEME2AJmRuNxBANzmxjHQ9gkyvu0jC
         JBLm4xTQlqh8jX8FPSiEHSDBBMMpjW0q2wHPo7Xx0+Q2VGOHUTI+LazQpZPNkttHs9Vc
         RPcvS/RP2w8WpScpNrt3TUP0RwZCSmfzEMzsfr2Hkt7adSPZlDMQtZHh7/YAYW5DF0Zr
         FPnT/pmS8+y+bWmgj/RHO15+a1yozX9tKWekLNHt1+3oOguMfFoBejOUCyKbQzmARGvy
         WtB0uuktA7KBMFgCF2bZy7/qBauVpJv53h15Sci+Ppyek4oWg+CC2U3J6l+Fxujz1FeX
         iG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772553356; x=1773158156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCve6WB7p5HFK86K5uC4kN5A3SIG4RHj/dCOzJXHcas=;
        b=NQpUWKU2be9XvJYuOw0x8p/xekY7umYbIvvLGYtVxuG4bWTjfjjT4sNKWpiG9erAcy
         o62PmCsubL9PLlfiwKUFSIM5KuLX3RUepoSeIy2lxX4QclB78sm0zFIkWPgezI5WPw/X
         ooXohUtdz48hiS33YbGZ+hchFTbLvkhKofXAz6TWA3CZIodoAt168vpXgzL1oQ/8KiWH
         bhvkIf7ZTqp4nUItzZSEj3cg7fh/LnMKlFb3whFlNgfqK5GHX9Vl5hSLHNN7hSh+U2ke
         EbA+BfgeF9+kIfC2FcGBtScQxEfkDb8MyBUD7JZwNX4PcuKH4gZrs+olMFP/i1RG94ek
         ipLw==
X-Forwarded-Encrypted: i=1; AJvYcCUp6M7d/EQUu8F671ylwoAJH1QWDJNo3mwo0S41guUDQun//CNEVI5tgfx8CXK4ahj9lXI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzQlbzKn72JDKIopq+mG2p5RdH7XbLp47gbgHOV7dBXpK+pQOJ
	472dt0kzkfxj0K7gAP4L2Gl3s7VCtPQi2bdgm5G3W5ITfIq/c2DZeYi5
X-Gm-Gg: ATEYQzxSfdMrUoricQQMkap+lqIusQx99mx/076FuZ14I0N4Inj5fIb1CNl51EIT1n6
	UE8piep16EyxCzrg8frC5WS+gWBxx7es2fM+7Vi28A/cdYCMmBbMuj9wXL1ubyVpYcFu7iwlGy0
	OyFnS/+/Lye9g9VG0fywWRSBuKaUeho0Dljyb5dflo97LJe9MLCc+0p4vPyhkknn9/+bTXHI1UC
	yFMtEXmH27FHdU0n10M+TBItY1/pXDM7U3CS1EMS2l4afVRFpaLQhb6IU/R9443C/rG+asY1RQu
	lvs+s5Bxynoba6Nig+BhLHlXtZuZX0mrJNTfxl9cqtqDzyWFu7S2LHjW/P1b7YXfDOHy9Bgusc6
	cNxBQ3Q83MDLedzRGOeUJjUBDkzwNOaWlCzfo8qwkITxxfIExb55cl1FyeFH1oXLEWCqWBBoLtf
	j0VFlqPD6NKciTgq97Za0pEBgOj/VyFtStY9DJFwnab1A7XZnvZZd3rBtly71LkhqV1OP05w==
X-Received: by 2002:a05:600c:8b84:b0:479:2f95:5179 with SMTP id 5b1f17b1804b1-483c9bb1adbmr288516035e9.15.1772553355437;
        Tue, 03 Mar 2026 07:55:55 -0800 (PST)
Received: from [192.168.68.74] (93-34-120-147.ip49.fastwebnet.it. [93.34.120.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b485a0b6sm20131646f8f.39.2026.03.03.07.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 07:55:55 -0800 (PST)
Message-ID: <84ccccd0-bbf6-4f36-9862-68264f85ed9e@gmail.com>
Date: Tue, 3 Mar 2026 16:55:53 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: Support
 Cortex M7
To: Frank Li <Frank.li@nxp.com>, peng.fan@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260303121324.1576841-1-ghidoliemanuele@gmail.com>
 <aacAYYuPkqgV3QYu@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <aacAYYuPkqgV3QYu@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/3/26 16:38, Frank Li wrote:
> On Tue, Mar 03, 2026 at 01:13:06PM +0100, Emanuele Ghidoli wrote:
>> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>>
>> Enable Cortex M7, the vring nodes, a mailbox and reserve DDR memory for
>> the M7. The remoteproc framework is so capable to load and run the M7
>> firmware.
>>
>> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>> ---
>>  .../dts/freescale/imx95-toradex-smarc.dtsi    | 50 +++++++++++++++++++
>>  1 file changed, 50 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> index 5932ba238a8a..77c4a6dee098 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> @@ -42,6 +42,16 @@ clk_serdes_eth_ref: clock-eth-ref {
>>  		enable-gpios = <&som_gpio_expander_1 13 GPIO_ACTIVE_HIGH>;
>>  	};
>>
>> +	cm7: remoteproc-cm7 {
>> +		compatible = "fsl,imx95-cm7";
>> +		mbox-names = "tx", "rx", "rxdb";
>> +		mboxes = <&mu7 0 1
>> +			  &mu7 1 1
>> +			  &mu7 3 1>;
>> +		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
>> +				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
>> +	};
>> +
>>  	connector {
>>  		compatible = "gpio-usb-b-connector", "usb-b-connector";
>>  		/* SMARC P64 - USB0_OTG_ID */
>> @@ -156,6 +166,42 @@ linux_cma: linux,cma {
>>  			alloc-ranges = <0 0x80000000 0 0x7f000000>;
>>  			linux,cma-default;
>>  		};
>> +
>> +		m7_reserved: memory@80000000 {
>> +			reg = <0 0x80000000 0 0x1000000>;
>> +			no-map;
>> +		};
>> +
>> +		rsc_table: memory@88220000 {
> 
> I remember driver use hardcode rsc-table, I suggest fan pan to update
> driver to support memory-region-names to avoid use hidden ABI.
> 
> Fan peng, what's current status?
> 
> Frank
> 
>> +			reg = <0 0x88220000 0 0x1000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev0vring0: memory@88000000 {
>> +			reg = <0 0x88000000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev0vring1: memory@88008000 {
>> +			reg = <0 0x88008000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev1vring0: memory@88010000 {
>> +			reg = <0 0x88010000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev1vring1: memory@88018000 {
>> +			reg = <0 0x88018000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdevbuffer: memory@88020000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0 0x88020000 0 0x100000>;
>> +			no-map;
>> +		};
>>  	};
>>  };
>>
>> @@ -572,6 +618,10 @@ &lpuart3 {
>>  	pinctrl-0 = <&pinctrl_uart3>;
>>  };
>>
>> +&mu7 {
>> +	status = "okay";
>> +};
>> +
>>  /* SMARC MDIO, shared between all ethernet ports */
>>  &netc_emdio {
>>  	pinctrl-names = "default";
>> --
>> 2.43.0
>>

Thanks Frank. You’re right.
I spotted that my patch is not working as expected, due to a last minute
renaming on my side.
I’ll rework the patch accordingly and send a v2 to align to current expected
naming.

Emanuele
