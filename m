Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1171D198
	for <imx@lists.linux.dev>; Thu, 13 Oct 2022 00:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217F6C43470;
	Thu, 13 Oct 2022 00:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665621908;
	bh=BY6NSNTsGspisONHzJBR5FbCDR3j3NmpXA4EUtKNq7k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h39oegE9/yYg4mdGObUEHdbBB1VHfmT4ffOkxp0632dgmwqJ6djgYrneUd2A3PXGz
	 26g2y6oXX14aMeuxRKHQ8e4CMl25pwTPXxw5NDPzcSUKgFqxtclUjhH7mLuLGnQNzx
	 6HujuDZYXjMKZ/MPfCjW3jowQmo48A6shj66kg0UTCIcKnCc22L9DxNVhHp6pbDCev
	 tlhB+KHLLzQe8ldacaT0cqYzx9rx1vzrBfPJ0SoU7v8Uh4CULMYfNwHe7xtZhV0Pbv
	 xNeAvgJvmaelU9ZT4hqsqIqloJ/zJ8WhoMKrqwEhwHNt5yZ7OkyZpsnvCz38w/6tC6
	 KOnqddIhMD15A==
Date: Wed, 12 Oct 2022 17:45:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew
 Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Giuseppe
 Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v4 2/2] net: stmmac: Enable mac_managed_pm phylink
 config
Message-ID: <20221012174507.1938d533@kernel.org>
In-Reply-To: <20221010204827.153296-3-shenwei.wang@nxp.com>
References: <20221010204827.153296-1-shenwei.wang@nxp.com>
	<20221010204827.153296-3-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Oct 2022 15:48:27 -0500 Shenwei Wang wrote:
> Enable the mac_managed_pm configuration in the phylink_config
> structure to avoid the kernel warning during system resume.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Could you add a Fixes tag pointing to where the warning first appeared?
