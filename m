Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED742F8C3E
	for <imx@lists.linux.dev>; Thu, 17 Jul 2025 16:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752768423; cv=none; b=mVvRXALaaGBuTjvZdVV+e30s1K0ITDRm9sLuLAz/uLYV01JkX7KpeUH9W36uQKYBVOoXsBjtNz9rvhapaoleD6ibdxtW8NzvCPU6Ci2Ty1oy9avmI9SUuyrqloAvWLWOuYpHFOO4ufKd9a/wss6F/XKK6RENu/X4lmfAhsOtOgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752768423; c=relaxed/simple;
	bh=h6SUv5F3sSkMt4hliGGw5MzCkPQbyFnhTA9Kl2lmveo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYBDd0ID/ygHaxUzIQ5Vusm8BnJTC9Sh7ksda2FV5lRkrNFvDS+Lsv9uMji2uo8uNBVUOKSoUosmpybmK7PyMLAMebNmOcfDuTALLgLC8S1AtKiQyu3RV3x/sbkVN8bbGuQhfUtsSyr1Uxe/+Y6PQtgpRmfneZ/iU56+DJaYXxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dFxFQMvx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dFxFQMvx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so8505015e9.1
        for <imx@lists.linux.dev>; Thu, 17 Jul 2025 09:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752768418; x=1753373218; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/BNV8Br8ggkW3UcK3Zf2ulHXs0ZJobMuBMxa/aid09Y=;
        b=dFxFQMvxowSU6uWYZDvVu39OWkqQ2Fhl5FFetObOt1WQ2k5IJ+thaXGnwbvDxwvSAf
         pRHbaaRFPuMsyVMnUpaqpCgns34n3ODTKMPRut//YFUlouJx4+MVoIEzUAtV/DdtMIr1
         jzXe5iOhW7d/THIwm3oJuBKoAmKUYnxRxM752FJHZc8nUj6ePotS0KoiUbWHsrh/ejfP
         DjRFahAuwaMdp0Re6zJciUNO2Kl+C3xa4DfoBaiRhq9eOvYhz2VA7F9ifTvJNhQWKTVa
         eaqVb8cz1wUUZpILky8dS9Rf8STTu87EajXXkjL8BgH9O86IsRm4yERoe8zcKJAYS+PF
         iSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752768418; x=1753373218;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BNV8Br8ggkW3UcK3Zf2ulHXs0ZJobMuBMxa/aid09Y=;
        b=QWSEL7HT/ugJWFsD4fa7wo7HY6hyECWEZcA5QApZYWsNcqOJir6gEnZcbRMhstJrU8
         KWVf6wGLGIYsyKvc3FAI/I10Rx6fJ+vgrYZnjx9wqkfUg482F7vVPWLVWwyFLrjj/3Dx
         qAj5NtgwxK4qT3yJlWHBj9JZZe5CcHgZksP9hfIMFNGGonpY6DwF8T2SGEtNBnQwRpG3
         jk2FSnSqM0nJeXAWv4gD73+pTsi0ZoOdgn1J64nAd5HmIIll235ULD3nuECn6uON+ovD
         dcg8X5mA5n2tVzruNUAXvEB5HIJAE6eq/1C340zJTgQJsea5WEzGkw715fNXx0lF0rZi
         gEJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU162TNpHVUXELCdKXg78gGLfJLdwZz8kAqkn22yRwBBDZI0g68AgexHjUggLXEslF+eBg=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg/6ZdzgkwCw81cy2IG4ykIcmkrYKEbF7taoy4MQ/L5Ix7cNUj
	YDYOEDdZLnLTjRXeHxdrmP+VNiT3qMylvVmXu40I6ZrS4hBoWIR9FtxoCrT2LCphFzo=
X-Gm-Gg: ASbGncs7TgmMzvoKJlh6RO2EjXC2OuNueNfMhK8d6FdSo1z898qBs+puOyYryGzuSYB
	4Mudmm8hoQhknNi8/JWEVsEvCBc1ELUSJlT4OHmeXZqbeP3PIF/ewEzOTOFLYIVshQlQExta07z
	MlXTyjJntO9CDb0ip5ygAi/SmxdVnsfPc5AKi4grcu6SeQDfmJ1UIfcKaEfiLPpzfjdq1ZSvI5+
	Uz9pkSOmOVVZ8O6UZ8UVavhlRyvjWn7YgQ1dLiUoIUu59mOPDWL62+DVh+VHG8MWC0WOlJ+NHxn
	s71KkRxaGHW/mnTuosMwfgE3+asXsbQ12Z10UxbBxXtXvofIrxvoJlS3eV/ai3QbjKmyJGTe99z
	8i2NnsIoVSI4HOIPhJDPSEc0=
X-Google-Smtp-Source: AGHT+IFd2pFskydzsXLxySJ86ae4Z4yBIdNrJZXhbrxV4zrWoKjgQmJQTRCDmqhUCimFVeIudsKmoA==
X-Received: by 2002:a5d:5f4e:0:b0:3a5:2653:7322 with SMTP id ffacd0b85a97d-3b60dd643bbmr6867126f8f.3.1752768418467;
        Thu, 17 Jul 2025 09:06:58 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1e2fasm20802147f8f.77.2025.07.17.09.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 09:06:58 -0700 (PDT)
Message-ID: <c5d60a2a-7b3e-4adb-bd75-bd7c3437bfa7@suse.com>
Date: Thu, 17 Jul 2025 18:06:56 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: s32g2: Re-order usbmisc device tree
 section
To: Dan Carpenter <dan.carpenter@linaro.org>, Xu Yang <xu.yang_2@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1752703107.git.dan.carpenter@linaro.org>
 <14d3cfde-57bd-452e-afa6-8a468281e5e7@sabinyo.mountain>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <14d3cfde-57bd-452e-afa6-8a468281e5e7@sabinyo.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/07/2025 00:46, Dan Carpenter wrote:
> The compatible line is supposed to be first.
> 
> Reported-by: Xu Yang <xu.yang_2@nxp.com>
> Closes: https://lore.kernel.org/all/u7glt7mn33lbdeskbr4ily6tjjifvffy64llwpi5b2rrhx5tnv@y2h2y3oz3xc4/
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/freescale/s32g2.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index 089f54415571..6f700085dec2 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -424,8 +424,8 @@ spi2: spi@401dc000 {
>   		};
>   
>   		usbmisc: usbmisc@44064200 {
> -			#index-cells = <1>;
>   			compatible = "nxp,s32g2-usbmisc";
> +			#index-cells = <1>;
>   			reg = <0x44064200 0x200>;
>   		};
>   

