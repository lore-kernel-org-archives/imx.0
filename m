Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97D91EDA3E
	for <imx@lists.linux.dev>; Tue,  4 Mar 2025 18:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741113525; cv=none; b=G5xyW8DaRXr/pbnKh/3umdKRUu+QEZPF0cHIhz9NV1OqecQujuBdCXwHquer54dM5pCvKX4dJwtgkUtkGEIbV7Zmmy4s0jhQ5xSq1AkHtAgnkoFtUCVnJrYdE2uhRdqvy8XCNADgpgZpv9eRgMEphBwb60ZVMPdbjMJcyHsgoPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741113525; c=relaxed/simple;
	bh=hSLwXWcUbwo7t49r9pt8k3ZvIyCKvfSqv0ZtVn9VHGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ehmnz5SnipFsgYdl8Dm7o8Fe5c4CULeGlMf/8GmYYmWRx0k3dDNHAHSTj+lrAoLn+3EvBgxtOP1mv+hQinswMC/qn9F6XHxP32TAHk1Cb90FVqsNMv/sZSLqNGCCg8Cqi5L1Qc0dlC07IYkktcCLAnieWXIiS0RAJdrAwXSYCj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0jYNMQ1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0jYNMQ1"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bd03ed604so3935245e9.2
        for <imx@lists.linux.dev>; Tue, 04 Mar 2025 10:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741113522; x=1741718322; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H948FRDwgMsgmADI+OEoZ51nO5/psSifQe84iLy+MzA=;
        b=k0jYNMQ11et7Socy/j+u/Dyx/Ndvzjxy0fEM+QsCZUNPIaRFwNGb5rQS+AaokXSBaa
         beqGkeOMmehzUH0eXAvwj9n7iC8x9qCUBQtWvxPTfDX6Yaaf/dsIuGeVP1/zsDlTNRXG
         V1fEGIE2JJIK2/FawSpe0Wr/ZOjZXsFOrLODz7XJtX75XYwlpA9CKJDwW75Ec9oKYtR5
         e/TNs4SxCrIeacxLkVT0FYal9P6e2lqo+I67PaBZsDSGi38BgIUaUL4ocjJY9GL5IOtS
         5tbIIC0gV8H28Eg8mupFCI1EelZ187pMPFCqWFEYO8qzMWrBaLs09ZyP+MqmtvqGmqvC
         8qCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741113522; x=1741718322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H948FRDwgMsgmADI+OEoZ51nO5/psSifQe84iLy+MzA=;
        b=WP2g36DbjCCye6LuPsIC+7ycVyNAbofPv5FiISVUyZ0EZtgTr0G5yCFir5K4JN40kE
         PWmampM2igE2Y2Nj9IBIo1J/RVSt0yjzQH6PyOWAYWoYkWy0vGaeO7v207nDwJGKhbuB
         w8WURvObxfTNW4nolKePWrk+LW/VvOLw/FXgkY91EwNgx6kXF1JN/oiML6KqFBl9WV0P
         y+ou8lxZ2lYRhviAofHZF7VjBVOl8+R5Y6oaKnDDY1+XcuedAjwN4jfOYjMRKfws/guE
         /s5vzQDn3+zI0Q8dtTRXEtpx7uB1Vz4IajfSjjxQ+phg8yNb5Oj7xB1tKyVa93UEhNHu
         U3aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpnTHCaRoSOZ9JzbuFOA2ftZuwBbpWQQNxoKeU+Nx+r7wF67HAbVp1D8YIAGELQX4Fq+8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdCvB/lY5BdTLyVsSvjxi37hy7Tkv3cInmARc6Rk8LSw2qcjRY
	vCcPix0T16X/TBlTZfxcPAd2rH/SPPkpN054kx0rcRj39RC9Fewb
