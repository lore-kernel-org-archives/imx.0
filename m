Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E3A4307B3
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 16:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783613245; cv=none; b=JpsHcqt0XHZGaBiuu0RGuoaM+/rt0pVyamWvk629cKSG8SFrAGulD9+NGWIcTGdIT4XvM5wmfsck4AVUA7NxpbaHcNvhl2ocBFw/Bl/iGm0ji5crykUXOjl1sYVM5gcEEimwLvISDnM3NSPMgNcEPmdfjfAdmZpqdWTvZqJdm5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783613245; c=relaxed/simple;
	bh=TfiHSLMBjZ80AM2O04NWCaLK29aZWfR88RfiqOuVlcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IM4lXe5IM4ENM6vtekPWVIYnwfs+oHRNcWhlmVVSmXdCvlMHx5lstm92/2mKebq63fFoiK39IEnkC7opBmd3JlswOC0aEeMhz8hSK4FiZEE76QvlL+g0UX4dDiz1TM0AbnKyCU80yGzlSBEhGytizCQwnoYYfVrhdQTfKcZPIEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/K6xu58; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/K6xu58"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8486672f03cso535488b3a.0
        for <imx@lists.linux.dev>; Thu, 09 Jul 2026 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783613243; x=1784218043; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ysgGA9FNs2LC6p8SRgBycN6NLmY0OUHVJV77+UK20Sc=;
        b=Y/K6xu58ftlVgJ5bNeSyjnhSJ2LUSCFfiaUyjwpVb68uoViYK/QELELt4JlmPWJLxk
         JTE9jl2dJFNewyEl2DSNj8ZUVuxRyx0hbid9sXgbRuIIpET+dPqr9atNfZx/k9oiYFJ8
         LAgDrdtbVAY81wwdYJpTL8qotC2VhWzhhl64fHoPyBmfdeJHkWWzqnR10XX5gIEDeV6F
         6cfqec2VvNvBoxEAruNt78fA0+c5g+SOO/+OnzYqq+7i/OYnFXl3YaGJH7v9w7HOyWiz
         GefN0DFbNtYeejGaAQiika6lUoFim9My87qIgGvdenlNRXkQKbuFQMuoPGyOyexrkDDr
         Whfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783613243; x=1784218043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysgGA9FNs2LC6p8SRgBycN6NLmY0OUHVJV77+UK20Sc=;
        b=lFNLz2mT1ML6zzHrgQ/1BOrvOhDWTGI4gDbvKfLGQLe+ovWGZ0eiZykp0FLhKeAqmE
         nQp506/Ug1JDvCQLSrnsDEsyFyBR4OMLMeF2p50AVaxcNJUkUuceJKgRh5UXDzaD4MA1
         FINuhVy7Jg5hn1tHglWShfyWjzw3WpFpkChMoCulkrpUPe9AJrm3ksW9PXAzjYuxtp/q
         H1N/0uzsko7MqZV4NvSX27HdJXZ2Z7s0YSVWo7KVkVgTxXsVz7Bq/Na5Uh1MyEBodf0T
         fShUYDbKr7y02hwBB5uc9f5rtEt9MRnCkUFf7DYbDloTWkCa3MMeY4IA/5L82fwgBlcL
         ROpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rro5SF1a4LP+koRBLBlriAjmv/mD6hkOO/cN/5e903V0UZ4Ld27yOwxmjV8pBJ5AkY//Z0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1ZJ+SDwonLy8VKrEe+9DEsynT8Wfq8J22Ine0da+19AAgXL76
	XQNQPJXuU9NLHnU4bbS3Bxg43ab2n/la7glCOM5COFgpigpJ0BboNul6
X-Gm-Gg: AfdE7clScFyx2iY0X62pw3G2HVXhRFSa9eZ+VDXKh/onbYbKEOs1Jbhwlr16+tTeMiE
	hCax+KKVAa+Zds+Dhm6bSMF/osSNaIsHcs1RN1/MseM6LlOaeGGZRJPAFlk6FEqixBxwRUspebe
	I+9ZFTBkRR+O5YQ9ZraS4Lw+cBpYws2tuhCyBVGPaEAcpBYX0Y2XutVJV35xh7Kr4zWm56YIYG1
	8/E2k7AwddTpnJwuiqrO+dCJNbH5ZAYbX2LUCM/p8mivjw2Rbzge21mrmoI1YtT6CiOUsK4samd
	Iv+sGVjLqYGwxKL3UIECcZb7IIQepH9p7vuATVoPCLKjT2WFGivR4VgImSVVEW0H7SM1xvryB5q
	ctmhpYD5YRmAWONnWiodADik175ebNrdXL/3v/+LAKSB2RmSmMgLsLuhvC1WDt4Lhy5wE/7vkcE
	MaLQo0CGYF6rtAHxfh4fpkBX1p3Q==
X-Received: by 2002:a05:6a00:91a9:b0:848:44d2:72a2 with SMTP id d2e1a72fcca58-84844d2940fmr6740302b3a.27.1783613242449;
        Thu, 09 Jul 2026 09:07:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8484d465991sm2206257b3a.47.2026.07.09.09.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:07:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Jul 2026 09:07:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	vincent.guittot@linaro.org, Souvik.Chakravarty@arm.com,
	Alex Shi <alexs@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <dlechner@baylibre.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>, Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Pavel Machek <pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
	"open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
Message-ID: <6cc90547-a3d6-40b4-8914-a1ff60944cdf@roeck-us.net>
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>

On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
> On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
> SCMI server from different architectures than ARM that's why remove
> ARM/ARM64 Kconfig dependency with also remove ARM from description and
> rename folder to reflect it.
> From specification perspective only ARM specific transport layers should be
> available on ARM/ARM64 architectures.
> 
> That's why get rid of ARM prefix and description from documentation, file
> names, folder names, MODULE description, module names, Kconfig and
> comments.
> But keep origin Kconfig symbols not to break existing users.
> 
> Hwmon, pinctrl, powercap, regulator, reset, clk and cpufreq scmi drivers
> already miss arm prefix that's why synchronize all of them to be without
> arm prefix.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
> Likely I missed other locations but I wanted to send this RFC to have a
> discussion about it.
> ---
...
>  drivers/hwmon/Kconfig                                 |  2 +-
...
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 2bfbcc033d59..cda0aedb36ca 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -401,7 +401,7 @@ config SENSORS_ARCTIC_FAN_CONTROLLER
>  	  will be called arctic_fan_controller.
>  
>  config SENSORS_ARM_SCMI
> -	tristate "ARM SCMI Sensors"
> +	tristate "SCMI Sensors"
>  	depends on ARM_SCMI_PROTOCOL
>  	depends on THERMAL || !THERMAL_OF
>  	help

I agree in principle, but I don't see why this would have to be done
in a single patch. Also, both the Kconfig file (SENSORS_ARM_SCMI,
ARM_SCMI_PROTOCOL) and the driver itself (""ARM SCMI HWMON interface
driver") still reference ARM.

Thanks,
Guenter
