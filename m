Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179C2387363
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 06:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785996467; cv=none; b=V0nCbCVk25XWC8ABu/zXEq29DyGUVV3vwwJJ5yDETNoKtXVaHELGrmz2UNBBMhdNIL7lU64ILk+vQHzNw2mHTkp+PgIzulntKskMDSsWf+O/zBBxZv937Zyl3GUll6JIK2ScOrcmuG+62kn30PvOJA+Sk3cP5tJ3cPOesk/qsrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785996467; c=relaxed/simple;
	bh=eZVbKbJlRy6iKFYcyypMSZExqhzl7Fd9PRmhKUenaOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Px8eIZ9w6hP0Wz50x4pQkkOhj8WBeHpHHnT99Luirjq58SpYiYBpqs70/npcxABj1eyqaPvMBV8RbNMuDXGyqMm3MO4gIYSz38USWvDMLu0wbghyC/R7GyHP6QHfPeC6nJXjcmp8BW6ITnBIxxp9kOdpO1AMVhKA2XzTnBtA3L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C/hxiENv; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C/hxiENv"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca80d708489so439008a12.1
        for <imx@lists.linux.dev>; Wed, 05 Aug 2026 23:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785996462; x=1786601262; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mmocOSK9hgh5E+Lsrtu82Yd/W9gDMariJqutM9LyXaQ=;
        b=C/hxiENv46VFEZqOX8UE0VkAuyp37Nr+h1YHF/pG5Wp+QY9vwmuBivVsuGtkiA+MEi
         HwFK4gj9+SyMt9oZ3LQ6tGco4ICbBG/3ax2JiNkEyQTxEACb6BBBr3SFpxHfTeqYGEDw
         AC+gcG1HC1g6G7IvYVh3LAuZ9uglFbSRximj4fXbhqgxYb7909UNJgTntBABkpki12k6
         lv0F+oNCsXu76dzxG34idVZEZ4Z1/MvQ7K0Gb82tBl9a8d9O40Lflid+WTC53VYkBxeC
         +TJTP1xz0xbEbMNPiabUcE0hveyoes0zNhWSSew+ebo+UbqHPu8qpLfYJ7yAAi1+5/xE
         dHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785996462; x=1786601262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmocOSK9hgh5E+Lsrtu82Yd/W9gDMariJqutM9LyXaQ=;
        b=U/WkJ6+3ZndtaKKg12zhon50MfjoWi44BWdVEuFmMNdXoo7SgoIcgHwC7zrXt3DtXv
         YU1OzXKtTNjarvccnkdh9ELslNtUZBwftAXacJnqOeaSvUgzKqBAtjVynRAiVdrp/R0o
         v/e42YJw/KWdq3yQ/tlJjLhTdvHa4tp1A4Vs1VJ142Rnv1gRJtZBtyzEQ/w6Lsq8y+92
         zrn4eOrHB8d4mee5d8PcV3r5TrBomvga3ffZC3YkLe4DCndexPrTFv0xdWXWMARSV5k3
         m2yv+Ssxxk2VhWJEo1+YPdWhUBhE1qUtErVugFaYrIN+D0gGzRhGk7LYbCTnxjTcM8sc
         fdWg==
X-Forwarded-Encrypted: i=1; AHgh+Rqjv7NFg/PHF0NyXojMIXyBP5AzdVMCKRS8KK3+H/9OYNXl+KY0osBQHTTLbFWsx+RBOKo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo3JHNRJqqOg9o+JMY1CAYnBtsiPrKnmPTLThoSlp4C1eBnfK/
	tiB384bTLUfk+QRSLft4HAEcOyi6UuWubWkjP3RFaOfF/uMwJEFdWyzgKvK5sAbLXHU=
X-Gm-Gg: AR+sD10VbpPdgM05HjlHa96vbxaogqaoVwYM8FfeVmUSSTdmb/FLHR3YBv7QN2c8oAD
	E8Bci5C5i37ybHtbgs1snF4EGQe72IwwP4/Z0i03KOHB8MsKyUFMzLbbgtAh2rEve3TZPH8Lt/B
	9vPvoriz+RWMWUV8F1c00D8jmFqK8CfJ/tz7rEVuyEqKWOoStr37Qfhk5VUd9zkzURfElRgo43s
	Mb6GkPrw0xndGlDroMzsznZrd99Xjfk7tHkMwAtf5l6Ju9TtWUJuJis54CeuAWNRSTIoikotita
	/eQyjb6q9F2yw0Bry/LHUsoU3RBxbF3hUmZYhAU9MupP4XzhA2Bpfq//i/A0nbNCF3TzuJNTJfV
	XvN36A99uo3VrEJlFXq/m4A3MIJg6x1kapXUuDQQKIPc4R48mduE+CLlPexgWztMDQroJbz0YOd
	XnNiKRSaxauzGefkbJb8lK+tiYBly4X5xUxOaflquJ5APU2gLJzbjJMvIU22jV
X-Received: by 2002:a05:6a21:178a:b0:3bf:a517:cdcd with SMTP id adf61e73a8af0-3cb9c1a3bb4mr5836488637.12.1785996462270;
        Wed, 05 Aug 2026 23:07:42 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca908068sm20402627c88.12.2026.08.05.23.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:07:41 -0700 (PDT)
Date: Thu, 6 Aug 2026 11:37:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, 
	Fabio Estevam <festevam@gmail.com>, Anson Huang <b20788@freescale.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: imx6q: fix out-of-bounds write when probed more
 than once
Message-ID: <f3oyofuwnnygmazuduufjvvafqpgqxfnvnf6dcxfc63z2ozz6o@vxk7bozr2ctl>
References: <20260806050239.90188-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806050239.90188-1-kmehltretter@gmail.com>

On 06-08-26, 07:02, Karl Mehltretter wrote:
> imx6_soc_volt is allocated fresh on every probe, sized to the number of
> ARM OPPs:
> 
> 	imx6_soc_volt = devm_kcalloc(cpu_dev, num, sizeof(*imx6_soc_volt),
> 				     GFP_KERNEL);
> 
> but it is filled through soc_opp_count, which has static storage and is
> never reset. A second bind after an unbind keeps indexing from where the
> first one stopped, and writes past the end of the new array.
> 
> Unbinding and rebinding the driver on qemu's mcimx6ul-evk, under KASAN:
> 
>   BUG: KASAN: slab-out-of-bounds in imx6q_cpufreq_probe+0x3b0/0xa34
>   Write of size 4 at addr c5e90480 by task binder/73
>    imx6q_cpufreq_probe from platform_probe+0x88/0xe4
>    platform_probe from really_probe+0x108/0x384
>    bind_store from kernfs_fop_write_iter+0x1b4/0x28c
> 
> The write lands one u32 past the end of the allocation.
> 
> soc_opp_count is only read a few lines below the loop that fills it, so it
> never needed static storage. Make it a local.
> 
> Fixes: b4573d1d657a ("cpufreq: imx6q: correct VDDSOC/PU voltage scaling when cpufreq is changed")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/cpufreq/imx6q-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
