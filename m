Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A223A179
	for <imx@lists.linux.dev>; Wed, 19 Jul 2023 06:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8C1C433CA;
	Wed, 19 Jul 2023 06:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689748479;
	bh=DC++SzU0ArlXkyCLBy3GqoRal30WHgBs6Gr4teUpvQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GOave3yKZ/oNcWg1QFZNWsCTTNRjXlkVdqycAOo7sWfK4ZnwlxBLXyIgLo+ZPhJII
	 oPCLH1KPFqTkqOFyzAm2WFVh8/IFza1J4TnPbvP0HCQiOZJYnW40VwJFdUOCaN3emc
	 yzujYaXnso6Pu0c5um9QpUNb3Ot0nCcDdqw1kPMpxl1NEE06FzNxcIZzyPDQaYUrn0
	 vd9RoivHOUinEAxB+wH7Xf1zBJf0E06xKA2blm8oksurfOrmAdPvei4Q/8+Sm5uz9T
	 vlvyD23nkVcARGxOYkAiYwSnMdFotTrZJk/I9XY1YIgI6qDAaLZYOt+JZS9Y+dZ+QR
	 +VHLeRWElJBew==
Date: Wed, 19 Jul 2023 14:34:25 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Chester Lin <clin@suse.com>, Li Yang <leoyang.li@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/3] arm64: dts: imx8qm: add cpu frequency table
Message-ID: <20230719063425.GE151430@dragon>
References: <20230713204932.1591255-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230713204932.1591255-1-Frank.Li@nxp.com>

On Thu, Jul 13, 2023 at 04:49:29PM -0400, Frank Li wrote:
> Add A53 and A72 opp_table.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!
