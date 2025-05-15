Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF052882AD
	for <imx@lists.linux.dev>; Thu, 15 May 2025 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299262; cv=none; b=uYZCc0JQnv3bmSl1XSY2vtiZFp+pV54T0B/B0GVtD5huIb2zmVaEoGV8MOJ+5NQNavaRbIMrtYykw+iP3Q/ba2tM0hYDE72yy/wjMz15mlMf6qYFndwUyYX6AiaAVLdWqmoTisDxVFQXw+OTjAiAHd8Cawp2gg6aXd31GsMSYc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299262; c=relaxed/simple;
	bh=E1z5He3Wwd9ce7anNAAfQb1t4GFYDRY9FnjlwNIzh1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DCq+uOW5ysOAH92AUy3MiuZyHdo8Awy3S2S5HI6wpYydBJaLBE+PuRcnUPUtMjzIiNOB0CY2X8bC9XIj+/sGqRU9bdqRPEN+M1aFT+/F6X0cDY/X1rtguBfHKWJbj7kIbdEaQ99l09JMIfg+vg05Dqr0OArmYN7IQ2y5FBfmJ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dm0kFkFw; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dm0kFkFw"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30f30200b51so6577391fa.3
        for <imx@lists.linux.dev>; Thu, 15 May 2025 01:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747299259; x=1747904059; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7JvnrWNRYAOhJGuJiHPvQ8RmC0zHeKbDlxT+TMUjbE=;
        b=Dm0kFkFwnasi35UBbFaBUwmsd2VFJGP7BqV5QpnpcdJkweoGJgX/IZoHtbvUN/IAg0
         uCvWiUlE4ecmH7UtcWLDnB2Ww+/YeetikQkXoyF/WPY995jecQZfcQd9UglqAxhh56eI
         OtQvydle6Pans67TdRrQYbLuTh1jzHUlUuxsG45mEG7wHCCRqOoN/ri5zBlanzIdxpm0
         3e/zjE4jI53EZ0HKs+9LjQriiUqwPYAeCyndOpk1gMbh5cnM4zTV1rNHgYRX7WY9NzAX
         1GgpxoBYVReA97CFFkZsa3jatL8C82TFUll+rHaXL8SvgwvyvKu2UOjEARYVcVCdArVB
         33Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299259; x=1747904059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a7JvnrWNRYAOhJGuJiHPvQ8RmC0zHeKbDlxT+TMUjbE=;
        b=bE7zl5zQC9rKmeYBeq38HLC1S5JdZ4pOwhesdv0165Ij8+5aJH5TsdKv0LKa58rtBg
         tJ4vjGoD7d3jNhMRojCpNs5bWuFMqAC+F/4tEhjUQuWc3gua5rK24D/MF4zzwlCuhM/X
         TH1A/WIdp2JOeP11gnmvnW7zt4rKzIInde40o3yPM/VZ8WH8eIZ8STsrGA1lP4ONh/6O
         yvjnHt92dJd485dxjeXovXf4SBC6gvxRibu07q6oavPBfnxbxe1JfykOhnAogaSKl1m1
         hYOAk/7BT15YPVEkkUJZeJCU6DGomYAxBWIMkF0cQFmbhfWru1we14psvPdtgcM/JvZq
         xHVA==
X-Forwarded-Encrypted: i=1; AJvYcCXDtoygI/eOHGUipUovQ1Jl0VqZrT/7wlROES3EulVvBeBKzRSQkgK/249f8B5s8i3lQhw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyA7rc1MbC+8IQzlEqZe4EOhSD46uI4p5eoHGW++pPYwZ0HMMI9
	mYkUhnRzv8FyDqnQn13me871fLogjEEPZVtoGFFhdUwWbtg8kKv7LbF2fg==
X-Gm-Gg: ASbGnct5EnD/Qa8oyRY20upCKVOCm0CahWsAKt92PBXA4wGIoKORO8jpnE/WQ+eesgD
	0jfaMy/Hrz5iOSDOIzjeofdYEKy9Qe8/z5KJpLbatbFIKFGVGiHK98ftcwerw940QKRMTqYtKJO
	WPHNPRSs9fW3DIEch58RwyIr9R6ZgzmkR6fc03UZ7FDclaOYuJvNU5jalYU5mS3gg5rMHI19qhD
	pBZ9iiCCmKDfhIpCb1AONeGHzo53R/qBq6eyhn0HmwGRXZvErRQWVoySyLLt8Rt8AjnnCW6CpP8
	byiKz7gSb/bWz2CxJ5bQUGX4555Tev4R6MTEhii3Ciwgh67Xg5Kro7C/SdFP5v9AZ0Itok7USfu
	FUOJs8e2JHRPJmS8Dy3YQNsp2As/NeOWX
X-Google-Smtp-Source: AGHT+IHtcdpnhUlg72zfo7hWrvx0FJm1YaMSsnRsy3WAnb5OW4dErT+GY1iWZYdh7iEQuUQYLBOqVg==
X-Received: by 2002:a2e:9fcb:0:b0:30b:ad2c:dfe4 with SMTP id 38308e7fff4ca-327ed1dedb9mr32145521fa.30.1747299258821;
        Thu, 15 May 2025 01:54:18 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33b7fe3sm22411401fa.24.2025.05.15.01.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 01:54:18 -0700 (PDT)
Message-ID: <db3f6178-646b-4f42-983e-9004d61dabc2@gmail.com>
Date: Thu, 15 May 2025 11:54:17 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] arm64: dts: imx8mn-bsh-smm-s2-common: Leave regulator
 under hw state machine
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
 Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Wolfgang Birkner <wolfgang.birkner@bshg.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
 <20250514082507.1983849-3-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250514082507.1983849-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 11:24, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> Let regulator to be controlled by hardware state machine.

Is it possible to add a note _why_ these regulators must be controlled 
by the state machine and not by the software?

> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> index 5a1ec2f6a552..0d343ffdb7f9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> @@ -144,6 +144,7 @@ buck4_reg: BUCK4 {
>   				regulator-max-microvolt = <3300000>;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				rohm,no-regulator-enable-control;
>   			};
>   
>   			buck5_reg: BUCK5 {
> @@ -153,6 +154,7 @@ buck5_reg: BUCK5 {
>   				regulator-max-microvolt = <1995000>;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				rohm,no-regulator-enable-control;
>   			};
>   
>   			buck6_reg: BUCK6 {
> @@ -162,6 +164,7 @@ buck6_reg: BUCK6 {
>   				regulator-max-microvolt = <1400000>;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				rohm,no-regulator-enable-control;
>   			};
>   
>   			ldo1_reg: LDO1 {

Yours,
	-- Matti

