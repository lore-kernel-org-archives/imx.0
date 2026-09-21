Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB53491582
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988821; cv=none; b=W7l5HEJkYSYqpxcBaP3bPhaACwESkX2gdIUevWrohotISgl9rI49pw/mLAl2KzBzi5FxlKT9Fzlioh2YlU32wpV5Ql4WkkPC3ITcfc4MM5dKgkWTJr4T9kbK5Hd7kjX0WCo64fkS8XyOqco5MvIgBlzyb1nriv8ggSdHKfd601E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988821; c=relaxed/simple;
	bh=UUOINDD93jJS+LUcebWPI3js4hVCQibaR3IC0U7k49c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G06fqySCQymC0tDuFx1wuH1TFIXgaS0URYwvw9Fvb2vyYYV85him9/85PEvkc/Vr0jmlsLyvyVsBqBHmpQc0Ad8gmmpiMBGdErkNNq9iLGxWCRMzrN+0WQvggETi4nxMPv1AJuqJXj0Tw2Qt5nEDnXIlTg7IA+kY0RTHVqWM2zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EM4VAF1s; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EM4VAF1s"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so25282365ad.0
        for <imx@lists.linux.dev>; Mon, 21 Sep 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789988815; x=1790593615; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycnprV0l+QiM05HZAYzXXqeG9wnBaUsBNe37TTIlwsM=;
        b=EM4VAF1skfHaqpw7gjenE0gKSECkKjG+R1EGpGpanuh74iRekWGwnRkz58h5XZzv34
         AQqMr6mky8+mfBBuzzWVYhkPFaRFrg+fedOEOLduxgm6E56FJ6wnZaT5HJmMvjMs7oMP
         Vdx95Ebze8oeZHDuajBtwfGRoNTlofnesJoCOAsnXe5xoztEuMLP1LMmNyWqSP2ualCH
         +O7zVogSWZXnyC1J8HezwzDZ/jFOoAxUEjRm5XFOJthIuhT84gwp7g7xqt+VmCvK6pVi
         XBUZrCwAUf+UdaWP7vfCEFpeyH1AB8mB7qoJbVA+Id6PLLjwpsQ8pEcglNDZKRpxsi37
         7k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988815; x=1790593615;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycnprV0l+QiM05HZAYzXXqeG9wnBaUsBNe37TTIlwsM=;
        b=jfq3nAodibhcddB8xcgA6P2K3eSOAGi4Aud2xn/2IzDG7ImcoGpG8l/klGeX7PFto1
         O/uZPdJusQYeAbja7D9U3cC/EOBCqKQfbW5v41Kmg/h/yc1sDEcHROcM0OvHH0OWhChC
         eiu08v1NhwM3UV27Hlt1ra3qSgDFtrXgyn3MXzjOqX01m+rKdnwBdyDaT89Tdwx8A51h
         Hoo68tN5yceLbQVCI1+yS2ig2X5IGfN2MDcnV/5QRgBv3forIIYvjC8CwtSRdmnPeEJi
         PlIt4YoibdDVUL26lZVYbqb89B5jM9I/Wcjyyl3RPqtVkNIcYH3mFp2EQ65VfyZbd1MY
         VZGA==
X-Forwarded-Encrypted: i=1; AKwUvBwAmL/P6FJ36C+1UBmtmNPSijEYd5owx8d/N92IAHSib3il58ZHp3Di9cz7U0pTF2Mc8OM=@lists.linux.dev
X-Gm-Message-State: AFuF++l1jA0MH1D2pfxDgnsPcx2XpgOKOCBvptMQwJGxwJuX+6SeK+Ti
	bhXw9oFnosy/hTkY6sZyWXgV7ydmtD4+zXAPmgFfiBbKrx3uS7mFmT6g
