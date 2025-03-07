Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99C022156D
	for <imx@lists.linux.dev>; Fri,  7 Mar 2025 16:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741363353; cv=none; b=nd6+jhKkGzUUZQ+T3tBW7AkifYv2uSPknjoJuKmh1utR1TwSzUNBQheTQ8bAqBT2CpP1IQJSpo8VIdvF4vLRru0BcpVE+/hC5tmFM8MlWJ6tUlDkB3RhXomoyWwE6hRyH8sUBtZqZBS5TLvcw7kui73Lq52A/BDVbWPekjnXxBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741363353; c=relaxed/simple;
	bh=lFdxkbYzjD0P48GbkFhKMmz9eW4sEbkQm1/W23ttC3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SfP2xUjVC1Gt12+EbShQv6lIzQfjBzr0nsye6wqsuCS7ZuQB1cQAS3yiOsFkw4bo3rZdbcUGmONnclisN7hUXvFvhwhHCfVOdx+XNYze/X5hCCxGp68ZNvEr5623goUbf0yJm5P/M1DeM/TuXLZXLY73rK4GkuKP1+O5XLgwZNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xi7XdyTY; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xi7XdyTY"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223f4c06e9fso37800155ad.1
        for <imx@lists.linux.dev>; Fri, 07 Mar 2025 08:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741363351; x=1741968151; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zb+NvzLUHQoq1FpAOfoO3rgYMLTUz+QxxpRaXvte7s=;
        b=Xi7XdyTYiUbIsfeXS/4E4C1oHWShvE+vNhVlusGncLCG2QENmpULdKGrM2fulrAZl3
         KXrcDV1v9ghmg3tA2b91gi+gvdq6LEaR7VL8m1tjG8YV22Eg1SPYo4cV38ScaH4IAe2C
         2pQyPWbKMhS7AWVjD424YIvk04R54jPAbuhYtEnraFHeReCBSm9Q3MaBVXIcS18fQfmj
         aKzAd4ZnIhJn2zq0hgaT20fFDDSJ8mtcUwaAYQOVHQ32iLXO8srGQ7lW8Oc0ujqP2x/u
         OjdlrPVai05h+eaBvUtKzERiOxShyxOoE1OoaB6DVZjSXNo9DFIngh6n89tlzOokaN5D
         arhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741363351; x=1741968151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Zb+NvzLUHQoq1FpAOfoO3rgYMLTUz+QxxpRaXvte7s=;
        b=tW9Jiujp97QXf/zroTTS3oJUk4ht2DWbUCQhCGGlxxYPlRvDaIqQkBSbb3hz5EIUBo
         BYIYq47ODW9/DA+AGJrLFLRsPaTxzi+aVtR9cyp2/GpdNCYBhJ8/hJAu6Tn8OCa6BwAR
         LSEGuKGfFoDidi1L2NKneIBNm1maYPt7U4MmET9ldqZRq/xAyM2CJTpKI5wOP6hnUzg5
         fcDQABEyXgXn/alRk1F2w0iFTjHatF6j88aZd/OTP3+exL02I/5rK4NyPEalb2/WIbxT
         akRU+YdtDofa96bwIJEw3+o/4EvG4UwfTJb1LzrJVdFJog9rUuY5zpxqXEqbvRMrp4t5
         ODgA==
X-Forwarded-Encrypted: i=1; AJvYcCWDF1lCBrDVMS/x4v5dLPI+kl3KhHZFxxbbIaNr2BCz65JzQ81QFNH22TEDxxEcoDKMPr0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7yO4eXBMOj/Pb3xheCmO4viIsHtlYqpdXHPeHmH20av0U43O/
	YMLk+zevG81P1IYQsbXrh5vJdPaGDs/AE4WLGsbql9w+uaYZjRKa
X-Gm-Gg: ASbGncu6RY9JWQ8xW3KowHjPxk+Xu2ZRDhzq1kwbragbc8ZrVMwsf2ZmnhB88wzgiJj
	OhCm3XhlEHw0yUNuI1an39amhfTCxXnzW87SP1q3XqzSzQ1ei3PCKKB89b5/xVvpBkPS/mXp/4S
	FWiVaqTf8hr4kCNmS0FjTTW4H99KcuN7xnFqMPKbbKVrZHyVyh238uyOYEx0vG3KTE8ZCesZor7
	FqOzhpDXSKmmh8TBb9Uu2/CmozsKc+sljsznqqctfBb9Oqhf0Yz0F6tTp44/phH9WSVEelBJxxU
	6AL3BgbOIk8XgJo5z7oFj2s3BSZDaJncLEtTVFBtLtj9BcteHZ6XM+804AM2dNPHunpgMmJ9j75
	eHcVljqW0WibLy58s0g==
X-Google-Smtp-Source: AGHT+IGznSvrYjNrYuAgQA1A2W1jR7Q+mpt9Mdt9FcdIUUbJ2WN2Iq2LMwq9M4nmJ7MiIMinbFk74A==
X-Received: by 2002:a17:903:1a10:b0:221:8568:c00f with SMTP id d9443c01a7336-2244b098602mr1713835ad.0.1741363350733;
        Fri, 07 Mar 2025 08:02:30 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af512724c14sm468713a12.37.2025.03.07.08.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 08:02:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <64d7d06b-337e-498a-87dd-03ae41e6a2de@roeck-us.net>
Date: Fri, 7 Mar 2025 08:02:27 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx7ulp-wdt: Add i.MX94
 support
To: Frank Li <Frank.Li@nxp.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250307154424.2613795-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250307154424.2613795-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/7/25 07:44, Frank Li wrote:
> Add compatible string "fsl,imx94-wdt" for the i.MX94 chip, which is
> backward compatible with i.MX93. Set it to fall back to "fsl,imx93-wdt".
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> change from v1 to v2
> - fix typo im94 in compatible string
> ---
>   .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml         | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
> index a09686b3030db..6ec391b9723a5 100644
> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
> @@ -22,6 +22,10 @@ properties:
>             - const: fsl,imx8ulp-wdt
>             - const: fsl,imx7ulp-wdt
>         - const: fsl,imx93-wdt
> +      - items:
> +          - enum:
> +              - fsl,imx94-wdt
> +          - const: fsl,imx93-wdt
>   
>     reg:
>       maxItems: 1

