Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688571D63C5
	for <imx@lists.linux.dev>; Tue, 26 Nov 2024 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732637841; cv=none; b=cFJhJZ0g1CAxqV//UcjCLk20FAp311qb44SCEHpdfhlQy/hIWdvsNFajoUARDtsN5SSKFTOiWagQHhSNlsGaDpIwiNCkm5AC2aw5HPSimPTa4lX3Go4qLjn+iFhIkchyxnN9WyckPOQ+e9UkrUZ435F198arW+x/sk49Ny+xy6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732637841; c=relaxed/simple;
	bh=t1uBQW+oI0CzJFAUHppB/Jtuu9jM/2ue+emxeR+cC/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRGXdU5IuA1wrLgQz37apcLk/hTmHM8fQ+9A/lDpqciZeI5J5V7gLakP57NBC19IDjyVONAPuL2+QJlCm7ZzCPT0znkM52MWkxXvctzuVE8x0VKYTCFO5CSWn+09+leFffEf89IV8B93itiuAJldmn3ldlacjgUNM7eKHg7hx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBMQsimr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBMQsimr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-212008b0d6eso47293505ad.3
        for <imx@lists.linux.dev>; Tue, 26 Nov 2024 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732637840; x=1733242640; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dotO4c05j+1ByFMdhxgy6HIjtPrpikGEeV7kKdyEfIQ=;
        b=CBMQsimr2rEb16QHhiTVmq+xHmn857WXeq6C5uHxV0OwVm+lDB10s8cOHgOud471eU
         KvkEIG28HubPG5pwBhuJ3qA/cksvZE5RL9tj1UbVKc2qtUXT8VrTzYWi8gmeG1O7Cx9b
         lPLq2/jjHtUGrIVTnR4m7nw7Aiym8lzL4gvjHDJ9kLCD/rPGJnpz82JQSDfZzhTxt73Z
         OfdmTIALpb4YTwk5TS1wkqDgREQJgvSvokMOtgotzBKMhtr9umgbAzDfMFmsEVhNnWI4
         9QvkWSp5e+/5NDXL2H1N6Crj9LQvEV1oRuThGistjJyN4Tn9dY3bEamS0jVe+eVK94jR
         TE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732637840; x=1733242640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dotO4c05j+1ByFMdhxgy6HIjtPrpikGEeV7kKdyEfIQ=;
        b=siaxSaAurLGR9auTzHH3jQbKWwKtmJylBtuwk2IOlNzwyoHyf2070bkjnjQVrXSZ+7
         /O6EXY8YZh4R2/FWd+NxgYGplfIb0sRUvek/CspVmVsNQoSJvMOyVn5xIy0gx6tENnKb
         S4Y0zgNkNQgCK9vsZLZ4zSA6Qdevv9N4Y94Q/e+C943HP5PgYiThnSdPbuHbpt7o6/p8
         lkPiemOzFdvggC07Zf5T438ZKeiE7XHSPHsShupiFigzWXftOyhAOzC9msxqRgjBbec9
         beAL99Vj7Su2TTAyidp5eoQ56lZxV1REr36TDVZXC0sqWUs7maCo7r+C5I4aESfUamwS
         J5Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWKJQJ2vscodZLNi1ByzDMBtfDFS91FYVjCg+R/njjrdkFXpoSby5AeB1V/rK4SEICokDg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCpcV2LypEdaNCRSAmaCESfwur0GPYC17C3Dn04nZEDpo8rdfb
	9r1F+HzNYJGI3EljkdCi5MnXnToa5d+sGrI2gOUruLy6Q34+O0se
X-Gm-Gg: ASbGnctgTfYMAF3QEGbANqk+xMeFBx0PUvWgZsHdyI7MjINSjc3X+Lj25PRFqEbIb8g
	ZEAvwo4Kh37y3KAPO1DMIpN9aF4giRBZzCE4JNcFY+CO18LVpry33+y3bUoEXtkkwVIOZaWNhTJ
	Si0/0/dMaUYHhTo8j/Vx0t7HP84pxXNBveztByNUp7eqAmB2qHJ4DLq7cXnjb/NDGZrWbPFiC8x
	DAC3f1QZe0aFLFc0/R1AUuSXz8we7k/UPrQ0XxIlvjUx9PMm7yWoamUCh5FnLg=
X-Google-Smtp-Source: AGHT+IHIE2SReZTJ4Qu4Z8qk2ImmULTwKv8+/GkwDFaH8Bgy3Ec6rGlXL8O9cvmqAvZCw7gJDtDStQ==
X-Received: by 2002:a17:903:32c1:b0:20b:8bd0:7387 with SMTP id d9443c01a7336-2129f28f81amr257582205ad.52.1732637839561;
        Tue, 26 Nov 2024 08:17:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc22a4asm86521855ad.261.2024.11.26.08.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 08:17:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 26 Nov 2024 08:17:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Esben Haabendal <esben@geanix.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
Message-ID: <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net>
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>

On Mon, May 06, 2024 at 12:23:53PM +0200, Esben Haabendal wrote:
> Making pinctrl drivers and subsequently the pinctrl framework
> user-controllable, allows building a kernel without this.
> While in many (most) cases, this could make the system unbootable, it
> does allow building smaller kernels for those situations where picntrl
> is not needed.
> 
> One such situation is when building a kernel for NXP LS1021A systems,
> which does not have run-time controllable pinctrl, so pinctrl framework
> and drivers are 100% dead-weight.
> 
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>

This patch didn't update default configurations, meaning PINCTRL is now
disabled by affected configurations such as imx_v4_v5_defconfig or
imx_v6_v7_defconfig, making pretty much all imx platforms non-bootable
unless the default configuration is changed manually.

Guenter
