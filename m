Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57B19E82A
	for <imx@lists.linux.dev>; Mon, 12 May 2025 14:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059225; cv=none; b=FIlD56Erm9gb/RgpMMooxdD9aYZEUV7BEKEz6bIsTHWb3CzCbU5ncONjwBoXRu+1tSrIAGnn2Oe3uONia38yqRdxEQAfzfPSgqVQ6/zLXrwIGk5TDLo8iQbeYwEV0KpeiFi/Q6kUw3TaMAosgYgWAd54Wr+8rdrISJTe+O0yVgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059225; c=relaxed/simple;
	bh=2OJlnvMBtd1Qdxb8D4i8PT0Scjad8idgDm1fH/AmWto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwzRkTqOZXWq+2WiMsFdRuQUahKAaTrgO86sZWhlBkqktlkEgYR67qtKnYS9cpT/jG3TGtX4eII9WNGPR8A/qu2RQVDamfFbUOh1hO9J3lv4RDgpfnXP+WuMiplPM1ye0tU30hoPvZpNuJO/MOpQ/W7jKdOCtN5xQfly4BaoB+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMfeGFhn; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMfeGFhn"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so4454116a91.1
        for <imx@lists.linux.dev>; Mon, 12 May 2025 07:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059223; x=1747664023; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2OJlnvMBtd1Qdxb8D4i8PT0Scjad8idgDm1fH/AmWto=;
        b=RMfeGFhn7ZkVAYUREPqflVcxXronnLy2I+tPJQ0ISr1Du/1fcbLbNjpTOPiCeB87MW
         1xBewmU3ITTPw+fovvItdDMvVpPv75QfII4PXPmIhA3EkxYvXhxf1MsKYIOhQAliB25Q
         XNLGLknAhFXDcFrnVmbK0v7RMakABqU1v/roNbBXgWFpu6/6QSO7ki0ncTr9fLsLfAoT
         fJu2sNoUfjP5m0Zw8Nm7oM9pABM/QoSwI2Ag3/qB7/lS5gT8gV97bkFO/j9M10aqXTm5
         CZYCY8fDZjzS173UFUgb2q+P66Y/3bijuwHUQ1CY4lldb7nUdjec8gQsmLJ4VILD4bgA
         g7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059223; x=1747664023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OJlnvMBtd1Qdxb8D4i8PT0Scjad8idgDm1fH/AmWto=;
        b=EakWOsEzWVfUYCM1rxHVJvHVSQYppEjMhujM+lzJwQPJ8GzeFlif7NAE3/J+q8l9Y0
         TKyGZH01LUYGF/r+i6RpriT+H6dwA/Hdhguj99sEg8YCF8vrWcRIcy2rsgGSm0iqIIap
         BoImqT1Hn2dMqaxOCtBACPZvmiZN+3RHD3Wv8DKs0T7vuw7G+pSeA6fGL0NLk6lJn3PD
         gujrETyMTCR6ZZhfY0kTOgNafixVYIstyzuYeXXyV+sz1Cvs31mFEStiPIwnJfluvo8K
         laj5JqE28K2RVwaMvFPHSCWpnfSIJHFsxOBmy0j0ZwSaTr9TYc3kYM6HPAshWyD8GFHK
         l3Dw==
X-Forwarded-Encrypted: i=1; AJvYcCU+0puhoX6vohBDyK8RPLAYrUFWQbXPiJ9f5tFnqEeyZGknjyMM0QFzpaj6AXd9SYM7yMk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4r8j+PoiCMzJMVK6GJNMzo3i9rpW6O7EE9gqQvPd81GEZqPni
	gdr1NBDZvZKmzfq9FCDs+Ot6Opx7nvNjHKP2oYnKQfVJZxiEz6Oi
X-Gm-Gg: ASbGnctLnRdj4kLssnWPm1jHW4rPJAQ+KfRzUAKBOs/siJpP4+sjQxFloZ9GXK8TShv
	+W4aslsoHI1Qxgt7IFiLPhgTiPY2SYZAgoztG67H4qMZBwg2MzgDGYXRxPVHf/HjTXSs99Vtg+K
	3/5Y0bLgi2B/jg7YiWckkMg0KeZEnavly1aCLIb2lEvvrIM1a+wKiSv+vdhBdZ/o3YmRlIS7H73
	ttL4tDHmhVMasSp7y2y5HmXmUIapZLQR4Tm7vXIiWvNT6KC4pgJCtRL8Emru53SdgUP0VldiwAY
	p1MO/DD3UK6y/T6nGEVxvqrX2DtNmbBr+4UonMA0XJ29NBHjnw==
X-Google-Smtp-Source: AGHT+IH5gUoco7N8sKGHqASp+t6n1KYZvtsdLBTVel5nTdgyJkB/lYXE+HXry+XviOclf5k9LSJ5pA==
X-Received: by 2002:a17:90b:3e4e:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-30c3d62e4c5mr22364395a91.25.1747059223077;
        Mon, 12 May 2025 07:13:43 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39df09dbsm6650922a91.26.2025.05.12.07.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:13:42 -0700 (PDT)
Date: Mon, 12 May 2025 11:13:36 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
Message-ID: <20250512141336.b72ga37qtlrvgaut@hiago-nb>
References: <20250507160056.11876-1-hiagofranco@gmail.com>
 <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb>
 <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb>
 <20250512045613.GB31197@nxa18884-linux>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512045613.GB31197@nxa18884-linux>

Hi Peng,

On Mon, May 12, 2025 at 12:56:13PM +0800, Peng Fan wrote:
>
> Ulf's new API dev_pm_genpd_is_on needs to run after power domain attached.
>
> But if run after power domain attached, there is no API to know whether
> M4 is kicked by bootloader or now.
>
> Even imx_rproc_attach_pd has a check for single power domain, but I just
> give a look again on current i.MX8QM/QX, all are using two power domain
> entries.
>
> >
> >>
> >> In this way we don't need to export unnecessary firmware functions
> >> from firmware/imx/misc.c, as patch1/3 does.
>
>
> I think still need to export firmware API. My idea is
> 1. introduce a new firmware API and put under firmware/imx/power.c
> 2. Use this new firmware API in imx_rproc.c
> 3. Replace scu-pd.c to use this new firmware API.
>
> Or
> 1. Export the API in scu-pd.c
> 2. Use the API in imx_rproc.c
>
> With approach two, you need to handle them in three trees in one patchset:
> imx/pd/rproc.
>
> With approach one, you need to handle two trees in one patchset: imx/rproc tree,
> then after done, pd tree

This patch series is already implementing approach one, as I understand,
right?

The difference is I moved this API from drivers/pmdomain/imx/scu-pd.c to
firmware/imx/misc.c, and exported it there. But you think I should
create this new file firmware/imx/power.c and move the API from scu-pd.c
to power.c, is my understanding correct?

>
> Regards,
> Peng

Best Regards,
Hiago.
