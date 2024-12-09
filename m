Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867BA1BC4E
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733735514; cv=none; b=e8ObZ+wsHr93+2gJCJ3j7G4ypJGQAEZWWpTjQ1GhOHWOXREsb4XXzi0Y0QfDOLTShHaNJ6QfMGCoCGE6jVgziXwt8MiNLVqnUOL8xwziibljB60phVa/JDqzYsIhux0YWyZSt9vt4c/gEaI8hfnhfeg/7prfkAqzSplHm9+8nyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733735514; c=relaxed/simple;
	bh=THySfj94iqMosY1olRs08xVkuR/A+URSyqRNUOJ998Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCyd8gwzeI8gw5bSOYK/sVrj3FtU3kJRMujvyVjecXmT43uv8aPR2RdbM1aQ4KyKxIb/zJfBlZHO69m8RDh0hcbnavJdGVXOhCYas55pUiZ77nDesWy0/6/ZZMZYWHJyXuRMR2A8Z4lr2Xrf+nbwpUqXqkVVwn37dxbCyBEo9sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=MZ8/j1oE; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="MZ8/j1oE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=67tvmmn9OuQWrMC+HWaoLNhCgYmT8MPFGmX2K5RtNBA=;
	b=MZ8/j1oE5cQRVGjm7bWOLx/KOgKTwAVpmJtNPLX8wxeoe/pbrNLSgSvhgSDtKb
	p4u1fvTJfUV4n3sxw8STx6Chu4oCFQ0XoZrpF8lfCesg2UpEWWQxXNwVjTvAOMo4
	Kkc/O2zZDuTGikxmI7/Syu0mSaJGR0tyFxvIQqyj9n/p4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHjwUttFZnkWp7BA--.46698S3;
	Mon, 09 Dec 2024 17:11:11 +0800 (CST)
Date: Mon, 9 Dec 2024 17:11:09 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?iso-8859-1?Q?Jo=E3o?= Rodrigues <jrodrigues@ubimet.com>,
	Bruno Thomsen <bruno.thomsen@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] TQMa7x DT cleanup
Message-ID: <Z1a0Lc+N+J3PGnH7@dragon>
References: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgAHjwUttFZnkWp7BA--.46698S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruryxXr43WryfKFyfXr43ZFb_yoW3uFb_uw
	15Wa1DZ347Xr4fCw10gwnI9rZ5Ary5Xw4DKFy5Wa9xWr1a9F13GFyfJ34a9FyxXasIgw1D
	Jr1DZ3W7ZF9FkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0xu4UUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhOwZWdWoWNcVAAAsv

On Fri, Nov 08, 2024 at 02:49:18PM +0100, Alexander Stein wrote:
> Hi all,
> 
> this series fixes some DT binding check warnings as well as removing
> duplicated nodes. Eventually IRQ support for thernet PHYs was added.
> Additionally add CONFIG_JC42 to imx_v6_v7_defconfig.
> 
> Best regards,
> Alexander
> 
> Alexander Stein (8):
>   ARM: dts: imx7-mba7: remove LVDS transmitter regulator
>   ARM: dts: imx7-tqma7: Remove superfluous status="okay" property
>   ARM: dts: imx7-tqma7: add missing vs-supply for LM75A (rev. 01xxx)
>   ARM: dts: imx7-mba7: Add 3.3V and 5.0V regulators
>   ARM: dts: imx7-mba7: Fix SD card vmmc-supply
>   ARM: dts: imx7-mba7: Remove duplicated power supply
>   ARM: dts: imx7[d]-mba7: add Ethernet PHY IRQ support
>   ARM: imx_v6_v7_defconfig: enable JC42 for TQMa7x

Applied all, thanks!

