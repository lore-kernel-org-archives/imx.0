Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3870279782
	for <imx@lists.linux.dev>; Mon, 14 Apr 2025 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642820; cv=none; b=myWlQtxrenteHuWXyqAdqzet9xazEkoL/TCPsf0ttTwsE3f1A0OTwFZt+n4XBFC5l2HkbjQ6sMi7q7UfqPTaX9ycwU6U1wxtk90lmawLji2wgv1YBjZaFhW1rTpt7euv0jflH3ypzsu7CMto3snPNKQzcZOOe4hUkpSBtDWqaS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642820; c=relaxed/simple;
	bh=LnGYMCgY8o3nqU9dYoIpDmeiZgFuXlxSQGxnfJCjUwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kxGbnyyhVR31+UXvkSDq6syPknCfPjQmYFNHaIagWoEF3JypEYsFqxvDEvw5bG986vdc2MGTEFaIeyCltlmuWOoI8/1M7tfw031ILzfVsCHeL+XzGwiCMD9QGuycc/TAwI9siSX/oyKao2S1ewDxDEuGWNR83Ih5vCW6Sq4dwmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEcARfeZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEcARfeZ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2264aefc45dso65801165ad.0
        for <imx@lists.linux.dev>; Mon, 14 Apr 2025 08:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642818; x=1745247618; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5kLS/6RXQ66h4Cm91JvQtjGIa3JCgrOEQRFQVcgiCPw=;
        b=iEcARfeZq57MWYpzjOlKizRfTveGuOgBhGc/SuRwZntt9GQRYJJONAsXqhWNtdRaok
         UYFY11LLlnWMXFStPvfMTbZj76RpTNcF2dhGBk0UbBzEtXbkL7MqC51wrGS3KG22oVW1
         VIrEV7xx07fP2WIuOpCsbivoUpdTWtfmAynQFYgrxiUkgdmhTZYbb9mOBM39GNLnVhJg
         +rP1H5E2peO+hp0MDcC3IPiR0RXg1FwfgWIUFAT7u9Ki2i0GWcoDNYVOmuBk2OePD4Oh
         y937d46fat36o6JU/lNj6DX3lVtCTLPqQ/AVD4YnUVqMbh3yih3ppSEBe8PAauKwk7P3
         ZudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642818; x=1745247618;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kLS/6RXQ66h4Cm91JvQtjGIa3JCgrOEQRFQVcgiCPw=;
        b=UbLBbdBuLkBrvNwvWuDr9nwb95ctcAgzDWEgmJzGQoz9sibeWAOIy19FGgqqEGS1VR
         V7BsFzs/Flxc74A99mj6GsmMh6ofkflx5kz45p1/2CUBraGyy4h/7y9FNyXyb2fhyZ/M
         1KBxvWkk4IfKEBavKhM3XZKQdeumbdSlqYJK+NHTKOGV1rr0mLCnKFjIYnmIUClBYSod
         wDj0bb2rTAJ5qx3LaEkBZTjaWOGFmPOKIW9ZMDh3viKsqCI5Q85JdkyYWaEnS0YEWR95
         cBFtdswjoPE1O75YDfeKXn211VQLNbiV7GpT/QaH7YNlaihYZ6JIJ2esHXcwecobrP9z
         F6Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVfy2+r6ydI7g5fuKDSnPczogdCGZn+bRxJgLOgXT8RS3tqPrDO20NtzaoYX/72VJFN9+4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9bv6NxsN7suJFIl0UlLa8SSvAhhLSZK2yk2uI9I6RvOxKeqXe
	sBZywT+/qxcEGfVixerZmj4o2uSM09vqX8YsyxKEy9xatkRxVTcQ
X-Gm-Gg: ASbGnctltIeKFVi783Z0UpyBfnavSpmpOAN6MSQAEHIolutdTgk70BgChPTe0Wlp0zP
	Kr1pbWe4YpQak1VU8nMTHeyeJ0Kz5BG08tYAxtgx/o7knKxL/IlO7/VbKdCXqYbBxkaNNu/XepG
	jVwLcoHULPYv5+mr14ZfRsL0abYA5YhuSksu/nmQSuN1ERkftGEFGwBVKJ9cwE2HC6NZDvg1uV7
	PzTuJdfQ3jCbkwwcPv3b6Z4+cIJNqKmgTA0nrO7xw55/03ydsSn1ZFbHbrXVrNXoXWI7diXp11X
	Jiku1WWEgJiUQQZtYapc7h8Zl96IE6Nxre8mw1ANJEgXc8xUXNN0fmz1le7oEpzjH/xUGOseELl
	Qx92bytGJK9OPuA==
X-Google-Smtp-Source: AGHT+IHqBXbTHQD4lPtB456t+zFykKlRJiHynnOhc3Db4nt5B88XORp2NkZCBZwkWo8idEIhJzlAEQ==
X-Received: by 2002:a17:902:d4c2:b0:223:2aab:4626 with SMTP id d9443c01a7336-22bea4952cdmr166451955ad.11.1744642817775;
        Mon, 14 Apr 2025 08:00:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b6508esm99898635ad.52.2025.04.14.08.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 08:00:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <91a0f271-3261-43bd-acb6-81a404ba0e1c@roeck-us.net>
Date: Mon, 14 Apr 2025 08:00:15 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: fsl,scu-wdt: Document
 imx8qm
To: Thomas Richard <thomas.richard@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
References: <20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com>
 <20250414-imx8qm-watchdog-v2-1-449265a9da4e@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250414-imx8qm-watchdog-v2-1-449265a9da4e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/25 07:57, Thomas Richard wrote:
> Add an entry for 'fsl,imx8qm-sc-wdt' as imx8qm also contains the SCU
> watchdog block.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
> index 8b7aa922249b..1d9f15ec6657 100644
> --- a/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
> @@ -20,6 +20,7 @@ properties:
>       items:
>         - enum:
>             - fsl,imx8dxl-sc-wdt
> +          - fsl,imx8qm-sc-wdt
>             - fsl,imx8qxp-sc-wdt
>         - const: fsl,imx-sc-wdt
>   
> 

