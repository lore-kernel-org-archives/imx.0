Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19814248DC
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 08:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634569; cv=none; b=Zfl0ludhz0ThQd5rnE4xKqTroUMJ3gEp+ZBDgm4fi/6FsKOCR9W5z7wf5//nNL7VBTfw6lkWDsLnr3ojDiJvQIdn/YeK3I7hz9zJ2L1JcCXInq/aB8vMMQlQqyMXxaQ8f/NCq9C/W/QXIO0TeUu3LE5fr9QiW4H65yRi2x+1CnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634569; c=relaxed/simple;
	bh=nVMG1SbekNaLvNRQlQ39Yo+Gy2z6qKasZ304GKCy2GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Em1zZqvxe9mOCdVGtuUyhKCnJ98pshhj8KAf8JD71IsdbdLlqjGwa15gKL9g0nUY+smD0feT/WqHHoRSUhJC+xblsocH7/7D0yer5lKi+C9uJiAd9OUVLwVvFS2NwT8Ok7ZQ6KNFoPysWw28IozxdJvSffsEeiGzlnHcHT0NPOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qI5Vi51K; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qI5Vi51K"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so4265425e9.1
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 01:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789634555; x=1790239355; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qhnvHXmqUmnS9g4y5J7KmcXx39UVV4BRbHPaDoXYC7Y=;
        b=qI5Vi51KU1GmXtKRCxBV8u/BKIzeFMxy0S4CGUn5XiuwQ5Odwjlb+lpYIkK4SWykR/
         2izMXBmLLCfbo4+9sPXO7Y3vTBeJ9m3fAES+hGst8cwDdacqsnaDzPaRxXMObyS5n0xp
         klHTiRH0fvc+oGyTPopBgXAiPJFyRoraUviH3hGg4wziOAMgjoR/hs3TGdRxfUSxR5EI
         CHWlPoK8k/ZWVciyvq+S9YBtXbwKVqXlEElo/qeNc+yS4a/oRKcpkvT3l6AdqmhdgOgx
         ZkpevbfrRfyj2CyjAM+13MpWQD6S5V3aCjuPVDKW5svaTI5lC7DJM7v0CkbmZ0Dtd7VL
         zapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789634555; x=1790239355;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhnvHXmqUmnS9g4y5J7KmcXx39UVV4BRbHPaDoXYC7Y=;
        b=MO/k/ORtYDtRINPtOG/a7zpsThJ2mZ0/l5dfS7SztX/qfvBNugPeR2Xgr/xG1xBT41
         rgQiqSVg3Z+AO5IeW4KfGxww3OyMlSgt2Fs4Cd9uskCmq1xtZTm95UTnOv3STKTYKRtr
         Ipl0ITnIzPEqlIGLbpJdSEiOoXiRZldmtgSpg0TpnEGZYbL8P1cHVbReWfLHq1jUnjoz
         FkWydTF71MpaVjxZvwlS+oAJ2r8ak6IVHlZDx0rQwt46sn4IGtd+0FSprHR0ImgY0KbN
         a+iJuL/yTmeTj3Cc2YacivX7MibyzR+WVt/xekBJRERj3lwfj1mPYblgEbsZQ7OnVXrW
         lOtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqoMbe/2a0buT24v5894tE0VR5wOMzJWoI5qx5hLn3dGiQie3QNdDeo1eoIvvP/bl2YNc=@lists.linux.dev
X-Gm-Message-State: AFuF++kwtzpUBHk1z62T/66fsXb2L9vNBduONwwDL8VQSqMCm7ASU+2+
	rQpoRj7jfRU//Llvo62DhquIBJmAKviJe792LfbwSJLz7nF4LHYmD36s
X-Gm-Gg: AYBFou3aoi5iXQgeByHDmjv9WTPyG/SaHNyve3EKjSWWy+t15v9CI+ikx4VmFr4Rq+6
	Q5rWzPtBhlgP7ojR7EE0C4UYe3l+U90zIQyVi5+JywsVqFIWrc3lHDf4vtu5hme1ua/jdtoIXhz
	WXdlCGC1WCOO8f/GtyZDjS86x5WkQiJpBUrmzA4dm2aFI3Phioffr9BvcNPeHWNSeFfZrmunYvF
	ICb2YF6yPdhciKRwOPCUTo2znGhnRZrOdZ8HX8xlh2M2U0x3gxmbhcGWX/A1mQ0q6/asnjQw2T9
	EF31Zwcc8bqfZ27ln4HEf9Lvb3e7EbzbSUTVrhprHOOu51bXUiiMSWVxlNtaZfOnBVrHfKkoFJ/
	kdLswHeBucWajSUX8xkaGuMa/AX7VeUzmfqzmZgPqy9buQXOMJaoiyNYY+Einj7lP3gkgOa3TJm
	DdVnIQCBIuKfMu6BtDfug0oHxW4bwhLEOKWDwZzr+L30OqvtoCS4CHg1jtac3GDGBbDj+zDd49D
	noP2JwCsfd1Ih/Ip5Vfp1xnSSoRFpsOom73KEPoxDnwHhPdk5E4WiDLI8WxOxmA8j1+HR6EJ558
	QBo2Jbr7NWoXZvf0pfrBWXQs/5NehGCepWLnrMpexOiqa4A7UA403EQhKu8I5GkYEAPnIKslhZl
	8bA7RUufIzX0+Biy7DKf9uV/tjsWrvSuCS0sdWBnLzTVUuIkRuJftbP8vQ1IsXCmeuMTfrkr+4B
	gYpci7YUuCbzLYpqI=
X-Received: by 2002:a05:600d:6446:10b0:49f:bc43:9e8e with SMTP id 5b1f17b1804b1-49fbc439f6dmr34380115e9.26.1789634555063;
        Thu, 17 Sep 2026 01:42:35 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1d0978sm56898145e9.2.2026.09.17.01.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:42:34 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:42:33 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng
 Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Frank
 Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: imx: add missing
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <20260917104233.00007a85@gmail.com>
In-Reply-To: <20260917102429.00002faf@gmail.com>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
	<aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
	<aqq_ymTi1I951uQp@SMW015318>
	<20260917102429.00002faf@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 10:24:29 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> On Wed, 16 Sep 2026 11:11:54 -0500
> Frank Li <Frank.li@oss.nxp.com> wrote:
> 
> > On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:  
> > > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:    
> > > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > > on teardown or error, causing potential resource leaks. This series adds
> > > > the missing calls.    
> > >
> > > No, as I've explained repeatedly elsewhere, it does not cause any
> > > resource leaks. [1][2]
> > >
> > > The autosuspend setting leaks if you will, but that only matters in the
> > > theoretical corner case of someone rebinding a different driver (which
> > > will soon also taint the kernel).
> > >
> > > So don't exaggerate the impact, this is essentially just a cleanup,
> > > which is fine in itself.    
> > 
> > Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> > include these pair functions.
> > 
> > I get many similar patches since scan tools is more powerful now.  
> 
> I suppose that could work. One would still have to scrub the kernel of legacy
> use/dont_use_autosuspend() calls though, so it could end up being a large
> patchset.
> 

On second thought, some drivers do tend to disable PM runtime system sleep
etc. so it probably isn't as simple as adding the autosuspend stuff to
enable/disable.

-- 
Kind regards,
Joshua Crofts
