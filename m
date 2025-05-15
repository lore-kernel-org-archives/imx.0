Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE5D292938
	for <imx@lists.linux.dev>; Thu, 15 May 2025 08:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299171; cv=none; b=udQa6+aTODkF6kdJNPC0YnOCwrfrwRveE3qj2ianKD6MEINizmK4XnFn93MK7JfaywVrSBAkBNhOsObIGkAFDM9yYpPMeJMiz4lsGafqOf2uItIzJo+SrTRtO0lRVrzdJ/7pJQ7IfehUq+W4NBAECqwsMWxctUvIPhiL/avX7eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299171; c=relaxed/simple;
	bh=baDU5OetjJx39/uqBkmmFjvG7V0MajD4w+Wf3Mhy0sI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhwWbyhphHfQoxrWxLrvgzdRGpAji0bzGwvO7GBiKkmguDRPUwTL4fUuSV/HKKl8J84SJ7HASzpm4TfC66hISx77zUJkXmir6iA2+VTQoBRnrnKu1Sy92RX2I/YtkGKbyac02XYkMOJRZZB43sY/eXWf/kifJ3Sopby4yM4/veQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IR8wxjqd; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IR8wxjqd"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b0d638e86so776794e87.1
        for <imx@lists.linux.dev>; Thu, 15 May 2025 01:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747299167; x=1747903967; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+nMEUq5ozL3XCKx6Xei2teXG7hWWZhoXqA/EoccK2ek=;
        b=IR8wxjqddxCazqsTcy409Xx36+bzOl7AyuotkQ7Ry2pKclCM+dcwA+AccPqn5LBfmx
         0l2/37393Mt51RATBRLKzNkWydpLcm0PhP/jtbC45tTMC40mHiyqAWrF8woJ7xlGR8wT
         toeqAhP/mSVzZopOd4ST0ksWbQV62u3SB5rZSGa/1LNPmrb7PcbFz4HRl9GYGOLvaEuu
         WPD76zKaVcg3UqqypO9ij9SfHTKnYNBx1XsgNg7rUvGNJakm1ooh8mm3ZColXhNYytfe
         1iGGpCFNbCj9KyKYQ2o7h2N1hkYjwQL/twFmgm6+ZIsR+74bAujTHFZFjlpUVDaXveKe
         KhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299167; x=1747903967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nMEUq5ozL3XCKx6Xei2teXG7hWWZhoXqA/EoccK2ek=;
        b=lZavmVDeozde+wk22/AROv8azC8MP95WqoAYhhJEMs5WQ4dnXDW5+YG3vZtQanyqfu
         83MsPFFpQBBr0SFT82VLc+ikgcsqzqAP2e4/YPO+LWJOuYJ//YjH0oYnjmSHxRM1jLXc
         qF5/Ezhi5jhL7uSd4a2Q1w7W4HxDzLNMMHbtarIEg0KfEfEa2LEx02u0qzTQfcRUarZe
         6jXl2l9to7Bq67TweWKs9ppIKZjBuBZGfhNOLspi6emrhydJCPwPhHRlbRJkOBSxV4OH
         wSYj9UaKfr6xGQIfdDu2tbTZ2xKL2CTVYAgeXE7QV1VIQR4rqngCRZvcNOpqFqYLc25c
         UGiA==
X-Forwarded-Encrypted: i=1; AJvYcCX5HwYV4ByTH9nuvyt6UpJA6HNqiwv+J97VX16cU9e69q2EuFeOiXgN2eAOQqasbZxSMSI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOyH7cVw3RkGXLbu/Iv9AzqjKPrLYi2K9ZgmVQtwv9aomgt45h
	EX/tl7w+A3F0tcWL7XT+sNfURZqrTu1v2VT6bb47vL1LzeWmRPF1/jn1bQ==
X-Gm-Gg: ASbGncvEO/VrKCRaf9d1AtxaWPcbpLQOWyrumS29Uddvg20jBoy0mqbNmPItq7SPnEW
	D4sPvCF38gm9+MfehNKYvHRTevpqeZB/fMc33zxQKLo0T08H6hpMwPJLXXfqQHpvh8/sjwD0wpc
	8HixT1gc3s0N5imK3SIQeij4DgBbaSw9jWSRZk+/YzgwleukT1Olly/cuYN2/VmcajOIU0vsTxD
	XiZnXNFAy/DWP43xchLc8NUJjSsZG7kvN0aXE8vRD0mDJYkOVuxO8csj2yyAXV881Fzrz+48ghT
	GRFVymPSS8fVNbB8wKvFHGB0n3eFoMhI0/5OkY+p+lP8LoSQwtWmmItHlvjiWUR5vzOy05eYCYH
	unMTHHdsNh0Mvb0eKGE+EHlztoFhdQpxG
X-Google-Smtp-Source: AGHT+IFr+Zu/wdjpllwn3ZdGFMnTZxToomXEA+mKUOQn0Jm/AWko6eEHsQCUeWofLoc5bYC55wc4SQ==
X-Received: by 2002:a05:6512:3b9b:b0:549:39d8:51ef with SMTP id 2adb3069b0e04-550dcffc1fbmr627657e87.6.1747299167217;
        Thu, 15 May 2025 01:52:47 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64ccf20sm2530860e87.239.2025.05.15.01.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 01:52:46 -0700 (PDT)
Message-ID: <057c6bc2-adf9-4160-9184-6438cbe6e9d4@gmail.com>
Date: Thu, 15 May 2025 11:52:45 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] arm64: dts: imx8mn-bsh-smm-s2-common: Define suspend
 voltage threshold
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
 <20250514082507.1983849-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250514082507.1983849-2-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 11:24, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> Voltage threshold should be adjust according to the worst case.

I would love to understand why these voltages are set.

Could you please explain a bit further why this change is done. What 
worst case? What happens if voltages aren't adjusted? What is the 
current voltage (before this patch is applied?).

> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   .../boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi  | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> index bbb07c650da9..5a1ec2f6a552 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> @@ -105,6 +105,12 @@ buck1_reg: BUCK1 {
>   				regulator-boot-on;
>   				regulator-always-on;
>   				regulator-ramp-delay = <1250>;
> +
> +				/* enable autosuspend threshold */
> +				rohm,dvs-run-voltage = <850000>;
> +				rohm,dvs-idle-voltage = <850000>;
> +				rohm,dvs-suspend-voltage = <850000>;
> +				rohm,no-regulator-enable-control;

The commit message does not explain why the software control of the 
regulator's enable state is changed? Maybe this should be in the 2/9?

>   			};
>   
>   			buck2_reg: BUCK2 {
> @@ -115,6 +121,11 @@ buck2_reg: BUCK2 {
>   				regulator-boot-on;
>   				regulator-always-on;
>   				regulator-ramp-delay = <1250>;
> +
> +				/* enable autosuspend threshold */
> +				rohm,dvs-run-voltage = <960000>;
> +				rohm,dvs-idle-voltage = <860000>;
> +				rohm,no-regulator-enable-control;

same here?

>   			};
>   
>   			buck3_reg: BUCK3 {

Yours,
	-- Matti
