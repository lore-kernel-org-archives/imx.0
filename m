Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E9C36C588;
	Wed, 26 Aug 2026 06:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727057; cv=none; b=hTz5u/RLOgwSoD0uxCICJi4OdEsn9ZPIyVrXI9UAjUyVsd5/pwCAjSq9a50tFrQudATm1ioYVparwptrGC+J5f52rXyZbYIvO+PtZKkBr+VMkREGw9c9EYdHX32/qf3mCJA//H1oJ4VfHohwY8uaiZUaWCirYT8Ha92QUivuvJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727057; c=relaxed/simple;
	bh=81Z0OBJdcHLEQ0z1Ifr+52KyoOf8ct//8xiq+mWPKKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dt+IPpOcEIrtOEFQBZOFuElnR9qMYbus1vGYb6TcUKFXl252NfEHVsMX51zHuCbMa3x55H75wPqAW6oSbAV0DkXIitGSo/FJCZZ5KctTwh7tcuewpDOOD+a2whCXEDgCXAcaEc6y3DcMKaw/vTe+xXwMPZooh44i0O16uFExP74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMaTw8uN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMaTw8uN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF1E1F000E9;
	Wed, 26 Aug 2026 06:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787727056;
	bh=eknOS7DPk4eW/moos+V/ffAFnLmh02PexohFS/buP1A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OMaTw8uNgmB61qikVsUyoEMfLk1UcFHD8cURdGo2nvyCA48sxN6EnLt2/w7xn4Et0
	 g3Pn2tf9WVWI/Wo55qC5LdzWhIvGBpGHX03YUvRaKFNE+qoUzByNNN8WUYzk6u8q9c
	 hZe4fSXtVQqdeOgfCxEor5qAEM+EezPlbKf9Do6It6XUolRI6UssGK+nyTZEynLW02
	 p1EEI/FZpYwgQTF+mHkGEP/2sfk3DA2C8a6wWx/7rHP7CYsOI6ZyacjitXQTy30+k6
	 oOA+AH0fuGKaMVCgIUqZz5DR0E5PQyt1/Qx+pF9wEoWonKh7jpAa/bYbR0qqSdNktS
	 WP/7gYu2wwMpw==
Message-ID: <44905087-dcf0-4ca8-a4f2-814737746435@kernel.org>
Date: Wed, 26 Aug 2026 08:50:44 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/18] Add DT support for CSI2RX multi-stream
To: Rishikesh Donadkar <r-donadkar@ti.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, nm@ti.com,
 vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, andersson@kernel.org, geert@linux-m68k.org,
 dmitry.baryshkov@oss.qualcomm.com, arnd@arndb.de, ebiggers@kernel.org,
 luca.weiss@fairphone.com, michal.simek@amd.com, sven@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, devarsht@ti.com,
 u-kumar1@ti.com
References: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
 <cd6818c3-bbad-4ab4-9a4c-4d9eda0ebc10@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <cd6818c3-bbad-4ab4-9a4c-4d9eda0ebc10@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/08/2026 07:46, Rishikesh Donadkar wrote:
> 
> 
> On 13/07/26 17:04, Yemike Abhilash Chandra wrote:
>> Support for multi-stream in j721e-csi2rx.c driver was merged last cycle[0].
>> This series adds the corresponding device tree support.
>>
>> Patch 1 is a cleanup fixing indentation in the existing CSI2RX nodes.
>>
>> The next few patches i.e. (Patch 2 to Patch 6) add the additional DMA
>> channels required for CSI2RX multi-stream capture.
>>
>> Multi-stream capture uses a SERDES pair based on the FPD-Link or
>> V3Link protocol. The serializer takes the input from a camera sensor
>> and converts it to the FPD-Link standard, while the deserializer
>> aggregates streams from multiple serializers and sends them over the
>> CSI-2 RX interface. Each CSI2RX instance therefore indirectly receives
>> input from multiple sensors.
>>
>> The remaining patches add overlays for various deserializer boards,
>> and for the UB953 serializer with the IMX219 sensor. Also enabling
>> DS90UB960 deserializer and DS90UB953 serializer drivers in the
>> arm64 defconfig.
> 
> Hi Abhilash,
> 
> Thank you for the series. LGTM !
> 
> For the entire series,
> 
> Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>

You did not have comments for v1, no comments here, so are you really
reviewed it (considering code has obvious issues)?

Best regards,
Krzysztof
