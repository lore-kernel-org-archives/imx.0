Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFCE283CBA
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 12:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744287832; cv=none; b=s4OjQRrVf4YEtWWW+3YKdu2pKwPtVg6vXawnyYfB5eI82939ZOwvLmZc4fZdLUTn17KiMrpIt1pgqajEYNzEkjff6NDpi7KcbbsFs7zxje2uOVwnq5iPpdcYVe1E/kjs4tK8Nlx6L6r1wtgXf1rRSLwtJbKNn58EW0N8QC6fjTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744287832; c=relaxed/simple;
	bh=WQ/Zg5pbALkIDSUKET7wO/sepfxFHacC6w9xaLnf7Wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRqR3w9WhP0qqEOPtXWQWRYxovdIUZ6wX01Y3yx6VvBOEiWoUaadw92RrPBIbFEWHbBv4/+MtXomDaY8dIUMX4WsRUyVNskdh1arUKcLQAcWD0MCdYxOntqr82Vbb9+PiJDT1RHmnmGUqUSLcysvveLiGW56g8+V6O8jJV54ygo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vstscdrh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vstscdrh"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edb40f357so6659465e9.0
        for <imx@lists.linux.dev>; Thu, 10 Apr 2025 05:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744287829; x=1744892629; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PpGCun6OnLyj/iO45IrhWhjo8NHmRNo/yGae+dtnKsQ=;
        b=VstscdrhSO24Ha5hATITTnSJ6yraOU1u/Nwb9WA3bFKr5KKt7wg7714Q8o5gRC6crK
         pu1v2sRxUX+AmU2EtqmnMxEkoIAk1y6mmuukAdrpk4u81qnyeb2YUsiSNd2NhRmZRVfK
         V7VqXKOeFb5lnLHtsQ+K6LjVO0IYCoTFHXUQtRUp3UEPN8+zKgSIzbCm2qQLGYVpHWja
         CPXgpITNNNPiTplqxmPhoYpsXpBubjL76B71sLrbQWT+nhA1BKH6xxCMPTWH9b3Ry8Ag
         lcBeYB1e+RQrwqL7+srS5f3EgV0B3lietHY3y+FL6O1mtRPWtWer7Tbi65xe6cDiikqO
         gONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744287829; x=1744892629;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PpGCun6OnLyj/iO45IrhWhjo8NHmRNo/yGae+dtnKsQ=;
        b=BZ61G57b0oJJVCtSqI+Rd9K6KMm0U/IZUiNeRK2v0V+DmHK/TsuHwtNe1tFaT9duKS
         1pM7wcCbp8UDSHO/Or6sf0Pwk16KtYaEdHDa+GLM8ujG8rfonhsdD993bLTg/84l6W7M
         SSi6+leME1J53KXCP2Tg8/aIImMQY8KW1IEp2tUTuONsSyfO51z9G2EYdI1i1GEEq2i2
         CP3X39Kia8dFOHHQShFqRqAozgbOs8SlWQ0Xi7s/n+M3AoOLm8ICnrhR2WPMI1Ktd3lx
         tXYWzbslSaoN3p/q45g1nwE5W4xEv+cStS9h9LLpzlpwa6MOzLbYPLPms1/u4pXZSdWg
         THFw==
X-Forwarded-Encrypted: i=1; AJvYcCUTw6An0G47YxL/cy7xaB0zLoEbHfNUPWZgMoZfAVqsKV6Rie5V4vouHQ5O+mEEfMv8/DM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3aNdolIPnludHf0cAWalwtNxXnjHxB1Sc/uNB55YxY8aM5lCL
	s/5xLFjFRUemtgL1CFqBz0sLn1bXslacW9Wujl24sTt4KtFWKfPa
