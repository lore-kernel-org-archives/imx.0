Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7934429802;
	Thu, 11 Jun 2026 15:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781192155; cv=none; b=n1E1P5rAj9UzeubtppIahiewcCvWzQQrPb0L1f1zLFchyKGfLyDBBvQxbL4jSL6+ETb9qEiY1pUIkZCZXz6RnfxKNHRKbNfuVaqe0AGFg/BapgpYYlDVc4UX/WaMBhW2s8PSView9OsezC9vj9CewApBL/O8f9VlZfboTqIENJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781192155; c=relaxed/simple;
	bh=juqHsXEw37apUgCVeHIovqT0m3tjExVj/Oq4YeLzOoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b/SvZoTFgwh2Yk8h3bnqvZFET2GhGDdZg7qiz3dmdbGKZpGfWq6B5moETsk2W1cfVPR5ORUFKiuIuTA3Wkd4C3tPd7QcIr2XOaoyg/iBZTvM8fExsujfo8syEMedFbPAOMENaMSsWiFUDi/3HxgWjiJkCUmFHrcv5tGc00w6e38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1D/tmBE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1D/tmBE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5131F00898;
	Thu, 11 Jun 2026 15:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781192148;
	bh=+j2YhohFB/HwnCxh8xFFgMkWvDaXNClb8/BZwsoLoFw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=A1D/tmBEy2STYW/pTS7lVBHE4ek0/WqtChV8XxlYJnveGcN86bflYpc073arEhag4
	 +43OyKgMcqyz+QTmYk8gJccn89PpvEBhvSu3ztyuQqeSDyY1R/0stDaWQTgKlQTw0X
	 mSs6PgWmrF/n6VwvqAdYhdoBe9D4/8w76ZmS7tm5z574Am2aK7x+ANNNDRfHu3yLmg
	 OgluB0zx5a9SaCZo3/Jh2MYcf+EyrMOIQ4kyBL9d4ewdXZINwn8DmiKRFQ2DZrGsEk
	 dOOyLfaFWlZVQnHo/V/gNACW2HhMinP8E8Cqj2RwhRIF/GtgNTgnjoazYJk21svf23
	 och8PzEttTf6A==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Felix Gu <ustc.gu@gmail.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260605-lvds-v2-1-3ce7539d1104@gmail.com>
References: <20260605-lvds-v2-1-3ce7539d1104@gmail.com>
Subject: Re: [PATCH v2] phy: freescale: phy-fsl-imx8qm-lvds-phy: Fix
 missing pm_runtime_disable() on probe error path
Message-Id: <178119214553.568088.1035620775294899553.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 21:05:45 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 05 Jun 2026 19:57:20 +0800, Felix Gu wrote:
> If mixel_lvds_phy_reset() fails in probe after pm_runtime_enable(),
> the function returns directly without calling pm_runtime_disable(),
> leaving runtime PM permanently enabled for the device.
> 
> Fix this by using devm_pm_runtime_enable() so that cleanup is
> automatic on any probe failure or driver unbind. This also allows
> removing the manual err label and the .remove callback.
> 
> [...]

Applied, thanks!

[1/1] phy: freescale: phy-fsl-imx8qm-lvds-phy: Fix missing pm_runtime_disable() on probe error path
      commit: 799e7cf2f0b50b34660b5ffce0f7d8dec376a0d5

Best regards,
-- 
~Vinod


