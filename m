Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EA04334B0
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 23:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787353883; cv=none; b=HuZ0n7EybxwYE0G7VQWMYdXBVKJism4H6HRG3pXyjbnU9qA9s8czH9fndSOsMRWxIlYUJ6CoOPjliThHbANjJmZbB43PW3HCu+YB6VsFi6NYFXwYxsOkoh17zLiNw/2wLP7Ko1uJYsIZIRnf6EV940GfQkIBDV3733fkflMR/Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787353883; c=relaxed/simple;
	bh=Hfg4eNdHbaBARANiJABKZ+XnrxmaeCJGh7zzb5htsLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jW4x20qWWFBPeT8G6aPDqMFEvOBGZVzMHsBSRGPrQRD9gk8rEzks9PWCUZibu0f2XosvmQyZLgY5KGPTYALQ/SQDH3unlxWzyzZFRyZgZIwWoDXJwooIoZEUo8j52SChPHIA7xvbrWeq6obenBLDetfNV/9eKBhtLBnAhWFYk78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UX6RXZ7W; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UX6RXZ7W"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-499b57cf2f3so9279475e9.0
        for <imx@lists.linux.dev>; Fri, 21 Aug 2026 16:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787353878; x=1787958678; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLSJoNhqitBynpVd16vFcy3Vr4aNPFfC+ZBhksu/Yjg=;
        b=UX6RXZ7WBt5J2iwpkijPWcFAs+tX9bHScACzTKaoxvdDT+TMLdAdKyE5DFK/B9d+3e
         rcbpBQiCTjpwVwswSoXJaMcz/ggblkF0KIpF+Kx9kxsdvo1IA+FWnank6ww8HEbAbrI2
         IC85bdvwyROkuutU/g3pEuTzg74C8VQQKLQ0EDkPJdUkjcOhRgFoMsTYljSl7IrPq5Wx
         Nzh4BsmIWQk8505xvBn7MiMA1ObnOsPU8EBGIPwE01x7f4tOjajQbf1gw3Z/ePi8UUJu
         h4Un4NGD+Pnca4OmA9bjkPGycj3mALEJ+dwjIwjQ5jfHGkNvXNV4dIzEG8L24i4vj08p
         v7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787353878; x=1787958678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hLSJoNhqitBynpVd16vFcy3Vr4aNPFfC+ZBhksu/Yjg=;
        b=AtYTOb25Blmx0HgpTvViHkyILmtaSbI7Kg60A4mTjF+m0SSDc1JHBhRoQoD2KBTaK2
         CQjeO4sMC2cSoUVs3OQectMxWE0w1903jyTykx/XKt6PbP/u63GBCehEXXoLD7S6SqbB
         iVbZLIJTcLhRM0OA/+OX0Obdje7QJXqvb3lKyB1XVfu6DeJr4fXMG2QjWIAkVz5ChZ+F
         qevH7Gn1YqkDUmcuDFvpr7sCm0RSl4mh8U3Y2RVBsvW7ow+1xLoZ77jOTRfql2kJLJbt
         4qO7AHvnsCYF31LEhPinwmpd6yhOlF3yKCMZneRidGtsO9S4zxTbwLzM5JM4CkrYsJNy
         QWgg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2QG3Fqa8dBsMMM5bM1DhTG5tRIaE+xGauu1QcftUQiCbBEm0i2FZEjNqEOpcA7UYPN7k=@lists.linux.dev
X-Gm-Message-State: AFuF++mPMjEBKa8offe60lsXfX4jexT3b6VtZ9PVNl0ZllXo4ELuFVMh
	rRq/yF8+IspzhsNQtW7nGOnxlkvOkf2OMyVl0+mtq3GceRK1qufVQVKr
X-Gm-Gg: AR+sD11PuMfRgoEZqhvwnCVmBkgquLGZrQGYTNbnJOxxPlPnlJF/GwvKeKF5N0PQBoD
	v7IqPLwiM446469c4AUJvatNnXrkk+pWDlwciqYIja/3ZagNI5Su7Y5TYiuNtwPT2lfzu9WFHdd
	cNDGuTT4exybwDhqpG/HWSqE7uIHmHfR+eIo2Lv3z6MFKyMfUBNVpGjuXFrP4iRhYEZpXyLRnN2
	JAotfqbdiBEwC9h4z9Gx0/tC4ZPw2tfUE/9oBXwJfyY7mpQfEdCaPSgYJmwnznYFYMLtoJnwVdS
	S2w/VIHwvuZ1KC4fdjzdKQC/rKowoVmYPMQQ6zszDeJRm76yeV+pJafDxv7IkZEit+3qY/nYWCT
	SKhEVOC/5oCpW4qrC2ZlUV+Yzt+r/59qfWA0oS3ewL1+VNgztSfOXOsHxDs4h5gq0REl8A8JA/S
	eGznJ9iNU2IeoSLkaHLN3T1XlWKCME2jZTqKnF3iBFa4j0uT63v3HhhX8b3TlIeACv7rEuUJEOg
	JtfqOZtq3YwPCceBsCI2aQZvmUT8KiGvBf58hlv13LK1uL7MGjUUZH9
