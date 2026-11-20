Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171334;
	b=ZR3tghKXCJQQh0dFXGKKluo/8C008RTFl2rXXyI+fgWMoMeogdYSZk8RROuNdeCfRPzX
	 tj0XVmW91KjMhhKd5yYoP6b3xsvtvQR52pwRA+A3pNjDDs6zRTLn/Ja+JlsZI2Le2VcmZ
	 +/m1eTOZOZvVqgTqLGnMDAJi+lvq2NYX2kPrC3Yz5NdPztORHaMzqI38yDX8Pm05a7SQW
	 8zXk2uvA4+iv3mUaaM6E6edqVl6PyXYInDF8lUfBWdqbsJZdwf4YeS+IAFt1z6QDlwnVS
	 ZkfcEvtWEHYQAXng5oUIHBDaW2QtCQH4zCw2HLiKXgEFHL+5mMBkaaJOY4aQ9FRoItQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=m9qCn8tiC9eOR+AeR03URThDVh6TlV82DdOIxf2Zrx4=;
	b=B4aUC9cZONiv3QZpYcVQGbvDnCHgXxSaT4NeDdl9r3HRKrEHWibyKi98OtuVTdl1B8BB
	 4k8A3wzyg8gq92OxbPaJzaWaMwpeLmvzotYcTYKcPKc+DNh3DZzgkchmtkma2LFZ65Utj
	 jy0GqAU6LURSccENIk+hBiddXHh4RZNDmoVs3cNDJyZVmFS1rexa7FCiA2MXTLo8PbYpl
	 NKPMMuTSZOZ+jDXDYvgjpPxcwnzQUjijAmIKvnATYAmBfEaIfy+XlOyaTHqNmac3WX171
	 hFNagOSElICyPyX5iOFXZGaRy1A9G6RP4H9/Bru5hLOIyjJzm/UyfVZK4aHlGDeChkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c539EpIa;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A958606A32C
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 10:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A958606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c539EpIa
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so443245a91.3
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 02:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171333; x=1795776133; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m9qCn8tiC9eOR+AeR03URThDVh6TlV82DdOIxf2Zrx4=;
        b=c539EpIaRfm3SLdO0KjzOFPQgaZNVk17MAYllfYh8elzn0uYU2me85GNBT3NnaFZAQ
         T5Qt62RF3UVdU67uEg8ByJhaQjsdDwK33Pt8850sWz+oY43kosMyHkIpsJZZH4qhbfWF
         3QTRY+t1CZ/3ey/VE+xH5laj7NhI633LudvfDZ5imi2/n5mp8UuJtC8wPCLOZsvmAa50
         YwR6ZnnLCwkWFEsJ4EADfBowX/Rn7csM8WxjBd45Rk+gBRFUWDwILgi8uXPI0ClQ82WS
         L73Xi2NkOpSP3F+yKEw8StCH02P9E8NuP7SaidCf+wg0HMMX6GUtXPVkhgry4cOk28ZW
         7uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171333; x=1795776133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m9qCn8tiC9eOR+AeR03URThDVh6TlV82DdOIxf2Zrx4=;
        b=s9835N/316xl2RoOi6Hpd2oiNwGinkYiJjg1Z5EjP4NrjNtU3PoX8urHsbzzJF/1jd
         ZJWAx7AyR80Eh0jt5LeNZ8I1Gv+QcLAh2oMdjmJ3GwWXrzJ9uAki00uvlHXL7Q5Tkm4G
         e2fx6WD+9YMaWcRIhiMKZwhDfSbVu93fnZUzXZxMcc47Wx9HazBndnfDItxianKigs3D
         WnAemQ4hQYJuhfpJqWjcjriUfbIs/xfcakZUeZfMArM+aGUNQ6lPY+PgqJtL9r6Lp48t
         4+gF4amwkkEWoHqI85obxUzfS8GHRXz59BJRCjb98RU6Q2sHU/i9crUrF8CUaUVEFLLe
         5cRQ==
X-Forwarded-Encrypted: i=1; AL+hErHPo3Yfpmhq/2sJ3t1CtxWy9kxC5qdbbDrCOGk0TYBVsGIqj8n/K5Z40J8NreZqDIwU2Dk=@lists.linux.dev
X-Gm-Message-State: APuU4Z9u+93xFQMHoGwPeYiRFkg6XCLC1Vakh58AIZJ5cBe0RsWuESkZ
	qKWOpvnzlhXLKo+TwVO+FFtSadGENwNARgvzJP1suTarBdFIHl36ctGt
X-Gm-Gg: AZFdTZcaVCCXvV3oYQI/AXYQpBbjFRZnnMUlaW4Vm5tx8PK6TKSTmEkDgCkXDCBrkRx
	oWY/sd0woUXphR3tHULlOI0D5eliQHUXEW/U7dlDHa0PpcWRRBXf8+EF7Avfpiikk+4X7hIP7M6
	eWgHWGyg75b4L5Xsh7ruD3TrDYeQ84GtOre+owAj0Obfizhlypdd+Brr6afBpW0AE4EAOyakNUT
	FJjhbd7JV/yoyDPkOPy+/8JRglKfHkByr/jaI0ZrtRHMJ/TUACKHzMbjfRvvwuoy2DamCJuHGIw
	ShD14dl5Tev8dRb8fE+tGFrkydk4wBuvEe1RYVi3Q0obfRkz9iiFZSaWQgQHCVdtwU/iRDcuUXc
	I7aFRqu6vY4P/7SKWxzjCg0pfC0dJgIA2ZrztIl0Q8S0jaOIhj8R9ZbnL5DWVHbkF0ANGPi8lSv
	ERYrPxP2cihbjmssdeJgS+MGPa3mQlfxDbot4s+R819XGDuLu31PBXU7Q7iQvb/xXYbKBndx0uz
	Jq9lSWMw4kbT88GezLrbzGVP62fX/VlRo6RQwFGWIWSy9r+X6xL+hOmrwAWLLAhLbaiT3ql/dCq
	8sEqSdj8WDTCqHPIzgBzkMsiWuUnVK4Sc1jyf6AxtzzeDa8vUGbnI1fvuv1ScSZnWxGEBBw=
X-Received: by 2002:a17:90b:248e:b0:3b3:a9d8:ed2b with SMTP id 98e67ed59e1d1-3b41c8fe24bmr1594114a91.14.1795171333416;
        Fri, 20 Nov 2026 02:42:13 -0800 (PST)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm4115150a91.5.2026.11.20.02.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:42:12 -0800 (PST)
Message-ID: <fa77b633-2c99-46fc-ab36-03f6b5653262@gmail.com>
Date: Fri, 20 Nov 2026 18:42:06 +0800
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: imx93-9x9-qsb: Add DMIC codec to replace
 dummy codec for micfil
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 daniel.baluta@nxp.com, chancel.liu@nxp.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
 <20261120031853.1175454-4-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261120031853.1175454-4-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/2026 11:18 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The "fsl,imx-audio-card" machine driver uses a dummy codec by default
> which does not allow configuring the channel number according to the
> board design. Replace it with a proper "dmic-codec" node configured
> for 4 channels to match the DMIC hardware layout on the i.MX93 9x9
> QSB board.
> 
> Fixes: 31b2f4e4c4f7 ("arm64: dts: imx93-9x9-qsb: Add PDM microphone sound card support")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu
