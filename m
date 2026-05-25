Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000DE3DE424
	for <imx@lists.linux.dev>; Mon, 25 May 2026 09:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701589; cv=none; b=JWsGJ+5/QjsPpjOYFJ+YxFcaRLP+8qIDvdZtoX+XjAlekaYpPHDb3Jy2UOWbZo4pCypv993IozZ4ap3kjcfqQKm0o+FIawp0pQVUVt0v7Ym8mYdUlT5Uf98N0gtO9KJyiCXQ/dOaqJL2UMZFE8SK9pnTLCRE9UdbXoawHGkfS1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701589; c=relaxed/simple;
	bh=2+pxe1kU4fEfdSxs26jAJpTMIaMSl6lYnVxeYKl+0io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vhs5gc48NYq/YIn7hu+VU/JeA9Ixk6ynZCkg0Fds/7y2rViIZnZ745/orTX2vy+o/5R3cjvlJ8ozWzu6IN4FPM4ggx3lL5iulXvtBgbbcAVFSODy9gMQY7v8ckBTVIMfSkTHiOFeTahKLMycgwBkQHrsWJEtLvnP6wsHOeZK8GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osnP+9Y/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osnP+9Y/"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso80686055e9.2
        for <imx@lists.linux.dev>; Mon, 25 May 2026 02:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779701586; x=1780306386; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DoERE+8L5vLj1dPanKPuhfMBdwOHVvuHRasN+h+wvto=;
        b=osnP+9Y/GABVlGWkKN3cMFyvD5wxmdG6rNbTewOo2cpmRC0EzxaBfHNhyfVGGHmlW4
         gSfOfkDUUZyUOBVyDzKlPwjcaSW1OXs4lTe0k+KZP45dJfPLyhgTXUmknu6q+B/Xxim0
         dZuF5ksi1UeeSdInD00O+8L3TWL5OcIWHezbDo5DD4ZWBIuSliL27NUbxkiRo+Ku86R9
         sAaW5EvVKN0+6PAtwRAJaq4oQeDbVGI1MC/QUKIvpMtcepMl4LKboarWiol/Cf8R4REM
         1F3hzhynW5nenJ2c+PCtINha3p5ZH5DshY/V+/Ks9BqJcK2WFQprhbOCoVynqQigHemQ
         2APg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701586; x=1780306386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoERE+8L5vLj1dPanKPuhfMBdwOHVvuHRasN+h+wvto=;
        b=jne/pQ/AAa7n8BAahM1OiwY7m4eXNCPWuG1afZZgpHBtCAbctgYAS48w0ddiFH9Ip2
         3R9DoF7tGpNSTQbs5HNz1F66zKaUuVHfH+J6HWdD5k5eSDBWHHUJrInhwEvbY/qmsVBl
         nsk1jST4/1ql4+lgds8ep+j2gc6JpZyVAQZQkkzabknaSGKB/L3uC0cTEUzCp9nh9E0x
         8gGQGLReK1H6PVoA4Ge2FCi/8I1HXANRQMUhoOba5Hj02KIyuEMai2pZLKNepQ2Uz7ah
         hBNl0/D7qKxHiLIFcnBjC0zlFnPE5NQMro44PJbdjarrH22T6Qi8QnoJ7CSZGyQKUW3W
         /OKA==
X-Forwarded-Encrypted: i=1; AFNElJ89k2Qt369JRTyv0y5pn/7KF6ekdj5KjB+a3ihSzf6fuCfIFdSFKQCfARvHdEnbHxr4nk8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8838CB5hX38t/HiLVkfxfD/GAUdkN+o/zzEzgb5PWpsC7HuAa
	caYK5+YYgmBSY+WAu3LMvBlDU0qEZTEkSzD3mBQNGPclHFKaoopoVRLV
