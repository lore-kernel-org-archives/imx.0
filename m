Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2665D328AD
	for <imx@lists.linux.dev>; Thu, 28 Sep 2023 12:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76180C433C8;
	Thu, 28 Sep 2023 12:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695902879;
	bh=aagHP/tT7OX+/Nk9NY1e7msOI3MzWBd3pcmlQFBXIXM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=PNQB0J2zjPqmTiAhBoCMyuzjh2H3IsK5se2FJx8jCzFB8lV+bdsy7ULNVlKbRXL6R
	 KG4l4gCoP21yAVD4QC8cr7ITEntWZjhCvmc3yop2NXifG5jiyDx2w5kkRglI8FZv3/
	 BLB9tpQcf3ichOmkmHAAEqAJjXLj+JwsmlH5APtCLx9c+EJgZat4Oh0niypMV2DnfU
	 8q1y2nn63VgCsxUyL1jkzV6puGC80YGwrJSCafgEVjlUsD8s8BUt5Fxfq4gaeTtc7a
	 KpVx+6BWBIZSnXEp+O7YJvyb9RDzMHr5j0qeEVfmzLrm7nYnIGjvIKKDgeMTqCkKbM
	 az2O+JaFtrj3g==
From: Vinod Koul <vkoul@kernel.org>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20230921144652.3259813-1-Frank.Li@nxp.com>
References: <20230921144652.3259813-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] dmaengine: fsl-dma: fix DMA error when enabling
 sg if 'DONE' bit is set
Message-Id: <169590287811.161554.16554289447720451572.b4-ty@kernel.org>
Date: Thu, 28 Sep 2023 17:37:58 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Thu, 21 Sep 2023 10:46:52 -0400, Frank Li wrote:
> In eDMAv3, clearing 'DONE' bit (bit 30) of CHn_CSR is required when
> enabling scatter-gather (SG). eDMAv4 does not require this change.
> 
> 

Applied, thanks!

[1/1] dmaengine: fsl-dma: fix DMA error when enabling sg if 'DONE' bit is set
      commit: 3c67c5236fbf7a58c1a26d57da4465ea5fb25537

Best regards,
-- 
~Vinod


