Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BC930F556
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756392820; cv=none; b=qXWZ+7NekXRvXi7hK3/yD6pANLY68kp/j389vXr7L5JHv4CLoYfMsdmEWpx1gF8G0wSfuhmx+QTLx04xm0Zn2+IUk6EJ2mgXeiX/vbmKpkR9ul9kMKkaYxr0wOPuRvwB4hLCFsD/1kiHfR7dd95FYmxV4rFuZ1nk5TN7lCvgHEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756392820; c=relaxed/simple;
	bh=/DJCTdY3b1P2Or2NvSx10h8mL8R7PGDv7zdfJNYKi88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FmlroGqqNf5GmRmljOwyjN6SX2xFrWVbZSufFcvKxlS5oAM2Zi4/vUGnJrPDJQEklubxPWgkBAnxZuJPrqppohbIJYBnhZyKERrNxk6R5Iro9CfV0KjwQNn6MacEp6AerFtoMAJjelBaKARk/HAwo7WcbqIiijS6M1BeQVzU6O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RDjPz8Sv; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RDjPz8Sv"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f34d792c4so183378e87.3
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 07:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756392816; x=1756997616; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgRsIq6h9IQubkV0Zd6BIst1A8E0nIWsW8u9giQ2ZLk=;
        b=RDjPz8SvyVw7FW3mS9w4SkelEPg8fN6B7HSbiZdZW0NuGzcuAZz10A3awF0mokIXJP
         ErgC1PLcxLCXnbiSp1DwlFOc+1izcENZcv+TO/XSc4oQMCZ94QXxIcRbMnpfXj2fRzUK
         6tZa4Sq91kcEX81T2kTOOHow5Zz/gxX3UancaY8bQscT8bYSCtmxEYq+ndezieEe+eEA
         9ol+kU99+Ram/ZGWX+6la+ffHH73lT4RC+Plu+futGLWcECApdYPbbNlx6zPAvBTT3q8
         gZ+XD6Vawm1EBWCXAIe3XJD+Uo+kZOaQ9Dqm1z824PEo4xIBKDW3oERZaqRNkDxCGSZD
         ygLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756392816; x=1756997616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RgRsIq6h9IQubkV0Zd6BIst1A8E0nIWsW8u9giQ2ZLk=;
        b=HUlSTgJk5EVF7JXw0JZEaxr+hV121F5jXIeWOBwrc36a4yriMIn20qrh5cODzS+xaK
         8v+ztb3Xjx+2U0Wd9bUe5V6ibQouWfZpqm+ZPMTmKjHbMmiGtiMUVmnYeBiTbOVEwvBK
         U/pYrUNl7QoC1M17ixqBotH9o6xnkr/8uLR7jVhX+x0WO54+EPekl49kDVEGtbh7W7EO
         XTJFEoGwc7f7Rymq5XxOa7x0/2nmFJjaZVxVRFxGQw3JVjOxu0ys61ggVcI+46Q6XWUh
         WtbGHqsvjS5IAFDzoj04GibKz5G+NiSUNDS6JIZ9Z3g3+fYvrBxjRfhY/uf65J8yzViB
         i3Xw==
X-Gm-Message-State: AOJu0Yxj7U+ibzbp/IpiF0ENHYrtHdXDpn92unCzEJvPhkybFbLi68O+
	vTOmKvAaankLl3iLIFvbLGc8EPv/mzolDUwzwoi+9G2oX6NpWLtsZVUx9CmVlQ1BL4c=
X-Gm-Gg: ASbGncvaNB/1HZpBKEHLk6VZ1/UcmvwtSVLhHTQstelxmEda5qmMj6llGWevA4CFiIi
	2rp+hW6Y4QmtXpmk2itOWT8LZ/eypKvJn+ou0LWpqwn1akKMumnvCSMmV3iQe40bHHcCSDQv+UV
	KypQHpHjcKT2HSRMYwgvYbOgWncadnTh0PHiOV5OqmJGmMAPcIvd8hxKds5Pju62UZT//MhwiKF
	yqSNdckZa0ZWZn/NV7kNAGP5HxaU8bkuEs9LFmHlIuIq6sW++HQO2FqNT4iT2zG57/F5oeviGIQ
	jf2zFvCJUQHAtc9bu9bIzHyIlikhlkgkKi6nv+Z6XyEAre+L53f5xH2aCPSG8y5gWAWaVF3IbZu
	xJAiphsOzB6QC5g0stGZIIumhxpDsGqNvXKXeLhuD/JHU7wBOLbQN7yupIKTyBQNtQxWgftanlX
	jOENKAQ7gnZcA=
X-Google-Smtp-Source: AGHT+IGSuI6V+Kke1CGBKIzaGvPw1P+D1NcZ65uMuJ+zPiHBgCmf2jcWw97duRvN9bxsU4rWcf1vCg==
X-Received: by 2002:a05:6512:12d1:b0:55f:4e46:8979 with SMTP id 2adb3069b0e04-55f4e468ad1mr1956400e87.8.1756392816152;
        Thu, 28 Aug 2025 07:53:36 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f63098450sm227908e87.60.2025.08.28.07.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 07:53:35 -0700 (PDT)
Message-ID: <17cd27d4-c881-4b88-9a28-555527546bbe@linaro.org>
Date: Thu, 28 Aug 2025 17:53:27 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: dt-bindings: ovti,ov2680: Use
 unevaluatedProperties for endpoint
To: Frank Li <Frank.Li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "open list:OMNIVISION OV2680 SENSOR DRIVER" <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250827194919.82725-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250827194919.82725-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/27/25 22:49, Frank Li wrote:
> The endpoint ref to /schemas/media/video-interfaces.yaml#, so replace
> additionalProperties with unevaluatedProperties to allow use common
> properties.
> 
> Fix below CHECK_DTBS warnings:
>    arch/arm/boot/dts/nxp/imx/imx7s-warp.dtb: camera@36 (ovti,ov2680): port:endpoint: 'clock-lanes', 'data-lanes' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov2680.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> index 634d3b821b8c7..ec5c40684b6bd 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> @@ -58,7 +58,7 @@ properties:
>       properties:
>         endpoint:
>           $ref: /schemas/media/video-interfaces.yaml#
> -        additionalProperties: false
> +        unevaluatedProperties: false
>   
>           properties:
>             link-frequencies: true

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
