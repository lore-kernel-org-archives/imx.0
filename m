Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F8E410D02;
	Wed, 21 Jan 2026 08:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985535; cv=none; b=QBw7Y8ipXpuZlNzgAY2lbUWLHl3fnlILP+KbjmMIPRB6eft03U+NRANUhOTtEhYqANVbdiIayqNhTT6aoEqszmnY5nEc5eYRyAlyjv1HDqrpaSAto4hap34WOfN+ehbpoXx2B4gfw3mZev29ow6tATpVxdXPMu64KDJBfp94PEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985535; c=relaxed/simple;
	bh=jgRIhCmAaFipOkGH+vdMQTIQ3U/7dYSKGd7V7jJZOpQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wv0dmR/BUB8Hg3X7z0P9Zb0FW173fgNWiLtxu7F2A0FjXycsgxOCsmiS/R7JECTqgggACXoTv0IDU1zaa01yLrXP0Fwc5+sq0tpJIlRuPY1n9U8lBDPDw65NvGnle3MyiB6z9WKDaL8kUqATxAEt5zLPMvy40V/Pe2Ijt3la2uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCajSL74; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCajSL74"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35377C19424;
	Wed, 21 Jan 2026 08:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768985534;
	bh=jgRIhCmAaFipOkGH+vdMQTIQ3U/7dYSKGd7V7jJZOpQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gCajSL74VRRWMeuogyEQFdrV7BWypTWkDAt07WMUnZd8pKYp2jgA0bJ0MAq4u12qm
	 vLlcPwJ8dSjsfKn/D5kESRONoyKniO1zW2rLVPuK3vj6UfSEOpXxqbC/FUQ0yaFctj
	 eBSttlRyC1+Qyp2VZb3ihGB71pe/1VYONJRlMDqw6PH7pqmJAZb5hm7PfzmuLzXhSM
	 d82xAzLPBcXTD6siR6kygVU5DoOrTTew1l6luHrX0GQ00NkVyyV3KjtLPHitG4LY4A
	 6hhSpsnsgXf0aYinVbsHCHyBYuQnBVBDyoSAb++/c+hnEMny6AAByV99ws/NZRdNkL
	 Dp7KoMNp7hibQ==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de, 
 festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, 
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260116101835.1810675-1-xu.yang_2@nxp.com>
References: <20260116101835.1810675-1-xu.yang_2@nxp.com>
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: enable RX Termination override
Message-Id: <176898552763.1268719.6857926656823193062.b4-ty@kernel.org>
Date: Wed, 21 Jan 2026 14:22:07 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 16 Jan 2026 18:18:35 +0800, Xu Yang wrote:
> This is to resolve the problem of wakeup system by USB3 device insertion
> if HSIOMIX on, in that case, the USB3 device detects RX term on so the
> USB3 device doesn't downgrade to high-speed, we can't expect CONN wakeup
> (for USB3) happen because the 24MHz OSC is required ON to trigger it.
> Because the device works at Super-speed so DP/DM wakeup can't happen
> either. Then the entire systen can't be waken up by such device attach
> event.
> 
> [...]

Applied, thanks!

[1/1] phy: fsl-imx8mq-usb: enable RX Termination override
      commit: 05b56ef347495239da896f310c9d613e9bd1a015

Best regards,
-- 
~Vinod