X-Gm-Gg: ASbGncsmxBbb0Ln+j0tC0yQ+MftRiEaOrFmcSycTXBfv22jAlcH6zUO3wuCR+bQs4y9
	924V+SIS9fSzbPUeGfqPqbV1Ih+PxV2xEqQm+28ZWjUmPZT6RGnDWuBeGscZBS6QJsyBuzFIIIK
	BN8oGzvfhUj6f5Wf8k2o8cI3TdAF5wq85b90PE1O3qQqOp8DntxqipvbBvj+oMC0JbqYwuJTXpy
	xI9Ir5I3xzQlIoEW4DTcaeBhftWAlxK/4vyDz2+t87HRSdRAJSTNh0hm7qPcF8laS6QGqWx1SuZ
	9Ia2qTrymFQTOtT93w/w9km+kYqlLNI6zZY20MGGkyTDxgsThdsh+/X6arGsEqZTnwQ8/w==
X-Google-Smtp-Source: AGHT+IHJYqLm2bNlTIV0OaPKSdoxtU3W2Hk6krFGdZj7Augauu5oSQ67P5k0PX48vM11HcU7mHRvqw==
X-Received: by 2002:a05:600c:3c91:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-43f2d7e932emr33093865e9.16.1744287828716;
        Thu, 10 Apr 2025 05:23:48 -0700 (PDT)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206264a1sm54736005e9.9.2025.04.10.05.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:23:48 -0700 (PDT)
Message-ID: <fb40d405-9f76-4117-88f9-423ea5fac3f0@gmail.com>
Date: Thu, 10 Apr 2025 15:23:45 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Configure imx8mp dsp node for rproc usage
Content-Language: en-US
To: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org,
 robh@kernel.org
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, krzk+dt@kernel.org,
 conor+dt@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, frank.li@nxp.com, aisheng.dong@nxp.com,
 daniel.baluta@gmail.com, laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com,
 iuliana.prodan@nxp.com, a.fatoum@pengutronix.de, mathieu.poirier@linaro.org,
 linux-remoteproc@vger.kernel.org
References: <20250320121004.2542314-1-daniel.baluta@nxp.com>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250320121004.2542314-1-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/20/2025 2:09 PM, Daniel Baluta wrote:
> DSP found in i.MX8MP SOC can be used by multiple frameworks in order to
> enable various applications:                                                                                                                                                            
>         - rproc/rpmsg framework, used to load for example Zephyr samples
>         - Sound Open Firmware, used to enable various audio processing
>           pipelines.
>
> Current dsp node was configured with SOF in mind but it doesn't work
> well with imx8mp-evk dts. SOF controls audio IPs from firmware side
> while imx8mp-evk.dts preffers to control audio IPs from Linux side.
>
> So, configure 'dsp' node to be used with rproc scenario and later will
> add a separate dts or an overlay to configure the node for SOF.
>
> This patch series configures and enables dsp node to be used with rproc.
>
> Changes since v6:
> 	- addressed Alexander Stein comments
> 	- enable mu2 separately in patch 5/5
> 	- put "status" always as the last in node definition
>
> Changes since v5:
>        - do not enable mu2 node by default
>        - fix dt_bindings errors
>
> Changes since v4:
> (https://lore.kernel.org/linux-arm-kernel/Z6zGLn3B6SVXhTV1@lizhi-Precision-Tower-5810/T/)·······························································································
>        - after comments received on v4, we implemented the run/stall
>          bits using reset controller API (changes merged ->
> https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250311085812.1296243-1-daniel.baluta@nxp.com/)
>         - drop patches related to DSP run/stall/reset via syscon
>        - picked up patch related to using run_stall via reset
>          controller API.
>
>
> Daniel Baluta (5):
>   arm64: dts: imx8mp: Use resets property
>   arm64: dts: imx8mp: Add mu2 root clock
>   arm64: dts: imx8mp: Configure dsp node for rproc usage
>   arm64: dts: imx8mp: Add DSP clocks
>   arm64: dts: Enable DSP node for remoteproc usage
>
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 14 +++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 22 +++++++++++++-------
>  2 files changed, 29 insertions(+), 7 deletions(-)
>

For the whole series:

Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
