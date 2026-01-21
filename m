Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C688644A727;
	Wed, 21 Jan 2026 08:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985527; cv=none; b=judiIta9YsTM2mbws0aWkxhxQnaAM1TXmvpUSQOhVc8WJlfGu+pAk1tgWb912TAiqQA4bYqBlBBnQ85cTh/PXaF4zbQmdpTZwIj/Rh5g6AVXAngCHoeYswCKJ8a6cEjFs5pdkyCMOxFoi5nxhRh7wcUFcf+QnHgAD3iwwh8PHIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985527; c=relaxed/simple;
	bh=a7GuYbQi91bFNi5fdQT6m/29FoHbwePMR8kcPjdcIK4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d+Nb0sMg1mIApMbdD9eEL0U2LIo+nAmV4qWLtdBWhprliuzhXq9o0j4Nb+TTeeJfGhQOPm9NU//RCi7anmBiUYtWE1NjBL2xEqhdlzn+hMoE7tnfucXpKxDj0V0VQNEg+wDkG9L2Vs2RdSA91fP5oIyKJ/dYOPj9PJdgn0uiHiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0swohfI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0swohfI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC87C2BCAF;
	Wed, 21 Jan 2026 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768985527;
	bh=a7GuYbQi91bFNi5fdQT6m/29FoHbwePMR8kcPjdcIK4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=D0swohfIYZ4NCVOzsmpT65ziy1qTE6oACqwGoPsD75BpvF1uAmkymFcTrCXkOLYft
	 zw2PeCOEOy0MJiYARFYbClrl8n1kvB+aXsBXDmhgst63tEAM+UIOAUpMDmkEww9KwG
	 g8OACrw0yG3Bg3v1jSJqImuBIuOsTrfMh4yHRiTsICxz9/DoOsaKsMQPkCJhN4+YvC
	 aQFjuXMsCAlxFGv4iGfD733SO9zicNeGZeh6tUrECa0fIzcFaPqJIB2GWKFhhnBKEu
	 qY7HqLLem70UabJB3tppFvRY9yZ/DezY3XxAulPJdcsWEBQxmEkvA5ph7FKnGInGUD
	 Nyj39Vg/uOOrQ==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de, 
 festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, 
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260120111646.3159766-1-xu.yang_2@nxp.com>
References: <20260120111646.3159766-1-xu.yang_2@nxp.com>
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: set platform driver data
Message-Id: <176898552285.1268719.14817988483305710497.b4-ty@kernel.org>
Date: Wed, 21 Jan 2026 14:22:02 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 20 Jan 2026 19:16:46 +0800, Xu Yang wrote:
> Add missing platform_set_drvdata() as the data will be used in remove().
> 
> 

Applied, thanks!

[1/1] phy: fsl-imx8mq-usb: set platform driver data
      commit: debf8326a435ac746f48173e4742a574810f1ff4

Best regards,
-- 
~Vinod


