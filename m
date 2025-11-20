Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AA2368267;
	Thu, 20 Nov 2025 17:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658708; cv=none; b=SHxaKzJZe3JPmUHCmfcyVWASX5YMqS4/ViQ5EGqYO7+mL4KaUclCGTYFABFxKRHhWODWQnug1mPfyVVVRqy+4cbEOXWGVYbob1WnMftuIH77hXdmtyPAXVo1uk4EWx3K8wjHzn9nvvHQMmgL4T89N8SfsK7EiNdkwLZr8eoLxl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658708; c=relaxed/simple;
	bh=PD7zSy2DUzt2FkGyp5vvTIfvxYWDS94+zaKXi5No4Fo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TDG48CeKwDHxvBvZwUKM203CE5T7v34lC+UrNNNcQFTbqYp5kEV9FKJSexJ8ZxzHGAs1/DLPiqNX24Z/h5FZJZjfxLvwzEzY9FXeNsns2owlaF0bOzQ7eIvpRigF4rO+KNYmagB1dri9SV4QclIK3Di1BEy0bf0fRcgMAB+ntdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQjUp6y7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQjUp6y7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F7AC4CEF1;
	Thu, 20 Nov 2025 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658707;
	bh=PD7zSy2DUzt2FkGyp5vvTIfvxYWDS94+zaKXi5No4Fo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LQjUp6y75EqXNoORw6oxhq6T08GscOn2QsFBGxshNyIY/1gtHAkhuCx18Ogb9GLV7
	 hHsuv4/ygKSS3dtdnalT0T3btoDv6nNXDWYZ418c8bC6EwJLU+xeXOdcSPJXFOghMi
	 cagm4XcnQ4JkXTmN4pHmgpqVN8r841R73APmwsGeQQH8fOFvMAGpe08kGwSuRh7VJp
	 CwlPrBeBmTV7gf4NyV+UaejxlOBkvq95+/Oe5UKGierCP16V/otGTTssQyu7W+OrC3
	 4yEdBin+OH8Y4HnstUoz9m/1vVKLX9sr5cOgKK4X+1RIiL4cArynyRGJbg4fA7kF8o
	 5P0/Q3WH8gnjw==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.li@nxp.com, kishon@kernel.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250925013806.569658-1-xiaolei.wang@windriver.com>
References: <20250925013806.569658-1-xiaolei.wang@windriver.com>
Subject: Re: [PATCH v2] phy: freescale: Initialize priv->lock
Message-Id: <176365870435.207696.4457416829154592287.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 22:41:44 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 25 Sep 2025 09:38:06 +0800, Xiaolei Wang wrote:
> Initialize priv->lock to fix the following warning.
> 
> WARNING: CPU: 0 PID: 12 at kernel/locking/mutex.c:577 __mutex_lock+0x70c/0x8b8
>  Modules linked in:
>  Hardware name: Freescale i.MX8QM MEK (DT)
>  Call trace:
>   __mutex_lock+0x70c/0x8b8 (P)
>   mutex_lock_nested+0x24/0x30
>   imx_hsio_power_on+0x4c/0x764
>   phy_power_on+0x7c/0x12c
>   imx_pcie_host_init+0x1d0/0x4d4
>   dw_pcie_host_init+0x188/0x4b0
>   imx_pcie_probe+0x324/0x6f4
>   platform_probe+0x5c/0x98
>   really_probe+0xbc/0x29c
>   __driver_probe_device+0x78/0x12c
>   driver_probe_device+0xd8/0x160
>   __device_attach_driver+0xb8/0x138
>   bus_for_each_drv+0x84/0xe4
>   __device_attach_async_helper+0xb8/0xdc
>   async_run_entry_fn+0x34/0xe0
>   process_one_work+0x220/0x694
>   worker_thread+0x1c0/0x36c
>   kthread+0x14c/0x224
> 
> [...]

Applied, thanks!

[1/1] phy: freescale: Initialize priv->lock
      commit: 95e5905698983df94069e185f9eb3c67c7cf75d5

Best regards,
-- 
~Vinod


