Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9734A265600
	for <imx@lists.linux.dev>; Tue,  4 Mar 2025 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102505; cv=none; b=NTIQlW53urW0rydi0pR94J1tbIdeLAUsIVTqZ3wEIyfjH05+6Xn3uQR89uj5fNLUubQUtw+/nwOW4GglR3V20aWG01Z5MX97ulkVjT2R6Il+oeZLcL4Zu61wdmHJXIVD/7Sg4uULnl3+neDJaOn+rx7M1PHHA27o+HbPoLDtcMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102505; c=relaxed/simple;
	bh=O5BPl3Fu5wJkHXKEYtyH4ta5yhgbg1I1X4DpIIkIPh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MNSEiQb0mSM24hR+XIg4ATtsCNx39MAbWcEA/tivSaqzpEIFcbcmvkybkEh3croLlO42BG+o7vEG/BAJWfXHHoutPuAOhmQ4ifcTb+s51NVSEpA/TdRXNGBbSzA3YjtjGY4h+xm/3H+GtzXaJubyEQypE0Jrv6mFiC9Ejib1bkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrrAkddd; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrrAkddd"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaec61d0f65so1178293166b.1
        for <imx@lists.linux.dev>; Tue, 04 Mar 2025 07:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741102502; x=1741707302; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwZWXvpRlzaapz6M25h0ltLJIX9XFgudqnE1z2aOvDw=;
        b=JrrAkdddrlKfQDEBELgMBxHdL7kyQ4f57z4TpGmCd0ClGTUvy8oNP31NvK3cMjygVA
         AM1N6QBtToG3BcwM6DzPhG7oRI2Obk+JldRnfoIRAaVM4CfKkOJCuGJcIHxToEzrY663
         H5sX3EjiDIre3OrVKYkyN9e7olkPbKKd9heq1Bk2HRALqRzHOQL2ZUpB+U9sCjfCpQk0
         fs13L3Nw+2lsXEidRPaWYiMkcA55Fc8y3YVgtmJ0mc3tp1Eq6N95uqGN9xRTHHVXx+rL
         hTRRh/Ks6Ae2KDTcRbJSTpCbI3bUfaUWTG6u9/JprHA1Sbv5CNeJR+uK3jRA488Yn/d4
         0TvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741102502; x=1741707302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwZWXvpRlzaapz6M25h0ltLJIX9XFgudqnE1z2aOvDw=;
        b=A7xcvajcj9Tpz3APmCDIyQa9A/AgoMt9EP512eX5Q+6SNnSHcreu6uGq83nZDDKfKS
         P5l+4hCdj4v8Kp5LLbAbrQwjxXBW3jHaVLEqnsSSqLDYe+f4GwjEts1agj6JwAcWIZFs
         E7OI7PrkGGHg9lcwn5hlI4A1XYUhUkHqbNiBUktYTyLAYVvFN9fOPC9t+UFZlR3psT4r
         ybR3snupMOi//KcZS4gtJGgB8wYK4H+d88Nz9TKemRZ6OtEZRvvHa2WJ2jgzVLcr2dcy
         O3IxKHo3X6DPhJg4lOGGZCL+K9GzQ0rPrYuvHjnsHRKNHy48J10El/XFp+3xPa4Xnv2b
         ubnw==
X-Forwarded-Encrypted: i=1; AJvYcCVNVQ/pED0DuSZbsOa1jbvMjDP7msysZV00V97rDITOfDXxxJLakC7kjo+w0/ydQ5Wlgvo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5B/CdbjHDC5hq5Q5k0/UsOmBRa2PUhXcrcEjj5lKsNRPMbDUQ
	KU53iMnb02ou3i+Ho7Ejj8F93FtlL9vcLnnLW0l2W/P7rrMUI64D
X-Gm-Gg: ASbGnctUG4faw8m28R4T04T/mLWYlFpCIG4FPGKd7W8HMp/5Y3/IKGatOYZz/nPw5ec
	peeWpvPz6e9+3mQZTjfOnTvJRP/DFNTFa50T+w72G4whWOmOSlwrdgzV6EGTMDzrcT2GIO2LyLH
	Y4N6mpD1iLKCwREdgP6Ih6DGAFj4z6bRbZg2DpUfI6mNh3jKbzbVT+XjxOSSbdSFRZYDOmM56Rs
	mFSxOfBf1YwXAL3FfsGcgFyOaL9NPEyWSsZ814IzUbGlrlHPV53Q1P2sWTSZD0Du0B7M2X8NfiO
	b+0IG29/VuRdBypD4u7LoeDlCML/oeK2Mr5BrH3YaJNv2m7kmx5jB47eEwQrAoFFFTg7DluxYg=
	=
X-Google-Smtp-Source: AGHT+IGYG9XakyW+UdqNNLCDXpKkxXWG7Y4hV03XJnaZ6z+kf+TWlmY7SAdaNuPfFRb4w3Wi/uqpzw==
X-Received: by 2002:a17:907:988:b0:ab7:da56:af9f with SMTP id a640c23a62f3a-abf26859581mr2151760166b.49.1741102501551;
        Tue, 04 Mar 2025 07:35:01 -0800 (PST)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf74e85fbfsm404613066b.15.2025.03.04.07.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 07:35:01 -0800 (PST)
Message-ID: <09aba9f8-354d-4987-9026-37eb3ca26d6f@gmail.com>
Date: Tue, 4 Mar 2025 17:34:57 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] clk: imx8mp: fix parents of AUDIOMIX DSP/OCRAM_A
To: Abel Vesa <abel.vesa@linaro.org>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Marek Vasut <marex@denx.de>, Stephen Boyd <sboyd@kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Adam Ford <aford173@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
 <174102305899.2928950.8837177294161174759.b4-ty@linaro.org>
 <Z8Xn7f6vXg0aM4zx@linaro.org>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z8Xn7f6vXg0aM4zx@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/3/2025 7:33 PM, Abel Vesa wrote:
> On 25-03-03 19:30:58, Abel Vesa wrote:
>> On Wed, 26 Feb 2025 11:45:09 -0500, Laurentiu Mihalcea wrote:
>>> Correct the parent of the AUDIOMIX DSP and OCRAM_A clock gates by setting
>>> it to AUDIO_AXI_CLK_ROOT, instead of AUDIO_AHB_CLK_ROOT. Additionally, set
>>> the frequency of AUDIO_AXI_CLK_ROOT to 800MHz instead of the current
>>> 400MHz.
>>>
>> Applied, thanks!
>>
>> [1/4] dt-bindings: clock: imx8mp: add axi clock
>>       commit: 2471a101938b0d1835b1983df08daeb98eef1205
>> [2/4] clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
>>       commit: 91be7d27099dedf813b80702e4ca117d1fb38ce6
>> [3/4] arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
>>       (no commit info)
>> [4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz
>>       (no commit info)
> Applied only patches 1 and 2.
>
> My b4 setup messed up. Sorry.
would it be possible to also have patch no. 3 merged via the IMX CLK tree? I'd like to at least keep the first 3 patches together as they all fix the issue of OCRAM_A/DSP clocks having the wrong parent. if not, Shawn would you mind picking up patches 3 and 4? Thanks!
