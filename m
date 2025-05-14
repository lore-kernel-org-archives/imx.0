Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D669F275858;
	Wed, 14 May 2025 11:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222664; cv=none; b=jUC2QqvwiJ6qdd7s45MwgdKju1E92EL31yVaUAQMD56ECgwq6q1bCJZ1mcz7H/6M59OHcHAjUVfX89y84B6VP4tm1i8IRTMUF+VGAjGvXqzsQkIMkAbG3j2QJ257V/UQpOJ550tG0vxH9JEKSJJaMdZprB7Y89poAdyEM1ukPoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222664; c=relaxed/simple;
	bh=jISERuaY9qmDFJKtUygAy794V54ed8Ao4JMN9t4+FHo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J/Lkz9D7JexuBlu1CKy66V9MGaf5+P6doHHCb3FRVKkgGmhTpR+DiihKy+G5c0TdUu1Jdqa4tg2unpHIUVIaGbMMt2PZLuCsVRnpTNVwu/sI+K22TNWHK50NYvIXF4efp1l0QV3C6PHBUsr/vKwhyL6t34eUeCY7dA2XxDoPNUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GneZh8ED; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GneZh8ED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B04C4CEE9;
	Wed, 14 May 2025 11:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222664;
	bh=jISERuaY9qmDFJKtUygAy794V54ed8Ao4JMN9t4+FHo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GneZh8EDbYt1L15AvpZL1bcBLJpsVedS7VpuI6NCooz2TVTqGippouQ9pExUkvLW4
	 7oYUAjaZhvpUm5J6tBTopqIzFS6BOgVqYdMBncmrgI3XiUU5vHFlXXVMKEurMTOX/6
	 fZ62xwSO1DiUUXvZ/QKCnZprUeHXyEH3pcicoCR52muQS0/U9jkZCPOVISFRyhVFNh
	 j6hfgL230YzdDe8GmdBJ9tUrClQf/cHmXQLAiNnzqiBrW4HBQ/6/fayw71OKA44jWr
	 5SY+w/AUv9n4sb+czqZBfORyS5Yv5GGiVahLVtAr9zm1ev74yt6Cvu3ndbckBDiGcO
	 CGRhshx5Axzdg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, Xu Yang <xu.yang_2@nxp.com>
Cc: jun.li@nxp.com, alexander.stein@ew.tq-group.com, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250430094502.2723983-1-xu.yang_2@nxp.com>
References: <20250430094502.2723983-1-xu.yang_2@nxp.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: imx8mq-usb: fix
 fsl,phy-tx-vboost-level-microvolt property
Message-Id: <174722266099.85510.8742771363116122058.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:40 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 30 Apr 2025 17:44:59 +0800, Xu Yang wrote:
> The ticket TKT0676370 shows the description of TX_VBOOST_LVL is wrong in
> register PHY_CTRL3 bit[31:29].
> 
>   011: Corresponds to a launch amplitude of 1.12 V.
>   010: Corresponds to a launch amplitude of 1.04 V.
>   000: Corresponds to a launch amplitude of 0.88 V.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: imx8mq-usb: fix fsl,phy-tx-vboost-level-microvolt property
      commit: 5b3a91b207c00a8d27f75ce8aaa9860844da72c8
[2/4] dt-bindings: phy: imx8mq-usb: add imx95 tuning support
      commit: 7325e0995f414af1cfa38be965dc47248cb4ec45
[3/4] phy: fsl-imx8mq-usb: fix phy_tx_vboost_level_from_property()
      commit: b15ee09ddb987a122e74fb0fdf1bd6e864959fd3
[4/4] phy: fsl-imx8mq-usb: add i.MX95 tuning support
      commit: e75d564f64661086fcd65ed07268590259893448

Best regards,
-- 
~Vinod


