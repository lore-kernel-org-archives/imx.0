Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2A03C9EDC
	for <imx@lists.linux.dev>; Fri, 10 Apr 2026 16:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775837133; cv=none; b=TnGiWHdbamhC589vn55KZ0WDi8RLVn46oRjFa9pKpS8EAORWyEz/SftOrQIc7F4SjhZEQYiZuTC+uroGp4eaQXkj7ToKT5p2E3Hfo8kuGeSqqv/CnpmijwR6VTTs+qmpQtWLVQUHlORfp2fS8Ixc57r6wJkoxP7fHbXUA9O5j8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775837133; c=relaxed/simple;
	bh=JVRuMiNPOp0rOofZTG53QZRaqC74TDxdD8KJao+OyDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cR+r3d7hUIs5wb8PjE+Gj+LcTCtgQscrmm9UhyAB6E0ZvCA/VHGQgPlPavimjyeAxMLqgKy/247Z73Nsid/aCrLi5j7zk3gllr+rJdwHdcDFQk9RsrP0287PRuFqY07e6mMaEhhKmBExOXbuHorctCAEDRdj94jvc9GbRSVKecQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QU3l4TFb; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QU3l4TFb"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1271257ae53so9647071c88.1
        for <imx@lists.linux.dev>; Fri, 10 Apr 2026 09:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775837131; x=1776441931; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Rdw806p54hv0WYSi4dT+YA4YfP2LywL8N5qs00NGoaw=;
        b=QU3l4TFbRZ55V82UWKj0MKGgt1f1gaiklwQFIDyu5aEsefXFkQrbQxjgSBrwEPLztO
         HI/RXWHINFjI17eTRCWB+MX3u07VfaZ0/PYeznOq18kFojuh8ptJ8COwI7P8ep30eexU
         FYo1ay84v3dAd5spvwn/W8x3VRdBrpLqIIA6D7d2fu+ieHNp0mw5JnqEaPcOhPELE45W
         0rCK9kyR8XJ6Ka6CZth+nnBjOyE+2uAV6V97JuPk6hy6a/mYJ6E1bw9OO7GsftbkAK4F
         QSvTyD/MntFi6d09FA4ipKvy/qiI/IA7QgyOx0LMeaI65hFrLRwAAu4iVlcekTNmdUen
         meGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775837131; x=1776441931;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rdw806p54hv0WYSi4dT+YA4YfP2LywL8N5qs00NGoaw=;
        b=CntFpv/AXltd72hwPa2pP0JdLTjOER1KJZMJ1Cs9mc519zn+EFkyRpkDjBtOrI71Xl
         SbrU3cJo2/TJP3uvvWKXoUJx4riI5xK948v/D833gH2rq0DUBgOuX/piKOOToSN+o/qj
         8i6e+ipH+yWCi3XW1L+L3ahYKjY2k/tnBtnV9T/Eih4D0lK7c1lbf5rFKGgZwTRyyeGK
         Q8Xsuj9lypKaV3sWXzrFu6gwR9i9Ub5vkJn0ABISSKMbf5Vmu/iHm5EQoCWZCRaK8Foj
         8AQgjob72A5cYVA9hWw9p3g+ai721Y7KdtzSlpntf7AZddYVzltV2vwZl2smiEsWKEz3
         UFEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEWLeNQvUHPF+GoUgT0XLDAm6j9pQpSJjiLwNTXR4zyjw03NOMXzlVcmyMO9gMATH1zYE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/+zq+WQMOr3Cd5yNGe2PlUvI44icARF8zS1uhXD1zNmg73d9H
	UI2cCpCXPuEwzdnfHeo06cShe870JBZfedGx0goTwPSuETrmL0H7vh8p
X-Gm-Gg: AeBDieuGzW/174v7lnfKky7cpBuxliBbyYF1j6xx16drVJnEx+LQQVkXV2vSpiQAwTq
	9U6ciybE02jlHvO/eQACEDck+xLnK/UBtYESAiJOhinRu/OmKoQi/he9wrxDRr9Gt5Iaxl5Ctuw
	/xbiRt+QBIhsJkzM4slpLol4wAW/8pWIZS6CXsqSqxMYfiYbMQLUrwqOb7LBHFVA7VaSYBW7BOx
	R+GBRPS6awuP14XtzpHrEqfn4KkHtTQGig3rbKUFbhXKrsBlN+MtoTVclyMcDutcEBcqSzZEW5D
	ZQKYt/3+r3Roz41EN6aRpvYN3eT/+gJmvbsbeeuFJH6YH2z9daU1ysulrzTAoodq9adLxl6wDOp
	QggBQ6zY0XMgawVsA8hrJT1kHfega12CorU8VqOzieTTHehKunjzuG9vcpgVRi+ahSr9857vq/l
	X0BSQmFTv7QrMhHRoDw1x68AX+4K9pA594m/R5FDNRZBLaovOj9SJZdQFsr/PW6v812acnABsZ1
	v7wmjEpiPE=
X-Received: by 2002:a05:7022:492:b0:12a:6c7e:bef2 with SMTP id a92af1059eb24-12c34e68eb6mr1904050c88.7.1775837131226;
        Fri, 10 Apr 2026 09:05:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55f5c69b3sm4849901eec.1.2026.04.10.09.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 09:05:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <54fec616-3cc2-4d73-9ddf-aadcf41c924e@roeck-us.net>
Date: Fri, 10 Apr 2026 09:05:29 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] hwmon: emc2305: Validate fan channel index
To: florin.leotescu@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260402122514.1811737-1-florin.leotescu@oss.nxp.com>
 <20260402122514.1811737-2-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260402122514.1811737-2-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/2/26 05:25, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> The fan channel index is used to access per-channel data structures.
> Validate the index agains the number of available channels
> before use to prevent out-of-bounds access if an invalid
> value is provided.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> ---
>   drivers/hwmon/emc2305.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index 64b213e1451e..0b42b82c8e22 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -548,6 +548,12 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
>   		return ret;
>   	}
>   
> +	if (ch >= data->pwm_num) {
> +		dev_err(dev, "invalid reg %u for node %pOF (valid range 0-%u)\n", ch, child,
> +			data->pwm_num - 1);
> +		return -EINVAL;
> +	}
> +
>   	ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells", 0, &args);
>   
>   	if (ret)

Please address Sashiko's concerns regarding channel index validation.
It seems valid to me. Feel free to ignore the other comments.

https://sashiko.dev/#/patchset/20260402122514.1811737-1-florin.leotescu%40oss.nxp.com

Thanks,
Guenter

