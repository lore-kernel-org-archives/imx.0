Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5053A4F36;
	Wed, 21 Jan 2026 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985524; cv=none; b=hJlSLyiSPTvD/MG3XC9d0pDeubaUyC4JHHvnkYk6zeAEeQOQ2xEtLp8JS9CBn3FoymYWUVaoKppM/BeH7755qL6Wu4vKm3KQV5oFPQoR32i/XlZu/VbAJmhtXSZGXVQLggaEp93uPTP88s3Tsa2OEE04A3AbRW5GHZo+WRZJDxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985524; c=relaxed/simple;
	bh=F1Divp1iQY//EJAcHECb5Zq6njuhGj6QCZPRtvomuos=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FaBB+D+USql5Bjb0y8/2IFAD4+vQyNcal7CRa0AnRTC2UBQr/1pVi1M/NSdrM4dZ/HzdBTO3WtHFU2xY0ZLs98jhmYrj+JciFVU3PfBOwJYmYxJKuUookaDgXKXByQ52MFyBNijmr4bJJr4uAGieo4QHUk6hK6WUPsv8gvOg+b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2kwRGzN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2kwRGzN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BF3C19422;
	Wed, 21 Jan 2026 08:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768985522;
	bh=F1Divp1iQY//EJAcHECb5Zq6njuhGj6QCZPRtvomuos=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K2kwRGzN/ESMFFKtDbdSUFHEEU40g+DCA+1adBQDQ4LhGJMkcHUYGuj4MkJgbZU48
	 iV1Dc5vP1Z9cmV36iVX9IsT1peRrN8S6ErRA3EQbs3rugPzZhLRInhGItipFaQQTP1
	 DtZIYNna2JEtlt/G6cao+uty5J/JGN2qeU8LM6sxJYMwfpWEVwfUwf0qDS604GDtIK
	 ZKUTo+0uaDYeeTucqB/JY90xGUX8I6s77+SexDrOP3SUpfqOz5Ulr40tk/0+yXyU1Q
	 x18nsPTY/6XU8QOvh+gLVtc/Ur2XtMEhNVFma7Vo0YUlV3nBvmr1zsMcUMjKyRn+VB
	 9rV7oL2A6u0lg==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de, 
 festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, 
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260120111712.3159782-1-xu.yang_2@nxp.com>
References: <20260120111712.3159782-1-xu.yang_2@nxp.com>
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: disable bind/unbind platform
 driver feature
Message-Id: <176898551703.1268719.2573998309118426062.b4-ty@kernel.org>
Date: Wed, 21 Jan 2026 14:21:57 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 20 Jan 2026 19:17:12 +0800, Xu Yang wrote:
> Disabling PHYs in runtime usually causes the client with external abort
> exception or similar issue due to lack of API to notify clients about PHY
> removal. This patch removes the possibility to unbind i.MX PHY drivers in
> runtime.
> 
> 

Applied, thanks!

[1/1] phy: fsl-imx8mq-usb: disable bind/unbind platform driver feature
      commit: 27ee0869d77b2cb404770ac49bdceae3aedf658b

Best regards,
-- 
~Vinod


