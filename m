Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B06149C6A
	for <imx@lists.linux.dev>; Sun,  3 Nov 2024 08:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730624207; cv=none; b=P5Cjb8ovETmM5d4HgcIWnmRqOofbJotiz4VOv8PkZNqIGInfYdhhj6yBhoejbE7UEDHKf72KL/0zL80djDkLsMfCicx9Apa/Wg+FxwJ7dDGwFQzvklzkhJEkKOBvv4j07j0Zc6WJkWXrKsXc2z95NwQFTw4lJu09p+kDdfvvUlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730624207; c=relaxed/simple;
	bh=kf2YSqFIkSaE2uUJ+UB5rQmrH03K2t4Fm2WbuEiZ+gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XaynZ8bBX4PSnYcntyV7oihG8TTEjQDfkbRvRqCd99VjwyOA1c+UFyig8p1E+RMiWJxZA2un7j7GqMs3sCwwodcUWOVLCdQMjfnsD5ZRPiyCNRg5mj3NYbkIihAIcTaGNhgwqoIalg25BLuhAt7elZUwqc/BVhiFAa5Er1Oeu+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Xd3pJv91; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Xd3pJv91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=8JTO3pXa6iKx5Hb/VSB98fJK/UCMUDuzcS6whwJ9WpM=;
	b=Xd3pJv91sb3iFpnuMZ4Z6yxTWRvSdC9/iFW/Rcrd8JrLd+4lqUsG5Qv+CX/4DY
	2TF1HEuRrc+ezfjKgo7E6ci2apbiIuhkM3ygZ5ig4RWiToeo7WvxvJevHcNYWsyF
	BoBy+GYRJdFNhKiau1xMYZKXGBzbCF/Tsux2HGxJKhQiQ=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBHo5K4Oidn1XaRAQ--.16068S3;
	Sun, 03 Nov 2024 16:56:26 +0800 (CST)
Date: Sun, 3 Nov 2024 16:56:24 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: imx8mm/imx8mp-verdin: add
 single-master property to all i2c nodes
Message-ID: <Zyc6uEcPys1On65L@dragon>
References: <20241025095915.22313-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025095915.22313-1-eichest@gmail.com>
X-CM-TRANSID:Mc8vCgBHo5K4Oidn1XaRAQ--.16068S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr1UJr4kXFW7tr45Jry8uFg_yoWxuFXEk3
	ZrKF1Ik3yYgFWrKw4Ut3ZrZr909rW8Wwnag342qFWSvr93Aan3CF9Yqryfu3WxXa1xJFsF
	kryxZ34SyFWUCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUn6nmtUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERiMZWcm9u9uJQAAsz

On Fri, Oct 25, 2024 at 11:58:01AM +0200, Stefan Eichenberger wrote:
> Add the single-master property to all i2c nodes on the iMX8MM and iMX8MP
> Verdin modules. This will allow us to use some single-master
> optimisations on the i2c driver. Together with the following series, now
> in the i2c-host branch of Andis tree, we get rid of a timeout problem on
> the i2c bus with a SMBus ADC:
> https://lore.kernel.org/all/7ts577rxed4mmfkfin7kfdjfjkb6iak2y4vtgtz6merwxkzz6w@h5aefbvyx44u/
> 
> Stefan Eichenberger (2):
>   arm64: dts: imx8mm-verdin: add single-master property to all i2c nodes
>   arm64: dts: imx8mp-verdin: add single-master property to all i2c nodes

Applied both, thanks!

