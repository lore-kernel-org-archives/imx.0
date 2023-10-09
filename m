Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C501746AE
	for <imx@lists.linux.dev>; Mon,  9 Oct 2023 06:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZ6glDo4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B925FC433CA;
	Mon,  9 Oct 2023 06:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696831950;
	bh=dbhhiVSslKuZeTU8xgrFM5xEx8ji9w2nubCjVDsgT/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NZ6glDo4PNbrCVcImzZsTTHlB2OHRXfg/FCki8VJDEdj7w8YwGaJ17lAbmBZIUNCU
	 N4WMQBYsusVs3fDi92W4Z8dA1gvZwBFMlxYGZbAS15rm7QavVjXZHhgvuEefBa2QiV
	 HAzFKgmMufeKPM60fjveIHefuna9qEAPY302v3OoMoRepoRrnK02SVeYfq9bRkjyA3
	 3X/rNV4QCC9Djm8OP93fYSaAJKO2aVQ21LjduL5nv5VR+CDj8scIC+HVEwm5/DtaUw
	 ic9xcYe4a2oP9a1jsouRQcgWrS6Oz/EVoWM6b1qRZ/dVtRFCLQ2nEv81J+ki2tLALN
	 VZ+mMtC35w3zA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Frank.li@nxp.com, dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 joy.zou@nxp.com, linux-kernel@vger.kernel.org, peng.fan@nxp.com, 
 rdunlap@infradead.org, shenwei.wang@nxp.com
In-Reply-To: <20231004143228.839288-1-Frank.Li@nxp.com>
References: <20231004143228.839288-1-Frank.Li@nxp.com>
Subject: Re: [PATCH resent 1/1] MAINTAINERS: Add entries for NXP(Freescale)
 eDMA drivers
Message-Id: <169683194737.43997.1440186102884737667.b4-ty@kernel.org>
Date: Mon, 09 Oct 2023 11:42:27 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Wed, 04 Oct 2023 10:32:28 -0400, Frank Li wrote:
> Add the MAINTAINERS entries for NXP(Freescale) eDMA drivers
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: Add entries for NXP(Freescale) eDMA drivers
      commit: 9f895354cc3cf4fbff21c922a5721691ed40589d

Best regards,
-- 
~Vinod


