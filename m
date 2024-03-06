Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D188313A89D
	for <imx@lists.linux.dev>; Wed,  6 Mar 2024 17:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709746933; cv=none; b=CeeoXGIJXhTIH5aLmeizgCAh6MUbxeNYMF1T6/c5TMW1Q5xn7C3/dh+vGYeYJwXmNJ5UMcYhz5x8v+RGOH+aFxKz6xJrryeWcQO3IBaqNTDA5rBHZQMNeK2AyzAtdjg4wI+Lq3dz3yMvFPH+Aw+PEbt02HYhN7wzi6Ze/VHCPkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709746933; c=relaxed/simple;
	bh=XCnhPj2fK38RW068ZA7Azta24iCeZaL58zBR3pb2O9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sUeaaJUGRiYQN0dOiuyFCAs8ZwF48JV/8QwNhuCCVYeYn/ZAif5ijVQMjYSMzzgkyqlV1Gicz/br918Xke9LJU66kvoPrSY2C0nOiErAkFVY0ZO7B9Wix922Xgcv7jJUzsjiF90HP254w82Cf00iZujkB77BC0f35aKCW/riUb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RR9/S2zR; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RR9/S2zR"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-68f571be9ddso833406d6.0
        for <imx@lists.linux.dev>; Wed, 06 Mar 2024 09:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709746931; x=1710351731; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cP96RrcztrNAzMbEhfXoCNnB/B/rAwamum1tutFUVu8=;
        b=RR9/S2zR9KxgIuEXFkxW/xfW0HwC9UhO7hxh6u2ddPKLHgxlykF2MLBBpa77/iTSu1
         qKOsJ+/SYx8am0/KX9kSIEZdo/aQJJ5k4iiW5WOWisiIijFCPEpdxUJg0LqftCaApv/N
         En5/Ss1mAU5OUfp4iBGBdV/KKxthKY8IzXXVZNGvGK3pZLZXIsjxDLSWIg/eIDVOnho4
         tNYJwb8nOaLUUB13fezz3FhWkC9o6rV+b/3cA0c7Z4nWFHd5/d3rdVOh6YrLwgQjlj3i
         bwE1mAFeqoSMN58en3dDkz+7e+cIvUtVfo77uOj48fd6gMNR/TcaArJwd4+MOts9yItX
         HN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709746931; x=1710351731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cP96RrcztrNAzMbEhfXoCNnB/B/rAwamum1tutFUVu8=;
        b=S0r79pNmFF2/k+3Brr/aVHLqU2blaVcy+hUpMAIvw9aBYf6VSZZKqGbJ4S0CK1VZhU
         aZeZg8vexIjptX/aH4KvrKpKBSz3X1UvrH4HV5+ccrRbtpY/O9i+DgekuO25nN/1d3Ah
         s/6bWZz/ixGC9BqtqvI4a4+5VD3nwk2JcuZDGiJ7Vuh3zehdluDxqn+GW7bLI9yDupt7
         MEluCv1uBAXDmZNlpA2NrPrOm7y9fnO0EcuCmnb9ICRcs0c1/sLQprKSuPfSTdnLFF1w
         dAQYfJceGdBAFYMD+g46nLUNgzMLAqgWspecvfFHETBGmhVZqSPdPUef+k+PbbYXvSQR
         wL2A==
X-Forwarded-Encrypted: i=1; AJvYcCVeOmtNUmHHN6OFQfkLx7m2e6+8AoDHcQZOQiRgNtWtL9c49DoGz5cof0kOl0iJuYNqpxoMu7cIsOswsxYRYJTo/Zkg
X-Gm-Message-State: AOJu0YzEXIPbdy4IdpVQTIsgGETymnEA101hIDVzJVlA9cOe/6C5VOO7
	wg+cVaDzJFxU1TRaANjVZGebHLFy6ual2odoReJRxTGAPEUi+0ml
X-Google-Smtp-Source: AGHT+IEdVVnjOkVxsshHgJLZVHna+BAO8gJvdt0HEpxKUw8ATSAgs42Yfrkygg+W6m2PVqJ1V92CMQ==
X-Received: by 2002:ad4:4990:0:b0:690:7e04:7874 with SMTP id u16-20020ad44990000000b006907e047874mr5613328qvx.2.1709746930844;
        Wed, 06 Mar 2024 09:42:10 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id kr9-20020a0562142b8900b0068fcd643b9dsm7654626qvb.22.2024.03.06.09.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 09:42:09 -0800 (PST)
Message-ID: <fc8a079f-10f1-4b2e-abc1-0a043eb1876e@gmail.com>
Date: Wed, 6 Mar 2024 09:42:02 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: dwmac-imx: add nxp,phy-wol
Content-Language: en-US
To: Catalin Popescu <catalin.popescu@leica-geosystems.com>,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
 linux-imx@nxp.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 bsp-development.geo@leica-geosystems.com, m.felsch@pengutronix.de
References: <20240306172409.878928-1-catalin.popescu@leica-geosystems.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240306172409.878928-1-catalin.popescu@leica-geosystems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/6/24 09:24, Catalin Popescu wrote:
> Add support for PHY WOL capability to dwmac-imx MAC driver.
> 
> Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
> ---
>   Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
> index 4c01cae7c93a..6cf373772eb1 100644
> --- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
> +++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
> @@ -71,6 +71,12 @@ properties:
>       description:
>         To select RMII reference clock from external.
>   
> +  nxp,phy-wol:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      If present, indicates that PHY supports WOL(Wake-On-LAN), and PHY WOL will be enabled.
> +      Otherwise, MAC WOL is preferred.

This is encoding a policy in Device Tree, which is not acceptable, see 
my comment about your second patch.

pw-bot: cr
-- 
Florian

