Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD07216E26
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 08:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755851236; cv=none; b=VZs3YCMuAQDv8IBU7Rz4zFdqQbnX/WoowJCI0AdAA4gu11pJLn0a7gPFNdip1zf5hcNLTa43P5T1MSVeipQ74b1gf0ktqwzqhi1NJaeHrfaV5CTYi9Muh4/ex2rHSZzasmD5CodJmU/yf7L2w3c5EeqGCxnf2faZF02e0MwMgL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755851236; c=relaxed/simple;
	bh=thenpvWiSLNDmB4c+x2qmtcODgkESbbw9ot/N9LrtU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uyoxc8njyOZZ/Ftajqu1RknIj/CXNXukDzQ3I2rkAfz/mMFJLgMwyiD+hQ5myUwtYwHAmw/Z3f5mCps2saNX3pt05SqFkZnZjRSeIzF0wkJTfxQX9/KwmDAdC0Agz2a5MaMzO4RL+xPFAoMrL6OUEqcagZQEHV4Eunmt4do9klI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=AnWz0oyJ; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="AnWz0oyJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=xnNoai/6WE+/YlaBeq11xGUrY7PQToHaLx/C4M43Y8c=;
	b=AnWz0oyJz8V/4sZx9Iaz7D0/y3nOogBQQJdsf0NZtHCIHCQjvhHFLHlGeeePh6
	owD6fhuEK+5uCgRf3JXUn+wtHRgi8D4D20Er0tyH02+421ETvx5fHyeWi2dJh5Ae
	0IroioHDWG0gcmTOv1ICe7kRNAB9+rEkKaNxsEuoohghM=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnBYvDKahoGlEVAw--.10154S3;
	Fri, 22 Aug 2025 16:26:45 +0800 (CST)
Date: Fri, 22 Aug 2025 16:26:43 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: mbrugger@suse.com, chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, s32@nxp.com, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] Add the STM and the SWT nodes for the s32g2 and
 s32g3
Message-ID: <aKgpwzqlmK71Guio@dragon>
References: <20250731140146.62960-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731140146.62960-1-daniel.lezcano@linaro.org>
X-CM-TRANSID:M88vCgDnBYvDKahoGlEVAw--.10154S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwg4SUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAW-JWioKcXcnAAA3H

On Thu, Jul 31, 2025 at 04:01:33PM +0200, Daniel Lezcano wrote:
> Daniel Lezcano (8):
>   arm64: dts: s32g2: Add the System Timer Module nodes
>   arm64: dts: s32g274-rd2: Enable the STM timers
>   arm64: dts: s32g3: Add the System Timer Module nodes
>   arm64: dts: s32g399a-rdb3: Enable the STM timers
>   arm64: dts: s32g2: Add the Software Timer Watchdog (SWT) nodes
>   arm64: dts: s32g274-rd2: Enable the SWT watchdog
>   arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) nodes
>   arm64: dts: s32g399a-rdb3: Enable the SWT watchdog

Applied all, thanks!

