Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67487748A
	for <imx@lists.linux.dev>; Wed,  4 Oct 2023 07:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A05CC433C8;
	Wed,  4 Oct 2023 07:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696404759;
	bh=c0sblUv/k3X4rxTQo+ycwCdkeBNEQJr2yNqOWAvpvUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GUkqFgUUE8h0HfcvopN8fByxCJBWsDAt9UKULj1nw1/yX3zaDtTlGMKBi6RC2grO3
	 Zk5c5QDAQ4QZT2PER4+fHZvqU2SS3/h+lWtEu9xD7LT5EmEvNX+UH9MgfIhBr2WrjK
	 G+vkNn+ImkA1OU3JYFiLFwb44uaa3VTJH0Yv4yQyw051ti9MC0Lv/F2Jqy5he97lWC
	 L7OhjaAqAyHV6D/o5Y8AUeRLI8tYKPx2vs5pOk5QmOk1ktgaGImN+mbODXDNCf/Bnu
	 /OAQlgmwJQGpnfRVLhvbtyY5E8NNn1wY5rMpWzLGmv/2q9ZBRy8AuyygpKO/6xBNGE
	 JLSO2VQF6IZ9A==
Date: Wed, 4 Oct 2023 13:02:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, joy.zou@nxp.com, linux-kernel@vger.kernel.org,
	peng.fan@nxp.com, shenwei.wang@nxp.com
Subject: Re: [PATCH v3 1/1] MAINTAINERS: Add entries for NXP(Freescale) eDMA
 drivers
Message-ID: <ZR0VFKzbl7Dt5KkR@matsya>
References: <20230824145834.2825847-1-Frank.Li@nxp.com>
 <b1c5ba0d-748f-ae2e-4a5f-e1e853161d16@infradead.org>
 <ZRWKH1gSwdLMhBCt@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRWKH1gSwdLMhBCt@lizhi-Precision-Tower-5810>

On 28-09-23, 10:13, Frank Li wrote:
> On Thu, Aug 24, 2023 at 02:01:20PM -0700, Randy Dunlap wrote:
> > 
> > 
> > On 8/24/23 07:58, Frank Li wrote:
> > > Add the MAINTAINERS entries for NXP(Freescale) eDMA drivers
> > > 
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > 
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > 
> > Thanks for fixing. :)
> 
> @Vinod:
> 	ping

Can you please resend

-- 
~Vinod