X-Gm-Gg: ASbGncurLaiLa8V0WkHIxEIaL900DbIJTgKNtBUDNIXevCfEE7t5TWbQQF4sdXDj+SW
	3PWui/NW8a5gJ8NYnTEYZn5f6P07/oVNz6fzV2tkR9HG6PM7KnCfikC2kSJxb1tPs5DWkw5Ye1t
	1WbHsHNEZ47WRcD6ZOivrfW9V6sWa7DZyJIWN5i5stdYyAkOfIhPglL7O/a9LmolUqFi6DFW3rk
	fbL8yLVmfKjGaWB54zsMnCjTEqgkC4AzTCQrqXgskAGA2nO3Q+ukVqdTjkY/UqWxlHtlVFoosqk
	mIZAB48ZiZiacH4Ox4IfC5EmSmtUlRzTCAMkd/+jBpNgIYZO0tWUMVHptWy1d4gmVsvkg8S4ww=
	=
X-Google-Smtp-Source: AGHT+IG1166SxCE4sFCdzuiE0V7QxZDudPu8M9dvEeKEFshASL6QcVMXEy639K5WegyKjMIjEPWGqA==
X-Received: by 2002:a05:600c:1384:b0:439:8bc3:a698 with SMTP id 5b1f17b1804b1-43ba66e5e9bmr153210385e9.6.1741113521738;
        Tue, 04 Mar 2025 10:38:41 -0800 (PST)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bbe676b41sm93370475e9.11.2025.03.04.10.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 10:38:40 -0800 (PST)
Message-ID: <31451d28-d179-49b7-81fb-0f8914cc9c1a@gmail.com>
Date: Tue, 4 Mar 2025 20:38:37 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: imx: add imx95 dts for sof
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
 <20250211225808.3050-4-laurentiumihalcea111@gmail.com>
 <Z6vcBvs4xGQ+pGCJ@lizhi-Precision-Tower-5810>
 <36ca7549-aee7-4f14-9311-77978a42362a@gmail.com>
 <Z7zNymSs5qeHp9wL@lizhi-Precision-Tower-5810>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z7zNymSs5qeHp9wL@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/24/2025 9:51 PM, Frank Li wrote:
> On Mon, Feb 24, 2025 at 09:17:03PM +0200, Mihalcea Laurentiu wrote:
>> On 12.02.2025 01:23, Frank Li wrote:
>>> On Tue, Feb 11, 2025 at 05:58:08PM -0500, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> Add imx95 DTS for SOF usage.
>>>>
>>>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>> ---
>>>>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>>>>  .../dts/freescale/imx95-19x19-evk-sof.dts     | 85 +++++++++++++++++++
>>>>  2 files changed, 86 insertions(+)
>>>>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
>>>>
>>>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>>>> index 839432153cc7..27f64e333e4b 100644
>>>> --- a/arch/arm64/boot/dts/freescale/Makefile
>>>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>>>> @@ -282,6 +282,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
>>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
>>>>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>>>> +dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>>> look like should use dt overlay ?
>>
>> can you pls explain why you'd see this as an overlay?
> It is addtional option, which base on imx95-19x19-evk.dtb. Default wm8962
> is used for built-in dai, this provide option to move it dsp.
>
> Ideally this option should work for all boards, which use wm8962.
>
> We try to move MxN problem to M + N. otherwise, there are huge numbers of
> dtb files.
>
> Frank

Yeah but these are not cameras/sensors (for which there's a lot of possible combinations)
we're dealing with. Unless your board has the same codec, same GPIO for headphone
detection, and uses the same SAI instance this overlay will not work. For instance,
this wouldn't work for the imx95 15x15 EVK board as that uses a different GPIO for
headphone detection. As such, you'll most likely end up with a different DT overlay for
each board instead of a DTB.

Also, from the experience with the IMX8 series, we really don't have many DTBs. Usually,
it's been 1 for the base board and 1 for the audio board if applicable (which can probably
be turned into DT overlays. It would certainly make more sense this way).


Given all this, I'm still not convinced that DT overlays are the way to go.
