Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEB91B4F0A
	for <imx@lists.linux.dev>; Thu, 10 Sep 2026 15:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052910; cv=none; b=CSV14VWeZjcG6U6A0pfPcJFovBfIWPVe+kYlHjj50vLeIPTibna4kipuDvqe1zGA48JjnSkqRnhCJ0NaWvZaCi2wZddAZDs6UPf30/vxktv8NWWRynLfSO1OBoPGrZTuMsw6a20hs9XlVdKA21/WTtH9lvvxY1KeRg7i+EGmcRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052910; c=relaxed/simple;
	bh=YSYs9LbmZU0PYWfoZXs1bLGfoTvd1+eohtoxmTIiqW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T+W8hWkgPszA/s1FPeKC9phH3vBoOIhDp1zGiAXLcqq+kP+3+AOkt5oDNJ7AaNu1KVdklTxWK26hr0/CIgBMaMiOHw09xIoD5ZoTw1586sBELhrjfGzjBgJsWm61a+wWC91Dk3W6yzUESbUyWCECikKrrgh3rPCmFjfM/ALKrbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r5qsDAJ9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5qsDAJ9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so70837965e9.2
        for <imx@lists.linux.dev>; Thu, 10 Sep 2026 08:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789052903; x=1789657703; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/O88mD56SBzt1YvJ4sXCFFpkOs3XAqa1P/dxdZfqCQY=;
        b=r5qsDAJ9ZL31gOeBwy+jYBK1+xCfKB56R20IGXPicAA97jq0sYgaBbfZOap5XwE4bk
         ASK56Mu9Fg/FEZ+ykSQgL62n6DNMBhN3bHjW8CBPhoSB5yB1mXmPbqGfvn4pPEWBxaSV
         x4PMi0zdA4Bod1mSHwRLnJq5vyLfvY6wHyh+EEAR81xUisMSW/VddY+6VzOawItey3+w
         2gt+HgT+lny5LQgRB7gwimO34gOjbvj9k+TSY6+wCuvnap5sglTlfC54WBvBasIPRU4k
         Pa8xpqQezoVPgJop7Ghgt/TORiU4f3Gb0S717Z8sAYsKzEyk9Up/JuibN5umzCh99Ooi
         EJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052903; x=1789657703;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/O88mD56SBzt1YvJ4sXCFFpkOs3XAqa1P/dxdZfqCQY=;
        b=AAiTJrJdrwWkVzA8jvOROVUBa/bZNYQDa9ADdIY0kNnoEuhUxVTfv7wJcwNE0WKz4y
         +xzGpKcLP9W5e6hAgFVDYmBGJXduOXGrNWzv9B3qcNCmWFwUOKi2jN/KvouqsVnbXfZj
         h6SZFo4cx/NQWrB8MzBQTe2z9RQXwi6jngIMEEcOn9aDDkuIbqCiP/HdOgc8c/cFWstY
         7nR5aFE7LfTfJj7M7iSYNLlj09Sz01P32EII/QrKDU4UpISCaTRHzI/Qpq2rpzTIYfRE
         bbbbehixWGmJ2yai7BkZ5m2JmEt6TG9P7M5y+DqD+NWIGry9+WdDiNQDuRVfv+31JfOk
         TLRA==
X-Forwarded-Encrypted: i=1; AKwUvBzQO5tAfU+pg7PoZksXNgsTGJLKm72ArzqVl9hFAdKR0324eQfIRU1pBd71RCBLP1h2M/E=@lists.linux.dev
X-Gm-Message-State: AFuF++ncQZPIuW5NwEhGJcjfLd2z23126M5pSNOK7aMIERgsk/ogX909
	bTUVyBR8cMmz/Hw+RMCsuVfFhr1ht/tf31xpboQPw8BU7MxN1yiozDY8
