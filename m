Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB4C46AE
	for <imx@lists.linux.dev>; Mon,  9 Oct 2023 06:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HawuaW4a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714CBC433C8;
	Mon,  9 Oct 2023 06:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696831933;
	bh=VVc6hDifgti0ubiSRz34eNWT2uN4aWAM0vQKyzQ7xq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HawuaW4atxpP3DrS/dnw/sstX3KxXHMl/F2kZ4tb8o7UgJGWTAe3Pha2yjX8nYK8w
	 OrBz/vOMaIPiPm8OvGYamKP9fNLpmBdunuDFlYNpzSyz3lGh5qhBtkusB8xZTqc9+i
	 vL3bccKwq0qg7z+sNx0MxWM2aFDAShrVRJ6ov7UKjhonoB2DUBXtFRS4+1SbTUf7WZ
	 jSKBRbVSGJ0pgtUXSxligXZUONYWkV8uK+rUNYf0RawQjtOM2gSU7X0JM0MJ8McZI8
	 ID3Vg0no+Tcr5XWulomiiP01ETZUPR1WZ8l+JFYmI10FUuRK0p/T8FTp3XT1664nD4
	 KU0+9PB4UQcXA==
From: Vinod Koul <vkoul@kernel.org>
To: rdunlap@infradead.org, Frank Li <Frank.Li@nxp.com>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev, joy.zou@nxp.com, 
 linux-kernel@vger.kernel.org, peng.fan@nxp.com, shenwei.wang@nxp.com
In-Reply-To: <20230824145834.2825847-1-Frank.Li@nxp.com>
References: <20230824145834.2825847-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/1] MAINTAINERS: Add entries for NXP(Freescale)
 eDMA drivers
Message-Id: <169683193008.43997.12102895009675453131.b4-ty@kernel.org>
Date: Mon, 09 Oct 2023 11:42:10 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Thu, 24 Aug 2023 10:58:34 -0400, Frank Li wrote:
> Add the MAINTAINERS entries for NXP(Freescale) eDMA drivers
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: Add entries for NXP(Freescale) eDMA drivers
      commit: 9f895354cc3cf4fbff21c922a5721691ed40589d

Best regards,
-- 
~Vinod


