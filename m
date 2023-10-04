Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFB2748A
	for <imx@lists.linux.dev>; Wed,  4 Oct 2023 07:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4E4C433C8;
	Wed,  4 Oct 2023 07:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696404781;
	bh=Q5Yvrxk9uP3w/sec70NuRnAW8kUBSmlRnZ+J/yHoJLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dNE+PJI5CYiE/MZbcfodrX7lU2FEsLx6aiKFdFMJemCoOos8rIn6EzEYFa0+Q2JMR
	 srgMsQckngMh01CLwvaI8LyaZoUmD/+XY9gyq/H9b3D+zCZ055CC/ZebiJOKylcq6d
	 VIrKpAeN3akIFJethC/sxpwi09LzgLJlIQUBlOHjgZnOuqEGdt/9M9YOrdUuFJs8/Y
	 QfN2HtxrzzQ6Gl/8S7Z8yZZ68ZLom2auGJas79szmhRw5FAZkaI/Bs59GmhfaPQ+oB
	 0bKt7HQbod4ZPf1iQVgWJZl2av25NTDtKus+k4SOCompBykDl/S0jggC87tV/wwubz
	 ugO7ObYqEyNQA==
Date: Wed, 4 Oct 2023 13:02:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: "open list:FREESCALE eDMA DRIVER" <imx@lists.linux.dev>,
	"open list:FREESCALE eDMA DRIVER" <dmaengine@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dmaengine: fsl-edma: fix all channels requested when
 call fsl_edma3_xlate()
Message-ID: <ZR0VKS2VoocrTzWY@matsya>
References: <20230914222204.2336508-1-Frank.Li@nxp.com>
 <ZRWLSkl/QzBtls+T@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRWLSkl/QzBtls+T@lizhi-Precision-Tower-5810>

On 28-09-23, 10:18, Frank Li wrote:
> On Thu, Sep 14, 2023 at 06:22:04PM -0400, Frank Li wrote:
> > dma_get_slave_channel() increases client_count for all channels. It should
> > only be called when a matched channel is found in fsl_edma3_xlate().
> > 
> > Move dma_get_slave_channel() after checking for a matched channel.
> 
> @Vinod
> 	ping

Can you please resend

-- 
~Vinod
