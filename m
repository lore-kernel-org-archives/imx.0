Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C0F36E55F;
	Thu, 20 Nov 2025 17:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658728; cv=none; b=l64wLFSYhzpbx7HPm/kfXeJ0RHIwiI+c/BBTha0FRwj3Xt6Gjq9aBN14Rqpav5/+rjZ2kjlKVBmatWTRvZI8mLRrXurAzADASEna8APf7YyTrbS53m7qdQZXw75LQqG7TSRhombaCKhEIJfdEl0moU1Ir9b3uPSWFknIRXlwfFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658728; c=relaxed/simple;
	bh=mHyQXOCfUEu3/8Ya1tUCqfJKlgAxb9fCkFtOdrJ4sqo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GNCHH/i+sPsKzU2SC8R0hSE/DiCNJZivqAh2owlCAce01scaxh2lW49CKCMf6KXdGcE3sloGQGwGBT+omLY/xJyS6XcJlSoWp6GT0u2VUsJDZR5gEpyY8RDfRYeOh63cura+8EquJ2tSeqDIeROx9bunuPH1YDH0Tt6Gi7Ai6YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVw1rNdR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVw1rNdR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1E4C116D0;
	Thu, 20 Nov 2025 17:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658727;
	bh=mHyQXOCfUEu3/8Ya1tUCqfJKlgAxb9fCkFtOdrJ4sqo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=dVw1rNdRNoq8Xib0X0bjU5pBVXr56M/7OELZiMq3qEM64g+qqSpbC9AtbGdMPwUtY
	 /gupB6Z4jKM44NuY5MIhqUjcjbI654r+cFc3PJZzGfenmL3ZCxykFuUQYQfG59aaAN
	 h9Ou9Lkyb1uOWkLzAeTiWNPXd3+b0kUoHy3Q3yD5/ePM7Yd4fCZMK9A7dOftB7e4XM
	 maXTGCM+ofAMF7vXJP5kuEgWjhkxtggWTi/Y7U/XfQG1qCiMaqn02odENr+NOODGOT
	 aLDEvP8eHjhFz7JVwXIsH0Ildnbx077Xfye5IbansaERIWgY5CpxATq3GaOKTJbGj/
	 8W8u5D7+Tc/4w==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
In-Reply-To: <20251118071947.2504789-1-xu.yang_2@nxp.com>
References: <20251118071947.2504789-1-xu.yang_2@nxp.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: imx8mq-usb: add alternate
 reference clock
Message-Id: <176365872319.207696.9701764903294048146.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 22:42:03 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 18 Nov 2025 15:19:46 +0800, Xu Yang wrote:
> Beside default 24MHz clock input, there is an optional additional 100Mhz
> clock input 'alt' for USB PHY reference clock.
> 
> 

Applied, thanks!

[1/2] dt-bindings: phy: imx8mq-usb: add alternate reference clock
      commit: 0e8fe19c0292d9912460b25043292227d5f1fdb2
[2/2] phy: fsl-imx8mq-usb: support alternate reference clock
      commit: 3b64ea4768e7e64b2d9ae5833dbcac19f6212145

Best regards,
-- 
~Vinod