X-Gm-Gg: Acq92OFD5JCPzUN7JLh9fTPqlQCploGjAiM4ap4LVJUEOEFKqMpw3X40UtGwQEB7w7S
	OX5/42otWuXbK4IbvLEcjeLZ3LqRsQUlrQBb3E6/ArhgFWtdos8gnYtiHjD5Lpb4yhhfUGfsG0l
	oFD5qFJ5564dD9ao0nBm9QH8P5roTIXclq7WPtwCR1J0ScuXddpDbkFOKpEsUHL2NCRs0CFKr9e
	CE/r/Yx/m1s/8WG8LpJ7X1UAmpCj2aLAzau6nOGn1I0x3k/iQRQmw3+XfRqgWw1LvXHUmF7MX6i
	uvvuRYWdbITb96SRERcVIPgV+4eJZqM9XJ4sXGwsgUTrsHRjmg8laXqNTG6AsGpnXi4O9ekU5vj
	w10T9oVDIbMI2shnf2IcLOpj+TFM5XT/FT6pgiu0RqTSOm86n2g0BlXJzeEacVVVAVYcpyvem4u
	hUbDl6WR9s+m3MEDmBTO3ZNrHvUB/5U7OOVOupyAzfXMjGDvtJpUBxsKx0
X-Received: by 2002:a05:600c:8484:b0:490:3c94:a3c6 with SMTP id 5b1f17b1804b1-490428e205cmr231028375e9.26.1779701586132;
        Mon, 25 May 2026 02:33:06 -0700 (PDT)
Received: from [10.25.212.250] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904333146bsm135468715e9.0.2026.05.25.02.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:33:05 -0700 (PDT)
Message-ID: <3c2bc7b9-33e8-4840-af41-ce6e7308ae2f@gmail.com>
Date: Mon, 25 May 2026 02:33:02 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: freescale: imx95-toradex-smarc: move CM7
 node to SoC DTSI
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-4-laurentiumihalcea111@gmail.com>
 <ahOwvnij7Fwxh3La@shlinux89>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ahOwvnij7Fwxh3La@shlinux89>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/24/2026 7:15 PM, Peng Fan wrote:
> On Fri, May 22, 2026 at 04:18:47AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The CM7 remoteproc configuration is common to multiple MX95-based
>> platforms (e.g. MX95-19x19-EVK, MX95-15x15-FRDM, SMARC-IMX95, etc.).
>> Therefore, move the node to the MX95 SoC DTSI. While at it, split the mbox
>> channels using <>.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>> .../boot/dts/freescale/imx95-toradex-smarc.dtsi    | 14 ++++++--------
>> arch/arm64/boot/dts/freescale/imx95.dtsi           |  7 +++++++
>> 2 files changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> index 7d760470201f..c94a63a3bf8f 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> @@ -145,14 +145,6 @@ reg_wifi_en: regulator-wifi-en {
>> 		startup-delay-us = <2000>;
>> 	};
>>
>> -	remoteproc-cm7 {
>> -		compatible = "fsl,imx95-cm7";
>> -		mboxes = <&mu7 0 1 &mu7 1 1 &mu7 3 1>;
>> -		mbox-names = "tx", "rx", "rxdb";
>> -		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
>> -				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
>> -	};
>> -
>> 	reserved-memory {
>> 		#address-cells = <2>;
>> 		#size-cells = <2>;
>> @@ -204,6 +196,12 @@ vdevbuffer: vdevbuffer@88020000 {
>> 	};
>> };
>>
>> +&cm7 {
>> +	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
>> +			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
>> +	status = "okay";
>> +};
>> +
>> /* SMARC GBE0 */
>> &enetc_port0 {
>> 	pinctrl-names = "default";
>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> index 3e35c956a4d7..f8760ac067fa 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> @@ -272,6 +272,13 @@ opp-1000000000 {
>> 		};
>> 	};
>>
>> +	cm7: remoteproc-cm7 {
>> +		compatible = "fsl,imx95-cm7";
>> +		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
>> +		mbox-names = "tx", "rx", "rxdb";
> 
> Please not put mboxes and mbox-names in dtsi. Some demos may not
> require them and boards may use different MUs.
> 
> Regards
> Peng
> 

Not going to insist on this.
Frank Li, are you ok with dropping this patch and handling this at board/SoM level?

