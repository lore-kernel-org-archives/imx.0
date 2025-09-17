Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABE7143756
	for <imx@lists.linux.dev>; Wed, 17 Sep 2025 10:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758106038; cv=none; b=lTbVQRBxidN5n79Dakx130sVvmYYi38BgyPBr7D/SNjlRWjIDLtctnnVvU0fnYuY7gcDl4jsHbxqXTUzgYJxXQK1Z3B9eD0gztXQB/W+pBLIQB8Ld/iQnHwKouf6DMGvPZfnU6X6CXxyByj5zpOL/XJmwg97g5fFEzJZHMKJHWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758106038; c=relaxed/simple;
	bh=VRLwGUcuRKvY24Qe4T2v4d9v5n56AV4gdzIOLjHFicE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s20OXuHlPQZOQ37UvqCZru6i1ah+7WWUne68PsR2EMiJpuUcCwXSjSVduFBROwzcOy6xP1Dj4/OULKgAT+i2fkrFLeWhZ2+sWbUm8X0gIMm674txUH3mCRr9+L+1hLkHnGL3qjyDShKDtIBjqR3helhW+Jd1ctrqXpHof2F8wMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KfJ5e/O/; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KfJ5e/O/"
Message-ID: <8994414a-07f3-425f-8b76-5d433ff4716f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758106034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qXvN9zguKxTNFj65lLAAK90IdwxrcqN9SiKarg0zXno=;
	b=KfJ5e/O/KhKd96q2i3CAATfQT+IfK9EVuUHgX0Z5dZ481iRGJUY44exufBYubXLTvzBiNh
	l5d4JlA78FXiKiXE/mCPN59mc3sKv5AfBv5LoHluHdhxobYquAyXEbpVVYn4l5+z4YFuXM
	dJ2MC06zispZ469q84bmL7MfxZ2fB7c=
Date: Wed, 17 Sep 2025 11:47:08 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 2/2] ptp: rework ptp_clock_unregister() to
 disable events
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Richard Cochran <richardcochran@gmail.com>
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Clark Wang <xiaoning.wang@nxp.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, Eric Dumazet <edumazet@google.com>,
 imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, netdev@vger.kernel.org,
 Nick Shi <nick.shi@broadcom.com>, Paolo Abeni <pabeni@redhat.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 Yangbo Lu <yangbo.lu@nxp.com>
References: <aMnYIu7RbgfXrmGx@shell.armlinux.org.uk>
 <E1uydLH-000000061DM-2gcV@rmk-PC.armlinux.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <E1uydLH-000000061DM-2gcV@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 16/09/2025 22:36, Russell King (Oracle) wrote:
> The ordering of ptp_clock_unregister() is not ideal, as the chardev
> remains published while state is being torn down, which means userspace
> can race with the kernel teardown. There is also no cleanup of enabled
> pin settings nor of the internal PPS event, which means enabled events
> can still forward into the core, dereferencing a free'd pointer.
> 
> Rework the ordering of cleanup in ptp_clock_unregister() so that we
> unpublish the posix clock (and user chardev), disable any pins that
> have EXTTS events enabled, disable the PPS event, and then clean up
> the aux work and PPS source.
> 
> This avoids potential use-after-free and races in PTP clock driver
> teardown.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Now LGTM, shouldn't break our use-case, thanks!

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
