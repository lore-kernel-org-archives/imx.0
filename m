Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7072DA77E;
	Tue, 23 Dec 2025 17:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766511233; cv=none; b=eAPcctyhmPp+dzGJFSe1TkhfVtvgy+aNLY+/S+Kg07LlaQ3JL/iNVNFMcl4Ru9DqYoj6FMa81gyGLqEOFF3FpdxLIV50ngwAcEJnNdr3IXB9ddAapKFa6XFPBFoVAiE7r7sNfuezXlNni9r7t4Gc9wOdaV3H26xMB0yJC/oKq7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766511233; c=relaxed/simple;
	bh=140O8L5hM3fV6uRa6W72nPSfVxzYilOZdhot67zls6Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VAF//ihMfhD7qIqfhjHkcFkjrOe3ZlE6ikZKj0az10BOoS6HSAz0LsDOOp3hWovNwvxfvteJjcLdE0CT7NEQDpC1v4aEUwQFN8wEkRE2K/ApG2R+9r3+NSDwWaaCRykuYUIea8Xam5ofFYR4b50+6Livx+ntmF1FBTefWGmcplY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkM7e3Ww; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkM7e3Ww"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC800C116B1;
	Tue, 23 Dec 2025 17:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511233;
	bh=140O8L5hM3fV6uRa6W72nPSfVxzYilOZdhot67zls6Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XkM7e3WwLaqz9w+fcEgZBhDJvS3gmHjYchmNJke4L7G94gIVkg0HOONmz1+QY0sp3
	 EAV84wghcCUpYTeigcm7ELp5Bpj7FGVRs1Pf6OyguBUZDcZHplMreBxUTelJwM5/Gm
	 516D/Ytw6rXhKqLsoXZBuTk63wodgYoZqJPhXzRja6GdhqTfqNpl6i+PNyQ1/ndkCV
	 3cOWw2bTsybsYdPzQ5uJKNjY5hblVL2FIDZhfuO0tVql3P9ld9S49AKnNSK9bTRMy6
	 S8SXjkfKZlskuIX+tCHCudBZUkMyYltQsGKsasbqVZIEwRgFKu4u+aMe2KrwDJkZ3D
	 oAK/huBecBTEA==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, j.zink@pengutronix.de, 
 linux-kernel@vger.kernel.org, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: xu.yang_2@nxp.com, jun.li@nxp.com, Frank.Li@nxp.com, haibo.chen@nxp.com, 
 linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 Stefano Radaelli <stefano.r@variscite.com>, 
 Leonid Segal <leonids@variscite.com>, 
 Pierluigi Passaro <pierluigi.p@variscite.com>
In-Reply-To: <20251219160912.561431-1-stefano.r@variscite.com>
References: <20251219160912.561431-1-stefano.r@variscite.com>
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: Clear the PCS_TX_SWING_FULL
 field before using it
Message-Id: <176651122841.749296.2874068673012798981.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:03:48 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 19 Dec 2025 17:09:12 +0100, Stefano Radaelli wrote:
> Clear the PCS_TX_SWING_FULL field mask before setting the new value
> in PHY_CTRL5 register. Without clearing the mask first, the OR operation
> could leave previously set bits, resulting in incorrect register
> configuration.
> 
> 

Applied, thanks!

[1/1] phy: fsl-imx8mq-usb: Clear the PCS_TX_SWING_FULL field before using it
      commit: 8becf9179a4b45104a1701010ed666b55bf4b3a6

Best regards,
-- 
~Vinod


