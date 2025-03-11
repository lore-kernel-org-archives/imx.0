Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E301E47DD
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 02:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741661943; cv=none; b=O6f90l0E/VkDxUbw0Q1TQCNda35HVSVQLm6C00XFrnNKoYaZDmT4FOGnxs2lttWSXp1PQr7+d09BpgfotZ9zuXVs/BrLW1AnuUwLQ0+hXgdkkdUm5glDs2J78XCfJ3RbibjgqTJ53JKzxwJJ6d0eqJY87ePXjYC8shlSJxBdW/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741661943; c=relaxed/simple;
	bh=FU1Fda26sF6aIGkPyt3zuGoD7LdpQPSS+hCtJJEfPm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuBop8HhzA+FpsQVw01vmB8987O0cnvLwD6CRNGUCcj+WLrB1MTmSw0tSsUPpQap4xiEAd5LV6q+0McaPfN+sMcdLowfPupiXzf6On0E1HUPlVwU8P2F+gAzphMQUbc0GmOOfIoOLSnmZv8hpE446qMHH5Xma5D1KSZSpewQJsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=mZnOCRZQ; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="mZnOCRZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=GSR8BTfCX9kMB6qOH0+UvwaxFfvP+jyFvyHmy/gj9gE=;
	b=mZnOCRZQXcVe3qU42I6laEGda6LowRCDbbqby/VYSPkoIP7nfG6xvzU/5Jqa6z
	pRCqMJYTRfo35c3f5zV+o/9Rtii1wOF3p/1FvJciRnfLqV26vVOhM21mslRJvhB4
	Yt4vHL4RM0M1NetSflvuDl68Ia94puFgxeiaoP6+yAvgc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBnGk7Fps9n5JGvAA--.954S3;
	Tue, 11 Mar 2025 10:58:14 +0800 (CST)
Date: Tue, 11 Mar 2025 10:58:12 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, soc@linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: imx: mark imx53_suspend_sz as unused
Message-ID: <Z8+mxDdvtak/3SRs@dragon>
References: <20250225201157.4190864-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225201157.4190864-1-arnd@kernel.org>
X-CM-TRANSID:M88vCgBnGk7Fps9n5JGvAA--.954S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFyDGF4DWw1DAr18Zr4fKrg_yoWxtwcE9a
	yrtw1xAr1fJr9Igw17Jan0yr40g3yDurn8Z34rJ3WakFyj9FZrZ3y8t34kX39agr42k3Wx
	GF9Iqw1fCrZ5CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU00PfJUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBUNZWfPoGYkbQAAse

On Tue, Feb 25, 2025 at 09:11:52PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Unused 'static const' variables cause a warning when building with
> W=1, and imx53_suspend_sz has a definition for this as an
> alternative when CONFIG_SUSPEND is disabled:
> 
>     In file included from arch/arm/mach-imx/cpu.c:9:
>     arch/arm/mach-imx/common.h:101:18: error: 'imx53_suspend_sz' defined but not used [-Werror=unused-const-variable=]
> 
> It's still referenced though, so mark it as __maybe_unused, so
> the one user can address the dummy copy and other files that include
> the header don't produce a warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks!

