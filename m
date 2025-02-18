Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FDA22D7B1
	for <imx@lists.linux.dev>; Tue, 18 Feb 2025 09:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739872376; cv=none; b=BV0iyTMG9wT3SpRQOBx4mZj8YBg9kWErVysmZYIe0UpdoLzLcaG1IuPD7xF86ijHBwn6GXSQu1VcB2/9XQk9IwVe3WY6+iu8pYJFsk3B30kSAFbzIOHxvU3pofOVtO6riPOruEkUBuGcP/0z37pZMJvpxcsisrC75phNQdVCf+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739872376; c=relaxed/simple;
	bh=h+2PNpWdm302meQLu62UOxtxhiKhPwOHpiRCly9oUCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=koFPEC8Ak6w9rMHWWJQYnsWRrud0LeS4/9p47LY2ncQP5pCdd48o8gHYjKisl2lg8v+ssFpNEQkXYP1Tdxnp8BXfb6iTAHfz/DaC/RvcKvQtop+AncKLYiI1ZUSwRiuI+ON6CpAdscr2aRjgRokrlY2Yz8EVEzQVFecdg7FZOr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=N5zQMtti; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="N5zQMtti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=alsVGP82I8tUPKjw6ZLez29MzizoXC6KfuvyinlS+/4=;
	b=N5zQMtti6LqtMCrUtZFWLRifSuyRdSq9eUreMR1Y+Nib9dyJtawrjwWt23acGj
	15+xFh2eZH73lC3RLBFpVlRo5nzw8QGSZWvD1iXBUg0mxiXnpU+noyFNirFZ9kT2
	+zHn1d2pPwmFQ5YuVCWmy70Z/Ju7lYlijete4/UdU/Z+I=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBXDlplWLRnXD06CQ--.18498S3;
	Tue, 18 Feb 2025 17:52:39 +0800 (CST)
Date: Tue, 18 Feb 2025 17:52:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, max.krummenacher@toradex.com,
	francesco.dolcini@toradex.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] ARM: dts: imx6qdl-apalis: Fix poweroff on Apalis iMX6
Message-ID: <Z7RYZbBagvnMdy0i@dragon>
References: <20250110151846.214234-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110151846.214234-1-eichest@gmail.com>
X-CM-TRANSID:Mc8vCgBXDlplWLRnXD06CQ--.18498S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF1xZr4ruF4xZFWUuryUJrb_yoW3CFc_Ga
	48CF1xJw4fGF4UCw1qkF4a9r1S93y7Jr47XrZ2gFWav343Awn5AF1ktFy8Zr17J3yfZFWD
	Was8JwsrAF1fujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8H5lUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhL3ZWe0S-IzFwAAsc

On Fri, Jan 10, 2025 at 04:18:29PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> The current solution for powering off the Apalis iMX6 is not functioning
> as intended. To resolve this, it is necessary to power off the
> vgen2_reg, which will also set the POWER_ENABLE_MOCI signal to a low
> state. This ensures the carrier board is properly informed to initiate
> its power-off sequence.
> 
> The new solution uses the regulator-poweroff driver, which will power
> off the regulator during a system shutdown.
> 
> CC: stable@vger.kernel.org
> Fixes: 4eb56e26f92e ("ARM: dts: imx6q-apalis: Command pmic to standby for poweroff")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Applied, thanks!

