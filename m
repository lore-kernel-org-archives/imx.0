Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635BF29B22F
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 14:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765289858; cv=none; b=NrkaPzZ8RpH8ij3UQZmwFOTPBNnkmD6FEgRH/7QmxpbMzFXsOXZ6sMK2ykbYyinVVQ/UpmHFzImrLrx57M57UaHvObLgEH9OmLyrecJKYcSPQutDuQfRnAYsF+u2k36yEnqQDbCpwsrGOV8LN+hZehX2/Bm4ouzpv91+Y5kOsQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765289858; c=relaxed/simple;
	bh=unuZ6P3b7Yxjaa+0itPHl4nXBL7mIF6rtwXPOxCWtX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFfgSJFv4UxVbQzyKzy25xBH9J4+eWRRVg5fwoAkCYKUEsaXElP3vkPcBMV471KgWaMKvbflGILOiODuOO0SgPZdDWxsap0zMgqDKFOVa7FeNLxDD6AYLAhZOYRfR5CjxMu6RwgmqtGCzrvwq3+bDPT464zGTC7HJH1Rd6TlQtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCkAgH8S; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCkAgH8S"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-11b6bc976d6so8452377c88.0
        for <imx@lists.linux.dev>; Tue, 09 Dec 2025 06:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289856; x=1765894656; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GqGl05z99jHp2ShgOvgQgByFBkkP2VElXGK/JMHVdj4=;
        b=KCkAgH8SWYZ3Il+KH4GU4Mmz6cFXqyUPfZuoqIZ4oUhJd6261Y68kpuewKnZO6izHb
         q/hFMxPxwaYxt67Hy2Kh6PqBlgIEcIDsWJnbj0ezOn0+iSxUQ85bv1TqGzNFd/HGYYW1
         9S8v1t2HnWlfaQyqtbfSc+Mo+QVZX1LKb0TmuF9/jzCya/aG+wqcd6F6acEeKUbjXAfY
         Am9ChZ9ajxT7Hed9b8JuANw1HleLx5QZrGjlHf1nY1zY3LsrTNqolrA21A3qNNk8qOrw
         P6zwlq/cAlyShe6z4pJEpCNxltAk+vRinxng1lR2O9uLgFxsi9UoV5a5yk1PF6f5G/Tf
         FtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289856; x=1765894656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqGl05z99jHp2ShgOvgQgByFBkkP2VElXGK/JMHVdj4=;
        b=OM4RBAhvBvo0JW8E+Z+r1DgJEAS0D/hL4aluhIDp4pTKWq9a7RCb5eKmjbg9xrc12I
         QiXjIMEcXmXApUMDufqJVQPpjkJejT2SjMP+MiwqZczujz8GX9SKecGOatuUS9UYC+lj
         qwKUoRmDIYMwaxWbCe/c6Ihz1vH7q/HSZTMeSA4lS8KiJRGYhG6jsYV9Xp1n643wdvEI
         1ilEO98tMlwMG7SMElmeF/UcJpJjZwVag3EzabqNNmI2QB1ip9Z93FAfwDCgmVuMXibB
         qD4OmuDRPn2z8VfwQBWVS+RySRUx8V95Co7n8usQrO1IP1GXeYyz2l+I3aVycdIZB3+S
         KllQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnFUg2a6m4mMZIb5xI1JHS/Q1gE8FP3BsacaAc+j6CGaMQkETfTvpsuXd3Qvjd998ufUk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzjz8rheMRdUNRg3nRZv5moJR9neApuM61i+gUXPlxuSGqvpQPW
	p+AVbYvCSSJDsbecQScNXYwEQkhvunW75Kh+jkGNeac5qDJot2TAnmqDWxYAmpRaWCWgNIMjceE
	nbp9F1FB85LfWnMT2xZStDybqx02sxgI=
X-Gm-Gg: AY/fxX4AXV8rIVup0UFss+WyNnzLetQ6JMTcQV09zTnhT6f/F5K7D3HWkwDSsGz7BQ/
	wUpr86ZnRDSDEJzdxKerqf+GBwLeeTDR4cS9NbkMU8Y2RScvMo8AhL3DYxUWvMtVNkT5PRR8ylc
	LUw/skaNQ5p7fI2RFS/PGXhrVhUYXBTSklXE8vyJeLcvK/9GrRwvu8dzLoel49N5MOZErXFOARk
	BHSRbSohc72ZinOowWHUywjaB257JoRhHWdqrh1o7YTDjfFuHnlkOmZCreY/oSbNEgmtAym6XMh
	gu/pgW+F90tPaOhJdUF9mytc2bmRFj0JCxlZVJcsYy95YWVCDNkaP/pvJFJ3sFe4o694cxiNAit
	diHYNFlWqmA==
X-Google-Smtp-Source: AGHT+IHJSK7Qp1zb5om02W592OqiY5udTEsk9nBSftpZyGmqI0e9P/OjwE7rDiAyfrBX382yq5jBhBWzuWKkJmGaXh4=
X-Received: by 2002:a05:7301:f25:b0:2a4:50c2:a74c with SMTP id
 5a478bee46e88-2abf8dee655mr691583eec.8.1765289856143; Tue, 09 Dec 2025
 06:17:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124182751.507624-1-robh@kernel.org> <CGME20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c@eucas1p1.samsung.com>
 <20251124182751.507624-2-robh@kernel.org> <674efe8d-c299-4ce9-bf6b-c1920a5393eb@samsung.com>
 <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
In-Reply-To: <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 16:20:03 +0200
X-Gm-Features: AQt7F2rjwQKc_bRBeYsxUFhD_YJR9U-Y3qN6s4VMgPax1Na8ykfHoapTIdM-w18
Message-ID: <CAEnQRZDBZ52FoNRBJa1qScbkcEYKwbyP_ephutdkYFaY5b1yLw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] remoteproc: qcom: Use of_reserved_mem_region_*
 functions for "memory-region"
To: Rob Herring <robh@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	Beleswar Padhi <b-padhi@ti.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Other platforms (non-QCom) were tested also use
> devm_ioremap_resource_wc(). So something else is claiming the same
> region? Can you dump out /proc/iomem?
>
> The region is dynamically allocated, so maybe that has something to do with it.

We noticed a related issue with imx_dsp_rproc.

Because:
imx_dsp_rproc_prepare:
 -> imx_dsp_rproc_add_carveout
     -> /*... */ and this calls devm_ioremap_resource_wc
-> pm_runtime_get_sync

imx_dsp_rproc_unprepare:
 ->pm_runtime_put_sync

There is no easy way to manually undo devm_ioremap_resource_wc so I have
sent a patch to use devm_ioremap_wc.

https://lore.kernel.org/imx/20251209140425.766742-1-daniel.baluta@nxp.com/T/#u

In your case Marek at least you need to understand which driver
reserves    8dc00000-8e7fffff : reserved and why.

thanks,
Daniel.
