Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7B3134A6
	for <imx@lists.linux.dev>; Thu, 30 Nov 2023 05:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jj+uw8Cb"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-77d631aab99so25129785a.2
        for <imx@lists.linux.dev>; Wed, 29 Nov 2023 21:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701321046; x=1701925846; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQDiN1Jrbx1olt7xBW3Lpc34y9xCAK2zKO7t1ENpq/o=;
        b=Jj+uw8CbnRdMatFb/Hd21T9uQEBn8G6kmEFfWhXiXI0jTPuid8Rxw9AZjRV6oJtt9U
         QXh5HfqNxYANztUAVJTM1QndeauTqpWQYnWkzs0ASc/P5XQv1Z7Pj6fGAsJ3X6Dnk/Y+
         0S2eez5ynh+C0iQFxwbZDMQmCe2WDCcr3eP7R4qAVZGLMc2c/+4Z+f8uYNT35aUml7rP
         Urz5XhOKHIuqeDfSSkrYBclwyksH07Ob9JGHmDAvykviqcvhchScRPvq86mVnPJKDCSS
         wBeQ/N/N2KLe1XefqAiG7z17P4XSlwKGIfJA2TMZo5tUuM+XyNK3pBpsT/8aUySw2xz1
         QBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701321046; x=1701925846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQDiN1Jrbx1olt7xBW3Lpc34y9xCAK2zKO7t1ENpq/o=;
        b=SpV0rlyvZLHG7BJKRU5rN5mjcWWQ9xcgeG8E/7O7uIjS5c3soh+7cBgpez+h1H80uo
         gM16f7EpCkkGP8pPOfKRcB6FhWPszrFynIAbeHTDIHh9oVMy10/JhHkRuwl1H6igIDle
         OzvrE0F269+LQV5qnOUGKuboGxX43KL+u4iU8doiZ4rUX+vKJAPElUDX3hYzKYhqHZHe
         Zop+ewijEkKiychsAgPVQH8dv/WXksKZ1RlmfxUAox5uZjFiBR7VQQSWeSsqIyRcimyw
         jM59sPX7T6ky69Pxe3BMyGvIEh0rVZcdvW/6GI2DrXt08OPGUJ5VZCg6MwkrDTS7SrVw
         HRaQ==
X-Gm-Message-State: AOJu0Yz5H8NZhQWNZ62fAh+SjsJWH8G9cTI8tJOp2ru2ddXtmzPbYmye
	AshN+k/3WoRy8cvcS88NnhU=
X-Google-Smtp-Source: AGHT+IEcP/AVd6lZgZcHDoNwOG8AvlblBfm3ddm01OQcdGc2SYpqhh3zrPKbwYwjYK5GdAHS/FSEyQ==
X-Received: by 2002:a0c:fa51:0:b0:67a:52e0:de4 with SMTP id k17-20020a0cfa51000000b0067a52e00de4mr10222531qvo.56.1701321046509;
        Wed, 29 Nov 2023 21:10:46 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id k21-20020a0cb255000000b0064f4e0b2089sm164689qve.33.2023.11.29.21.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 21:10:45 -0800 (PST)
Message-ID: <016b48b0-2021-434f-88c7-deb1bf08d14a@gmail.com>
Date: Wed, 29 Nov 2023 21:10:44 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux v6.6 sporadic reboot failures with ath9k on i.MX6Q
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-wireless@vger.kernel.org
Cc: imx@lists.linux.dev
References: <20231129102240.183f94ba@booty>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20231129102240.183f94ba@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/29/2023 1:22 AM, Luca Ceresoli wrote:
> Hello,
> 
> since several weeks I am investigating a sporadic reboot failure on a
> custom board based on i.MX6Q. There is an ATH9K Wi-Fi card connected
> over PCIe, and the main suspect is the ath9k driver.
> 
> Anybody aware of this kind of bug with ath9k?
> 
> Some details about my tests follow.
> 
> This is on mainline v6.6 Linux, with only the board dts and a defconfig
> added. The board dts itself is based on imx6q.dtsi and among others it
> adds:
> 
> &pcie {
>          pinctrl-names = "default";
>          pinctrl-0 = <&pinctrl_pcie>;
>          reset-gpio = <&gpio2 20 GPIO_ACTIVE_LOW>;
>          status = "okay";
> };
> 
> and:
> 
> &iomuxc {
> /* ... */
>          imx6qdl-sabresd {
> /* ... */
>                  pinctrl_pcie: pciegrp {
>                          fsl,pins = <
>                                  MX6QDL_PAD_EIM_A18__GPIO2_IO20  0x1b0b0
>                          >;
>                  };
> /* ... */
>          };
> };
>                                                                                                                                                                                               
> Reboot usually works fine, but fails randomly in 1-5% of the
> cases. The symptom is that the console stops producing any messages
> at some random point in the shutdown sequence, even in the middle of a
> line.
> 
> After about 7000 reboot attempts with different configurations it is
> clear that enabling or disabling CONFIG_ATH9K is what makes the
> difference:
> 
>   1. kernels with CONFIG_ATH9K=n never fail
>   2. kernels with CONFIG_ATH9K=y do fail
> 
> Kernels built with CONFIG_ATH9K=y do fail even disabling all optional
> CONFIG_ATH9K* options (rfkill, pcoem, btcoex and no_eeprom).
> 
> Similarly:
> 
>   1. removing pcie from the device tree makes reboot work
>   2. leaving pcie in the device tree and removing all the peripherals
>      not required for booting, reboot does fail
> 
> On top of v6.6 I have applied all the potentially related commits from
> master that appear as of now (8 in total):
> 
>    git log --oneline --reverse --format=%H v6.6..origin/master -- \
>        drivers/net/wireless/ath/*.[ch] drivers/net/wireless/ath/ath9k/ \
>      | xargs git cherry-pick
> 
> and reboot still fails.
> 
> I have tested these mainline kernel versions, which no result:
> v6.1.60, v5.15.137, v5.10.199, v5.10.
> 
> A first look at the ath9k driver code did not show anything obviously
> wrong.
> 
> Any clues about how to further investigate would be very welcome.
> 
> I am obviously available to provide more info.

Do you have a reboot log with "initcall_debug debug" set on the kernel 
command line and if so, does it always point to the PCI bus shutting 
down the device drivers, pcie ports and ultimately the root complex?

We have seen something similar before with ath10k_pci and our 
pcie-brcmstb driver which eventually was a result of having made 
incorrect assumptions while implementing the platform_driver::shutdown 
routine. There was a hard hang in ath10k_remove(), I do not recall the 
details, but we were definitively doing something improper there.

imx6_pcie_shutdown() seems to much simpler, but my first guess would be 
there.

Hope this helps.
-- 
Florian
