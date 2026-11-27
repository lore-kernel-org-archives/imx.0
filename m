Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778409;
	b=R8+PdaNpRz+6Oz1L/B435WNqV9X3aiBJkvo/JTerrnkUTufU02bMLnTMJcqAWGjvsAks
	 chllo73D365BdoggPb9BPHK6u+zoRCDlR3VuJJ/FyaSj1ltna9W3Ua2sPi80bk1SXdkZ3
	 dhJWPj/vhTCvCib5+dt6y6Dz4j03zxHWWjNHKg7DJ7lLhwzp78rqiM5SngxKqOOnKHeXZ
	 WcP7TB6YLR1h8ZLO49E7j+7be0bCYQANImsXWX7coCRrR6tfuhg5F4k9H8jXuFs5dubiE
	 dhLxaYv/YgaoVhNBGHWx9AFdcOpdO+aeA7fRn3KSYr7eY5EYhn4N+faRj4x3jMZSpVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778409;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=2ETb1QafyRI6/oHfjDrfqCfUkUUni7k0hQ6WfP0vU/8=;
	b=EfFEIw/icZacO9YsCh5wTJJa+UYSkouMRkuuedcHD9BdJHtfoTw/opmf/EUE8moNEfp/
	 H6Wpybp2MVZGlukYXRMPDnppE2BDfCcr2eYApsmQP/vbSisecE/nU5tFdfVUFb4bY3E+U
	 6CHR1EMw9ar8wNGlDQh0CXaKEd9ICVn0vfTtptJwMRITro5PZDPZ7+QA8k+wTB8x/3U7p
	 gIJtbUQU/OR6/z7eMQN15erg607wDsQ2EzTQBiIssu3ig3pRomoSXeDkZ/mBAvN85uvar
	 bpavPIp6AT5rRB2HrA1qOKOdBhgSlmebu90Xw9k7EhHK6O/g7Tt7qeX7TQRbGjlP4vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X3TTtCYE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B975606A31C;
	Fri, 27 Nov 2026 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X3TTtCYE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7A91F000C1;
	Fri, 27 Nov 2026 11:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795778408;
	bh=2ETb1QafyRI6/oHfjDrfqCfUkUUni7k0hQ6WfP0vU/8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=X3TTtCYEl/CNkWbszOL2/NTMFsJu73ACHXYum+HEh6WIPYXMg2ynyTzq+I8Cd4qOY
	 EOzIRa8w69HfAYLkkI22528BwZDYPEZvCdnWgzsrYySdtZSMd9BFPNHFdllshGY7Xl
	 0v+M0Ox7zmAQ8C610RyONIuZrWe4GrJgdJowCy+mF0zjfRZekmSS44aEeJ2OARFZ+V
	 fHoygLNWwMA5lI9B0pCf8Q5ocEYgCESOKLWFzT8kIZmq1CeI2Mu18Lp+5kngfoC5XL
	 pWGMUb9NdIhocvWFxtw0sBuV8KG7ogq2vvaAwBafk4pO7FE/HIyKMfWSfOEalQ1MDA
	 yBLOwW8BM+bkQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 717AB38003E0;
	Fri, 27 Nov 2026 11:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 net-next 0/9] net: dsa: netc: add PTP support for NETC
 switch
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179577840725.924205.8910316217595010398.git-patchwork-notify@kernel.org>
Date: Fri, 27 Nov 2026 11:20:07 +0000
References: <20261119030534.1892935-1-wei.fang@oss.nxp.com>
In-Reply-To: <20261119030534.1892935-1-wei.fang@oss.nxp.com>
To: Wei Fang (OSS) <wei.fang@oss.nxp.com>
Cc: xiaoning.wang@nxp.com, andrew@lunn.ch, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 richardcochran@gmail.com, linusw@kernel.org, linux@armlinux.org.uk,
 wei.fang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 19 Nov 2026 11:05:25 +0800 you wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> This patch set adds PTP timestamping support to the NETC switch, so that
> the switch ports can be used for IEEE 1588 PTP synchronization.
> 
> The NETC switch has no time registers of its own and instead shares the
> PTP time of the NETC Timer, which is a separate PCIe function driven by
> its own driver. The first 3 patches prepare the Timer driver for this
> role: tidy up its 64-bit register access, drop an ineffective reset, and
> export netc_timer_get_current_time() so the switch driver can read the
> current PTP time across the driver boundary in a race-free way.
> 
> [...]

Here is the summary with links:
  - [v8,net-next,1/9] ptp: netc: use ioread64_lo_hi/iowrite64_lo_hi for 64-bit register access
    https://git.kernel.org/netdev/net-next/c/1f1bfb52b44b
  - [v8,net-next,2/9] ptp: netc: remove unnecessary pcie_flr() call in probe
    https://git.kernel.org/netdev/net-next/c/0dd839917efe
  - [v8,net-next,3/9] ptp: netc: export netc_timer_get_current_time() for cross-driver use
    https://git.kernel.org/netdev/net-next/c/9b844ef56d60
  - [v8,net-next,4/9] net: dsa: netc: tie setup resources and reset to DSA setup/teardown
    https://git.kernel.org/netdev/net-next/c/f320f1e55e65
  - [v8,net-next,5/9] net: dsa: netc: use entry ID instead of pointer to track host flood rule
    https://git.kernel.org/netdev/net-next/c/bc6680acf83a
  - [v8,net-next,6/9] net: dsa: netc: check return value of ntmp_ipft_delete_entry()
    https://git.kernel.org/netdev/net-next/c/585b422eaa71
  - [v8,net-next,7/9] net: dsa: netc: enable ingress port filtering lookup by default
    https://git.kernel.org/netdev/net-next/c/26b51309ef3d
  - [v8,net-next,8/9] net: dsa: netc: add PTP two-step timestamping support
    https://git.kernel.org/netdev/net-next/c/d2c3f304034e
  - [v8,net-next,9/9] net: dsa: netc: add PTP one-step timestamping support
    https://git.kernel.org/netdev/net-next/c/8b5aba6d328e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


