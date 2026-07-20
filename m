Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B530742F702
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558612; cv=none; b=HD4THUB1REpi5P+6WHmg8PHQrSzieJeBX1ob07uYCthCFi1sq8RcmPW4tRgaQRhV6YMZeI/yEwnEkeEyRVk+StvYFSb8lfFm2Kv/M0YBCcODBqWwAIVB/xEISnc4iDTAVgmJQcirY5mO74+0Psvr1IUXHSWhLy7MTyLVIje91+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558612; c=relaxed/simple;
	bh=z4xNGYkf4fETdRDY/WXmkgQmHnFeScnUkN9aeJpb0+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkzZZ7XK4tJOm+qJQgnY0YSnBobY1VYvXpgoVeaZv3tG6ho3bVEfW4qgxKqeTPSWZOB8Uap3j9+Tb4YNQdiQYxD1fxjDONf4l3wnroA73sb6s3JcxbfyycomWEgZgWMs1qjCfElO8DxhPb6uF/PzvKh4sp7A7P92cV2TUXrRh4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pS7QBL1X; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pS7QBL1X"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9aea40d799so3255472a12.0
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 07:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784558609; x=1785163409; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRPQsRwj+n1ng0H+WDG2QV9LkRG40/jMmpAbf3NOmNY=;
        b=pS7QBL1XAlkz+av02EFkl5jb+xVq5Kl/TAqiqdp25Wlt7IBPt+R21uYJEUFbJRgLnz
         2gaIu2EOQMh5FER3hi2mUNyxTSnzB0nt5Z4njE8AxEYi+V3Ss5NiY5jut0Npn4dGbjJF
         Z9w3qlHMUgLRFUSX+LP/WM1e+354qQpNiqJUMPP0nWa3qAjb8ZKAkYH+cvgsZWT3BhA6
         mzWb1T10BPVIFzX/MEMZmxQrWZ47Geck+tJlnVWoU9aeebrchgOpv6sUIPm8AWY7lBn3
         X31ZLv6kWp4gD91AYRH17rBtBO752v//B67c1kmoFVMDPUciuZ7H+wuWHxxRLoVsPjY7
         BbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558609; x=1785163409;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YRPQsRwj+n1ng0H+WDG2QV9LkRG40/jMmpAbf3NOmNY=;
        b=s933s1EIUEMIkY5LcnZAdGJIvFEmWFTRFEnUGf4tSijrcWwdTGekeWbfKxhQZ8jFpu
         rWBfaRqmDzdbxRw4JNPG9RnkFESr6PC/TAJT6xAhlLjI5NCvEmwRMKNGu2KbuhhEDPNf
         84g24vXZAcypAKNyVqJBEH7UJyjc3oJ/loXLeRK3BsJN/LZer5joN+PI5NggEeBe4Ctg
         f2Gend/CgCOzTLKSgi8Zsnk0OxAv27bCljwWgQspRFslJy+Nq7hYHeUNoXR6UiX60e+F
         gYGCWrt0K2gARtnG81I9uKayXGbAlvIXxE5NizOAD9wFqYCCg43oCU7L968CrMTYE+QF
         09AQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6H9QeNmMr3WMON2uQBQBy0tcQflG0sNb3eYyW6iqJ782DhiJLnJA1lmBdHqh73SV0aJI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdgYY3nrRWZXpcAU0F9ddJ6X/Z52EZDwIOSCc1LnPpg/neRYMS
	fASjISxK/byU+YuBQvVDK0gl2VFHkHxS0bS+1Nsx9LAkhw/MLOvtpm5h
X-Gm-Gg: AfdE7cmvx00g5Rn/w8E/pAPmHx8ZTLTDTC/nbkAyPN18lyj3WwSiKlBKDp/uXBoJR6e
	o9b4eusnv/7UvH/NnVm98a3fIq4BK9wRKOD6EtCzFt8bJU1pjQ8edRL6RXlsLKinBnPZYlZpB3N
	WV1dRtlceoV/F/TUAGbVE5qdsISbzPsBEo5GQWYNxfjWxktc9N6CC2+wdQ1nPDXoow6CSIeMsV2
	JY9WO7ikvYp/7SJmsRvuiUzIh5DR770ozeWnqspk8cUK3BgEC68aARV5DCD0YtxcZHka3jTSP+r
	aY3fOIX9VlfqE6degyybZvg68zRtyuNYC/lMYbFUUMDTc7dAfsHEicbULNFDpw7ftOYyvkSiwGX
	FF+5fmQNuHe3Fjzkm12No97sN1WOkm67EIYgqgGiElly1VqzgiuEv39WyC0erVjF+Q+hIgcE+Qn
	axqa+8b6p7qV5nbwH1Owo16ePPs0TICAVVyQU6mF4UMi4iPQwYgws=
X-Received: by 2002:a05:6a21:3981:b0:3c0:adec:b3bd with SMTP id adf61e73a8af0-3c3ad9646afmr16051848637.49.1784558608970;
        Mon, 20 Jul 2026 07:43:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm35894013eec.2.2026.07.20.07.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:43:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <612e3496-2917-4d4c-8794-69c3b5b27c5c@roeck-us.net>
Date: Mon, 20 Jul 2026 07:43:25 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 monstr@monstr.eu, git@amd.com, vincent.guittot@linaro.org,
 Souvik.Chakravarty@arm.com, Alex Shi <alexs@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Brian Masney <bmasney@redhat.com>, David Lechner <dlechner@baylibre.com>,
 Dongliang Mu <dzm91@hust.edu.cn>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Pavel Machek <pavel@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
 <skhan@linuxfoundation.org>, Stephen Boyd <sboyd@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yanteng Si <si.yanteng@linux.dev>,
 arm-scmi@vger.kernel.org,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 linux-arm-kernel@lists.infradead.org,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
 <ak_Eu_eQKalPMwo-@pluto>
 <CAPx+jO9KMcxnmt-wT5jaApj9p7s11B6eSG6K08Jt9J=-vXxjhA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAPx+jO9KMcxnmt-wT5jaApj9p7s11B6eSG6K08Jt9J=-vXxjhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/14/26 06:16, Ulf Hansson wrote:
> On Thu, Jul 9, 2026 at 5:56 PM Cristian Marussi
> <cristian.marussi@arm.com> wrote:
>>
>> On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
>>> On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
>>> SCMI server from different architectures than ARM that's why remove
>>> ARM/ARM64 Kconfig dependency with also remove ARM from description and
>>> rename folder to reflect it.
>>
>> While I understand dropping the dependency on ARM (I always wanted to do
>> that and test if it worked at all on some otehr archs with QEMU), I am
>> not sure about the whole renaming party ? why is needed just for
>> cosmetic reasons ? it is at the end an arm originated protocol so I dont
>> see it as a being wrong to be named as such even though used by other
>> archs...I have not really strong opinion on this...
> 
> This is certainly not my call to make, but I have to admit that I
> fully agree with the above.
> 
> Usually we don't rename files that indicate a legacy platform name,
> just because a new company/platform wants to make use of it.
> 

I agree.

Guenter