X-Gm-Gg: AYBFou0FkfYOWHTL35jCT6Vs/VopntDMPGakIHtwHSCOY2xvfkPe8NcZBe0IErYxZUO
	gOMTllaPvoN63XLG4e9SDXx8d7xwnKx4rfHIrqt6kiMFh7tOulLTGJiEx68BtGp1wpknQRzVnPq
	LgBbuV7HQU6lVcPK5lBkP6eMCyQ0FvYk8C5sPJy5/LkVLjEZkFOwQ+tTE0YTBsQP5UNAlMqUTyY
	MbaFThnQ/7S0ECnbo0C9DEA65RsBvt1+p5LaTmeRBO1VvnHS826zoa59jvrf9sqLOYxl6oLgi3a
	0CDQxRhf9q2AFKiOc+E4L4osvMPjk8XPkH/6jdmZiEKgdtN8Js9oMANARN+rI6HCImJTHTTeUlM
	OiAbbUitKFsIjuxNf+Prjh/R8xAdhnm8ZLoiT9LdIYSM0Q6LSCjKDSpVuF++7t1bEIQIApCg6Ri
	Xo0zNgpTSne+TwKz1GpxZIy2k73Q2Y3+SnpoO+if1OlO69nHcudmWDLuKerxHz4IewEHYU0MZ+W
	HoE3BCDw3IdL8X2LfYApvHBRQm0UYfq
X-Received: by 2002:a05:600c:4f12:b0:49c:fc6c:be00 with SMTP id 5b1f17b1804b1-49cfc6cbfcamr388041945e9.23.1789052902962;
        Thu, 10 Sep 2026 08:08:22 -0700 (PDT)
Received: from [10.25.218.197] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d24e01c66sm48739535e9.1.2026.09.10.08.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:08:21 -0700 (PDT)
Message-ID: <a41510f0-8906-4698-9919-b65b40cc9b89@gmail.com>
Date: Thu, 10 Sep 2026 08:08:18 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 elena.popa@nxp.com, consmin.stoica@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
 <20260909153943.1048-3-laurentiumihalcea111@gmail.com>
 <f0136c29-e372-4ae9-972a-23d7a60d75e4@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <f0136c29-e372-4ae9-972a-23d7a60d75e4@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hi Ahmad,

On 9/9/2026 9:20 AM, Ahmad Fatoum wrote:
> Hi,
> 
> On 9/9/26 5:39 PM, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add basic support for NXP's MR-NAVQ95 board. This board is designed for
>> robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
>> following hardware feats (list is not exhaustive):
>>
>> * based on i.MX95 19x19 SoC
>> * 64GB eMMC
>> * up to 16GB of LPDDR5 memory
>> * 1 x USB 2.0 TypeC
>> * 1 x USB 3.0 TypeC
>> * 1 x RJ45 port with RTL8211 PHY
>>
>> The support targets revision B of the board.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
> 
>> +	chosen {
>> +		stdout-path = &lpuart1;
> 
> I would recommend instead "serial0:115200n8" here. This introduces no
> change for Linux, but for other consumers of the device tree, they will
> be able to agree on a common baudrate.

ACK, seems fine. If there's no other objections to this I'll make the switch
in V5.

> 
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		/* actual size filled in by the bootloader */
>> +		reg = <0x0 0x80000000 0 0x80000000>;
> 
> If the board has at least 2G always, this is fine.

the board only ships with 16GB LPDDR5 so yes, it'll always have at least 2GB.
While the current size is fine, maybe it would be better to change it to 16GB?
Will have to update the commit message as well since "up to 16GB of LPDDR5 memory"
might be a bit misleading.

my other option was to leave the size set to 0x0 like some QCOM DTSIs seem to do.
Not sure what the preferred way of handling this is?

> 
>> +&usdhc2 {
>> +	bootph-pre-ram;
>> +	bus-width = <4>;
>> +	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
>> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +	pinctrl-1 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +	pinctrl-2 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> 
> Looks unexpected to have same pinctrl groups for the higher speeds.
> Are higher speed modes even possible on this board?
> 
> If not, I would suggest dropping the extra states.

The pin configuration is chosen to meet the timing requirements of the 200MHz
state. Because of this, I would expect the configuration to be appropriate for
lower frequencies as well.

The intention is to use the same configuration as MX95-19x19-EVK since, from what
I've been told, the trace lengths are similar to those of the EVK.

Thanks for taking the time to review this! :)

