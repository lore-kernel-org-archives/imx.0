Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83228427A14;
	Thu, 11 Jun 2026 15:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781192145; cv=none; b=XeWyftk75RBGUbir/V6TBOso5l2Sme6ypuRla0uO0trUp/vD6EaEtt6giGtLdsSGJnb4aHC94JEo8R3EYY+V8p03HQ8mET7n6JtWlMjrcyFqNmBCIThHjfwHbs3zXkqajJXqU7l2KT7/ryzhrEIKpS3/Ef0v4QeVywXuW8pTaAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781192145; c=relaxed/simple;
	bh=nAHACgXCX8sWI3tcI0KB3aqv04VHRJ+t5VbDlrf16+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pOsBUe3RBnm9hd0vSf7Amrd1X8lN9qNOfP5IVA8GIyQgLYO5+O2dPeBymU3GR9DyrP7Md6NyHpWWrTmBBolPtAacJLYsKbJqv/i0dATlFbJL61HOZePF8slRhi9jD/bENuasaJct6VxeCWe/fjEet68Jn4S0lLwCVC26g1DObyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nkcb7rNG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nkcb7rNG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A441F00899;
	Thu, 11 Jun 2026 15:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781192142;
	bh=CyqMjRcBNzsNW4+u7ngkuXlJ7cl2LUvTia3Gu9mccqo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Nkcb7rNGVLCJ2HdS9QQfPdbdGLjE9oRSbWoVk17PMAvYXTitn6IKehO9rvyNIF9+p
	 OupNCoPq7xtTtjkTTrZ7rrZP2G4hQMB2+Z7MgayrgKhDinKH87J7J06Z7bIjEVFxlF
	 mP95yrpByTg0PHFcM94Z0hvmP8NZAD56bkkIeTheNnLGvCYw+WC0yBD+uoD5trapRB
	 kmLvwLACjzRG6QtUpistPnKLsZtG96Vi62jDMF1bFZbNdcdkn3qkhniB2ZrZk8KHK+
	 VnlSiC6oVM+6CkZfYaWhFizOLaiMbeur0OBwsAqMzH0pWKEJqpSewHevj7SQIKeAkR
	 wtnf3sIBOA2jQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Felix Gu <ustc.gu@gmail.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20260609-lvds-phy-v1-1-6ad790c6d0ea@gmail.com>
References: <20260609-lvds-phy-v1-1-6ad790c6d0ea@gmail.com>
Subject: Re: [PATCH] phy: freescale: phy-fsl-imx8qm-lvds-phy: Use
 synchronous PM runtime put in reset
Message-Id: <178119213836.568088.17165360220822956179.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 21:05:38 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 09 Jun 2026 22:48:50 +0800, Felix Gu wrote:
> The mixel_lvds_phy_reset() function pairs pm_runtime_resume_and_get()
> with pm_runtime_put(). The asynchronous variant queues a work item
> to handle the idle check and potential suspend, which can be cancelled
> by a subsequent pm_runtime_disable() call if probe fails after the reset.
> 
> Switch to pm_runtime_put_sync() to run the idle check and suspend
> synchronously.
> 
> [...]

Applied, thanks!

[1/1] phy: freescale: phy-fsl-imx8qm-lvds-phy: Use synchronous PM runtime put in reset
      commit: b28ec8ce03d8f9a0f7a9ec84f1ed9b5a6f393791

Best regards,
-- 
~Vinod


