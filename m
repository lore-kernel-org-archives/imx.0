Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F3E46AE
	for <imx@lists.linux.dev>; Mon,  9 Oct 2023 06:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r3n9yVnB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BF9C433CA;
	Mon,  9 Oct 2023 06:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696831975;
	bh=jn0sUbgd2EJPBzkIYTs9bpjsHB6DVkAX2SQb+8D+QWs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r3n9yVnBe/L/tg8bcQsQQ/nxNBtLmuUgAkCToHhr/yGVMMvZWRTCfg2beB7ruJMqi
	 rtiIxfQRxnZKB64q9vx0DoPKIGaOGN7yXyhQhdxqlSIXxwFoEXva4v3bGQx05MsKiy
	 WufOlzR1lk4sceEDp+FYImZjADeXF069ln2lvX82AiVKv4yxkP6wvCEDPw1iIqmWco
	 Vz9UoAyVXO4AIBLjc9PMOJMpnUwBSsZFDmu6xTZsEtOwpRIVjwTNN/poaJIoSMYniS
	 5CAFZRqG67UQNu0ZM17F9VlcQFQY9uXTdf9NcTR9OlryN4EaYThpi+oVtb6nM4EEf7
	 zWP5Ey3JiEX8A==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Frank.li@nxp.com, dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231004142911.838916-1-Frank.Li@nxp.com>
References: <20231004142911.838916-1-Frank.Li@nxp.com>
Subject: Re: [PATCH resent 1/1] dmaengine: fsl-edma: fix all channels
 requested when call fsl_edma3_xlate()
Message-Id: <169683197316.44135.5111296120983470256.b4-ty@kernel.org>
Date: Mon, 09 Oct 2023 11:42:53 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Wed, 04 Oct 2023 10:29:11 -0400, Frank Li wrote:
> dma_get_slave_channel() increases client_count for all channels. It should
> only be called when a matched channel is found in fsl_edma3_xlate().
> 
> Move dma_get_slave_channel() after checking for a matched channel.
> 
> 

Applied, thanks!

[1/1] dmaengine: fsl-edma: fix all channels requested when call fsl_edma3_xlate()
      commit: 3fa53518ad419bfacceae046a9d8027e4c4c5290

Best regards,
-- 
~Vinod