X-Gm-Gg: AYBFou3x0eRu0/hWYZGa9wfOIUk4wCaYQBqehkIHfnZWxwSbSbG0Nz/svZCjL6/BocW
	9pL2Er0SPlZ3qBdjl2tBJhoOufRQr6SBMldGwbsRVtw1GjyDQCFNC55WIwN3tKZ/UfnpNiaH6jd
	rjGahMYtQjf4hUO5NvM7fAk6Frl1s51DmXBXu3xKKF7PCxX+3YOrs+ICGhiXvQgtw2lGpQrPlbN
	EuuYTovzt1L9qzjyOMwcv6Teb4C8093n4wWlDAr67t1cTeBiRSHWUi5Cim8qSZ7N2VdqffVqXu/
	eE5XO5Mt0c9h4WWfKkoqT4qBbRRzlcT/X/drXXrmpztGow3AZKwJ3tXdB8IHqfMbKUh44B8bVrv
	MOh7KpHr0ZG+/0EauVFrKE+SS2G5feRxNgAik7ZSr7b1EHym+dYsfFabLqj2zhvxnQ68/xRe7g0
	VpEVnrXFS7NS0D89SRZ2/gpT3+1WduSoW1ANEQu5v4lEhT+zu72gwLqJVxEaDyIpL/1Yv0LNwAJ
	DAk3uNy/gz0YtNbNTJq0oEvuUc0AoORS6/4VJ7hHAUvoPiM/8jYcA6kao4Zrg==
X-Received: by 2002:a17:903:2447:b0:2d9:43f5:b462 with SMTP id d9443c01a7336-2ddb1b79df8mr144230985ad.5.1789988815140;
        Mon, 21 Sep 2026 04:06:55 -0700 (PDT)
Received: from [192.168.151.214] (222-228-113-186.aichi.fdn.vectant.ne.jp. [222.228.113.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba719sm31428165ad.56.2026.09.21.04.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:06:54 -0700 (PDT)
Message-ID: <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
Date: Mon, 21 Sep 2026 20:06:47 +0900
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yoshifumi SHU <envzhu@gmail.com>
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: arnd@kernel.org
Cc: Frank.Li@nxp.com, aaro.koskinen@iki.fi, alexander.sverdlin@siemens.com,
 alexandre.belloni@bootlin.com, alexandre.torgue@foss.st.com,
 andreas@kemnade.info, andrew@lunn.ch, arnd@arndb.de,
 claudiu.beznea@tuxon.dev, conor+dt@kernel.org, david@kernel.org,
 devicetree@vger.kernel.org, enelsonmoore@gmail.com, festevam@gmail.com,
 geert@linux-m68k.org, gregory.clement@bootlin.com, imx@lists.linux.dev,
 kernel@pengutronix.de, khilman@baylibre.com, kmehltretter@gmail.com,
 kristoffer.ericson@gmail.com, krzk@kernel.org, linusw@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 liviu.dudau@arm.com, lpieralisi@kernel.org, mcoquelin.stm32@gmail.com,
 nicolas.ferre@microchip.com, npitre@baylibre.com, robert.jarzmik@free.fr,
 robh@kernel.org, rogerq@kernel.org, s.hauer@pengutronix.de,
 sebastian.hesselbarth@gmail.com, shawnguo@kernel.org, soc@lists.linux.dev,
 stefan@agner.ch, sudeep.holla@kernel.org, tony@atomide.com, vz@mleia.com,
 thehajime@gmail.com
References: <20260914140821.1805449-1-arnd@kernel.org>
Content-Language: en-US
In-Reply-To: <20260914140821.1805449-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd and all,

I would like to request that the core Arm Cortex-M support be retained, specifically for v8-M.

I'm heavily using Arm Cortex-M / NOMMU Linux for academic research.
In particular, I frequently run Linux on newer Arm v8-M (Cortex-M33/M55/M85) processors.
However, dropping CONFIG_CPU_V7M also removes support for these newer CPUs.
Because v8-M is highly compatible with the older v7-M (Cortex-M3/M4/M7), the v8-M support is tightly coupled with CONFIG_CPU_V7M, despite the name. 
The major differences are essentially CPU IDs and PMSAv8 MPU support.
So I need the majority of CONFIG_CPU_V7M to support Arm v8-M. 

Regarding platform support, I don't need Linux-side device drivers.
In my current setup, Linux runs in a virtualized environment hosted by an RTOS (like Zephyr) and accesses devices through virtio served by the RTOS.
I also understand that maintaining legacy MCU platform support is a significant burden.
Therefore, I don't object to removing the platform support, though the MPS platform remains convenient for bare-metal testing.

I am willing to help maintain this support, including modernizing the relevant code. I can regularly test kernels on real Armv8-M hardware.
If an active maintainer is required to keep the support, I am willing to take on that responsibility.
Please let me know how I can help keep the support.

Thanks,
Yoshifumi
