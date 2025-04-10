Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7488B2857C1
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288577; cv=none; b=uTcmbtI0uIdueAKzzwhivUoRnXGnRQ5qQIxVk3OhI3LgzJCsFKuWZZqATDxTERvmM+bLX5WiVTM6ARZloEV40XvnqBjGM7IXza+FSDeLnQk7olNICZjxv7t4JJb14tuu1eqw6SeuUlCSAEG5hCnmzZuzAyY6k5F1SiEs7oYBkcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288577; c=relaxed/simple;
	bh=H2rAYnbGeFgX5saZ/b7X46QHeJfq5kinlY6BpgEnd3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QsCmEVqz78QG7+mMJkSjXGwJwW4+roJ5IXDfpD7GJivmkjnRqA+yDMim6iK2TFVS4lmvYIPVB7T4hnUHTQnddpUjzZfbEdwWbP0/XR/utSRVzmYtHC02QTguzJYkFwjbw/m+5oJeSJqr61IqfX3Ga9XdNwUAbSrSNjkY2OhJ21c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vo6OASiq; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vo6OASiq"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso836778f8f.0
        for <imx@lists.linux.dev>; Thu, 10 Apr 2025 05:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744288574; x=1744893374; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQ0j7wMSGTmXUuOHtflR052mxHlsC9aOf5SK3WIqsvY=;
        b=vo6OASiqokQVZ6XgKn1EOd3hpAdOiO/X/+6A9SNT8rbrfMiDwv3mna3sgIXHzNd8So
         ApclJAOHXMog3kk1ccFWGMFvMpt0gixhZ7pTAgFXIuGHjsljFC50lnyekeUGRoXJHx+m
         5Gj1pN1SSEU7qtcqyjXPj2lvZ3Zw0u1adj/EYLQTJDZYOf/1Jjp+N0xeM1nQg4ZHpuNC
         IoyDg8+GFMm+S7q2GZtuah5w8S6itoPwsamF4PQ3HpEtGX2TkK1uoTApI8ubzTmpXEgM
         ImR5d7iwQjDiqVxw2P/acqwdIXkWh9CfelCgWLw7N92MDslKtuY8UtKNhUvaxKSGCS+g
         mfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288574; x=1744893374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ0j7wMSGTmXUuOHtflR052mxHlsC9aOf5SK3WIqsvY=;
        b=pE3LeuUeus8Es+NlPYt6bEAe0eXuBfQcw0A3p+zLd53HTUO2NYX6DXx0yJXLOYzqMQ
         A0dflBrkHtX4i/0ZXDcECfs27Zc/37chSyZ80A2w3yg8OHNdAw6qOUM71Vn7jlQOhCCh
         2oosmdG+vn4cb0N4ixJpxypqBM3crE0sZatWom5K7kHVsdMZw96g0o6F2Sl7T8aFdYUg
         GOrGFxXWarjyxzqAga8uiSd0T1yWWh98F3O+dCcogk9Dye93EVQ7xhQP0dsH2JzIJTXl
         VhCEm9HTmGwinYInWbb509oxllac2wnaBiitPE2Bj4NUyBLHCxNGRuy7WsGRT+1wP2wh
         7Q+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSiKU3oDvHxgNmlZGwMcPwGyj7wwSPLSAKERGlS2sUZDx2OpTDUVOsVpLn8ir24rc/NYY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7uuV5NzoXNTSNk0rYIezNCA5Cr2JyRLIcyUEF0LgtUqwRS/nW
	Zp6zkpRtXyJfzYgYkJu0by1xxDJX3VWNESz0ePwOZ0QTJZKfyEtG4YtV4WcW4G4=
X-Gm-Gg: ASbGncs3noW/cugTDQqzKvfN3qldgysQG06Ix/QUbSf+gcM4Hbni7h+N5QampRTj8n8
	ItbDftmlp9Jw3JVUk80LOOXjUcrgwXf25Ov8n+Gc5wenDQidgCy1culyE2goaJIrmu+Id+Y1Jpf
	YWEOEQGxMk6xPZSRs7rEMl5iVwSbE1L4mqkYuCMH/hjJq+ElIpHImAW8FiT+RTp7J20AcAB2VBO
	QjhCWhBv8fpwBsA5EaJ4VZP0YW5NRz6ZgSEyUHdmLAXm0LB4PUEAEHus2quJMICTV4frjAGX4Ue
	QzP+wCf5yBCjdSIq1OKr4emo7MVH7fr3ghH4KieOiLFhKbJxSLGo/6x8+GasMJySYSnJST+EEXT
	lMbDSR8S+R+L+XA==
X-Google-Smtp-Source: AGHT+IFetWy1yp/dwylC0fW3Xc3rkEsOkh6f7DWozfmMsr0xNplY7KcWpRd6urR6Mieq6r6/8yNM9w==
X-Received: by 2002:a05:6000:4285:b0:39a:c80b:8283 with SMTP id ffacd0b85a97d-39d8f498980mr2285415f8f.31.1744288573720;
        Thu, 10 Apr 2025 05:36:13 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fdf8fsm4624182f8f.91.2025.04.10.05.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:36:13 -0700 (PDT)
Message-ID: <17b9ff87-899e-44ca-b902-ab965cff0879@linaro.org>
Date: Thu, 10 Apr 2025 14:36:10 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] arm64: dts: broadcom: bcm2712: Use "l2-cache" for
 L2 cache node names
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
 Conor Dooley <conor@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-2-076be7171a85@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-2-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/4/25 04:59, Rob Herring (Arm) wrote:
> There's no need include the CPU number in the L2 cache node names as
> the names are local to the CPU nodes. The documented node name is
> also just "l2-cache".
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

