Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692F81DFE14
	for <imx@lists.linux.dev>; Wed,  9 Oct 2024 17:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728494397; cv=none; b=Xsum8O+kpKFK2IZq5NV9VsRUqpWgp2B2oOzX+dfaEInQSFZchtmMqAKCwzEdcQcBxQA7phHhG3mv4Sh6iX/eF9OPmsLGZOA2Wq54LySehGB5zU0DxS2F0olxKUzmVsbeXpT8GaUmrUpIxs6bGPk2HccmImIHFEusM6dco+IMt2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728494397; c=relaxed/simple;
	bh=6XO3QHVsI2FrTm/T4grPmVZTTWhumn93WxIxXZX4PAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=asRj2LjMD1BFd/sLc9IfzuPAXKUI19zrJ4SfF0+VhPHOQq1xz1XjNZwqPy6oBR5bWwMXK27qHzUPb29gc1PZrk5FwKu4p7PzK7PokBioibLYs0G45jQ4smOKSPw88I7xx7TJhaLOX012p98zKPp9JO2m+USHzkGSR+IN3UWOakg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeJAPs4c; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeJAPs4c"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20b49ee353cso66181455ad.2
        for <imx@lists.linux.dev>; Wed, 09 Oct 2024 10:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728494396; x=1729099196; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mBIl3ppuyOTFiyulZToWVK1cyteAW6nYjEsK1BP48mQ=;
        b=aeJAPs4cRRnYdhWLdW1qloVpQjnvL8avDOnFbdpqf8MzTmUK3UTmB1wC/dkkhmJGOi
         Y7TlszRSiDEYruZTkLMcW50nIfm+PUqjG8+/BEhDXAr10O1HIGorTR6euD7soYnvKB+v
         W41UChK528aiuSva1SlOOw13uhWFl7ZRrWQxyhfe48IVMYq64RFHRMaF82UKcKckJ13f
         rtvfLD03fGQq0YWQKaUNMVabAgI6HB4ax5EYQmIV25jQgjVY9wtXk0EKYr2IqavbNtYr
         8yw82i8+4Pu5hR2rwbf1NbK0a7wxrxHCE3sWcukwU0/x6JUIZ/98rAwiONoxWLXUKQrk
         ISOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728494396; x=1729099196;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBIl3ppuyOTFiyulZToWVK1cyteAW6nYjEsK1BP48mQ=;
        b=KdvHRBYiFcsZAT2Fw1oomcZgOIF4l3DN893WQoChIro1QGIGfKzUAkCenaG8hZt4mI
         mwpgFMgyY4QUKcnovmZrDh809GLNgShMmUQ42ShV7FPiv/xfGzEE3xtX5bsiVHPvD4gW
         iocDucqErlTblSMwz/Ui6lE99La1JjCbV8bqSxoRaI5CivRqQerCG4PGe940wGLbTnbx
         zcVdfGDehzPTs3hU9pXBlWE//JodH4GGKwuEY6ankJIStDwBpnMpnCHSWQqRYQK8TYvT
         DN8SfJNuteRJfeBmCxQ9OFcvnVF/suRZGOfBaNrmnKvKE0jVcpRpd4cNGu1WIVWt01Tk
         yjzw==
X-Gm-Message-State: AOJu0YwDidVENBFH2pnttTsCTArwsW560tiZRINsWIfzeZ5/dGIZbbpp
	q9uMSk9oH+97NDwRVUr7vvgxEotnnUApbMjn4hwwc4YfgE2D5XUe
X-Google-Smtp-Source: AGHT+IFncdsW7+yrkVxSkHVLCowFqbtZx8qhTN/bRvczM/0qiogXC3KEuOZFaT2x9Cvi9fd5QhV80w==
X-Received: by 2002:a17:902:db0e:b0:205:709e:1949 with SMTP id d9443c01a7336-20c637963fcmr40556565ad.57.1728494395627;
        Wed, 09 Oct 2024 10:19:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13939c3bsm73161265ad.151.2024.10.09.10.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 10:19:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e08f9ba0-66f3-488a-a6cc-b087527b2cb9@roeck-us.net>
Date: Wed, 9 Oct 2024 10:19:52 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: fec: don't save PTP state if PTP is unsupported
To: Wei Fang <wei.fang@nxp.com>, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
 csokas.bence@prolan.hu, shenwei.wang@nxp.com, xiaoning.wang@nxp.com
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241008061153.1977930-1-wei.fang@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241008061153.1977930-1-wei.fang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/24 23:11, Wei Fang wrote:
> Some platforms (such as i.MX25 and i.MX27) do not support PTP, so on
> these platforms fec_ptp_init() is not called and the related members
> in fep are not initialized. However, fec_ptp_save_state() is called
> unconditionally, which causes the kernel to panic. Therefore, add a
> condition so that fec_ptp_save_state() is not called if PTP is not
> supported.
> 
> Fixes: a1477dc87dc4 ("net: fec: Restart PPS after link state change")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/lkml/353e41fe-6bb4-4ee9-9980-2da2a9c1c508@roeck-us.net/
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

