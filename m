Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A50220B21F
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 08:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752223422; cv=none; b=ZqzUIiF73/ONmuglLNPQtXQNrwZr+uHSeq65PtXzHG0Zv3WXc02KuPSrwWgetY4gYqpfutyaFGDiyA3wdKt9TeT6iG9Ldc1udCTjn80AAHjknY9QoFFPoM26tKoLfEhpWuWZYur8fozbtmIFZMERa0R/T6NIWuRH48j+D4HC2og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752223422; c=relaxed/simple;
	bh=uHGMJA07ypF8Yz/ePKoO231Z6ORtct0fOPIuQmrfRBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHmkekj79T72ZMLXLOV3CcqtcTiQizL8HSlw/U4ZUoV88QTfJPQOK3fo/llr/rdnMzQ6M4Gt0/Utr7X64eUBjEAw8mXNgAiRAgUZLvJCYC6TMTqhO/pWPk+ptuOHqCOHMRxlWZ/K6T2NGpujRgETCUWf6jMhdPBfbgT6lz3QOpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=mKdXnCiZ; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="mKdXnCiZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=8Y8yX5xQMywwx2BGoeeybXxG1RrCPIPIZg9LEWNi+Ro=;
	b=mKdXnCiZUf47xRIbDuBBOxjfsin0f++eakr7LNJiHSWmspHUYDLbebDA0qS/kL
	RbCf5oo/221nhX+1BHS8NfcT0SFBIuLno0YnufWl1otMcqUaXj6lSblWPEkqCdNs
	RhgMy6gZfj1MA3zVputyRAp2JE4ylScqYni8SogkboY04=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXTwYnzHBog9pTAA--.57224S3;
	Fri, 11 Jul 2025 16:32:41 +0800 (CST)
Date: Fri, 11 Jul 2025 16:32:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/2] bus: imx-aipstz: allow creating pdevs for child buses
Message-ID: <aHDMJ2U6H88uN6ow@dragon>
References: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
 <20250707234628.164151-2-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707234628.164151-2-laurentiumihalcea111@gmail.com>
X-CM-TRANSID:Ms8vCgDXTwYnzHBog9pTAA--.57224S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFWfur4xXF13Gr48GF4xXrb_yoWkurgE9r
	10qFWkCr1rKwn3K3Zayr13urW093yUZFZ8Jr4vqrZIqa43tr9rJrs09r93ZF1UuFs7ZryU
	Jwnrtw4Y9r45ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8HUDJUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBmHZWhwjvrM-wAAsg

On Mon, Jul 07, 2025 at 07:46:27PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> devm_of_platform_populate() passes a NULL as the bus OF match table
> to the underlying of_platform_populate(), meaning child bus devices
> of the AIPSTZ bridge will not have its children devices created. Since
> some SoCs (e.g. i.MX8MP) use this particular setup (e.g. SPBA bus, which
> is a child of AIPSTZ5 and has multiple child nodes), the driver needs to
> support it.
> 
> Therefore, replace devm_of_platform_populate() with of_platform_populate()
> and pass a reference to the bus OF match table to it. For now, the only
> possible child buses are simple buses.
> 
> Since the usage of devres is dropped, the complementary operation of
> of_platform_populate() needs to be called during the driver's removal.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Fixes: 796cba2dd4d9 ("bus: add driver for IMX AIPSTZ bridge")
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/lkml/5029548.31r3eYUQgx@steina-w/#t

Applied this one, thanks!