X-Received: by 2002:a05:600c:4e94:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-499b9198005mr78347705e9.6.1787353877591;
        Fri, 21 Aug 2026 16:11:17 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9a848dasm25994015e9.0.2026.08.21.16.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 16:11:16 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <f4d11338-159b-477f-8ff1-1bd52783e183@gmail.com>
Date: Sat, 22 Aug 2026 00:11:15 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com,
 linux@armlinux.org.uk, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 bcm-kernel-feedback-list@broadcom.com, radu@rendec.net,
 kernel@pengutronix.de, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, arnd@arndb.de, Sudeep Holla <sudeep.holla@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260801212235.2692694-1-julianbraha@gmail.com>
 <87lda2j5gs.ffs@fw13> <877bllp5fs.wl-maz@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <877bllp5fs.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Marc,

On 8/20/26 09:22, Marc Zyngier wrote:

> [+ SMCCC folks]
> 
> Thanks for roping me in.
> 
> This looks like the wrong fix altogether. Whatever the Broadcom stuff
> depends on is irrelevant, and has nothing to do with GICv3. Same thing
> for the NXP contraptions.
> 
> If there is something to do *for the GIC driver*, it is to make sure
> it compiles/links correctly when the platform does not select options
> that are not required. Why would NXP and Broadcom care about an
> erratum that is specific to NVIDIA?
> 
> I also disagree with what the commit message asserts, ARM_PSCI_FW is
> selected *globally* on arm64, not on a per platform basis (TFFT!).
> The NVIDIA machine being an arm64 platform, the correct dependency fix
> is to select HAVE_ARM_SMCCC_DISCOVERY on arm64.
> 
> The overall issue is that there is no fallback to do something
> sensible when HAVE_ARM_SMCCC_DISCOVERY is not selected. Random drivers
> should not have to guess or add random #ifdefs all over the shop.
> 
> I came up with the following hack, which compiles correctly on 32bit
> ARM without PSCI at all. YMMV.
> 
> Thanks,
> 
> 	M.
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 42f2278a702d0..937f17ec93a2e 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -37,7 +37,7 @@ config ARM_GIC_V3
>  	bool
>  	select IRQ_DOMAIN_HIERARCHY
>  	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
> -	select HAVE_ARM_SMCCC_DISCOVERY
> +	select HAVE_ARM_SMCCC_DISCOVERY if ARM64
>  	select IRQ_MSI_IOMMU
>  
>  config ARM_GIC_ITS_PARENT
> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index 4de81848fe2ee..75f9d3f1723b5 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.h
> @@ -324,6 +324,7 @@ enum arm_smccc_conduit {
>  	SMCCC_CONDUIT_HVC,
>  };
>  
> +#ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
>  /**
>   * arm_smccc_1_1_get_conduit()
>   *
> @@ -363,6 +364,12 @@ s32 arm_smccc_get_soc_id_version(void);
>   * When ARM_SMCCC_ARCH_SOC_ID is not present, returns SMCCC_RET_NOT_SUPPORTED.
>   */
>  s32 arm_smccc_get_soc_id_revision(void);
> +#else   /* CONFIG_HAVE_ARM_SMCCC_DISCOVERY */
> +#define arm_smccc_1_1_get_conduit()	SMCCC_CONDUIT_NONE
> +#define arm_smccc_get_version()		0
> +#define arm_smccc_get_soc_id_version()	SMCCC_RET_NOT_SUPPORTED
> +#define arm_smccc_get_soc_id_revision()	SMCCC_RET_NOT_SUPPORTED
> +#endif	/* CONFIG_HAVE_ARM_SMCCC_DISCOVERY */
>  
>  #ifndef __ASSEMBLY__
>  
> 

Thank you for explaining. From my tests, your version resolves the unmet
dependency well and doesn't introduce others.

- Julian Braha
